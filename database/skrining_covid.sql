-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2020 at 07:05 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skrining_covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `user` varchar(16) NOT NULL,
  `password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`user`, `password`) VALUES
('admin', 'admin'),
('user', 'clxndyfbr99');

-- --------------------------------------------------------

--
-- Table structure for table `tb_gejala`
--

CREATE TABLE `tb_gejala` (
  `kode_gejala` varchar(16) NOT NULL,
  `nama_gejala` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_gejala`
--

INSERT INTO `tb_gejala` (`kode_gejala`, `nama_gejala`) VALUES
('G001', 'Mengalami Demam / Riwayat Demam'),
('G002', 'Mengalami Batuk / Pilek / Sakit Tenggorokan / Sesak Napas'),
('G003', 'Mengalami ISPA Berat / Pneumonia Berat'),
('G004', 'Memiliki Riwayat perjalanan atau tinggal di luar negeri yang melaporkan transmisi local 14 hari sebelum muncul gejala'),
('G005', 'Memiliki Riwayat perjalanan atau tinggal di area transmisi local di Indonesia 14 hari sebelum muncul gejala'),
('G006', 'Memiliki Riwayat kontak langsung dengan kasus konfirmasi atau probable COVID-19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelompok`
--

CREATE TABLE `tb_kelompok` (
  `kode_kelompok` varchar(16) NOT NULL,
  `nama_kelompok` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `solusi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kelompok`
--

INSERT INTO `tb_kelompok` (`kode_kelompok`, `nama_kelompok`, `detail`, `solusi`) VALUES
('D01', 'Pasien Dalam Pengawasan (PDP)', '-', 'Segera hubungi rumah sakit terdekat yang ada pada menu Informasi rumah sakit untuk penanganan dan pemeriksan lebih lanjut.  Harap untuk memisahkan diri dengan anggota keluarga atau orang lain untuk menghindari adanya resiko penularan.'),
('D02', 'Orang Dalam Pemantauan (ODP)', '-', 'Lakukan isolasi mandiri di rumah selama 14 hari. Selama menjalankan isolasi mandiri, Anda diharap untuk memisahkan diri dari anggota lain untuk mengurangi resiko penularan. Bila perlu hubungi rumah sakit terdekat untuk memastikan kondisi Anda. Apabila dalam kurun waktu 14 hari masa isolasi muncul gejala-gejala, segera hubungi rumah sakit rujukan terdekat.'),
('D03', 'Orang dengan Resiko Rendah Terkena COVID-19', '-', 'Tidak keluar rumah apabila tidak ada hal yang mendesak. Apabila terpaksa harus keluar, gunakan masker dan lakukan social distancing.\r\nJalani pola hidup sehat dengan makan makanan bergizi dan olahraga teratur.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tb_konsultasi`
--

CREATE TABLE `tb_konsultasi` (
  `id_rule` int(11) NOT NULL,
  `kode` varchar(16) DEFAULT NULL,
  `jawaban` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_rule`
--

CREATE TABLE `tb_rule` (
  `id_rule` int(11) NOT NULL,
  `kode` varchar(16) DEFAULT NULL,
  `jenis` varchar(16) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `child` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rule`
--

INSERT INTO `tb_rule` (`id_rule`, `kode`, `jenis`, `parent`, `child`) VALUES
(1, 'G001', 'tanya', 0, 'ya'),
(2, 'G002', 'tanya', 1, 'ya'),
(3, 'G004', 'tanya', 2, 'ya'),
(4, 'D01', 'diagnosa', 3, 'ya'),
(5, 'G005', 'tanya', 3, 'tidak'),
(6, 'D01', 'diagnosa', 5, 'ya'),
(7, 'G006', 'tanya', 5, 'tidak'),
(8, 'D01', 'diagnosa', 7, 'ya'),
(9, 'G003', 'tanya', 7, 'tidak'),
(10, 'D02', 'diagnosa', 9, 'ya'),
(11, 'D03', 'diagnosa', 9, 'tidak'),
(12, 'G005', 'tanya', 2, 'tidak'),
(13, 'D01', 'diagnosa', 12, 'ya'),
(14, 'G004', 'tanya', 12, 'tidak'),
(15, 'D01', 'diagnosa', 14, 'ya'),
(16, 'G006', 'tanya', 14, 'tidak'),
(17, 'D01', 'diagnosa', 16, 'ya'),
(18, 'G003', 'tanya', 16, 'tidak'),
(19, 'D02', 'diagnosa', 18, 'ya'),
(20, 'D03', 'diagnosa', 18, 'tidak'),
(21, 'G002', 'tanya', 1, 'tidak'),
(22, 'G004', 'tanya', 21, 'ya'),
(23, 'D02', 'diagnosa', 22, 'ya'),
(24, 'G005', 'tanya', 22, 'tidak'),
(25, 'D02', 'diagnosa', 24, 'ya'),
(26, 'G006', 'tanya', 24, 'tidak'),
(27, 'D01', 'diagnosa', 26, 'ya'),
(28, 'G003', 'tanya', 26, 'tidak'),
(29, 'D02', 'diagnosa', 28, 'ya'),
(30, 'D03', 'diagnosa', 28, 'tidak'),
(31, 'G005', 'tanya', 21, 'tidak'),
(32, 'D02', 'diagnosa', 31, 'ya'),
(33, 'G004', 'tanya', 31, 'tidak'),
(34, 'D02', 'diagnosa', 33, 'ya'),
(35, 'G006', 'tanya', 33, 'tidak'),
(36, 'D02', 'diagnosa', 35, 'ya'),
(37, 'G003', 'tanya', 35, 'tidak'),
(38, 'D03', 'diagnosa', 37, 'ya'),
(39, 'D03', 'diagnosa', 37, 'tidak'),
(40, 'G001', 'tanya', 0, 'ya'),
(41, 'G002', 'tanya', 1, 'ya'),
(42, 'G004', 'tanya', 2, 'ya'),
(43, 'D01', 'diagnosa', 3, 'ya'),
(44, 'G005', 'tanya', 3, 'tidak'),
(45, 'D01', 'diagnosa', 5, 'ya'),
(46, 'G006', 'tanya', 5, 'tidak'),
(47, 'D01', 'diagnosa', 7, 'ya'),
(48, 'G003', 'tanya', 7, 'tidak'),
(49, 'D02', 'diagnosa', 9, 'ya'),
(50, 'D03', 'diagnosa', 9, 'tidak'),
(51, 'G005', 'tanya', 2, 'tidak'),
(52, 'D01', 'diagnosa', 12, 'ya'),
(53, 'G004', 'tanya', 12, 'tidak'),
(54, 'D01', 'diagnosa', 14, 'ya'),
(55, 'G006', 'tanya', 14, 'tidak'),
(56, 'D01', 'diagnosa', 16, 'ya'),
(57, 'G003', 'tanya', 16, 'tidak'),
(58, 'D02', 'diagnosa', 18, 'ya'),
(59, 'D03', 'diagnosa', 18, 'tidak'),
(60, 'G002', 'tanya', 1, 'tidak'),
(61, 'G004', 'tanya', 21, 'ya'),
(62, 'D02', 'diagnosa', 22, 'ya'),
(63, 'G005', 'tanya', 22, 'tidak'),
(64, 'D02', 'diagnosa', 24, 'ya'),
(65, 'G006', 'tanya', 24, 'tidak'),
(66, 'D01', 'diagnosa', 26, '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rumahsakit`
--

CREATE TABLE `tb_rumahsakit` (
  `kode_rs` int(3) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `nama_rs` varchar(255) NOT NULL,
  `alamat_rs` varchar(255) NOT NULL,
  `telp_rs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rumahsakit`
--

INSERT INTO `tb_rumahsakit` (`kode_rs`, `provinsi`, `nama_rs`, `alamat_rs`, `telp_rs`) VALUES
(3, 'Aceh', 'RSU Cut Meutia Lhokseumawe ', 'Jl. Banda Aceh-Medan Km.6 Buket Rata Lhokseumawe', '0645-43012'),
(4, 'Sumatra Utara', 'RSU H. Adam Malik Medan ', 'Jl. Bunga lau No.17', ' 061 - 8360381'),
(5, 'Sumatra Utara', 'RSU Kabanjahe', 'Jl. KS Ketaren 8 Kabanjahe', '20550'),
(6, 'Sumatra Utara', 'RSU Pematang Siantar', 'Jl. Sutomo No.230 P. Siantar', '0634-21780'),
(7, 'Sumatra Utara', 'RSU Tarutung', 'Jl. Bin Harun Said Tarutung', '0633-21303'),
(8, 'Sumatra Utara', 'RSU Padang Sidempuan', 'Jl. Dr FL Tobing Pd Sidempuan', '21780'),
(9, 'Sumatra Barat', 'RSU Dr. M. Jamil Padang', 'Jl. Perintis Kemerdekaan, Padang.', '0751 - 32372'),
(10, 'Sumatra Barat', 'RSUD Dr. Achmad Mochtar', 'Jl. Dr A Rivai Bukittinggi', '0752-21720'),
(11, 'Riau', 'RSUD Arifin Achmad ', 'Jl. Diponegoro No. 2, Pekanbaru ', '0761-23418, 21618'),
(12, 'Aceh', 'RSUD Dr. Zainoel Abidin ', 'Jl. Tgk Daud Beureuh , No. 108 B, Banda Aceh', '0651-34562'),
(13, 'Riau', 'RSUD Kota Dumai ', 'Jl. Tanjung Jati No. 4, Dumai ', '0765-440992'),
(14, 'Riau', 'RSUD Puri Husada Tembilahan ', 'Jl. Veteran No. 52, Tembilahan', '0768-24563'),
(15, 'Kepulauan Riau', 'RSUD Embung Fatimah', 'Jl. R. Soeprapto Blok D 1-9, Batu Aji, Kota Batam', '0778-364446'),
(16, 'Kepulauan Riau', 'RSBP Batam', 'Jl. Dr. Cipto Mangunkusumo No. 1, Sekupang, Batam', '0778-322046, 322121'),
(18, 'Kepulauan Riau', 'RSUD Muhammad Sani', 'Jl. Soekarno - Hatta No. 1, Tanjung Balai Karimun, Kabupaten Karimun', '0777-327808'),
(19, 'Kepulauan Riau', 'RSUD Kepulauan Riau TanjungPinang', 'Jl. W. R. Supratman No. 100 KM 8, Tanjung Pinang, Kepulauan Riau', '0771-7335203'),
(20, 'Jambi', 'RSUD Raden Mattaher Jambi', 'Jl. Letjend Suprapto No. 31, Telanaipura, Jambi 36122', '0741-61692, 61694'),
(21, 'Sumatra Selatan', 'RSUD  Dr. Mohammad Hoesin Palembang', 'Jl. Jendral Sudirman KM. 3,5 - Palembang', '0711354088'),
(22, 'Sumatra Selatan', 'Rs. Dr. Rivai Abdullah', 'Jl. Sungai Kundur, Kelurahan Mariana, Kecamatan Banyuasin I', '07117537201');

-- --------------------------------------------------------

--
-- Table structure for table `tb_visitor`
--

CREATE TABLE `tb_visitor` (
  `id_visitor` int(5) NOT NULL,
  `nama_visitor` varchar(255) NOT NULL,
  `jk_visitor` char(3) NOT NULL,
  `bdate_visitor` date NOT NULL,
  `alamat_visitor` text NOT NULL,
  `telp_visitor` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_visitor`
--

INSERT INTO `tb_visitor` (`id_visitor`, `nama_visitor`, `jk_visitor`, `bdate_visitor`, `alamat_visitor`, `telp_visitor`) VALUES
(13, 'Clandy Febriana', 'Pr', '1999-02-26', 'Jl. Kayu Gede 1, Gang Delima RT 010 RW 04 No. 9', '081291312533'),
(14, 'Clandy Febriana', 'Pr', '1999-02-26', 'Indonesia', '081291312533');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD PRIMARY KEY (`kode_gejala`);

--
-- Indexes for table `tb_kelompok`
--
ALTER TABLE `tb_kelompok`
  ADD PRIMARY KEY (`kode_kelompok`);

--
-- Indexes for table `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indexes for table `tb_rule`
--
ALTER TABLE `tb_rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indexes for table `tb_rumahsakit`
--
ALTER TABLE `tb_rumahsakit`
  ADD PRIMARY KEY (`kode_rs`);

--
-- Indexes for table `tb_visitor`
--
ALTER TABLE `tb_visitor`
  ADD PRIMARY KEY (`id_visitor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_rule`
--
ALTER TABLE `tb_rule`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tb_rumahsakit`
--
ALTER TABLE `tb_rumahsakit`
  MODIFY `kode_rs` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_visitor`
--
ALTER TABLE `tb_visitor`
  MODIFY `id_visitor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
