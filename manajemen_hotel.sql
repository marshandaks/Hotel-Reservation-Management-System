DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- 1. Membuat Database
CREATE DATABASE Sistem_Manajemen_Hotel;

-- 2. Menggunakan Database
\c Sistem_Manajemen_Hotel;

-- 3. Membuat Tabel Tamu
CREATE TABLE tamu (
    id_tamu INTEGER PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    telepon VARCHAR(15) NOT NULL,
    email VARCHAR(100),
    alamat TEXT,
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Membuat Tabel Kamar
CREATE TABLE kamar (
    id_kamar INTEGER PRIMARY KEY,
    nomor_kamar VARCHAR(10) NOT NULL UNIQUE,
    tipe VARCHAR(50) NOT NULL, 
    harga_per_malam NUMERIC(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Tersedia',
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Membuat Tabel Reservasi
CREATE TABLE reservasi (
    id_reservasi INTEGER PRIMARY KEY,
    id_tamu INT NOT NULL REFERENCES tamu(id_tamu) ON DELETE CASCADE,
    id_kamar INT NOT NULL REFERENCES kamar(id_kamar) ON DELETE CASCADE,
    id_karyawan INT NOT NULL REFERENCES karyawan(id_karyawan) ON DELETE SET NULL,
    tanggal_check_in DATE NOT NULL,
    tanggal_check_out DATE NOT NULL,
    total_harga NUMERIC(10, 2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Tertunda',
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
select*from reservasi

-- 6. Membuat Tabel Pembayaran
CREATE TABLE pembayaran (
    id_pembayaran INTEGER PRIMARY KEY,
    id_reservasi INT NOT NULL REFERENCES reservasi(id_reservasi) ON DELETE CASCADE,
    tanggal_pembayaran TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    jumlah NUMERIC(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Dibayar',
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 7. Membuat Tabel Karyawan
CREATE TABLE karyawan (
    id_karyawan INTEGER PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    posisi VARCHAR(50) NOT NULL, 
    telepon VARCHAR(15),
    email VARCHAR(100),
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 8. Membuat Tabel Ulasan
CREATE TABLE ulasan (
    id_ulasan INTEGER PRIMARY KEY,
    id_tamu INT NOT NULL REFERENCES tamu(id_tamu) ON DELETE CASCADE,
    id_reservasi INT NOT NULL REFERENCES reservasi(id_reservasi) ON DELETE CASCADE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    komentar TEXT,
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 9. Membuat Tabel Layanan
CREATE TABLE layanan (
    id_layanan INTEGER PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    harga NUMERIC(10, 2) NOT NULL,
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 10. Membuat Tabel Penggunaan Layanan
CREATE TABLE penggunaan_layanan (
    id_penggunaan INTEGER PRIMARY KEY,
    id_reservasi INT NOT NULL REFERENCES reservasi(id_reservasi) ON DELETE CASCADE,
    id_layanan INT NOT NULL REFERENCES layanan(id_layanan) ON DELETE CASCADE,
    jumlah INT DEFAULT 1,
    total_harga NUMERIC(10, 2) NOT NULL,
    waktu_dibuat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tamu (id_tamu, nama, telepon, email, alamat)
VALUES
    (1, 'Rafael Mahendra', '081938472839', 'rafael@example.com', 'Jl. Sejahtera No. 10, Jakarta'),
    (2, 'Agnes Paramita', '082153784920', 'agnes@example.com', 'Jl. Merdeka No. 24, Bandung'),
    (3, 'Sofia Amelia', '085172839406', 'sofia@example.com', 'Jl. Garuda No. 55, Surabaya'),
    (4, 'Teguh Wicaksono', '083745019283', 'teguh@example.com', 'Jl. Sudirman No. 78, Bali'),
    (5, 'Dina Melati', '089643728195', 'dina@example.com', 'Jl. Pahlawan No. 22, Yogyakarta'),
    (6, 'Johan Kurniawan', '084739204857', 'johan@example.com', 'Jl. Bunga No. 49, Medan'),
    (7, 'Fiona Pratiwi', '087182736524', 'fiona@example.com', 'Jl. Raya No. 89, Makassar'),
    (8, 'Taufik Ardiansyah', '086245910384', 'taufik@example.com', 'Jl. Cempaka No. 90, Palembang'),
    (9, 'Rina Nurfitri', '085961230478', 'rina@example.com', 'Jl. Anggrek No. 103, Semarang'),
    (10, 'Lina Purnama', '088365017492', 'lina@example.com', 'Jl. Melati No. 67, Malang'),
    (11, 'Iwan Setiawan', '081784506382', 'iwan@example.com', 'Jl. Merpati No. 20, Jakarta'),
    (12, 'Nina Rahayu', '087645829103', 'nina@example.com', 'Jl. Kamboja No. 33, Bandung'),
    (13, 'Lukas Hendrawan', '085671903482', 'lukas@example.com', 'Jl. Pahlawan No. 47, Surabaya'),
    (14, 'Karina Dewi', '082439571203', 'karina@example.com', 'Jl. Cempaka No. 55, Bali'),
    (15, 'Deni Putra', '088172630948', 'deni@example.com', 'Jl. Wira No. 10, Yogyakarta'),
    (16, 'Mira Indriani', '085238470983', 'mira@example.com', 'Jl. Anggrek No. 72, Medan'),
    (17, 'Yusuf Halim', '083745209473', 'yusuf@example.com', 'Jl. Raya No. 28, Makassar'),
    (18, 'Indah Sari', '085689234702', 'indah@example.com', 'Jl. Sudirman No. 40, Palembang'),
    (19, 'Siska Lestari', '086590273194', 'siska@example.com', 'Jl. Cempaka No. 63, Semarang'),
    (20, 'Cindy Novita', '087513042896', 'cindy@example.com', 'Jl. Pahlawan No. 88, Malang'),
    (21, 'Niko Prabowo', '085371820392', 'niko@example.com', 'Jl. Merpati No. 18, Jakarta'),
    (22, 'Agustinus Santoso', '082943812749', 'agustinus@example.com', 'Jl. Kamboja No. 9, Bandung'),
    (23, 'Tari Santika', '087128374650', 'tari@example.com', 'Jl. Sumber No. 13, Surabaya'),
    (24, 'Albertina Yuliana', '084738109452', 'albertina@example.com', 'Jl. Merdeka No. 34, Bali'),
    (25, 'Eka Widodo', '086257943018', 'eka@example.com', 'Jl. Pahlawan No. 5, Yogyakarta'),
    (26, 'Hendri Hadi', '088172647380', 'hendri@example.com', 'Jl. Raya No. 75, Medan'),
    (27, 'Martha Suryani', '085628391017', 'martha@example.com', 'Jl. Anggrek No. 21, Makassar'),
    (28, 'Sandi Alamsyah', '082319874250', 'sandi@example.com', 'Jl. Cempaka No. 17, Palembang'),
    (29, 'Vina Lestari', '087498657321', 'vina@example.com', 'Jl. Sudirman No. 9, Semarang'),
    (30, 'Ferry Pratama', '085173984201', 'ferry@example.com', 'Jl. Cempaka No. 66, Malang');

	INSERT INTO kamar (id_kamar, nomor_kamar, tipe, harga_per_malam, status)
VALUES
    (1, 'K001', 'Superior', 500000.00, 'Tersedia'),
    (2, 'K002', 'Deluxe', 750000.00, 'Tersedia'),
    (3, 'K003', 'Standard', 350000.00, 'Tersedia'),
    (4, 'K004', 'Suite', 1500000.00, 'Tersedia'),
    (5, 'K005', 'Superior', 520000.00, 'Dipesan'),
    (6, 'K006', 'Deluxe', 780000.00, 'Tersedia'),
    (7, 'K007', 'Standard', 330000.00, 'Tersedia'),
    (8, 'K008', 'Suite', 1450000.00, 'Tersedia'),
    (9, 'K009', 'Superior', 510000.00, 'Dipesan'),
    (10, 'K010', 'Deluxe', 760000.00, 'Tersedia'),
    (11, 'K011', 'Standard', 340000.00, 'Tersedia'),
    (12, 'K012', 'Suite', 1480000.00, 'Dipesan'),
    (13, 'K013', 'Superior', 490000.00, 'Tersedia'),
    (14, 'K014', 'Deluxe', 740000.00, 'Tersedia'),
    (15, 'K015', 'Standard', 320000.00, 'Dipesan'),
    (16, 'K016', 'Suite', 1400000.00, 'Tersedia'),
    (17, 'K017', 'Superior', 510000.00, 'Tersedia'),
    (18, 'K018', 'Deluxe', 770000.00, 'Tersedia'),
    (19, 'K019', 'Standard', 310000.00, 'Tersedia'),
    (20, 'K020', 'Suite', 1550000.00, 'Dipesan'),
    (21, 'K021', 'Superior', 500000.00, 'Dipesan'),
    (22, 'K022', 'Deluxe', 750000.00, 'Tersedia'),
    (23, 'K023', 'Standard', 340000.00, 'Tersedia'),
    (24, 'K024', 'Suite', 1490000.00, 'Tersedia'),
    (25, 'K025', 'Superior', 520000.00, 'Tersedia'),
    (26, 'K026', 'Deluxe', 770000.00, 'Dipesan'),
    (27, 'K027', 'Standard', 330000.00, 'Tersedia'),
    (28, 'K028', 'Suite', 1460000.00, 'Dipesan'),
    (29, 'K029', 'Superior', 510000.00, 'Tersedia'),
    (30, 'K030', 'Deluxe', 740000.00, 'Tersedia');

INSERT INTO karyawan (id_karyawan, nama, posisi, telepon, email)
VALUES
    (1, 'Andi Pratama', 'Resepsionis', '081234567890', 'andi@example.com'),
    (2, 'Budi Santoso', 'Manajer', '082345678901', 'budi@example.com'),
    (3, 'Citra Wijaya', 'Resepsionis', '083456789012', 'citra@example.com'),
    (4, 'Diana Sari', 'Staf Keuangan', '084567890123', 'diana@example.com'),
    (5, 'Eka Permatasari', 'Resepsionis', '085678901234', 'eka@example.com'),
    (6, 'Fajar Saputra', 'Resepsionis', '086789012345', 'fajar@example.com'),
    (7, 'Gina Lestari', 'Kasir', '087890123456', 'gina@example.com'),
    (8, 'Hendri Nugroho', 'Resepsionis', '088901234567', 'hendri@example.com'),
    (9, 'Ika Ramadhani', 'Staf HRD', '089012345678', 'ika@example.com'),
    (10, 'Joko Santosa', 'Resepsionis', '081023456789', 'joko@example.com'),
    (11, 'Lina Pratiwi', 'Resepsionis', '082134567890', 'lina@example.com'),
    (12, 'Mira Kusuma', 'Staf Keuangan', '083245678901', 'mira@example.com'),
    (13, 'Nina Maulani', 'Resepsionis', '084356789012', 'nina@example.com'),
    (14, 'Oka Prabowo', 'Staf HRD', '085467890123', 'oka@example.com'),
    (15, 'Putra Wijaya', 'Resepsionis', '086578901234', 'putra@example.com');
select * from karyawan;

INSERT INTO reservasi (id_reservasi, id_tamu, id_kamar, id_karyawan, tanggal_check_in, tanggal_check_out, total_harga, status)
VALUES
    (1, 1, 3, 1, '2024-12-05', '2024-12-07', 450000.00, 'Dipesan'),
    (2, 2, 10, 3, '2024-11-01', '2024-11-03', 1000000.00, 'Selesai'),
    (3, 3, 15, 4, '2024-10-05', '2024-10-07', 300000.00, 'Dipesan'),
    (4, 4, 20, 5, '2024-12-10', '2024-12-12', 600000.00, 'Tertunda'),
    (5, 5, 25, 6, '2024-11-10', '2024-11-12', 750000.00, 'Selesai'),
    (6, 6, 5, 7, '2024-10-08', '2024-10-10', 400000.00, 'Dipesan'),
    (7, 7, 12, 8, '2024-11-15', '2024-11-17', 520000.00, 'Selesai'),
    (8, 8, 2, 9, '2024-12-01', '2024-12-03', 350000.00, 'Dipesan'),
    (9, 9, 30, 10, '2024-11-22', '2024-11-24', 850000.00, 'Selesai'),
    (10, 10, 7, 11, '2024-12-14', '2024-12-16', 650000.00, 'Tertunda'),
    (11, 11, 18, 12, '2024-11-09', '2024-11-11', 500000.00, 'Selesai'),
    (12, 12, 22, 13, '2024-10-12', '2024-10-14', 470000.00, 'Dipesan'),
    (13, 13, 6, 14, '2024-12-03', '2024-12-05', 420000.00, 'Tertunda'),
    (14, 14, 11, 15, '2024-11-18', '2024-11-20', 530000.00, 'Selesai'),
    (15, 15, 16, 1, '2024-12-20', '2024-12-22', 460000.00, 'Dipesan'),
    (16, 16, 4, 2, '2024-10-20', '2024-10-22', 300000.00, 'Tertunda'),
    (17, 17, 19, 3, '2024-11-30', '2024-12-02', 780000.00, 'Selesai'),
    (18, 18, 8, 5, '2024-10-15', '2024-10-17', 620000.00, 'Dipesan'),
    (19, 19, 9, 6, '2024-12-01', '2024-12-03', 560000.00, 'Selesai'),
    (20, 20, 23, 7, '2024-11-05', '2024-11-07', 670000.00, 'Selesai'),
    (21, 21, 14, 8, '2024-10-11', '2024-10-13', 750000.00, 'Dipesan'),
    (22, 22, 28, 9, '2024-12-05', '2024-12-07', 900000.00, 'Selesai'),
    (23, 23, 24, 10, '2024-11-22', '2024-11-24', 950000.00, 'Selesai'),
    (24, 24, 27, 11, '2024-12-02', '2024-12-04', 820000.00, 'Dipesan'),
    (25, 25, 21, 12, '2024-11-15', '2024-11-17', 680000.00, 'Selesai'),
    (26, 26, 26, 13, '2024-10-05', '2024-10-07', 630000.00, 'Dipesan'),
    (27, 27, 13, 14, '2024-12-10', '2024-12-12', 750000.00, 'Tertunda'),
    (28, 28, 1, 15, '2024-11-12', '2024-11-14', 480000.00, 'Selesai'),
    (29, 29, 17, 14, '2024-10-15', '2024-10-17', 590000.00, 'Dipesan'),
    (30, 30, 3, 1, '2024-12-11', '2024-12-13', 400000.00, 'Tertunda');
select*from reservasi;

INSERT INTO pembayaran (id_pembayaran, id_reservasi, tanggal_pembayaran, jumlah, metode_pembayaran, status)
VALUES
    (1, 1, '2024-12-05 10:00:00', 450000.00, 'Kartu Kredit', 'Dibayar'),
    (2, 2, '2024-11-01 14:30:00', 1000000.00, 'Transfer Bank', 'Dibayar'),
    (3, 3, '2024-10-05 09:45:00', 300000.00, 'Tunai', 'Dibayar'),
    (4, 4, '2024-12-10 12:00:00', 600000.00, 'Kartu Debit', 'Dibayar'),
    (5, 5, '2024-11-10 08:30:00', 750000.00, 'Transfer Bank', 'Dibayar'),
    (6, 6, '2024-10-08 11:20:00', 400000.00, 'Kartu Kredit', 'Dibayar'),
    (7, 7, '2024-11-15 15:00:00', 520000.00, 'Tunai', 'Dibayar'),
    (8, 8, '2024-12-01 13:15:00', 350000.00, 'Transfer Bank', 'Dibayar'),
    (9, 9, '2024-11-22 16:10:00', 850000.00, 'Kartu Debit', 'Dibayar'),
    (10, 10, '2024-12-14 10:30:00', 650000.00, 'Kartu Kredit', 'Dibayar'),
    (11, 11, '2024-11-09 11:00:00', 500000.00, 'Tunai', 'Dibayar'),
    (12, 12, '2024-10-12 14:45:00', 470000.00, 'Transfer Bank', 'Dibayar'),
    (13, 13, '2024-12-03 16:00:00', 420000.00, 'Kartu Kredit', 'Dibayar'),
    (14, 14, '2024-11-18 09:00:00', 530000.00, 'Kartu Debit', 'Dibayar'),
    (15, 15, '2024-12-20 12:15:00', 460000.00, 'Tunai', 'Dibayar'),
    (16, 16, '2024-10-20 17:00:00', 300000.00, 'Transfer Bank', 'Dibayar'),
    (17, 17, '2024-11-30 09:30:00', 780000.00, 'Kartu Kredit', 'Dibayar'),
    (18, 18, '2024-10-15 10:00:00', 620000.00, 'Tunai', 'Dibayar'),
    (19, 19, '2024-12-01 14:00:00', 560000.00, 'Kartu Debit', 'Dibayar'),
    (20, 20, '2024-11-05 16:45:00', 670000.00, 'Transfer Bank', 'Dibayar'),
    (21, 21, '2024-10-11 12:30:00', 750000.00, 'Kartu Kredit', 'Dibayar'),
    (22, 22, '2024-12-05 13:30:00', 900000.00, 'Tunai', 'Dibayar'),
    (23, 23, '2024-11-22 14:00:00', 950000.00, 'Kartu Debit', 'Dibayar'),
    (24, 24, '2024-12-02 16:00:00', 820000.00, 'Transfer Bank', 'Dibayar'),
    (25, 25, '2024-11-15 10:30:00', 680000.00, 'Kartu Kredit', 'Dibayar'),
    (26, 26, '2024-10-05 12:30:00', 630000.00, 'Tunai', 'Dibayar'),
    (27, 27, '2024-12-10 13:00:00', 750000.00, 'Kartu Debit', 'Dibayar'),
    (28, 28, '2024-11-12 10:00:00', 480000.00, 'Transfer Bank', 'Dibayar'),
    (29, 29, '2024-10-15 16:30:00', 590000.00, 'Kartu Kredit', 'Dibayar'),
    (30, 30, '2024-12-11 14:15:00', 400000.00, 'Tunai', 'Dibayar');


INSERT INTO ulasan (id_ulasan, id_tamu, id_reservasi, rating, komentar)
VALUES
    (1, 1, 1, 4, 'Kamar nyaman, pelayanan baik. Namun, sedikit kebisingan di malam hari.'),
    (2, 2, 2, 5, 'Pengalaman yang luar biasa! Kamar sangat bersih dan pelayanan cepat.'),
    (3, 3, 3, 3, 'Cukup memadai, tetapi tidak ada pemandangan indah dari kamar.'),
    (4, 4, 4, 2, 'Kamar tidak sesuai ekspektasi. Air panas tidak berfungsi dengan baik.'),
    (5, 5, 5, 4, 'Hotel bagus, fasilitas memadai, tetapi makanan sedikit mahal.'),
    (6, 6, 6, 5, 'Sangat puas dengan pelayanan. Kamar luas dan sangat nyaman.'),
    (7, 7, 7, 3, 'Pelayanan standar, tidak ada yang spesial. Kamar bersih namun tidak terlalu menarik.'),
    (8, 8, 8, 5, 'Luar biasa! Pemandangan dari kamar sangat indah. Pelayanan juga sangat ramah.'),
    (9, 9, 9, 4, 'Kamar bersih dan nyaman, namun ada masalah kecil dengan AC.'),
    (10, 10, 10, 5, 'Semua sesuai harapan. Pengalaman menginap yang menyenangkan!'),
    (11, 11, 11, 2, 'Hotel tidak seperti yang dijelaskan, banyak fasilitas yang rusak.'),
    (12, 12, 12, 4, 'Pelayanan cukup baik, namun kamar agak sempit.'),
    (13, 13, 13, 3, 'Tidak ada masalah besar, namun bisa lebih baik lagi.'),
    (14, 14, 14, 4, 'Lokasi strategis, pelayanan cepat, namun ada sedikit masalah dengan wifi.'),
    (15, 15, 15, 5, 'Sempurna! Pelayanan sangat ramah dan fasilitas sangat lengkap.'),
    (16, 16, 16, 3, 'Pengalaman menginap cukup baik, hanya saja sedikit kebisingan dari luar.'),
    (17, 17, 17, 4, 'Kamar bersih dan nyaman, hanya saja harga sedikit tinggi.'),
    (18, 18, 18, 5, 'Layanan luar biasa! Akan menginap lagi jika ke sini.'),
    (19, 19, 19, 2, 'Tidak sesuai dengan yang dijanjikan. Banyak masalah teknis di kamar.'),
    (20, 20, 20, 4, 'Cukup memuaskan. Harga terjangkau dan kamar bersih.'),
    (21, 21, 21, 5, 'Kamar luas dan fasilitas lengkap. Sangat puas dengan pelayanan.'),
    (22, 22, 22, 3, 'Hotel cukup nyaman, namun fasilitas umum kurang terawat.'),
    (23, 23, 23, 4, 'Tempat yang bagus, namun layanan makanan agak lambat.'),
    (24, 24, 24, 5, 'Sangat menyenangkan! Akan kembali lagi ke sini.'),
    (25, 25, 25, 2, 'Tidak puas. Banyak masalah dengan kebersihan dan kenyamanan kamar.'),
    (26, 26, 26, 4, 'Semuanya baik, hanya saja check-in terlalu lama.'),
    (27, 27, 27, 5, 'Kamar sangat bersih, staf sangat ramah dan membantu. Pengalaman yang hebat!'),
    (28, 28, 28, 3, 'Cukup nyaman, tetapi fasilitas harus lebih lengkap.'),
    (29, 29, 29, 4, 'Hotel sangat baik, hanya sedikit masalah dengan pembersihan kamar.'),
    (30, 30, 30, 5, 'Sangat memuaskan, pelayanan sangat baik dan cepat.');

INSERT INTO layanan (id_layanan, nama, deskripsi, harga)
VALUES
    (1, 'Pijat Relaksasi', 'Pijat untuk relaksasi', 120000.00),
    (2, 'Spa Wajah', 'Perawatan wajah dengan spa', 150000.00),
    (3, 'Layanan Antar-Jemput', 'Antar jemput ke tempat tujuan', 200000.00),
    (4, 'Laundry Kamar', 'Layanan mencuci pakaian kamar', 50000.00),
    (5, 'Kamar Mandi Uap', 'Mandi uap relaksasi', 100000.00),
    (6, 'Room Service', 'Layanan pesan makanan ke kamar', 80000.00),
    (7, 'Sewa Mobil', 'Sewa mobil harian', 300000.00),
    (8, 'Fitness Center', 'Akses pusat kebugaran', 150000.00),
    (9, 'Pijat Kaki', 'Pijat untuk kaki', 60000.00),
    (10, 'Tur Kota', 'Wisata keliling kota', 250000.00),
    (11, 'Perawatan Rambut', 'Perawatan rambut dan creambath', 130000.00),
    (12, 'Layanan Belanja', 'Layanan belanja untuk Anda', 220000.00),
    (13, 'Makan Malam Romantis', 'Paket makan malam romantis', 350000.00),
    (14, 'Perawatan Kulit', 'Perawatan tubuh dan kulit', 170000.00),
    (15, 'Paket Spa', 'Paket lengkap spa relaksasi', 300000.00);

INSERT INTO penggunaan_layanan (id_penggunaan, id_reservasi, id_layanan, jumlah, total_harga)
VALUES
    (1, 1, 2, 1, 150000.00),
    (2, 1, 5, 2, 100000.00),
    (3, 2, 1, 1, 120000.00),
    (4, 2, 6, 3, 240000.00),
    (5, 3, 8, 1, 150000.00),
    (6, 3, 7, 1, 300000.00),
    (7, 4, 3, 2, 400000.00),
    (8, 4, 10, 1, 80000.00),
    (9, 5, 9, 2, 120000.00),
    (10, 6, 12, 1, 220000.00),
    (11, 6, 11, 1, 130000.00),
    (12, 7, 4, 3, 150000.00),
    (13, 8, 14, 1, 170000.00),
    (14, 9, 15, 2, 600000.00),
    (15, 10, 2, 1, 150000.00),
    (16, 10, 13, 1, 350000.00),
    (17, 11, 6, 1, 80000.00),
    (18, 11, 10, 2, 160000.00),
    (19, 12, 8, 1, 150000.00),
    (20, 13, 7, 1, 300000.00),
    (21, 14, 5, 1, 50000.00),
    (22, 14, 3, 1, 200000.00),
    (23, 15, 9, 2, 120000.00),
    (24, 16, 13, 1, 350000.00),
    (25, 16, 14, 2, 340000.00),
    (26, 17, 2, 1, 150000.00),
    (27, 18, 12, 1, 220000.00),
    (28, 19, 8, 1, 150000.00),
    (29, 19, 5, 1, 50000.00),
    (30, 20, 4, 3, 450000.00);

-- uji tabel
select * from tamu;
select * from pembayaran;
select * from kamar;
select * from penggunaan_layanan;
select * from layanan;
select * from ulasan;

-- fitur utama 1
CREATE VIEW laporan_tingkat_hunian_kamar AS
SELECT 
    DATE(r.tanggal_check_in) AS tanggal,
    k.id_karyawan,
    k.nama AS nama_karyawan,
    COUNT(DISTINCT r.id_kamar) AS jumlah_kamar_terisi,
    (SELECT COUNT(*) FROM kamar) AS total_kamar,
    CONCAT(
        ROUND(
            (COUNT(DISTINCT r.id_kamar)::NUMERIC / (SELECT COUNT(*) FROM kamar)) * 100, 
            2
        ), 
        '%'
    ) AS tingkat_hunian
FROM 
    reservasi r
JOIN 
    karyawan k ON r.id_karyawan = k.id_karyawan
WHERE 
    r.status = 'Selesai' -- Hanya menghitung reservasi yang selesai
GROUP BY 
    DATE(r.tanggal_check_in), k.id_karyawan, k.nama
ORDER BY 
    tanggal, nama_karyawan;
	
SELECT * FROM laporan_tingkat_hunian_kamar
WHERE EXTRACT(MONTH FROM tanggal) = 11
  AND EXTRACT(YEAR FROM tanggal) = 2024;


--per hotel bulan
CREATE VIEW laporan_tingkat_hunian_perbulan AS
SELECT
    COUNT(DISTINCT r.id_kamar) AS rooms_booked,
    (SELECT COUNT(*) FROM kamar) AS total_rooms,
    CONCAT(
        ROUND(COUNT(DISTINCT r.id_kamar) * 100.0 / (SELECT COUNT(*) FROM kamar), 0), 
        '%'
    ) AS occupancy_rate
FROM 
    reservasi r
WHERE 
    r.tanggal_check_in <= '2024-11-30' 
    AND r.tanggal_check_out >= '2024-11-01';

SELECT * FROM laporan_tingkat_hunian_perbulan;


--fitur utama 2
--1
CREATE OR REPLACE PROCEDURE calculate_discounted_total(
    IN reservation_id INT,
    IN discount_rate NUMERIC
) AS $$
BEGIN
    -- Simpan hasil perhitungan ke dalam tabel sementara
    CREATE TEMP TABLE temp_discounted_total AS
    SELECT
        r.total_harga AS total_room,
        COALESCE(SUM(pl.total_harga), 0) AS total_service,
        ROUND(
            (r.total_harga + COALESCE(SUM(pl.total_harga), 0)) * discount_rate / 100, 
            2
        ) AS discount_amount,
        ROUND(
            (r.total_harga + COALESCE(SUM(pl.total_harga), 0)) - 
            ROUND((r.total_harga + COALESCE(SUM(pl.total_harga), 0)) * discount_rate / 100, 2),
            2
        ) AS total_after_discount
    FROM reservasi r
    LEFT JOIN penggunaan_layanan pl ON r.id_reservasi = pl.id_reservasi
    WHERE r.id_reservasi = reservation_id
    GROUP BY r.total_harga;

    -- Menampilkan hasil perhitungan
    RAISE NOTICE 'Total Room: %, Total Service: %, Discount Amount: %, Total After Discount: %',
        (SELECT total_room FROM temp_discounted_total),
        (SELECT total_service FROM temp_discounted_total),
        (SELECT discount_amount FROM temp_discounted_total),
        (SELECT total_after_discount FROM temp_discounted_total);
END;
$$ LANGUAGE plpgsql;
-- Memanggil prosedur dengan ID reservasi 1 dan diskon 10%
CALL calculate_discounted_total(1, 10);

--2
CREATE VIEW laporan_tingkat_hunian_dan_tugas AS
SELECT 
    DATE(r.tanggal_check_in) AS tanggal,
    k.id_karyawan,
    k.nama AS nama_karyawan,
    COUNT(DISTINCT r.id_kamar) AS jumlah_kamar_terisi,
    (SELECT COUNT(*) FROM kamar) AS total_kamar,
    ROUND(
        (COUNT(DISTINCT r.id_kamar)::NUMERIC / (SELECT COUNT(*) FROM kamar)) * 100, 
        2
    ) AS tingkat_hunian
FROM 
    reservasi r
JOIN 
    karyawan k ON r.id_karyawan = k.id_karyawan
WHERE 
    r.status = 'Selesai' -- Hanya menghitung reservasi yang selesai
GROUP BY 
    DATE(r.tanggal_check_in), k.id_karyawan, k.nama
ORDER BY 
    tanggal, nama_karyawan;
	
SELECT * FROM laporan_tingkat_hunian_dan_tugas
WHERE EXTRACT(MONTH FROM tanggal) = 11
  AND EXTRACT(YEAR FROM tanggal) = 2024;


--FITUR 3 SCRAPPING
--FITUR 4 FUNCTION DAFTRA KAMAR YANG TERSEDIA 
CREATE OR REPLACE FUNCTION get_available_rooms() 
RETURNS TABLE(id_kamar INT, nomor_kamar VARCHAR, tipe VARCHAR, harga_per_malam NUMERIC, status VARCHAR) AS
$$
BEGIN
    RETURN QUERY
    SELECT kamar.id_kamar, kamar.nomor_kamar, kamar.tipe, kamar.harga_per_malam, kamar.status
    FROM kamar
    WHERE kamar.status = 'Tersedia';
END;
$$ LANGUAGE plpgsql;

SELECT * FROM get_available_rooms();

-- TRIGGER  Update Status Kamar Otomatis Setelah Reservasi
CREATE SEQUENCE reservasi_id_seq;
ALTER TABLE reservasi ALTER COLUMN id_reservasi SET DEFAULT nextval('reservasi_id_seq');


CREATE OR REPLACE FUNCTION ubah_status_kamar()
RETURNS TRIGGER AS $$
BEGIN
    -- Update status kamar menjadi 'Dipesan'
    UPDATE kamar 
    SET status = 'Dipesan' 
    WHERE id_kamar = NEW.id_kamar;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger AFTER INSERT pada tabel reservasi
CREATE TRIGGER trigger_ubah_status_kamar
AFTER INSERT ON reservasi
FOR EACH ROW
EXECUTE FUNCTION ubah_status_kamar();


-- Sesuaikan sequence untuk id_reservasi
SELECT setval('reservasi_id_seq', (SELECT MAX(id_reservasi) FROM reservasi));

INSERT INTO reservasi (id_tamu, id_kamar, id_karyawan, tanggal_check_in, tanggal_check_out, total_harga)
VALUES (29, 2, 3, '2024-12-10', '2024-12-15', 1000000);

--authorization
-- Mencabut hak akses dari semua sequence di skema public untuk role staff_role
REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public FROM manager_user;

-- Menghapus role staff_role
DROP ROLE manager_user;


CREATE USER staff_user WITH PASSWORD 'admin123';
CREATE USER manager_user WITH PASSWORD 'kelaz123';

CREATE ROLE staff_role;
CREATE ROLE manager_role;

GRANT staff_role TO staff_user;
GRANT manager_role TO manager_user;

GRANT SELECT, INSERT, UPDATE ON TABLE reservasi TO staff_role;
GRANT SELECT, INSERT, UPDATE ON TABLE reservasi TO manager_role;

SET ROLE staff_role;
SET ROLE manager_role;

RESET role;

--uji role untuk mengakses tabel reservasi untuk melihat banyaknya kamar yang sudah dipesan
SELECT * FROM reservasi WHERE status = 'Dipesan';
UPDATE reservasi SET id_tamu = 30, id_kamar = 8, id_karyawan = 2, tanggal_check_in = '2024-12-18', tanggal_check_out = '2024-12-20', total_harga = 550000.00, status = 'Dipesan'
WHERE id_reservasi = 3;
SELECT * FROM reservasi;


--cursor
--cursor untuk menampilkan layanan yang digunakan oleh reservasi tertentu
DO $$
DECLARE
    cur_layanan CURSOR FOR 
        SELECT pl.id_penggunaan, l.nama AS layanan, pl.jumlah, pl.total_harga
        FROM penggunaan_layanan pl
        JOIN layanan l ON pl.id_layanan = l.id_layanan
        WHERE pl.id_reservasi = 1; -- Ganti dengan ID reservasi yang diinginkan
    rec_layanan RECORD;
BEGIN
    -- Membuat tabel sementara untuk menyimpan hasil
    CREATE TEMP TABLE temp_layanan (
        id_penggunaan INTEGER,
        layanan VARCHAR(100),
        jumlah INTEGER,
        total_harga NUMERIC(10, 2)
    ) ON COMMIT DROP;

    OPEN cur_layanan;

    LOOP
        FETCH cur_layanan INTO rec_layanan;
        EXIT WHEN NOT FOUND;

        -- Memasukkan data ke tabel sementara
        INSERT INTO temp_layanan (id_penggunaan, layanan, jumlah, total_harga)
        VALUES (rec_layanan.id_penggunaan, rec_layanan.layanan, rec_layanan.jumlah, rec_layanan.total_harga);
    END LOOP;

    CLOSE cur_layanan;

    -- Menampilkan hasil dari tabel sementara
    RAISE NOTICE 'Hasil dari tabel sementara:';
    FOR rec_layanan IN
        SELECT * FROM temp_layanan
    LOOP
        RAISE NOTICE 'ID Penggunaan: %, Layanan: %, Jumlah: %, Total Harga: %',
            rec_layanan.id_penggunaan, rec_layanan.layanan, rec_layanan.jumlah, rec_layanan.total_harga;
    END LOOP;

END $$;

SELECT * FROM temp_layanan;


--Transaction
-- Mulai transaksi
BEGIN;

-- Hapus Data Pembayaran
DELETE FROM pembayaran WHERE id_reservasi = 1;

-- Hapus Data Penggunaan Layanan
DELETE FROM penggunaan_layanan WHERE id_reservasi = 1;

-- Hapus Data Reservasi
DELETE FROM reservasi WHERE id_reservasi = 1;

-- Jika semuanya berhasil, lakukan commit
COMMIT;
ROLLBACK;
--uji
select * from pembayaran;
select * from penggunaan_layanan;
select * from reservasi;

