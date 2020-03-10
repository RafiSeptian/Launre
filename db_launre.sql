-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 07 Mar 2020 pada 15.18
-- Versi server: 5.7.24
-- Versi PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_launre`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Nama', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:roles,name|regex:\\/^[a-zA-Z]+$\\/\",\"messages\":{\"required\":\"Nama Hak Akses harus diisi!\",\"unique\":\"Nama Hak Akses sudah ada!\",\"regex\":\"Nama Hak Akses harus Alfabet\"}}}', 2),
(18, 3, 'created_at', 'timestamp', 'Dibuat Pada', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 5, 'id_outlet', 'text', 'Id Outlet', 1, 0, 0, 1, 1, 1, '{}', 17),
(24, 5, 'kode_invoice', 'text', 'Kode Invoice', 1, 1, 1, 0, 0, 1, '{}', 2),
(25, 5, 'id_member', 'text', 'Id Member', 1, 0, 0, 1, 1, 1, '{}', 18),
(26, 5, 'tgl', 'date', 'Tanggal', 1, 1, 1, 0, 0, 1, '{}', 7),
(27, 5, 'batas_waktu', 'date', 'Batas Waktu', 1, 1, 1, 0, 0, 1, '{}', 8),
(28, 5, 'tgl_bayar', 'date', 'Tanggal Bayar', 0, 1, 1, 0, 0, 1, '{}', 9),
(29, 5, 'biaya_tambahan', 'number', 'Biaya Tambahan', 1, 1, 1, 1, 1, 1, '{}', 11),
(30, 5, 'diskon', 'number', 'Diskon', 1, 1, 1, 1, 1, 1, '{}', 10),
(31, 5, 'pajak', 'number', 'Pajak', 1, 1, 1, 1, 0, 1, '{}', 12),
(32, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"baru\",\"options\":{\"baru\":\"Baru\",\"diambil\":\"Diambil\",\"proses\":\"Proses\",\"selesai\":\"Selesai\"}}', 14),
(33, 5, 'dibayar', 'select_dropdown', 'Dibayar', 1, 1, 1, 1, 1, 1, '{\"default\":\"belum_dibayar\",\"options\":{\"belum_dibayar\":\"Belum Dibayar\",\"dibayar\":\"Dibayar\"}}', 15),
(34, 5, 'id_user', 'text', 'Id User', 1, 0, 0, 1, 1, 1, '{}', 19),
(35, 5, 'created_at', 'timestamp', 'Dibuat Pada', 0, 0, 1, 0, 0, 1, '{}', 20),
(36, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 21),
(37, 5, 'deleted_at', 'text', 'Dihapus Pada', 0, 0, 1, 0, 0, 1, '{}', 22),
(38, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(39, 7, 'id_outlet', 'text', 'Id Outlet', 1, 0, 0, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Outlet harus diisi!\"}}}', 4),
(40, 7, 'jenis', 'select_dropdown', 'Jenis', 1, 1, 1, 1, 1, 1, '{\"default\":\"baru\",\"options\":{\"bed_cover\":\"Bed Cover\",\"kaos\":\"Kaos\",\"kiloan\":\"Kiloan\",\"selimut\":\"Selimut\",\"lain\":\"Lainnya\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Jenis harus diisi!\"}}}', 3),
(41, 7, 'nama_paket', 'text', 'Nama Paket', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:tb_paket,nama_paket|regex:\\/^[a-zA-Z ]+$\\/\",\"messages\":{\"unique\":\"Nama paket sudah ada!\",\"required\":\"Nama paket harus diisi!\",\"regex\":\"Nama paket harus Alfabet!\"}}}', 2),
(42, 7, 'harga', 'number', 'Harga', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harga harus diisi!\"}}}', 6),
(43, 7, 'created_at', 'timestamp', 'Dibuat Pada', 0, 0, 1, 0, 0, 1, '{}', 7),
(44, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(45, 7, 'deleted_at', 'text', 'Dihapus Pada', 0, 0, 1, 0, 0, 1, '{}', 9),
(46, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(47, 8, 'nama', 'text', 'Nama Outlet', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:tb_outlet,nama\",\"messages\":{\"unique\":\"Nama sudah ada!\",\"required\":\"Nama harus diisi!\"}}}', 2),
(48, 8, 'alamat', 'text_area', 'Alamat', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Alamat harus diisi!\"}}}', 4),
(49, 8, 'tlp', 'number', 'Telepon', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:tb_outlet,tlp\",\"messages\":{\"unique\":\"Nomor Telepon sudah ada!\",\"required\":\"Nama harus diisi!\"}}}', 3),
(50, 8, 'created_at', 'timestamp', 'Dibuat Pada', 0, 0, 1, 0, 0, 1, '{}', 5),
(51, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(52, 8, 'deleted_at', 'text', 'Dihapus Pada', 0, 0, 1, 0, 0, 1, '{}', 7),
(53, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(54, 9, 'id_outlet', 'text', 'Id Outlet', 1, 0, 0, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Outlet harus diisi!\"}}}', 2),
(55, 9, 'nama', 'text', 'Nama', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|regex:\\/^[a-zA-Z ]+$\\/\",\"messages\":{\"required\":\"Nama harus diisi!\",\"regex\":\"Nama harus Alfabet!\"}}}', 3),
(56, 9, 'alamat', 'text_area', 'Alamat', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Alamat harus diisi!\"}}}', 7),
(57, 9, 'jenis_kelamin', 'select_dropdown', 'Jenis Kelamin', 1, 1, 1, 1, 1, 1, '{\"default\":\"L\",\"options\":{\"L\":\"Laki-Laki\",\"P\":\"Perempuan\"}}', 5),
(58, 9, 'tlp', 'number', 'Telepon', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:tb_member,tlp\",\"messages\":{\"unique\":\"Nomor Telepon sudah ada!\",\"required\":\"Nomor Telepon harus diisi!\"}}}', 6),
(59, 9, 'created_at', 'timestamp', 'Dibuat Pada', 0, 1, 1, 0, 0, 1, '{}', 8),
(60, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(61, 9, 'deleted_at', 'text', 'Dihapus Pada', 0, 0, 1, 0, 0, 1, '{}', 10),
(62, 9, 'tb_member_belongsto_tb_outlet_relationship', 'relationship', 'Outlet', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Outlet\",\"table\":\"tb_outlet\",\"type\":\"belongsTo\",\"column\":\"id_outlet\",\"key\":\"id\",\"label\":\"nama\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(63, 5, 'tb_transaksi_belongsto_tb_member_relationship', 'relationship', 'Nama Member', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Member\",\"table\":\"tb_member\",\"type\":\"belongsTo\",\"column\":\"id_member\",\"key\":\"id\",\"label\":\"nama\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(64, 5, 'tb_transaksi_belongsto_tb_outlet_relationship', 'relationship', 'Outlet', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Outlet\",\"table\":\"tb_outlet\",\"type\":\"belongsTo\",\"column\":\"id_outlet\",\"key\":\"id\",\"label\":\"nama\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(67, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 10, 'role_id', 'text', 'Role Id', 0, 0, 0, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Hak Akses harus diisi!\"}}}', 4),
(69, 10, 'name', 'text', 'Nama', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|regex:\\/^[a-zA-Z ]+$\\/\",\"messages\":{\"required\":\"Nama harus diisi!\",\"regex\":\"Nama harus Alfabet!\"}}}', 2),
(70, 10, 'email', 'text', 'Username', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:users,email\",\"messages\":{\"unique\":\"Username ini sudah terdaftar!\",\"required\":\"Nama harus diisi!\"}}}', 3),
(71, 10, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"mimes:png,jpg,jpeg\",\"messages\":{\"mimes\":\"Format harus berupa PNG,JPG, atau JPEG!\"}}}', 8),
(72, 10, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 1, '{}', 9),
(73, 10, 'id_outlet', 'text', 'Id Outlet', 0, 0, 0, 1, 1, 1, '{}', 6),
(74, 10, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 1, '{}', 10),
(75, 10, 'settings', 'text', 'Settings', 0, 0, 0, 0, 0, 1, '{}', 11),
(76, 10, 'created_at', 'timestamp', 'Dibuat Pada', 0, 1, 1, 0, 0, 1, '{}', 12),
(77, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(78, 10, 'deleted_at', 'text', 'Deleted At', 0, 1, 1, 0, 0, 1, '{}', 14),
(79, 10, 'tb_user_belongsto_role_relationship', 'relationship', 'Hak Akses', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(80, 10, 'tb_user_belongsto_tb_outlet_relationship', 'relationship', 'Outlet', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Outlet\",\"table\":\"tb_outlet\",\"type\":\"belongsTo\",\"column\":\"id_outlet\",\"key\":\"id\",\"label\":\"nama\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(81, 7, 'tb_paket_belongsto_tb_outlet_relationship', 'relationship', 'Outlet', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Outlet\",\"table\":\"tb_outlet\",\"type\":\"belongsTo\",\"column\":\"id_outlet\",\"key\":\"id\",\"label\":\"nama\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(85, 5, 'tb_transaksi_belongsto_tb_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"tb_user\",\"type\":\"belongsTo\",\"column\":\"id_user\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(86, 5, 'tb_transaksi_hasone_tb_detail_transaksi_relationship', 'relationship', 'Paket', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\DetailTrans\",\"table\":\"tb_detail_transaksi\",\"type\":\"hasOne\",\"column\":\"id_transaksi\",\"key\":\"id\",\"label\":\"id_paket\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(87, 5, 'tb_transaksi_hasone_tb_detail_transaksi_relationship_1', 'relationship', 'Qty', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\DetailTrans\",\"table\":\"tb_detail_transaksi\",\"type\":\"hasOne\",\"column\":\"id_transaksi\",\"key\":\"id\",\"label\":\"qty\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(88, 5, 'tb_transaksi_hasone_tb_detail_transaksi_relationship_2', 'relationship', 'Total', 0, 1, 1, 0, 0, 1, '{\"model\":\"App\\\\DetailTrans\",\"table\":\"tb_detail_transaksi\",\"type\":\"hasOne\",\"column\":\"id_transaksi\",\"key\":\"id\",\"label\":\"total\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-02-26 06:41:41', '2020-02-27 00:47:13'),
(5, 'tb_transaksi', 'transaction', 'Transaksi', 'Transaksi', 'voyager-dollar', 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-26 14:12:07', '2020-03-03 02:18:35'),
(7, 'tb_paket', 'package', 'Paket', 'Paket', 'voyager-categories', 'App\\Package', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-26 14:16:28', '2020-02-28 07:12:45'),
(8, 'tb_outlet', 'outlet', 'Outlet', 'Outlet', 'voyager-shop', 'App\\Outlet', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-26 14:18:30', '2020-02-28 07:12:10'),
(9, 'tb_member', 'member', 'Member', 'Members', 'voyager-people', 'App\\Member', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-26 14:21:30', '2020-02-28 07:10:54'),
(10, 'tb_user', 'user', 'User', 'Users', 'voyager-people', 'App\\User', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-27 01:44:37', '2020-02-27 12:36:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-02-26 06:41:41', '2020-02-26 06:41:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-02-26 06:41:41', '2020-02-26 06:41:41', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 8, '2020-02-26 06:41:41', '2020-02-27 01:50:19', 'voyager.media.index', NULL),
(4, 1, 'Hak Akses', '', '_self', 'voyager-lock', '#000000', NULL, 2, '2020-02-26 06:41:41', '2020-02-27 01:51:06', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-02-26 06:41:41', '2020-02-26 14:36:00', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-02-26 06:41:41', '2020-02-26 14:35:21', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-02-26 06:41:41', '2020-02-26 14:35:21', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-02-26 06:41:41', '2020-02-26 14:35:21', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-02-26 06:41:41', '2020-02-26 14:35:21', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2020-02-26 06:41:41', '2020-02-26 14:36:00', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-02-26 06:41:42', '2020-02-26 14:35:21', 'voyager.hooks', NULL),
(12, 1, 'Transaksi', '', '_self', 'voyager-dollar', NULL, NULL, 5, '2020-02-26 14:12:08', '2020-02-27 01:50:19', 'voyager.transaction.index', NULL),
(13, 1, 'Paket', '', '_self', 'voyager-categories', NULL, NULL, 6, '2020-02-26 14:16:29', '2020-02-27 01:50:19', 'voyager.package.index', NULL),
(14, 1, 'Outlet', '', '_self', 'voyager-shop', NULL, NULL, 7, '2020-02-26 14:18:31', '2020-02-27 01:50:19', 'voyager.outlet.index', NULL),
(15, 1, 'Members', '', '_self', 'voyager-people', NULL, NULL, 4, '2020-02-26 14:21:30', '2020-02-27 01:50:19', 'voyager.member.index', NULL),
(16, 1, 'Users', '', '_self', 'voyager-people', '#000000', NULL, 3, '2020-02-27 01:44:37', '2020-02-27 04:36:19', 'voyager.user.index', 'null');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_02_11_210943_create_outlets_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2020_02_11_211051_create_members_table', 1),
(24, '2020_02_11_211203_create_packages_table', 1),
(25, '2020_02_11_211309_create_transactions_table', 1),
(26, '2020_02_11_211523_create_detail_trans_table', 1),
(27, '2020_02_26_131205_create_field_total', 1),
(28, '2020_02_26_131606_create_field_id_outlet', 1),
(29, '2014_10_12_100000_create_password_resets_table', 2),
(30, '2020_03_07_215219_create_field_berat', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(2, 'browse_bread', NULL, '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(3, 'browse_database', NULL, '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(4, 'browse_media', NULL, '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(5, 'browse_compass', NULL, '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(6, 'browse_menus', 'menus', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(7, 'read_menus', 'menus', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(8, 'edit_menus', 'menus', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(9, 'add_menus', 'menus', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(10, 'delete_menus', 'menus', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(11, 'browse_roles', 'roles', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(12, 'read_roles', 'roles', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(13, 'edit_roles', 'roles', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(14, 'add_roles', 'roles', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(15, 'delete_roles', 'roles', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(16, 'browse_users', 'users', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(17, 'read_users', 'users', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(18, 'edit_users', 'users', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(19, 'add_users', 'users', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(20, 'delete_users', 'users', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(21, 'browse_settings', 'settings', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(22, 'read_settings', 'settings', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(23, 'edit_settings', 'settings', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(24, 'add_settings', 'settings', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(25, 'delete_settings', 'settings', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(26, 'browse_hooks', NULL, '2020-02-26 06:41:42', '2020-02-26 06:41:42'),
(27, 'browse_tb_transaksi', 'tb_transaksi', '2020-02-26 14:12:07', '2020-02-26 14:12:07'),
(28, 'read_tb_transaksi', 'tb_transaksi', '2020-02-26 14:12:07', '2020-02-26 14:12:07'),
(29, 'edit_tb_transaksi', 'tb_transaksi', '2020-02-26 14:12:07', '2020-02-26 14:12:07'),
(30, 'add_tb_transaksi', 'tb_transaksi', '2020-02-26 14:12:07', '2020-02-26 14:12:07'),
(31, 'delete_tb_transaksi', 'tb_transaksi', '2020-02-26 14:12:08', '2020-02-26 14:12:08'),
(32, 'browse_tb_paket', 'tb_paket', '2020-02-26 14:16:29', '2020-02-26 14:16:29'),
(33, 'read_tb_paket', 'tb_paket', '2020-02-26 14:16:29', '2020-02-26 14:16:29'),
(34, 'edit_tb_paket', 'tb_paket', '2020-02-26 14:16:29', '2020-02-26 14:16:29'),
(35, 'add_tb_paket', 'tb_paket', '2020-02-26 14:16:29', '2020-02-26 14:16:29'),
(36, 'delete_tb_paket', 'tb_paket', '2020-02-26 14:16:29', '2020-02-26 14:16:29'),
(37, 'browse_tb_outlet', 'tb_outlet', '2020-02-26 14:18:31', '2020-02-26 14:18:31'),
(38, 'read_tb_outlet', 'tb_outlet', '2020-02-26 14:18:31', '2020-02-26 14:18:31'),
(39, 'edit_tb_outlet', 'tb_outlet', '2020-02-26 14:18:31', '2020-02-26 14:18:31'),
(40, 'add_tb_outlet', 'tb_outlet', '2020-02-26 14:18:31', '2020-02-26 14:18:31'),
(41, 'delete_tb_outlet', 'tb_outlet', '2020-02-26 14:18:31', '2020-02-26 14:18:31'),
(42, 'browse_tb_member', 'tb_member', '2020-02-26 14:21:30', '2020-02-26 14:21:30'),
(43, 'read_tb_member', 'tb_member', '2020-02-26 14:21:30', '2020-02-26 14:21:30'),
(44, 'edit_tb_member', 'tb_member', '2020-02-26 14:21:30', '2020-02-26 14:21:30'),
(45, 'add_tb_member', 'tb_member', '2020-02-26 14:21:30', '2020-02-26 14:21:30'),
(46, 'delete_tb_member', 'tb_member', '2020-02-26 14:21:30', '2020-02-26 14:21:30'),
(47, 'browse_tb_user', 'tb_user', '2020-02-27 01:44:37', '2020-02-27 01:44:37'),
(48, 'read_tb_user', 'tb_user', '2020-02-27 01:44:37', '2020-02-27 01:44:37'),
(49, 'edit_tb_user', 'tb_user', '2020-02-27 01:44:37', '2020-02-27 01:44:37'),
(50, 'add_tb_user', 'tb_user', '2020-02-27 01:44:37', '2020-02-27 01:44:37'),
(51, 'delete_tb_user', 'tb_user', '2020-02-27 01:44:37', '2020-02-27 01:44:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 2),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(30, 3),
(31, 1),
(31, 3),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(45, 3),
(46, 1),
(46, 3),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-02-26 06:41:41', '2020-02-26 06:41:41'),
(2, 'owner', 'Owner', '2020-02-26 06:41:41', '2020-02-26 15:15:15'),
(3, 'kasir', 'Kasir', '2020-02-26 15:13:37', '2020-02-26 15:13:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\February2020\\d9GZm2AK2kmHcCJRNnRh.jpg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Launre', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'A Best Solution for Dirty Clothes', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\February2020\\dwJJ1Sml9iYF27Bs1EgI.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\February2020\\kJzc6GFfb4FQ3etxSX95.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_detail_transaksi`
--

CREATE TABLE `tb_detail_transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_transaksi` bigint(20) UNSIGNED NOT NULL,
  `id_paket` bigint(20) UNSIGNED NOT NULL,
  `berat` double(8,2) NOT NULL,
  `qty` double NOT NULL,
  `total` int(11) NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_detail_transaksi`
--

INSERT INTO `tb_detail_transaksi` (`id`, `id_transaksi`, `id_paket`, `berat`, `qty`, `total`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 1.50, 1, 15000, NULL, '2020-02-27 12:37:20', '2020-03-07 15:10:55', NULL),
(2, 3, 1, 1.00, 1, 10000, NULL, '2020-03-03 02:12:36', '2020-03-03 03:09:43', NULL),
(3, 4, 1, 1.00, 1, 15000, NULL, '2020-03-07 15:02:54', '2020-03-07 15:04:04', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_member`
--

CREATE TABLE `tb_member` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_outlet` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tlp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_member`
--

INSERT INTO `tb_member` (`id`, `id_outlet`, `nama`, `alamat`, `jenis_kelamin`, `tlp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'Richard Roe', 'Jalan Ahmad Yani 32, Subang', 'L', '087876574544', '2020-02-27 04:02:27', '2020-03-03 01:56:16', NULL),
(2, 3, 'Anissa Rahmawati', 'Jalan Soekarto 22, Subang', 'P', '087765765544', '2020-02-27 04:04:52', '2020-02-27 04:04:52', NULL),
(3, 1, 'Rafi Septian', 'Jalan Panji 77, Subang', 'L', '087836187075', '2020-02-27 04:06:04', '2020-02-28 07:17:23', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_outlet`
--

CREATE TABLE `tb_outlet` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tlp` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_outlet`
--

INSERT INTO `tb_outlet` (`id`, `nama`, `alamat`, `tlp`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nusa Indah', 'Jalan Nusa Indah 35, Subang', '087846546437', '2020-02-27 01:57:35', '2020-02-27 01:57:35', NULL),
(2, 'Tirta Galih', 'Jalan Pabuaran 22, Subang', '087856464456', '2020-02-27 01:58:38', '2020-02-27 01:58:38', NULL),
(3, 'CuciBersih', 'Jalan Cigadung 34, Subang', '087835265463', '2020-02-27 02:00:01', '2020-02-27 02:00:01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_paket`
--

CREATE TABLE `tb_paket` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_outlet` bigint(20) UNSIGNED NOT NULL,
  `jenis` enum('kiloan','selimut','bed_cover','kaos','lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_paket` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_paket`
--

INSERT INTO `tb_paket` (`id`, `id_outlet`, `jenis`, `nama_paket`, `harga`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'kiloan', 'Kemeja', 10000, '2020-02-27 04:23:06', '2020-02-27 04:23:06', NULL),
(2, 1, 'selimut', 'Selimut', 15000, '2020-02-27 04:24:34', '2020-02-27 04:24:34', NULL),
(3, 3, 'bed_cover', 'Bed Cover', 17000, '2020-02-27 04:27:55', '2020-02-27 04:27:55', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_outlet` bigint(20) UNSIGNED NOT NULL,
  `kode_invoice` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_member` bigint(20) UNSIGNED NOT NULL,
  `tgl` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tgl_bayar` datetime DEFAULT NULL,
  `biaya_tambahan` int(11) NOT NULL DEFAULT '0',
  `diskon` double NOT NULL DEFAULT '0',
  `pajak` int(11) NOT NULL DEFAULT '0',
  `status` enum('baru','proses','selesai','diambil') COLLATE utf8mb4_unicode_ci NOT NULL,
  `dibayar` enum('dibayar','belum_dibayar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `id_outlet`, `kode_invoice`, `id_member`, `tgl`, `batas_waktu`, `tgl_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status`, `dibayar`, `id_user`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 1, '270220-1-1', 3, '2020-02-27 19:37:20', '2020-03-05 19:37:20', NULL, 0, 0, 0, 'baru', 'belum_dibayar', 1, '2020-02-27 12:37:20', '2020-03-07 15:10:55', NULL),
(3, 3, '030320-3-2', 2, '2020-03-03 09:12:36', '2020-03-10 09:12:36', NULL, 0, 0, 0, 'baru', 'belum_dibayar', 2, '2020-03-03 02:12:36', '2020-03-03 02:12:36', NULL),
(4, 3, '070320-3-3', 1, '2020-03-07 22:02:54', '2020-03-14 22:02:54', NULL, 0, 0, 5000, 'baru', 'belum_dibayar', 1, '2020-03-07 15:02:54', '2020-03-07 15:03:33', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_outlet` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `id_outlet`, `remember_token`, `settings`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Laras Nur Aprianti', 'larasNur@launre.com', 'users\\February2020\\HL59VAQqWRGyPL2Yz5qw.jpg', '$2y$10$SXzk9z23aExYO4N3EPo3LeMiAnCe3YhP1lc3L0KotKEbqkeO709im', NULL, NULL, '{\"locale\":\"id\"}', '2020-02-26 06:42:27', '2020-02-26 06:44:40', NULL),
(2, 3, 'Panji Agustian', 'panjiagustian17@launre.com', 'users\\February2020\\Ys3BeBugLxLeuJ9fNyRO.jpg', '$2y$10$z3ZdWrv3eiyWzQ9GKDlWB.tznX7BztCjDqh0oQINbHBvZvrXADr/C', 3, NULL, '{\"locale\":\"id\"}', '2020-02-26 15:16:59', '2020-02-27 12:35:20', NULL),
(3, 2, 'Yuliana Sri', 'yulianasri@launre.com', 'users\\February2020\\sbaOWzIZKYrZveWg2sfs.jpg', '$2y$10$WdLJ.07RkxuXxlxvGBufPukKhADGnpmsEYZRMKJGxSHeh3Nt2o7Km', NULL, NULL, '{\"locale\":\"id\"}', '2020-02-26 15:18:56', '2020-02-26 15:18:56', NULL),
(4, 3, 'Vivid Yuliana', 'vividY@launre.com', 'users\\February2020\\pJVHcBlKc2ENHRfTulsG.jpg', '$2y$10$53OF27WNzdDFxBCmwvblHe2VgXySUxlnXm3bBwi6EOQ4dfeOu2Cbq', 1, NULL, '{\"locale\":\"id\"}', '2020-02-26 15:21:23', '2020-02-27 12:34:49', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indeks untuk tabel `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indeks untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indeks untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indeks untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_detail_transaksi_id_transaksi_foreign` (`id_transaksi`),
  ADD KEY `tb_detail_transaksi_id_paket_foreign` (`id_paket`);

--
-- Indeks untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_member_id_outlet_foreign` (`id_outlet`);

--
-- Indeks untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_paket_id_outlet_foreign` (`id_outlet`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_transaksi_id_outlet_foreign` (`id_outlet`),
  ADD KEY `tb_transaksi_id_member_foreign` (`id_member`),
  ADD KEY `tb_transaksi_id_user_foreign` (`id_user`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_user_id_outlet_foreign` (`id_outlet`),
  ADD KEY `tb_user_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indeks untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT untuk tabel `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_outlet`
--
ALTER TABLE `tb_outlet`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_detail_transaksi`
--
ALTER TABLE `tb_detail_transaksi`
  ADD CONSTRAINT `tb_detail_transaksi_id_paket_foreign` FOREIGN KEY (`id_paket`) REFERENCES `tb_paket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detail_transaksi_id_transaksi_foreign` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_transaksi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_member`
--
ALTER TABLE `tb_member`
  ADD CONSTRAINT `tb_member_id_outlet_foreign` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_paket`
--
ALTER TABLE `tb_paket`
  ADD CONSTRAINT `tb_paket_id_outlet_foreign` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_id_member_foreign` FOREIGN KEY (`id_member`) REFERENCES `tb_member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_id_outlet_foreign` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_id_outlet_foreign` FOREIGN KEY (`id_outlet`) REFERENCES `tb_outlet` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ketidakleluasaan untuk tabel `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
