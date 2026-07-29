SELECT 
    SUM(CASE WHEN status = 'Baru Masuk' THEN 1 ELSE 0 END) AS baru,
    SUM(CASE WHEN status = 'Sedang Proses' THEN 1 ELSE 0 END) AS proses,
    SUM(CASE WHEN status = 'Selesai Bimbingan' THEN 1 ELSE 0 END) AS selesai
FROM laporan_bk;