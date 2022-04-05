-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2022 at 07:51 PM
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
-- Database: `prodi_sainsdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_matkul`
--

CREATE TABLE `data_matkul` (
  `id_matkul` int(255) NOT NULL ,
  `nama_matkul` varchar(200) NOT NULL,
  `rumpun_kuliah` varchar(200) NOT NULL,
  `project_based_learning` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosen_sainsdata`
--

CREATE TABLE `dosen_sainsdata` (
  `id_dosen` int(255) NOT NULL,
  `nama_dosen` varchar(200) NOT NULL,
  `npt_dosen` varchar(200) NOT NULL,
  `jabatan_fungsional` varchar(200) CHARACTER SET latin1 COLLATE latin1_nopad_bin NOT NULL,
  `masa_kerja` int(20) NOT NULL,
  `id_matkul` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(255) NOT NULL,
  `nama_mahasiswa` varchar(200) NOT NULL,
  `npm_mahasiswa` varchar(200) NOT NULL,
  `semester_mahasiswa` int(10) NOT NULL,
  `id_matkul` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_matkul`
--
ALTER TABLE `data_matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indexes for table `dosen_sainsdata`
--
ALTER TABLE `dosen_sainsdata`
  ADD PRIMARY KEY (`id_dosen`),
  ADD UNIQUE KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `id_matkul` (`id_matkul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_matkul`
--
ALTER TABLE `data_matkul`
  MODIFY `id_matkul` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dosen_sainsdata`
--
ALTER TABLE `dosen_sainsdata`
  MODIFY `id_dosen` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(255) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen_sainsdata`
--
ALTER TABLE `dosen_sainsdata`
  ADD CONSTRAINT `dosen_sainsdata_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `data_matkul` (`id_matkul`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`id_matkul`) REFERENCES `data_matkul` (`id_matkul`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
