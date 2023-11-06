## Implementasi Ekosistem Hadoop ##

|NAMA                            | NIM       |
|:---:|:---:|
|ALVIN RENALDY NOVANZA           | 1202203346|
|MUHAMMAD RAYHAN KURNIAWAN       | 1202201259|
|ORVALAMARVA                     | 1202204249|

### Airflow ###
Crawl data komen YouTube

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
