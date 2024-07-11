-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2024 at 10:38 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pelatihan`
--

-- --------------------------------------------------------

--
-- Table structure for table `gelombang`
--

CREATE TABLE `gelombang` (
  `id` int(11) NOT NULL,
  `nama_gelombang` varchar(15) NOT NULL,
  `aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gelombang`
--

INSERT INTO `gelombang` (`id`, `nama_gelombang`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'Gelombang 1', 0, '2024-06-19 02:25:29', '2024-06-19 06:33:22'),
(2, 'Gelombang 2', 0, '2024-06-19 02:25:29', '2024-06-19 07:14:19'),
(5, 'Gelombang 3', 0, '2024-06-19 04:10:30', '2024-06-19 05:06:00'),
(6, 'Gelombang 4', 0, '2024-06-19 04:10:36', '2024-06-19 06:12:12');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(11) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama_jurusan`, `created_at`, `updated_at`) VALUES
(4, 'Content Creator', '2024-05-14 06:21:40', '2024-05-14 06:21:40'),
(5, 'Teknik Komputer', '2024-05-14 06:23:03', '2024-05-14 06:23:03'),
(6, 'Operator Komputer', '2024-05-14 06:24:40', '2024-05-14 06:24:40'),
(7, 'Web Programming', '2024-05-16 02:07:31', '2024-05-16 02:07:31'),
(8, 'Tata Boga', '2024-05-16 02:07:42', '2024-05-16 02:07:42'),
(9, 'Video Editor', '2024-05-16 02:07:51', '2024-05-16 02:07:51'),
(10, 'Tata Busana', '2024-05-16 02:07:58', '2024-05-16 02:07:58'),
(11, 'Teknik Pendingin', '2024-05-16 02:08:22', '2024-05-16 02:08:22'),
(12, 'Tata Graha', '2024-05-16 02:09:06', '2024-05-16 02:09:06'),
(13, 'Otomotif Sepeda Motor', '2024-05-16 02:09:21', '2024-05-16 02:09:21'),
(14, 'Barista', '2024-05-16 02:09:49', '2024-05-16 02:09:49'),
(15, 'Make Up Artist', '2024-05-16 02:10:09', '2024-05-16 02:10:09'),
(16, 'Desain Grafis', '2024-05-16 02:10:23', '2024-05-16 02:10:23'),
(17, 'Bahasa Inggris', '2024-05-16 02:10:38', '2024-05-16 02:10:38'),
(18, 'Bahasa Korea', '2024-05-16 02:10:45', '2024-05-16 02:10:45'),
(19, 'Jaringan Komputer', '2024-05-16 02:11:33', '2024-05-16 02:11:33');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2024-05-17 01:09:42', '2024-06-19 02:04:07'),
(2, 'Kepala', '2024-05-16 00:47:42', '2024-06-19 02:46:03'),
(3, 'Admin', '2024-06-19 02:31:26', '2024-06-19 02:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `pertanyaan_wawancara`
--

CREATE TABLE `pertanyaan_wawancara` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `nama_pertanyaan` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_gelombang` int(11) NOT NULL,
  `nik` varchar(18) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `pendidikan` varchar(20) NOT NULL,
  `gelombang` int(5) NOT NULL,
  `tahun_pelatihan` varchar(5) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id`, `id_jurusan`, `id_gelombang`, `nik`, `nama`, `email`, `hp`, `gender`, `alamat`, `pendidikan`, `gelombang`, `tahun_pelatihan`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 5, 0, '317107120001', 'aderiandi', 'jakarta@gmail.com', '08912447784111', 'Laki-Laki', 'jl.petamburan 2 rt.00 rw.42 no.12                     ', 'SMK', 1, '2024', 1, 1, '2024-05-17 02:54:11', '2024-05-17 02:54:11'),
(41, 7, 0, '1234567890001', 'SAPUTRA', 'saputra@gmail.com', '0812345678901', 'Laki-Laki', 'Jl.. UJUNG 1 BELOKAN 2                      ', 'SMK', 1, '2024', 1, 0, '2024-05-17 01:02:34', '2024-05-17 01:02:34'),
(44, 7, 0, '1234567890003', 'ALFATIH', 'alfatih@gmail.com', '0812345678903', 'Laki-Laki', 'JL. UJUNG BELOKAN 3                   ', 'SMK', 1, '2024', 0, 0, '2024-05-16 07:55:59', '2024-05-16 07:55:59'),
(45, 4, 0, '1234567890004', 'AMENAH', 'amenah@gmail.com', '0812345678904', 'Perempuan', 'JL. UJUNG BELOKAN 4                  ', 'SMK', 1, '2024', 2, 0, '2024-05-16 04:18:46', '2024-05-16 04:18:46'),
(46, 4, 0, '1234567890005', 'ZUBAIDAH', 'zubaidah@gmail.com', '0812345678905', 'Perempuan', 'JL. UJUNG BELOKAN 5           ', 'SMK', 1, '2024', 3, 0, '2024-05-16 04:18:53', '2024-05-16 04:18:53'),
(47, 4, 0, '1234567890006', 'SARAH', 'sarah@gmail.com', '0812345678906', 'Perempuan', 'JL. UJUNG BELOKAN 6               ', 'SMK', 1, '2024', 0, 0, '2024-05-16 07:42:24', '2024-05-16 07:42:24'),
(48, 9, 0, '1234567890007', 'KHODIJAH', 'khodijah@gmail.com', '0812345678907', 'Perempuan', 'JL. UJUNG BELOKAN 7         ', 'SMK', 1, '2024', 0, 0, '2024-05-16 07:42:03', '2024-05-16 07:42:03'),
(49, 9, 0, '1234567890008', 'ABDUL', 'abdul@gmail.com', '0812345678908', 'Laki-Laki', 'JL. UJUNG BELOKAN 8          ', 'SMK', 1, '2024', NULL, 0, '2024-05-17 02:25:33', '2024-05-17 02:25:33'),
(50, 9, 0, '1234567890009', 'PUTRI', 'putri@gmail.com', '0812345678909', 'Perempuan', 'JL. UJUNG BELOKAN 9  ', 'SMK', 1, '2024', 2, 0, '2024-05-16 07:55:44', '2024-05-16 07:55:44'),
(51, 7, 0, '1234567890001', 'GABRIEL', 'gabriel@gmail.com', '0812345678901', 'Laki-Laki', 'JL. UJUNG BELOKAN 1                              ', 'SMK', 1, '2024', NULL, 0, '2024-05-17 02:25:30', '2024-05-17 02:25:30'),
(52, 7, 0, '1234567890002', 'SAPUTRA', 'saputra@gmail.com', '0812345678902', 'Laki-Laki', 'JL. UJUNG BELOKAN 2                   ', 'SMK', 1, '2024', 0, 0, '2024-05-17 01:01:29', '2024-05-17 01:01:29');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(35) NOT NULL,
  `harga_brg` int(15) NOT NULL,
  `stock_brg` int(11) NOT NULL,
  `gbr_brg` varchar(30) NOT NULL,
  `tgl_publish` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `harga_brg`, `stock_brg`, `gbr_brg`, `tgl_publish`) VALUES
(7, 'Bunga Mawar', 2500000, 8, 'brg-1716869722.jpg', '2024-05-21'),
(8, 'Bunga Kejora', 1200000, 50, 'brg-1716869730.jpg', '2024-05-21'),
(9, 'Bunga Raflesia', 52000000, 20, 'brg-1716869479.jpg', '2024-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama`, `email`, `password`, `created_at`, `updated_at`) VALUES
(23, 1, 'Administrator', 'administrator@mail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2024-05-17 01:11:10', '2024-06-19 02:47:28'),
(26, 2, 'Kepala Pusat', 'kapus@mail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2024-06-19 02:44:24', '2024-06-19 02:46:58'),
(27, 3, 'Admin', 'admin@mail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2024-06-19 02:47:45', '2024-06-19 02:47:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gelombang`
--
ALTER TABLE `gelombang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pertanyaan_wawancara`
--
ALTER TABLE `pertanyaan_wawancara`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `pertanyaan_wawancara`
--
ALTER TABLE `pertanyaan_wawancara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
