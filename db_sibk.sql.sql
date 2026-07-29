-- Create Database
CREATE DATABASE IF NOT EXISTS `sibk_almusthofa` 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE `sibk_almusthofa`;

-- --------------------------------------------------------
-- 1. TABEL PROFIL INSTANSI & PEJABAT
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profil_instansi` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nama_bk` VARCHAR(150) NOT NULL,
    `nama_kepsek` VARCHAR(150) NOT NULL,
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed default data instansi
INSERT INTO `profil_instansi` (`id`, `nama_bk`, `nama_kepsek`) VALUES
(1, 'Leni Meilani, S.Pd', 'Asep Naswari, S.E');

-- --------------------------------------------------------
-- 2. TABEL PENGGUNA / USERS
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `pengguna` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL, -- Disarankan di-hash (misal: bcrypt) pada aplikasi web nyata
    `role` ENUM('BK', 'Wali Kelas', 'Guru Mapel', 'Peserta Didik') NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed data pengguna bawaan aplikasi
INSERT INTO `pengguna` (`username`, `password`, `role`) VALUES
('admin.bk', 'bk123', 'BK'),
('wali', 'wali123', 'Wali Kelas'),
('guru', 'guru123', 'Guru Mapel'),
('adit', 'adit123', 'Peserta Didik');

-- --------------------------------------------------------
-- 3. TABEL DATA SISWA
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `siswa` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nis` VARCHAR(20) NOT NULL UNIQUE,
    `nama` VARCHAR(150) NOT NULL,
    `kelas` VARCHAR(50) NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed data awal siswa
INSERT INTO `siswa` (`nis`, `nama`, `kelas`) VALUES
('3087354568', 'A. Fanji Rusyano', 'XI TSM'),
('0095675523', 'Adam Wardani', 'XI TSM'),
('0095994896', 'Aditya Eka Saputra', 'XI TSM'),
('3091486165', 'Aditia Suherman', 'XI TSM'),
('0108786433', 'Ahyar Ginanjar', 'XI TSM'),
('0098790190', 'Akbar Aidil Fasha', 'XI TSM'),
('0109517490', 'Ardiansyah', 'XI TSM'),
('3093463446', 'Buhori Muslim', 'XI TSM'),
('0095917148', 'Erwin Solehudin', 'XI TSM'),
('0103229309', 'Gema Akbar Ramadhan', 'XI TSM'),
('0106786833', 'Khalid Misbah', 'XI TSM'),
('3092607507', 'Mutia Nandasari', 'XI TJKT'),
('3092408641', 'Nadia Salsadilla', 'XI TJKT'),
('3107123721', 'Neng Reyhan', 'XI TJKT'),
('0104694450', 'Rania Astri', 'XI TJKT'),
('0106187696', 'Reva Alistia', 'XI TJKT'),
('0103572486', 'Salwa Malinda Yuliawati', 'XI TJKT'),
('3091203353', 'Sintia Nurhasanah', 'XI TJKT'),
('3091901493', 'Sri Devi Oktafiani', 'XI TJKT'),
('0097201950', 'Tiara Saputri', 'XI TJKT'),
('0099668854', 'Siti Alikha Fadilla Asyari', 'XI TJKT'),
('0061996461', 'Agung Ridwan Musadad', 'X TSM'),
('0081851526', 'Ahmad Davit', 'XII TSM'),
('0084021279', 'Ahmad Rasyid', 'XII TSM'),
('0087279332', 'Alfin Muhamad Ansori', 'XII TSM'),
('3080496231', 'Alif Dimas Agustian', 'XII TSM'),
('0091970523', 'Ariel Maulana', 'XII TSM');

-- --------------------------------------------------------
-- 4. TABEL LAPORAN BK / KASUS / KONSELING
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `laporan_bk` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `tgl` DATE NOT NULL,
    `siswa_id` INT NULL, -- NULL jika konseling anonim / siswa mandiri belum terikat relasi
    `nama_siswa` VARCHAR(150) NOT NULL, -- Menyimpan nama snapshot / cache nama
    `kelas` VARCHAR(50) NOT NULL,
    `kasus` TEXT NOT NULL,
    `status` ENUM('Baru Masuk', 'Sedang Proses', 'Selesai Bimbingan') DEFAULT 'Baru Masuk',
    `sumber_laporan` ENUM('BK', 'Rujukan Guru Mapel', 'Konseling Mandiri') DEFAULT 'BK',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_laporan_siswa` 
        FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) 
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed data awal laporan BK
INSERT INTO `laporan_bk` (`tgl`, `siswa_id`, `nama_siswa`, `kelas`, `kasus`, `status`, `sumber_laporan`) VALUES
('2026-06-10', 2, 'Adam Wardani', 'XI TSM', 'Konsultasi kelanjutan studi beasiswa kuliah luar negeri', 'Selesai Bimbingan', 'BK'),
('2026-06-18', 12, 'Mutia Nandasari', 'XI TJKT', 'Sering terlambat masuk di jam pertama pelajaran produktif', 'Sedang Proses', 'BK'),
('2026-06-24', 22, 'Agung Ridwan Musadad', 'X TSM', 'Pengaduan kehilangan barang bawaan di laci meja kelas', 'Baru Masuk', 'BK');

-- --------------------------------------------------------
-- 5. TABEL CATATAN TAMBAHAN SISWA
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `catatan_tambahan` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `tgl` DATE NOT NULL,
    `siswa_id` INT NULL,
    `nama_siswa` VARCHAR(150) NOT NULL,
    `perihal` VARCHAR(100) NOT NULL, -- Contoh: Karakter, Prestasi
    `isi` TEXT NOT NULL,
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_catatan_siswa` 
        FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`) 
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed data awal catatan tambahan
INSERT INTO `catatan_tambahan` (`tgl`, `siswa_id`, `nama_siswa`, `perihal`, `isi`) VALUES
('2026-06-25', 13, 'Nadia Salsadilla', 'Karakter', 'Siswa sangat proaktif membantu guru menyiapkan proyektor di kelas.'),
('2026-06-29', 15, 'Rania Astri', 'Prestasi', 'Juara 2 Lomba Kompetensi Siswa (LKS) bidang IT Network lokal.');