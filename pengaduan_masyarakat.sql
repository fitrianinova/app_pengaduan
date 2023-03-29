-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Mar 2023 pada 06.00
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deletetanggapan` (IN `id_tang` CHAR(10))   delete from tanggapan where id_tanggapan = id_tang$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertmasyarakat` (IN `nik_masy` VARCHAR(16), IN `nama_masy` VARCHAR(35), IN `username_masy` VARCHAR(25), IN `password_masy` VARCHAR(255), IN `telp_masy` VARCHAR(13))   insert into masyarakat (nik, nama, username, password, telp) values (nik_masy, nama_masy, username_masy, password_masy, telp_masy)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_petugas` (IN `id_ptgs` INT(11), IN `nama_ptgs` VARCHAR(35), IN `username_ptgs` VARCHAR(25), IN `password_ptgs` VARCHAR(32), IN `telp_ptgs` VARCHAR(13), IN `level_ptgs` ENUM('petugas','admin'))   INSERT INTO petugas(id_petugas,nama_petugas,username,password,telp_petugas,level) values (id_ptgs,nama_ptgs,
 username_ptgs ,password_ptgs,telp_ptgs,level_ptgs)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECTmasyarakat` ()   BEGIN
SELECT nik, nama FROM masyarakat;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatemasyarakat` (IN `nik_mas` VARCHAR(16), IN `user_masy` VARCHAR(35))   update masyarakat set username = user_masy where nik = nik_mas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatepengaduan` (IN `id_peng` INT(11), IN `tgl_peng` DATE)   update pengaduan set tgl_pengaduan = tgl_peng where id_pengaduan = id_peng$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `data_pengaduan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `data_pengaduan` (
`nik` varchar(16)
,`nama` varchar(35)
,`tgl_pengaduan` date
,`isi_laporan` text
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `detail_pengaduan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `detail_pengaduan` (
`nik` varchar(16)
,`nama` varchar(35)
,`isi_tanggapan` text
,`nama_petugas` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`) VALUES
('2222', 'mara', 'mara_cantiq', '202cb962ac59075b964b07152d234b70', '0899776666'),
('234', 'milda maylani', 'mil', '202cb962ac59075b964b07152d234b70', ''),
('2345', 'dea', 'mila', '202cb962ac59075b964b07152d234b70', '675'),
('320006', 'Mara Humaerotuz', 'marhum', '202cb962ac59075b964b07152d234b70', '09865764444');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(5) NOT NULL,
  `tgl_pengaduan` date NOT NULL,
  `nik` varchar(16) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` enum('proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(36, '2023-02-27', '234', 'dss', 'jujutsu.jpg', 'proses'),
(37, '2023-02-27', '320006', 'hummama', 'spy x family.jpg', ''),
(40, '2023-03-01', '2222', 'rumahku kebakaran', 'Sukuna.(Jujutsu.Kaisen).full.3412401.jpg', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(5) NOT NULL,
  `nama_petugas` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `telp_petugas` varchar(13) NOT NULL,
  `level` enum('admin','petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telp_petugas`, `level`) VALUES
(2, 'Rendy', 'rend', '202cb962ac59075b964b07152d234b70', '076567675', 'admin'),
(4, 'Rendy P', 'rrrr', '202cb962ac59075b964b07152d234b70', '08864', 'petugas'),
(10, 'ibel', 'beli', '123', '086', 'petugas'),
(111, 'tensei marukawwa', 'marukawa', '289dff07669d7a23de0ef88d2f7129e7', '08998766788', 'petugas'),
(112, 'rahma khairunnisa', 'rahma', '202cb962ac59075b964b07152d234b70', '08997', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(5) NOT NULL,
  `id_pengaduan` int(5) NOT NULL,
  `tgl_tanggapan` date NOT NULL,
  `isi_tanggapan` text NOT NULL,
  `id_petugas` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `tgl_tanggapan`, `isi_tanggapan`, `id_petugas`) VALUES
(13, 36, '2023-02-27', 'nknknkdknknknk', 2),
(14, 40, '2023-03-01', 'rumah anda akan segera kami ganti', 2),
(15, 40, '2023-03-01', 'rumah anda akan segera kami ganti dengan yang mewah', 2);

-- --------------------------------------------------------

--
-- Struktur untuk view `data_pengaduan`
--
DROP TABLE IF EXISTS `data_pengaduan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `data_pengaduan`  AS   (select `masyarakat`.`nik` AS `nik`,`masyarakat`.`nama` AS `nama`,`pengaduan`.`tgl_pengaduan` AS `tgl_pengaduan`,`pengaduan`.`isi_laporan` AS `isi_laporan` from (`masyarakat` join `pengaduan`) where `masyarakat`.`nik` = `pengaduan`.`nik`)  ;

-- --------------------------------------------------------

--
-- Struktur untuk view `detail_pengaduan`
--
DROP TABLE IF EXISTS `detail_pengaduan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_pengaduan`  AS   (select `pengaduan`.`nik` AS `nik`,`masyarakat`.`nama` AS `nama`,`tanggapan`.`isi_tanggapan` AS `isi_tanggapan`,`petugas`.`nama_petugas` AS `nama_petugas` from (((`pengaduan` join `masyarakat`) join `tanggapan`) join `petugas`) where `masyarakat`.`nik` = `pengaduan`.`nik` and `pengaduan`.`id_pengaduan` = `tanggapan`.`id_pengaduan` and `petugas`.`id_petugas` = `tanggapan`.`id_petugas`)  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD UNIQUE KEY `nik` (`nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_pengaduan` (`id_pengaduan`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `masyarakat` (`nik`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tanggapan_ibfk_2` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id_pengaduan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
