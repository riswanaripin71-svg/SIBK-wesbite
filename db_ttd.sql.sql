SELECT 
    l.tgl, l.nama_siswa, l.kelas, l.kasus, l.status,
    p.nama_bk AS koordinator_bk,
    p.nama_kepsek AS kepala_sekolah
FROM laporan_bk l
CROSS JOIN profil_instansi p WHERE p.id = 1
ORDER BY l.tgl DESC;