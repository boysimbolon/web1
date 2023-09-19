-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Sep 2023 pada 17.06
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
-- Database: `dbagoda`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `benefit`
--

CREATE TABLE `benefit` (
  `ID_Hotel` int(11) DEFAULT NULL,
  `Tipe_Kamar` varchar(50) DEFAULT NULL,
  `Sarapan` tinyint(1) DEFAULT NULL,
  `Wifi` tinyint(1) DEFAULT NULL,
  `Promo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `ID_Pemesanan` int(11) NOT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `ID_Kamar` int(11) DEFAULT NULL,
  `Tanggal_Check_In` date DEFAULT NULL,
  `Tanggal_Check_Out` date DEFAULT NULL,
  `ID_Tamu` int(11) DEFAULT NULL,
  `Jumlah_Tamu` int(11) DEFAULT NULL,
  `Status_Pemesanan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `ID_Pelanggan` int(11) NOT NULL,
  `Nama_Pelanggan` varchar(255) DEFAULT NULL,
  `Alamat_Pelanggan` varchar(255) DEFAULT NULL,
  `Nomor_Telepon_Pelanggan` varchar(15) DEFAULT NULL,
  `Email_Pelanggan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotel`
--

CREATE TABLE `hotel` (
  `ID_Hotel` int(11) NOT NULL,
  `Nama_Hotel` varchar(255) DEFAULT NULL,
  `Alamat_Hotel` varchar(255) DEFAULT NULL,
  `Deskripsi_Hotel` text DEFAULT NULL,
  `Fasilitas_Hotel` text DEFAULT NULL,
  `Rate_Hotel` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_umur`
--

CREATE TABLE `kategori_umur` (
  `ID_Tamu` int(11) NOT NULL,
  `ID_Pemesanan` int(11) DEFAULT NULL,
  `Anak_Anak` int(11) DEFAULT NULL,
  `Dewasa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `ID_Login` int(11) NOT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Kata_Sandi_Pengguna` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `ID_Pembayaran` int(11) NOT NULL,
  `ID_Pemesanan` int(11) DEFAULT NULL,
  `Metode_Pembayaran` varchar(50) DEFAULT NULL,
  `Total_Pembayaran` decimal(10,2) DEFAULT NULL,
  `Tanggal_Pembayaran` date DEFAULT NULL,
  `Status_Pembayaran` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `review_hotel`
--

CREATE TABLE `review_hotel` (
  `ID_Hotel` int(11) DEFAULT NULL,
  `ID_Pelanggan` int(11) DEFAULT NULL,
  `Nilai_Rating` decimal(3,2) DEFAULT NULL,
  `Komentar_Review` text DEFAULT NULL,
  `Tanggal_Review` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `ID_Hotel` int(11) DEFAULT NULL,
  `ID_Kamar` int(11) NOT NULL,
  `Tipe_Kamar` varchar(50) DEFAULT NULL,
  `Nomor_Kamar` varchar(10) DEFAULT NULL,
  `Harga_Kamar_Per_Malam` decimal(10,2) DEFAULT NULL,
  `Stok_Kamar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tipe_kamar`
--

CREATE TABLE `tipe_kamar` (
  `Tipe_Kamar` varchar(50) NOT NULL,
  `Nama_Kamar` varchar(255) DEFAULT NULL,
  `Deskripsi_Tipe_Kamar` text DEFAULT NULL,
  `Kapasitas_Kamar` int(11) DEFAULT NULL,
  `Fasilitas_Kamar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `benefit`
--
ALTER TABLE `benefit`
  ADD KEY `ID_Hotel` (`ID_Hotel`),
  ADD KEY `Tipe_Kamar` (`Tipe_Kamar`);

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`ID_Pemesanan`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`),
  ADD KEY `ID_Kamar` (`ID_Kamar`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID_Pelanggan`);

--
-- Indeks untuk tabel `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`ID_Hotel`);

--
-- Indeks untuk tabel `kategori_umur`
--
ALTER TABLE `kategori_umur`
  ADD PRIMARY KEY (`ID_Tamu`),
  ADD KEY `ID_Pemesanan` (`ID_Pemesanan`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID_Login`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD KEY `ID_Pemesanan` (`ID_Pemesanan`);

--
-- Indeks untuk tabel `review_hotel`
--
ALTER TABLE `review_hotel`
  ADD KEY `ID_Hotel` (`ID_Hotel`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`ID_Kamar`),
  ADD KEY `ID_Hotel` (`ID_Hotel`);

--
-- Indeks untuk tabel `tipe_kamar`
--
ALTER TABLE `tipe_kamar`
  ADD PRIMARY KEY (`Tipe_Kamar`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `benefit`
--
ALTER TABLE `benefit`
  ADD CONSTRAINT `benefit_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`),
  ADD CONSTRAINT `benefit_ibfk_2` FOREIGN KEY (`Tipe_Kamar`) REFERENCES `tipe_kamar` (`Tipe_Kamar`);

--
-- Ketidakleluasaan untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `customers` (`ID_Pelanggan`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`ID_Kamar`) REFERENCES `rooms` (`ID_Kamar`);

--
-- Ketidakleluasaan untuk tabel `kategori_umur`
--
ALTER TABLE `kategori_umur`
  ADD CONSTRAINT `kategori_umur_ibfk_1` FOREIGN KEY (`ID_Pemesanan`) REFERENCES `bookings` (`ID_Pemesanan`);

--
-- Ketidakleluasaan untuk tabel `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `customers` (`ID_Pelanggan`);

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`ID_Pemesanan`) REFERENCES `bookings` (`ID_Pemesanan`);

--
-- Ketidakleluasaan untuk tabel `review_hotel`
--
ALTER TABLE `review_hotel`
  ADD CONSTRAINT `review_hotel_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`),
  ADD CONSTRAINT `review_hotel_ibfk_2` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `customers` (`ID_Pelanggan`);

--
-- Ketidakleluasaan untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`ID_Hotel`) REFERENCES `hotel` (`ID_Hotel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
