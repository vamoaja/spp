-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Feb 2024 pada 23.28
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(15) NOT NULL,
  `kompetensi_keahlian` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kompetensi_keahlian`) VALUES
(15, 'XII RPL 1', 'Rekayasa Perangkat Lunak'),
(20, 'XII MM 2', 'Multimedia'),
(27, 'XII TKJ 1', 'Teknik Komputer Jaringan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_petugas` int(11) NOT NULL,
  `nisn` varchar(10) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `bulan_dibayar` varchar(10) NOT NULL,
  `tahun_dibayar` varchar(4) NOT NULL,
  `id_spp` int(11) NOT NULL,
  `jumlah_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_petugas`, `nisn`, `tgl_bayar`, `bulan_dibayar`, `tahun_dibayar`, `id_spp`, `jumlah_bayar`) VALUES
(133, 8, '1104', '2024-02-07', 'januari', '2023', 10, 410000),
(137, 8, '1104', '2024-02-07', 'januari', '2024', 13, 410000),
(140, 8, '1104', '2024-02-07', 'februari', '2023', 10, 410000),
(141, 8, '1104', '2024-02-07', 'maret', '2023', 10, 410000),
(142, 8, '1104', '2024-02-07', 'april', '2023', 10, 410000),
(143, 8, '1104', '2024-02-07', 'Mei', '2023', 10, 410000),
(144, 8, '1104', '2024-02-07', 'juni', '2023', 10, 410000),
(145, 8, '1104', '2024-02-07', 'juli', '2023', 10, 410000),
(146, 8, '1104', '2024-02-07', 'agustus', '2023', 10, 410000),
(147, 8, '1104', '2024-02-07', 'september', '2023', 10, 410000),
(148, 8, '1104', '2024-02-07', 'oktober', '2023', 10, 410000),
(149, 8, '1104', '2024-02-07', 'november', '2023', 10, 410000),
(150, 8, '1104', '2024-02-07', 'desember', '2023', 10, 410000),
(151, 8, '1104', '2024-02-07', 'januari', '2021', 14, 250000),
(152, 8, '1104', '2024-02-07', 'februari', '2021', 14, 250000),
(153, 8, '1104', '2024-02-07', 'maret', '2021', 14, 250000),
(154, 8, '1104', '2024-02-07', 'april', '2021', 14, 250000),
(155, 8, '1104', '2024-02-07', 'Mei', '2021', 14, 250000),
(156, 8, '1104', '2024-02-07', 'juni', '2021', 14, 250000),
(157, 8, '1104', '2024-02-07', 'juli', '2021', 14, 250000),
(158, 8, '1104', '2024-02-07', 'agustus', '2021', 14, 250000),
(159, 8, '1104', '2024-02-07', 'september', '2021', 14, 250000),
(160, 8, '1104', '2024-02-07', 'oktober', '2021', 14, 250000),
(161, 8, '1104', '2024-02-07', 'november', '2021', 14, 250000),
(162, 8, '1104', '2024-02-07', 'desember', '2021', 14, 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `username`, `password`, `nama_petugas`, `level`) VALUES
(8, 'imanuel', '$2y$10$fzafzw6hYOCoLrT8z9Ay3eZ85q0GrtcrQQffmqRR/UolP1WWK/Xiu', 'Imanuel', 'admin'),
(13, 'leunn', '$2y$10$mqZkOK6koZZ.HUVczZv0Du.hz2wdS1b7uWnglU.XkViUEF0P9k4Me', 'Leunn', 'petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `nisn` varchar(10) NOT NULL,
  `nis` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `id_spp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `id_kelas`, `alamat`, `no_telp`, `id_spp`) VALUES
('1104', '2006', 'Leun', 15, 'Lewa', '08126758362', 13),
('123', '213', 'Imanuel Valerio Molle', 15, 'Cibubur', '081282086618', 13),
('3456', '890', 'Adel', 15, 'ada', '085642346534', 13),
('412', '321', 'Odila', 20, 'Lewandowski', '0895879065764', 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spp`
--

CREATE TABLE `spp` (
  `id_spp` int(11) NOT NULL,
  `tahun` year(4) NOT NULL,
  `nominal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spp`
--

INSERT INTO `spp` (`id_spp`, `tahun`, `nominal`) VALUES
(10, 2023, 410000),
(13, 2024, 410000),
(14, 2021, 250000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_spp` (`id_spp`);

--
-- Indeks untuk tabel `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id_spp`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `spp`
--
ALTER TABLE `spp`
  MODIFY `id_spp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembayaran_ibfk_3` FOREIGN KEY (`nisn`) REFERENCES `siswa` (`nisn`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`id_spp`) REFERENCES `spp` (`id_spp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
