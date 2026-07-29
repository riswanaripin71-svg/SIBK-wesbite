# 🏫 SI-BK SMK AL-MUSTHOFA (Sistem Informasi BK Digital)

Sistem Informasi Bimbingan Konseling (SI-BK) berbasis web modern yang dirancang untuk mempermudah pengelolaan data konseling, pemantauan perkembangan siswa, pencatatan masalah/prestasi, serta pelaporan otomatis di SMK AL-MUSTHOFA.

Aplikasi ini dibangun menggunakan pendekatan **Single File Application** (satu berkas HTML terpadu) yang ringan, cepat, dan terintegrasi langsung dengan pustaka JavaScript modern melalui CDN.

---

## 🌟 Fitur Utama

### 🔐 Multi-Role Authentication
Mendukung 4 level hak akses pengguna dengan alur navigasi dinamis:
- **BK Admin**: Akses penuh ke seluruh sistem, pembaruan status kasus, ekspor/impor data, serta pengaturan instansi.
- **Wali Kelas**: Pemantauan grafik perkembangan siswa dan data profil kelas[cite: 1].
- **Guru Mata Pelajaran**: Form rujukan pengaduan/indikasi masalah siswa secara *real-time*[cite: 1].
- **Peserta Didik**: Pengajuan jadwal konseling pribadi mandiri dengan jaminan kerahasiaan[cite: 1].

### 📊 Dashboard & Monitoring
- **Statistik Kasus Interactive**: Grafik *monitoring* status perkembangan kasus (Baru Masuk, Sedang Proses, Selesai Bimbingan) terintegrasi dengan Chart.js[cite: 1].
- **Catatan Perkembangan Siswa**: Pendokumentasian karakter khusus, prestasi, maupun kejadian penting siswa[cite: 1].
- **Real-time Clock & Calendar**: Penanda waktu interaktif pada sistem[cite: 1].

### 📑 Fitur Laporan & Cetak Dokumen
- **Filter Berkala**: Fitur penyaringan laporan berdasarkan rentang waktu (Harian, Mingguan, Bulanan, Semesteran, Tahunan)[cite: 1].
- **Live Preview Document**: Peninjauan dokumen sebelum diunduh lengkap dengan *kop surat* dan format tanda tangan pejabat[cite: 1].
- **Multi-Format Export**:
  - 📊 **Excel (.xlsx)** via SheetJS[cite: 1]
  - 📄 **Word (.doc)** via HTML Blob[cite: 1]
  - 🔴 **PDF (.pdf)** via jsPDF AutoTable[cite: 1]

### ⚙️ Pengelolaan Data & Pengaturan
- **Impor & Ekspor Excel**: Mendukung *import/export* data massal untuk Akun Pengguna, Database Siswa, dan Log Kasus[cite: 1].
- **Profil Penandatangan Dinamis**: Pengaturan nama Koordinator BK dan Kepala Sekolah yang akan ditampilkan otomatis di lembar pengesahan laporan[cite: 1].

---

## 🛠️ Teknologi yang Digunakan

Aplikasi ini dibangun tanpa menggunakan *framework backend* rumit, menggunakan pustaka modern berikut:

* **Markup & Styling**: [HTML5](https://developer.mozilla.org/en-US/docs/Web/HTML), [Tailwind CSS (via CDN)](https://tailwindcss.com/)[cite: 1]
* **Icons**: [Font Awesome 6](https://fontawesome.com/)[cite: 1]
* **Visualization**: [Chart.js](https://www.chartjs.org/)[cite: 1]
* **Excel Processing**: [SheetJS / xlsx](https://sheetjs.com/)[cite: 1]
* **PDF Generation**: [jsPDF](https://github.com/parallax/jsPDF) & [jsPDF-AutoTable](https://github.com/simonbengtsson/jsPDF-AutoTable)[cite: 1]

---

## 🚀 Cara Penggunaan / Instalasi

Aplikasi ini bersifat **Client-Side Only**, tidak memerlukan instalasi *database* (MySQL) atau server backend (PHP/Node.js).

1. **Clone Repositori ini:**
   ```bash
   git clone [https://github.com/username/si-bk-smk-almusthofa.git](https://github.com/username/si-bk-smk-almusthofa.git)


├── index.html   # File tunggal aplikasi (HTML, CSS Tailwind, JS Engine)
└── README.md    # Dokumentasi proyek
