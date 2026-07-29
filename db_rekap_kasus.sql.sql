-- Contoh: Filter 30 hari terakhir (Bulanan)
SELECT id, tgl, nama_siswa, kelas, kasus, status 
FROM laporan_bk 
WHERE tgl >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
ORDER BY tgl DESC;