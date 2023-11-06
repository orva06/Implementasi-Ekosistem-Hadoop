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
Mengecek database dan table:
```
*show databases;
*show tables;
```

-Membuat eksternal table (katanya ada internal dan eksternal, blm tau apa bedanya): Contoh: 

create external table if not exists <namaTabel> (
id int,
nama string,
alamat string)
row format delimited
fields terminated by '|'
stored as textfile;

-bisa cek apakah tabel sudah terbuat dengan command : show tables;

-load data hdfs ke hive: load data inpath '<direktori/[namaFile]> into table <tabelEksternalTadi>;

-melakukan analisis deskriptif pada tabel dengan query yang mirip dengan mysql seperti:

*select * from <namaTabel>;
*select * from <namaTabel> where alamat="Bandung";

