-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2023 at 01:30 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hasilcrawl`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_komen`
--

CREATE TABLE `tabel_komen` (
  `author` char(20) DEFAULT NULL,
  `text` char(200) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_komen`
--

INSERT INTO `tabel_komen` (`author`, `text`, `date`) VALUES
('Muhammad Najib Hamam', '1. <a href=\"https://www.youtube.com/watch?v=Qzcc-FWv0cM&amp;t=0m39s\">0:39</a>     Tidak mencari tahu mengenai jurusan IT<br>2. <a href=\"https://www.youtube.com/watch?v=Qzcc-FWv0cM&amp;t=2m24s\">2:24</a', '2023-07-28'),
('M. AKMAL AL ABDILAH', 'terima kasih bang tipsnya,  sangat mengispirasi saya.', '2023-11-05'),
('Rizki Geni', 'Sama nih kayak saya dulu kepingin masuk jurusan IT karena pas SMA suka main game dan bisa troubleshoot PC sendiri.<br>pas masuk kuliah dan lulus D3 teknik komputer baru berasa ternyata di dunia kerja', '2023-10-31'),
('Ardaa Bangsa', 'apalagi yang kuliah + kerja buat biayain kuliah sendiri.. jadi yang beruntung bisa dibayarin ortu.. manfaatkanlah sebaik mungkin', '2023-10-30'),
('Jiwa Muda', 'Faktanya sehabis saya lulus jurusan IT 2016, Apa2 yg berhubungan dengan komputer, Handphone, Printer, Bikin akun2 Sosmed, Dimintai Ngajarin Jualan Online, Registrasi Kartu Perdana HP, Setting Wifi Tet', '2023-10-28'),
('Dury Gre', 'belajar fokus semisal mau condong front end, backend, devop, dan apapun di luar kuliah itu keharusan(atau minimal mau explore terkait programming atau tek yang terkait dengan IT). Nyesel santai gak be', '2023-10-26'),
('Hehe He', 'Terima kasih.', '2023-10-24'),
('Imran Ramdhani', 'Hmmm gara2 ketabrak kerja malem trus kuliah pagi dgn jurusan it smpe skrng lulus kuliah it gangerti sma skali😂klo mau belajar lgi dri awal mulai dri mana ya mas?terimakasih banyak', '2023-10-20'),
('fikra Mahardika', 'sukhron pak atas ilmu &amp; sharingnya<br>pak sandi adalah panutan belajar saya 💪🏾🤭🙏🏽', '2023-10-15'),
('Bagas_ SetiyawanXD', 'Saya belajar it di smk cuma kerja d listrik 🗿🗿🗿terminasi 30kv.jdi malas kuliah 😅', '2023-10-09'),
('Sukarti Yulie', 'mantap bang 7789', '2023-10-07'),
('B_aja', 'tapi pak saya sistem informasi tapi matkuliah nya ada <br>- Dasar Pemrograman<br>- Algoritma Struktur Data<br>Jadi saya sedikit syok, persaan saya cari di google matkul Sistem Informasi itu gk ada 2 i', '2023-10-07'),
('Sukarti Yulie', 'Makasih bang 7789', '2023-10-07'),
('cetung ningrum', 'Penyesalan waktu kuliah IT adalah ambil kelas karyawan dan kuliah sambil kerja. <br>Waktu ada waktu senggang pun lebih manfaatin buat parttime dan main ketimbang ngasah skill. Sekarang setelah lulus c', '2023-10-04'),
('Marianie \'80', 'intinya  jurusan yg dipilih sesuai dgn hobby sehingga apa yg dipelajari selalu enjoy.', '2023-10-02'),
('Dee-nund', 'sy jg nyesel.saat kuliah ga siap byk santai akhirnya kluar IP d bawah standar saat cari krja susah dpt yg sesuai 🤦‍♂️', '2023-09-27'),
('Andre Dwi F.', 'Sebenarnya yang salah itu bukan, Penyesalan kuliah IT.<br>Kita semua mahasiswa pasti lah bisa 1 atau 2 bahasa pemrograman. <br>Tapi perusahaan itu kalo hiring agak bercanda wkwkw,<br>Dibutuhkan orang', '2023-09-26'),
('Feby Auliya', '😊😊😊😊😊😊😊😊😅😊😊', '2023-09-25'),
('Gojito - Kun', 'Pilihlah jurusan sesuai hati, jika belajar ga pakai hati maka ilmu tidak akan masuk mau sebagus apapun cara guru/dosen mengajar', '2023-09-25'),
('Fika', 'Bingung mau beli laptop apa untuk mulai programming, yg murah tp mumpuni utk jd back end / full stack dev. Ada saran? 🥺', '2023-09-24');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
