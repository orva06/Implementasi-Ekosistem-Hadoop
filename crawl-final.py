from airflow import DAG
from airflow.operators.python_operator import PythonOperator 
from airflow.utils.dates import days_ago
from googleapiclient.discovery import build
from sqlalchemy import create_engine
import pandas as pd

replies = [] 
df= None

default_args = {
  'owner': 'airflow',
  'start_date': days_ago(1)
}

def crawl_youtube_comments(video_id, api_key):
  # creating youtube resource object
	youtube = build('youtube', 'v3', developerKey=api_key)

	# retrieve youtube video results
	video_response = youtube.commentThreads().list(part='snippet,replies', videoId=video_id).execute()

	# iterate video response
	while video_response:

		# extracting required info
		# from each result object
		for item in video_response['items']:

			# Extracting comments ()
			published = item['snippet']['topLevelComment']['snippet']['publishedAt']
			user = item['snippet']['topLevelComment']['snippet']['authorDisplayName']

			# Extracting comments
			comment = item['snippet']['topLevelComment']['snippet']['textDisplay']
			likeCount = item['snippet']['topLevelComment']['snippet']['likeCount']

			replies.append([published, user, comment, likeCount])

			# counting number of reply of comment
			replycount = item['snippet']['totalReplyCount']

			# if reply is there
			if replycount>0:
				# iterate through all reply
				for reply in item['replies']['comments']:

					# Extract reply
					published = reply['snippet']['publishedAt']
					user = reply['snippet']['authorDisplayName']
					repl = reply['snippet']['textDisplay']
					likeCount = reply['snippet']['likeCount']

					# Store reply is list
					#replies.append(reply)
					replies.append([published, user, repl, likeCount])

			# print comment with list of reply
			#print(comment, replies, end = '\n\n')

			# empty reply list
			#replies = []

		# Again repeat
		if 'nextPageToken' in video_response:
			video_response = youtube.commentThreads().list(
					part = 'snippet,replies',
					pageToken = video_response['nextPageToken'],
					videoId = video_id
				).execute()
		else:
			break
	#endwhile
	return replies
def convert_and_export_to_dataframe():
  df = pd.DataFrame(replies, columns=[
    'publishedAt',
    'authorDisplayName', 
    'textDisplay',
    'likeCount'
  ])
  print(df)
  engine = create_engine('sqlite:///:memory:')

# Menyimpan DataFrame ke tabel SQL
  df.to_sql('tabel_komen', con=engine, if_exists='replace', index=False)

# Mengekspor tabel SQL ke file .sql
  with open('hasildata.sql', 'w') as f:
    for line in engine.raw_connection().iterdump():
      f.write('%s\n' % line)

with DAG('youtube_etl', default_args=default_args) as dag:

  crawl_task = PythonOperator(
    task_id='crawl_youtube_comments',
    python_callable=crawl_youtube_comments,
    op_kwargs={
      'video_id': 'Qzcc-FWv0cM',
      'api_key': 'AIzaSyAKenCf09wcI1cBGhqwoVC9dlmct_4NBwM' 
    }
  )

  convert_export_task = PythonOperator(
    task_id='convert_to_dataframe',
    python_callable=convert_and_export_to_dataframe
  )

  crawl_task >> convert_export_task

