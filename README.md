
# 🏨 Manajemen-Pemesanan-Hotel

Proyek ini adalah implementasi sistem manajemen basis data untuk operasional pemesanan hotel, mulai dari data tamu, kamar, reservasi, hingga layanan tambahan. Sistem ini dirancang untuk menunjukkan kapabilitas basis data lanjutan (seperti *Stored Procedure*, *Trigger*, dan *View*) serta dilengkapi dengan fitur *web scraping* eksternal untuk analisis harga kompetitor.

## ✨ Fitur Utama (Modules & Logic)

Proyek ini mencakup dua modul utama: Sistem Database Inti dan Analisis Data Eksternal.

### 1. Sistem Database Inti (PostgreSQL)

| Fitur/Modul | Deskripsi | Logik Implementasi | Sumber |
| :--- | :--- | :--- | :--- |
| **Model Data & Integritas** | Menyimpan data tamu, kamar, karyawan, reservasi, pembayaran, layanan, dan ulasan. | Dibuat dengan 8 tabel, Primary Keys (PK), Foreign Keys (FK), dan `ON DELETE CASCADE/SET NULL` untuk menjaga integritas data. | `manajemen_hotel.sql` |
| **Otomatisasi Status Kamar** | Status kamar diperbarui secara otomatis ketika reservasi baru dibuat. | Menggunakan **TRIGGER** (`trigger_ubah_status_kamar`) yang memanggil **FUNCTION** (`ubah_status_kamar()`) setelah `INSERT` pada tabel `reservasi`. | `manajemen_hotel.sql` |
| **Laporan Tingkat Hunian** | Menyediakan laporan harian berdasarkan karyawan dan laporan tingkat hunian bulanan hotel. | Menggunakan **VIEW** (`laporan_tingkat_hunian_kamar` dan `laporan_tingkat_hunian_perbulan`) untuk menyederhanakan *query* pelaporan kompleks. | `manajemen_hotel.sql` |
| **Kalkulasi Diskon** | Menghitung total harga reservasi termasuk layanan tambahan setelah diterapkan diskon. | Menggunakan **STORED PROCEDURE** (`calculate_discounted_total`) yang menerima `id_reservasi` dan `discount_rate` sebagai input. | `manajemen_hotel.sql` |
| **Pencarian Kamar** | Menampilkan daftar kamar yang memiliki status 'Tersedia'. | Menggunakan **FUNCTION** (`get_available_rooms()`) yang mengembalikan tabel kamar dengan kriteria tertentu. | `manajemen_hotel.sql` |
| **Manajemen Transaksi Aman** | Mendemonstrasikan penghapusan data reservasi terkait secara atomik. | Menggunakan blok **BEGIN; DELETE...; COMMIT;** dengan `ON DELETE CASCADE` pada FK untuk memastikan data `pembayaran` dan `penggunaan_layanan` ikut terhapus saat `reservasi` dihapus. | `manajemen_hotel.sql` |
| **Manajemen Otorisasi** | Pembatasan akses ke tabel untuk berbagai peran staf. | Menggunakan **ROLE** (`staff_role`, `manager_role`) dan **USER** (`staff_user`, `manager_user`) dengan hak akses `SELECT, INSERT, UPDATE` tertentu. | `manajemen_hotel.sql` |

### 2. Analisis Data Eksternal (Web Scraping)

| Fitur/Modul | Deskripsi | Logik Implementasi | Sumber |
| :--- | :--- | :--- | :--- |
| **Web Scraping Harga Kompetitor** | Mengambil data harga, rating, dan ulasan dari hotel kompetitor di area tertentu (contoh: Pulau Samosir). | Skrip **Python** (`review.py`) menggunakan library **Playwright** untuk menavigasi situs *booking online* dan mengekstrak data. | `review.py` |
| **Data Hasil Scraping** | Hasil data mentah untuk analisis. | Disimpan dalam format CSV/Excel dengan kolom *hotel, price, score, avg review, reviews count*. | `hotel_samosir.csv` |

***

## ⚙ Teknologi yang Digunakan

* **Database Management System:** PostgreSQL
* **Database Language:** SQL (PostgreSQL Dialect)
* **Web Scraping Language:** Python
* **Python Libraries:** `playwright`, `pandas`
* **Tools:** pgAdmin / pgerd (untuk diagram skema)

***

## 🧱 Susunan Proyek



Manajemen-Pemesanan-Hotel/
├── backup\_restore/
│   ├── manajemen\_hotel.sql
│   ├── reservasi\_hotel.sql
│   └── tamu\_hotel.sql
├── hotel\_samosir.csv             \# Output data hasil scraping
├── hotel\_samosir.xlsx - Sheet1.csv \# Output data hasil scraping
├── manajemen\_hotel.sql           \# File SQL UTAMA (Schema, Data, Logic/Fitur Lanjutan)
├── review.py                     \# Skrip Python untuk Web Scraping
├── Schemas.pgerd                 \# Diagram Entitas-Relasi (ERD)
└── README.md                     \# Dokumentasi proyek

`

***

## 🚀 Prasyarat Instalasi

Pastikan sistem Anda memiliki prasyarat berikut:

1.  **PostgreSQL:** Versi 16.4 atau lebih baru.
2.  **Python 3:** Versi 3.x terinstal (untuk fitur *scraping*).
3.  **Dependency Python:** Instal library yang dibutuhkan:
    bash
    pip install pandas playwright
    playwright install
    

***

## 📝 Contoh Penggunaan

### 1. Instalasi dan Setup Database

1.  Akses database PostgreSQL Anda (melalui psql, pgAdmin, atau *tool* lainnya).
2.  Buat database baru dengan nama `Sistem_Manajemen_Hotel`.
3.  Jalankan skrip **`manajemen_hotel.sql`** secara berurutan. Skrip ini akan membuat semua tabel, mengisi data sampel, serta membuat *View*, *Function*, *Procedure*, *Trigger*, dan *Role*.

    sql
    -- Contoh menjalankan skrip di psql:
    \i /path/to/manajemen_hotel.sql
    

### 2. Menggunakan Fitur Lanjutan

Anda dapat menguji fitur-fitur yang sudah dibuat:

#### a. Menampilkan Kamar Tersedia (Function)
sql
SELECT * FROM get_available_rooms();
`

#### b. Menghitung Total Harga dengan Diskon (Stored Procedure)

sql
-- Memanggil prosedur dengan ID reservasi 1 dan diskon 10%
CALL calculate_discounted_total(1, 10);


#### c. Melihat Laporan Tingkat Hunian (View)

sql
-- Laporan bulanan
SELECT * FROM laporan_tingkat_hunian_perbulan; 

-- Laporan harian berdasarkan karyawan (untuk bulan November 2024)
SELECT * FROM laporan_tingkat_hunian_dan_tugas
WHERE EXTRACT(MONTH FROM tanggal) = 11
  AND EXTRACT(YEAR FROM tanggal) = 2024;


### 3\. Menjalankan Web Scraping

1.  Buka file `review.py`.
2.  Pastikan `checkin_date` dan `checkout_date` diatur ke tanggal di masa depan agar *scraping* berhasil.
3.  Jalankan skrip Python:
    bash
    python review.py
    
4.  Hasil data hotel kompetitor akan tersimpan di file `samosir.csv` dan `samosir.xlsx` (disimulasikan dalam proyek sebagai `hotel_samosir.csv`).

-----

## 🤝 Kontribusi

Kontribusi dalam bentuk *bug reports*, usulan fitur, atau *pull requests* sangat disambut baik.

1.  *Fork* repositori ini.
2.  Buat *branch* baru: `git checkout -b fitur/nama-fitur`
3.  Lakukan *commit* perubahan Anda: `git commit -m 'Tambahkan Fitur Baru'`
4.  *Push* ke *branch*: `git push origin fitur/nama-fitur`
5.  Ajukan *Pull Request*.

-----
\
