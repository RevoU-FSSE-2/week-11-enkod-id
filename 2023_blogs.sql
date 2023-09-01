-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 01, 2023 at 10:47 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2023_blogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`) VALUES
(1, 'Hotman Paris Sentil Mobil Pejabat Lewat Bahu Jalan Tak Ditilang, Beda sama Mobil Pribadi\r\n\r\n', 'Jakarta -\r\n\r\nHotman Paris menyoroti soal mobil pejabat yang menggunakan bahu jalan tanpa dikenakan tilang. Berbeda dengan mobil pribadi yang justru dikenakan tilang.\r\n\r\nPengacara kondang Hotman Paris Hutapea menyorot aksi oknum mobil pejabat yang doyan lewat bahu jalan. Dalam akun instagram pribadinya, Hotman mengungkap dirinya melihat beberapa mobil dinas pejabat bebas melintas di bahu jalan tanpa ditilang meski ada polisi berjaga.\r\n\r\nBaca artikel detikoto, \"Hotman Paris Sentil Mobil Pejabat Lewat Bahu Jalan Tak Ditilang, Beda sama Mobil Pribadi\" selengkapnya https://oto.detik.com/mobil/d-6902966/hotman-paris-sentil-mobil-pejabat-lewat-bahu-jalan-tak-ditilang-beda-sama-mobil-pribadi.\r\n\r\nIni berbeda dengan mobil pribadi yang justru ditilang polisi saat melintas di bahu jalan. Menurut Hotman, hal itu justru menimbulkan rasa ketidakadilan di mata masyarakat. Harusnya aturan ditegakkan tak pandang bulu. Lewat bahu jalan jelas melanggar, maka seharusnya semua kendaraan yang melintas sekalipun itu mobil pejabat tetap harus ditilang.\r\n\r\n\"Halo Dirlantas Polda Metro Jaya, barusan Hotman Paris lewat jalan tol dalam kota Jakarta saya melihat dengan mata sendiri begitu banyak mobil- mobil pejabat lewat bahkan dengan sirene ada yang mobil tentara, polisi lewat di bahu jalan bebas melenggang nggak apa-apa,\" ungkap Hotman di akun instagram pribadinya.\r\n\r\n\"Tapi ada sampai tiga kali saya lihat mobil swasta, mobil pribadi disetop gara-gara lewat dari bahu jalan, ini kan diskriminasi nggak boleh gitu dong, dilihat pemandangan mata tidak sedap kalau mau tilang, tilang semuanya, termasuk mobil-mobil polisi,\" keluh Hotman.\r\n\r\nBahu jalan sejatinya diperuntukkan bagi kendaraan darurat. Pada kenyataannya di jalan tol kerap ditemukan bahu jalan yang digunakan untuk mendahului kendaraan, terutama ketika sedang macet. Bahkan pada Desember 2022, Dirlantas Polda Metro Jaya Latif Usman mengungkap para pengguna pelat RF yang dulu identik dengan pejabat sering melanggar melintasi bahu jalan.\r\n\r\nBaca artikel detikoto, \"Hotman Paris Sentil Mobil Pejabat Lewat Bahu Jalan Tak Ditilang, Beda sama Mobil Pribadi\" selengkapnya https://oto.detik.com/mobil/d-6902966/hotman-paris-sentil-mobil-pejabat-lewat-bahu-jalan-tak-ditilang-beda-sama-mobil-pribadi.\r\n'),
(2, 'LRT Jabodebek Jalur Bekasi Gangguan, KAI Ungkap Biang Keroknya', 'Jakarta -\r\n\r\nPT KAI Divisi LRT Jabodebek buka suara soal operasional LRT yang mengalami gangguan di jalur Bekasi. Pagi ini operasional LRT Jabodebek mandek di Stasiun Cikunir 2 dan membuat perjalanan sempat tertahan.\r\n\r\nManager Public Relations KAI Divisi LRT Jabodebek Kuswardojo mengakui masalah memang terjadi pada operasi LRT pagi. Masalah terjadi pada bagian pintu sarana keretanya.\r\n\r\nPihaknya pun menarik kereta yang bermasalah tersebut untuk melakukan pengecekan. Hal ini yang menimbulkan antrean perjalanan.\r\n\r\nBaca artikel detikfinance, \"LRT Jabodebek Jalur Bekasi Gangguan, KAI Ungkap Biang Keroknya\" selengkapnya https://finance.detik.com/infrastruktur/d-6903040/lrt-jabodebek-jalur-bekasi-gangguan-kai-ungkap-biang-keroknya.\r\n\r\n'),
(4, 'update from postman 2', 'update from postman 2'),
(5, 'update blog', 'update blog');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'udin123', '$2b$10$Oxx8CoqXN1rmy.wVACzXZes2jzETwOyuvZwaEiKnknD3jtN08dyPq', ''),
(2, 'bogor123', '$2b$10$caZs.nO7IKohCb68fxr0l.1a6BHqVXfgSWTiTckOpSA6be1GvEwum', ''),
(3, 'udin1234', '$2b$10$8GEpuAJTE3WR9TMA13ZgOuNZolpK2hm4JDHqN/3TwxPhUCdwB60rW', ''),
(4, 'udin12345', '$2b$10$ctX92ovQaSil43usC4gB6uCl6kEET9IYpcyFJrV.Gd5/TTpm5nyJ2', 'superadmin'),
(5, 'udin123456', '$2b$10$m0iN4mh5URGyql2LKGCtf.x2KnWLHiBtmHYrkOyP0W4TYN321ugj2', 'superadmin'),
(6, 'budi', '$2b$10$fI8J6D2vppO9cHtl1ZUnueTfjHenikCk7cXVMpbSkkzY1LZMx8pEe', ''),
(7, 'budi123', '$2b$10$eZ5ccTYs95lJ.FX2/A3rOuPKgafCGxV1lw7ozephVwCF1Bx3aNsw2', 'admin'),
(8, 'jakarta12', '$2b$10$ee/SHOtZgu401ypIosuJqeVjmv4X73vBeSVnX4I.vZQ4HR.4W1Z.C', 'admin'),
(9, 'natan', '$2b$10$/yqcEhu320i7zpRZle8LK.tQPa78pljDO7HjnNYE4iszsOBG8BD4S', 'admin'),
(10, 'natan123', '$2b$10$Tcz3iG9O/ywuJh7NjPlE2OjFQS.oUVvi6GH8xscXPPE.NTNEpnCra', 'admin'),
(11, '12345678', '$2b$10$xlID/HSR48oP9C2uhJbEbuxALufqzimRYw1Udw60AUFAocbsK3m7i', 'admin'),
(12, 'bogor1234', '$2b$10$le1UU6RvOL6DYl3S89AZ5upEvqR2thIpim.QMovsiyiqxQtKm55Sq', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
