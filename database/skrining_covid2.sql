-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Jul 2020 pada 05.30
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skrining_covid2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `user` varchar(16) NOT NULL,
  `password` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`user`, `password`) VALUES
('admin', 'admin'),
('user', 'clxndyfbr99');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_gejala`
--

CREATE TABLE `tb_gejala` (
  `kode_gejala` varchar(16) NOT NULL,
  `nama_gejala` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_gejala`
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
-- Struktur dari tabel `tb_kelompok`
--

CREATE TABLE `tb_kelompok` (
  `kode_kelompok` varchar(16) NOT NULL,
  `nama_kelompok` varchar(255) DEFAULT NULL,
  `detail` text,
  `solusi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelompok`
--

INSERT INTO `tb_kelompok` (`kode_kelompok`, `nama_kelompok`, `detail`, `solusi`) VALUES
('D01', 'Pasien Dalam Pengawasan (PDP)', '-', 'Segera hubungi rumah sakit terdekat yang ada pada menu Informasi rumah sakit untuk penanganan dan pemeriksan lebih lanjut.  Harap untuk memisahkan diri dengan anggota keluarga atau orang lain untuk menghindari adanya resiko penularan.'),
('D02', 'Orang Dalam Pemantauan (ODP)', '-', 'Lakukan isolasi mandiri di rumah selama 14 hari. Selama menjalankan isolasi mandiri, Anda diharap untuk memisahkan diri dari anggota lain untuk mengurangi resiko penularan. Bila perlu hubungi rumah sakit terdekat untuk memastikan kondisi Anda. Apabila dalam kurun waktu 14 hari masa isolasi muncul gejala-gejala, segera hubungi rumah sakit rujukan terdekat.'),
('D03', 'Orang dengan Resiko Rendah Terkena COVID-19', '-', 'Tidak keluar rumah apabila tidak ada hal yang mendesak. Apabila terpaksa harus keluar, gunakan masker dan lakukan social distancing.\r\nJalani pola hidup sehat dengan makan makanan bergizi dan olahraga teratur.\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_konsultasi`
--

CREATE TABLE `tb_konsultasi` (
  `id_rule` int(11) NOT NULL,
  `kode` varchar(16) DEFAULT NULL,
  `jawaban` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rule`
--

CREATE TABLE `tb_rule` (
  `id_rule` int(11) NOT NULL,
  `kode` varchar(16) DEFAULT NULL,
  `jenis` varchar(16) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `child` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_rule`
--

INSERT INTO `tb_rule` (`id_rule`, `kode`, `jenis`, `parent`, `child`) VALUES
(1, 'G001', 'tanya', 0, 'ya'),
(2, 'G002', 'tanya', 1, 'ya'),
(3, 'G004', 'tanya', 2, 'ya'),
(4, 'G002', 'tanya', 1, 'tidak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rumahsakit`
--

CREATE TABLE `tb_rumahsakit` (
  `kode_rs` int(3) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `nama_rs` varchar(255) NOT NULL,
  `alamat_rs` text NOT NULL,
  `telp_rs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_rumahsakit`
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
-- Struktur dari tabel `tb_visitor`
--

CREATE TABLE `tb_visitor` (
  `id_visitor` int(5) NOT NULL,
  `nama_visitor` varchar(255) NOT NULL,
  `tgl_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jk_visitor` char(3) NOT NULL,
  `bdate_visitor` date NOT NULL,
  `alamat_visitor` text NOT NULL,
  `telp_visitor` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_visitor`
--

INSERT INTO `tb_visitor` (`id_visitor`, `nama_visitor`, `tgl_visit`, `jk_visitor`, `bdate_visitor`, `alamat_visitor`, `telp_visitor`) VALUES
(13, 'Clandy Febriana', '2020-07-26 06:06:09', 'Pr', '1999-02-26', 'Jl. Kayu Gede 1, Gang Delima RT 010 RW 04 No. 9', '081291312533'),
(14, 'Clandy Febriana', '2020-07-26 06:06:09', 'Pr', '1999-02-26', 'Indonesia', '081291312533'),
(15, 'Andanari Oktaviana', '2020-07-26 06:06:09', 'Pr', '1999-02-26', 'Jl. Kayu  Gede 1, Gang Delima RT 010 RW 04 No. 9', '15324'),
(16, 'Clandy Febriana', '2020-07-26 06:07:54', 'Pr', '2020-07-26', 'Indonesia', '081291312533'),
(17, 'Clandy Febriana', '2020-07-26 09:22:03', 'Pr', '2020-07-14', 'Indonesia', '081291312533'),
(18, 'Andanari Oktaviana', '2020-07-26 10:07:02', 'Pr', '1996-10-03', 'Jl. Kayu Gede 1, Gang Delima RT 010/ RW 04', '081291312533'),
(19, 'Hartono', '2020-07-26 10:09:29', 'Pr', '2020-07-07', 'INdonesia', '081291312533'),
(20, 'Andanari Oktaviana', '2020-07-26 10:10:57', 'Pr', '2020-07-15', 'Indonesia', '081291312533'),
(21, 'Hartono', '2020-07-26 10:29:58', 'Lk', '1972-02-10', 'Jl. Kayu Gede 1, Gang Delima RT 010/ RW 04', '081291312533');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`user`);

--
-- Indeks untuk tabel `tb_gejala`
--
ALTER TABLE `tb_gejala`
  ADD PRIMARY KEY (`kode_gejala`);

--
-- Indeks untuk tabel `tb_kelompok`
--
ALTER TABLE `tb_kelompok`
  ADD PRIMARY KEY (`kode_kelompok`);

--
-- Indeks untuk tabel `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indeks untuk tabel `tb_rule`
--
ALTER TABLE `tb_rule`
  ADD PRIMARY KEY (`id_rule`);

--
-- Indeks untuk tabel `tb_rumahsakit`
--
ALTER TABLE `tb_rumahsakit`
  ADD PRIMARY KEY (`kode_rs`);

--
-- Indeks untuk tabel `tb_visitor`
--
ALTER TABLE `tb_visitor`
  ADD PRIMARY KEY (`id_visitor`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_konsultasi`
--
ALTER TABLE `tb_konsultasi`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_rule`
--
ALTER TABLE `tb_rule`
  MODIFY `id_rule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_rumahsakit`
--
ALTER TABLE `tb_rumahsakit`
  MODIFY `kode_rs` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_visitor`
--
ALTER TABLE `tb_visitor`
  MODIFY `id_visitor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
