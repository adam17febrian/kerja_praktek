-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 30 Jun 2023 pada 03.59
-- Versi server: 10.5.20-MariaDB
-- Versi PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id20935806_bodyrepair`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(100) NOT NULL,
  `barang` varchar(100) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `barang`, `id_kategori`, `id_satuan`, `harga`, `stok`) VALUES
('DB-23061801', 'Penghilangan Goresan', 18, 15, '300000', 1000),
('DB-23061802', 'Cat Body (Sedan)', 18, 14, '6000000', 1000),
('DB-23061803', 'Perbaikan Karat', 19, 15, '500000', 1000),
('DB-23061804', 'Perbaikan Penyok dengan Cat', 19, 15, '600000', 1000),
('DB-23061805', 'Penggantian Kaca Depan', 19, 15, '500000', 1000),
('DB-23061806', 'Perbaikkan Penyok tanpa Cat', 19, 15, '300000', 1000),
('DB-23062601', 'Cat Body (Minibus)', 18, 14, '7000000', 1000),
('DB-23062602', 'Penyesuaian Body', 19, 14, '4000000', 1000),
('DB-23062603', 'Cat Body (Pickup)', 18, 14, '4000000', 1000),
('DB-23062604', 'Poles Body', 20, 14, '250000', 1000),
('DB-23062605', 'Jasa Pemasangan', 19, 16, '100000', 1000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_keluar` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` varchar(100) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_masuk` varchar(100) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_barang` varchar(100) NOT NULL,
  `jumlah_masuk` varchar(50) NOT NULL,
  `harga_beli` int(25) NOT NULL,
  `total_harga` int(25) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_masuk`, `id_supplier`, `id_user`, `id_barang`, `jumlah_masuk`, `harga_beli`, `total_harga`, `tanggal_masuk`) VALUES
('A-TP-23061801011', 11, 91, 'DB-23061806', '10', 700000, 7000000, '2023-06-19'),
('A-TP-23061801012', 11, 91, 'DB-23061803', '10', 100000, 1000000, '2023-06-19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `id_barang` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `total_harga` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `invoice`, `id_barang`, `id_user`, `jumlah`, `total_harga`) VALUES
(96, 'PY-23061801011', 'DB-23061806', 91, 1, 1000000),
(97, 'PY-23061801012', 'DB-23061803', 91, 2, 400000);

--
-- Trigger `detail_transaksi`
--
DELIMITER $$
CREATE TRIGGER `transaksi_penjualan` AFTER INSERT ON `detail_transaksi` FOR EACH ROW BEGIN
	UPDATE barang SET stok = stok-NEW.jumlah
    WHERE id_barang = NEW.id_barang;
   END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(18, 'Repaint'),
(19, 'Repair'),
(20, 'Treatment');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` enum('Pria','Wanita') NOT NULL,
  `no_telp` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `plat` text NOT NULL,
  `jenis_kendaraan` text NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama`, `jk`, `no_telp`, `alamat`, `plat`, `jenis_kendaraan`, `status`) VALUES
(20, 'H. Ujang Budi', 'Pria', '087770255558', 'Jalan Cikodok, Cimande, Caringin, Lemah Duhur, Kec. Caringin, Kabupaten Bogor', 'F1303FW', 'Toyoto All New Corolla', 'Selesai'),
(21, 'Nana Ruslana', 'Pria', '081320207770', 'Cikeas Rt.02/10, Bojong Koneng, Kec. Babakan Madang, Kab. Bogor', 'F1224DW', 'Honda City', 'Selesai'),
(22, 'Muhammad Sueb', 'Pria', '08980995495', 'Jl. Raya Parung No.46, Jabon Mekar, Kec. Parung, Kab. Bogor', 'F1128FG', 'Daihatsu Grandmax', 'Selesai'),
(23, 'Didi Sumardi', 'Pria', '0895384480936', 'Jl. Raya Sabilillah, Tajur, Kec. Citeureup, Kab. Bogor', 'B9046UCR', 'Daihatsu Grandmax', 'Selesai'),
(24, 'Sukardi', 'Pria', '081930078038', 'Jl. Raya Cilebut Jl. Jemb. II, Sukaresmi, Kec. Tanah Sereal, Bogor', 'H1356EF', 'Suzuki Ertiga', 'Selesai'),
(25, 'H. Abduloh', 'Pria', '085881283361', 'Jl. Tarik Kolot No.rt 02/01, Tarikolot, Citeureup, Kab. Bogor', 'B1599URZ', 'Chevrolet Spin', 'Selesai'),
(26, 'Ayub Sukmana', 'Pria', '085711992416', 'Jl Kebon Kopi Dusun Kamurang RT 02/07, Puspasari, Kec. Citeureup, Kab. Bogor', 'F1318AT', 'Daihatsu Sirion', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_barang` varchar(100) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jumlah` int(50) NOT NULL,
  `total` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_barang`, `id_user`, `jumlah`, `total`) VALUES
(41, 'DB-23062605', 91, 1, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(11) NOT NULL,
  `satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `satuan`) VALUES
(14, 'Body'),
(15, 'Panel'),
(16, 'Unit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_telp` varchar(100) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama`, `no_telp`, `alamat`) VALUES
(11, 'Toko Mang Nung', '08980998980', 'Jl. Citerep');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `invoice` varchar(100) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `total` int(20) NOT NULL,
  `bayar` int(20) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`invoice`, `id_pelanggan`, `id_user`, `total`, `bayar`, `kembalian`, `tanggal`, `waktu`) VALUES
('PY-23061801011', 17, 91, 1000000, 1010000, 10000, '2023-06-18', '02:25:00'),
('PY-23061801012', 18, 91, 400000, 500000, 100000, '2023-06-18', '02:27:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role_id` enum('Admin','Kasir','Owner') NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `user`, `email`, `image`, `password`, `role_id`, `is_active`, `tanggal_input`) VALUES
(24, 'Abdul', 'abdul@gmail.com', 'Gambar-Anime-Keren-Buat-Profil-232.jpg', '$2y$10$opxa4rwHJ5hujqllAA8hfusfIKUO8KpjX3X1PIkfaS7tlc9KWkP62', 'Owner', 1, 1649396551),
(91, 'ilham', 'ilham1@gmail.com', 'logo.jpg', '$2y$10$zV/AMAVhN9yOQRO6KMfO/OTtWzYvsSXFUPSMCG0oGdvCZ3cBI1x.i', 'Admin', 1, 1682657473);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`) USING BTREE;

--
-- Indeks untuk tabel `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_keluar`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_masuk`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`invoice`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
