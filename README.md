## Implementasi Ekosistem Hadoop ##

|NAMA                            | NIM       |
|:---:|:---:|
|ALVIN RENALDY NOVANZA           | 1202203346|
|MUHAMMAD RAYHAN KURNIAWAN       | 1202201259|
|ORVALAMARVA                     | 1202204249|

### Airflow ###

Menginstall airflow di docker:
Fecth docker-compose.yaml
```
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.7.2/docker-compose.yaml'
```
Buat folder dags, plugins, dan config
```
mkdir -p ./dags ./plugins ./config
```
Initialize the database
```
docker compose up airflow-init
```

Running Airflow
```
docker compose up
```

Crawl data komen YouTube:
1. buat file .py didalam folder dags *terlampir di file crawlfinal.py
2. masuk ke localhost port ariflow terkait, secara deault localhost:8080
3. login dengan username: airflow dan password: airflow
4. cari dan jalankan dags yang telah kita buat dari file crawlfinal.py

Untuk hasil file output yang dihasilkan oleh program airflow, kita dapat memindahkan atau membuat salinan dari file tersebut kedalam hdfs, langkahnya sebagai berikut:
1. Pastikan kita mengetahui path file tersebut disimpan didalam container airflow
2. Pastikan kita mengetahui path file hdfs untuk menyipan file pada hadoop fs
3. gunakan kode berikut:
```
docker cp <container-airflow>:/path/ke/airflow/output.sql <container-hdfs>:/path/ke/hdfs
```

### Sqoop ###
Memindahkan file MySQL ke HDFS
```
sqoop import --connect jdbc:mysql://<hostname>:<port>/<databaseName> --username <username> --password <password> --table <tabelName> --target-dir=<destination> -m 1
```
Menampilkan hasil pemindahan file MySQL ke HDFS pada direktori yang ditentukan
```
hadoop fs -ls <direktori>
```
Membuka file hdfs
```
hadoop fs -cat <direktori/[namaFile]>
```

### Hive ###
Mengecek database dan table dengan query yang mirip MySQL:
```
show databases;
show tables;
```
Membuat eksternal table 
```
create external table if not exists <namaTabel> (
id int,
nama string,
alamat string)
row format delimited
fields terminated by '|'
stored as textfile;
```
Mengecek apakah tabel sudah terbuat
```
show tables;
```

Load data HDFS ke Hive
```
load data inpath '<direktori/[namaFile]> into table <tabelEksternalSebelumnya>;
```
Melakukan analisis deskriptif pada tabel dengan query yang mirip MySQL seperti:
```
select * from <namaTabel>;
select * from <namaTabel> where alamat="Bandung";
```
