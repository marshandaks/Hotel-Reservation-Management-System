--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: kamar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kamar (
    id_kamar integer NOT NULL,
    nomor_kamar character varying(10) NOT NULL,
    tipe character varying(50) NOT NULL,
    harga_per_malam numeric(10,2) NOT NULL,
    status character varying(20) DEFAULT 'Tersedia'::character varying,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.kamar OWNER TO postgres;

--
-- Name: karyawan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.karyawan (
    id_karyawan integer NOT NULL,
    nama character varying(100) NOT NULL,
    posisi character varying(50) NOT NULL,
    telepon character varying(15),
    email character varying(100),
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.karyawan OWNER TO postgres;

--
-- Name: layanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.layanan (
    id_layanan integer NOT NULL,
    nama character varying(100) NOT NULL,
    deskripsi text,
    harga numeric(10,2) NOT NULL,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.layanan OWNER TO postgres;

--
-- Name: pembayaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembayaran (
    id_pembayaran integer NOT NULL,
    id_reservasi integer NOT NULL,
    tanggal_pembayaran timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    jumlah numeric(10,2) NOT NULL,
    metode_pembayaran character varying(50),
    status character varying(20) DEFAULT 'Dibayar'::character varying,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pembayaran OWNER TO postgres;

--
-- Name: penggunaan_layanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penggunaan_layanan (
    id_penggunaan integer NOT NULL,
    id_reservasi integer NOT NULL,
    id_layanan integer NOT NULL,
    jumlah integer DEFAULT 1,
    total_harga numeric(10,2) NOT NULL,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.penggunaan_layanan OWNER TO postgres;

--
-- Name: reservasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservasi (
    id_reservasi integer NOT NULL,
    id_tamu integer NOT NULL,
    id_kamar integer NOT NULL,
    id_karyawan integer NOT NULL,
    tanggal_check_in date NOT NULL,
    tanggal_check_out date NOT NULL,
    total_harga numeric(10,2) NOT NULL,
    status character varying(20) DEFAULT 'Tertunda'::character varying,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reservasi OWNER TO postgres;

--
-- Name: tamu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tamu (
    id_tamu integer NOT NULL,
    nama character varying(100) NOT NULL,
    telepon character varying(15) NOT NULL,
    email character varying(100),
    alamat text,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tamu OWNER TO postgres;

--
-- Name: ulasan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ulasan (
    id_ulasan integer NOT NULL,
    id_tamu integer NOT NULL,
    id_reservasi integer NOT NULL,
    rating integer,
    komentar text,
    waktu_dibuat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ulasan_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.ulasan OWNER TO postgres;

--
-- Data for Name: kamar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kamar (id_kamar, nomor_kamar, tipe, harga_per_malam, status, waktu_dibuat) FROM stdin;
1	K001	Superior	500000.00	Tersedia	2024-12-09 23:20:48.586422
2	K002	Deluxe	750000.00	Tersedia	2024-12-09 23:20:48.586422
3	K003	Standard	350000.00	Tersedia	2024-12-09 23:20:48.586422
4	K004	Suite	1500000.00	Tersedia	2024-12-09 23:20:48.586422
5	K005	Superior	520000.00	Dipesan	2024-12-09 23:20:48.586422
6	K006	Deluxe	780000.00	Tersedia	2024-12-09 23:20:48.586422
7	K007	Standard	330000.00	Tersedia	2024-12-09 23:20:48.586422
8	K008	Suite	1450000.00	Tersedia	2024-12-09 23:20:48.586422
9	K009	Superior	510000.00	Dipesan	2024-12-09 23:20:48.586422
10	K010	Deluxe	760000.00	Tersedia	2024-12-09 23:20:48.586422
11	K011	Standard	340000.00	Tersedia	2024-12-09 23:20:48.586422
12	K012	Suite	1480000.00	Dipesan	2024-12-09 23:20:48.586422
13	K013	Superior	490000.00	Tersedia	2024-12-09 23:20:48.586422
14	K014	Deluxe	740000.00	Tersedia	2024-12-09 23:20:48.586422
15	K015	Standard	320000.00	Dipesan	2024-12-09 23:20:48.586422
16	K016	Suite	1400000.00	Tersedia	2024-12-09 23:20:48.586422
17	K017	Superior	510000.00	Tersedia	2024-12-09 23:20:48.586422
18	K018	Deluxe	770000.00	Tersedia	2024-12-09 23:20:48.586422
19	K019	Standard	310000.00	Tersedia	2024-12-09 23:20:48.586422
20	K020	Suite	1550000.00	Dipesan	2024-12-09 23:20:48.586422
21	K021	Superior	500000.00	Dipesan	2024-12-09 23:20:48.586422
22	K022	Deluxe	750000.00	Tersedia	2024-12-09 23:20:48.586422
23	K023	Standard	340000.00	Tersedia	2024-12-09 23:20:48.586422
24	K024	Suite	1490000.00	Tersedia	2024-12-09 23:20:48.586422
25	K025	Superior	520000.00	Tersedia	2024-12-09 23:20:48.586422
26	K026	Deluxe	770000.00	Dipesan	2024-12-09 23:20:48.586422
27	K027	Standard	330000.00	Tersedia	2024-12-09 23:20:48.586422
28	K028	Suite	1460000.00	Dipesan	2024-12-09 23:20:48.586422
29	K029	Superior	510000.00	Tersedia	2024-12-09 23:20:48.586422
30	K030	Deluxe	740000.00	Tersedia	2024-12-09 23:20:48.586422
\.


--
-- Data for Name: karyawan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.karyawan (id_karyawan, nama, posisi, telepon, email, waktu_dibuat) FROM stdin;
1	Andi Pratama	Resepsionis	081234567890	andi@example.com	2024-12-09 23:20:55.78248
2	Budi Santoso	Manajer	082345678901	budi@example.com	2024-12-09 23:20:55.78248
3	Citra Wijaya	Resepsionis	083456789012	citra@example.com	2024-12-09 23:20:55.78248
4	Diana Sari	Staf Keuangan	084567890123	diana@example.com	2024-12-09 23:20:55.78248
5	Eka Permatasari	Resepsionis	085678901234	eka@example.com	2024-12-09 23:20:55.78248
6	Fajar Saputra	Resepsionis	086789012345	fajar@example.com	2024-12-09 23:20:55.78248
7	Gina Lestari	Kasir	087890123456	gina@example.com	2024-12-09 23:20:55.78248
8	Hendri Nugroho	Resepsionis	088901234567	hendri@example.com	2024-12-09 23:20:55.78248
9	Ika Ramadhani	Staf HRD	089012345678	ika@example.com	2024-12-09 23:20:55.78248
10	Joko Santosa	Resepsionis	081023456789	joko@example.com	2024-12-09 23:20:55.78248
11	Lina Pratiwi	Resepsionis	082134567890	lina@example.com	2024-12-09 23:20:55.78248
12	Mira Kusuma	Staf Keuangan	083245678901	mira@example.com	2024-12-09 23:20:55.78248
13	Nina Maulani	Resepsionis	084356789012	nina@example.com	2024-12-09 23:20:55.78248
14	Oka Prabowo	Staf HRD	085467890123	oka@example.com	2024-12-09 23:20:55.78248
15	Putra Wijaya	Resepsionis	086578901234	putra@example.com	2024-12-09 23:20:55.78248
\.


--
-- Data for Name: layanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.layanan (id_layanan, nama, deskripsi, harga, waktu_dibuat) FROM stdin;
1	Pijat Relaksasi	Pijat untuk relaksasi	120000.00	2024-12-09 23:21:21.149202
2	Spa Wajah	Perawatan wajah dengan spa	150000.00	2024-12-09 23:21:21.149202
3	Layanan Antar-Jemput	Antar jemput ke tempat tujuan	200000.00	2024-12-09 23:21:21.149202
4	Laundry Kamar	Layanan mencuci pakaian kamar	50000.00	2024-12-09 23:21:21.149202
5	Kamar Mandi Uap	Mandi uap relaksasi	100000.00	2024-12-09 23:21:21.149202
6	Room Service	Layanan pesan makanan ke kamar	80000.00	2024-12-09 23:21:21.149202
7	Sewa Mobil	Sewa mobil harian	300000.00	2024-12-09 23:21:21.149202
8	Fitness Center	Akses pusat kebugaran	150000.00	2024-12-09 23:21:21.149202
9	Pijat Kaki	Pijat untuk kaki	60000.00	2024-12-09 23:21:21.149202
10	Tur Kota	Wisata keliling kota	250000.00	2024-12-09 23:21:21.149202
11	Perawatan Rambut	Perawatan rambut dan creambath	130000.00	2024-12-09 23:21:21.149202
12	Layanan Belanja	Layanan belanja untuk Anda	220000.00	2024-12-09 23:21:21.149202
13	Makan Malam Romantis	Paket makan malam romantis	350000.00	2024-12-09 23:21:21.149202
14	Perawatan Kulit	Perawatan tubuh dan kulit	170000.00	2024-12-09 23:21:21.149202
15	Paket Spa	Paket lengkap spa relaksasi	300000.00	2024-12-09 23:21:21.149202
\.


--
-- Data for Name: pembayaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembayaran (id_pembayaran, id_reservasi, tanggal_pembayaran, jumlah, metode_pembayaran, status, waktu_dibuat) FROM stdin;
1	1	2024-12-05 10:00:00	450000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
2	2	2024-11-01 14:30:00	1000000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
3	3	2024-10-05 09:45:00	300000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
4	4	2024-12-10 12:00:00	600000.00	Kartu Debit	Dibayar	2024-12-09 23:21:09.73315
5	5	2024-11-10 08:30:00	750000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
6	6	2024-10-08 11:20:00	400000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
7	7	2024-11-15 15:00:00	520000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
8	8	2024-12-01 13:15:00	350000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
9	9	2024-11-22 16:10:00	850000.00	Kartu Debit	Dibayar	2024-12-09 23:21:09.73315
10	10	2024-12-14 10:30:00	650000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
11	11	2024-11-09 11:00:00	500000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
12	12	2024-10-12 14:45:00	470000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
13	13	2024-12-03 16:00:00	420000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
14	14	2024-11-18 09:00:00	530000.00	Kartu Debit	Dibayar	2024-12-09 23:21:09.73315
15	15	2024-12-20 12:15:00	460000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
16	16	2024-10-20 17:00:00	300000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
17	17	2024-11-30 09:30:00	780000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
18	18	2024-10-15 10:00:00	620000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
19	19	2024-12-01 14:00:00	560000.00	Kartu Debit	Dibayar	2024-12-09 23:21:09.73315
20	20	2024-11-05 16:45:00	670000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
21	21	2024-10-11 12:30:00	750000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
22	22	2024-12-05 13:30:00	900000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
23	23	2024-11-22 14:00:00	950000.00	Kartu Debit	Dibayar	2024-12-09 23:21:09.73315
24	24	2024-12-02 16:00:00	820000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
25	25	2024-11-15 10:30:00	680000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
26	26	2024-10-05 12:30:00	630000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
27	27	2024-12-10 13:00:00	750000.00	Kartu Debit	Dibayar	2024-12-09 23:21:09.73315
28	28	2024-11-12 10:00:00	480000.00	Transfer Bank	Dibayar	2024-12-09 23:21:09.73315
29	29	2024-10-15 16:30:00	590000.00	Kartu Kredit	Dibayar	2024-12-09 23:21:09.73315
30	30	2024-12-11 14:15:00	400000.00	Tunai	Dibayar	2024-12-09 23:21:09.73315
\.


--
-- Data for Name: penggunaan_layanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penggunaan_layanan (id_penggunaan, id_reservasi, id_layanan, jumlah, total_harga, waktu_dibuat) FROM stdin;
1	1	2	1	150000.00	2024-12-09 23:21:26.379218
2	1	5	2	100000.00	2024-12-09 23:21:26.379218
3	2	1	1	120000.00	2024-12-09 23:21:26.379218
4	2	6	3	240000.00	2024-12-09 23:21:26.379218
5	3	8	1	150000.00	2024-12-09 23:21:26.379218
6	3	7	1	300000.00	2024-12-09 23:21:26.379218
7	4	3	2	400000.00	2024-12-09 23:21:26.379218
8	4	10	1	80000.00	2024-12-09 23:21:26.379218
9	5	9	2	120000.00	2024-12-09 23:21:26.379218
10	6	12	1	220000.00	2024-12-09 23:21:26.379218
11	6	11	1	130000.00	2024-12-09 23:21:26.379218
12	7	4	3	150000.00	2024-12-09 23:21:26.379218
13	8	14	1	170000.00	2024-12-09 23:21:26.379218
14	9	15	2	600000.00	2024-12-09 23:21:26.379218
15	10	2	1	150000.00	2024-12-09 23:21:26.379218
16	10	13	1	350000.00	2024-12-09 23:21:26.379218
17	11	6	1	80000.00	2024-12-09 23:21:26.379218
18	11	10	2	160000.00	2024-12-09 23:21:26.379218
19	12	8	1	150000.00	2024-12-09 23:21:26.379218
20	13	7	1	300000.00	2024-12-09 23:21:26.379218
21	14	5	1	50000.00	2024-12-09 23:21:26.379218
22	14	3	1	200000.00	2024-12-09 23:21:26.379218
23	15	9	2	120000.00	2024-12-09 23:21:26.379218
24	16	13	1	350000.00	2024-12-09 23:21:26.379218
25	16	14	2	340000.00	2024-12-09 23:21:26.379218
26	17	2	1	150000.00	2024-12-09 23:21:26.379218
27	18	12	1	220000.00	2024-12-09 23:21:26.379218
28	19	8	1	150000.00	2024-12-09 23:21:26.379218
29	19	5	1	50000.00	2024-12-09 23:21:26.379218
30	20	4	3	450000.00	2024-12-09 23:21:26.379218
\.


--
-- Data for Name: reservasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservasi (id_reservasi, id_tamu, id_kamar, id_karyawan, tanggal_check_in, tanggal_check_out, total_harga, status, waktu_dibuat) FROM stdin;
1	1	3	1	2024-12-05	2024-12-07	450000.00	Dipesan	2024-12-09 23:21:02.793988
2	2	10	3	2024-11-01	2024-11-03	1000000.00	Selesai	2024-12-09 23:21:02.793988
3	3	15	4	2024-10-05	2024-10-07	300000.00	Dipesan	2024-12-09 23:21:02.793988
4	4	20	5	2024-12-10	2024-12-12	600000.00	Tertunda	2024-12-09 23:21:02.793988
5	5	25	6	2024-11-10	2024-11-12	750000.00	Selesai	2024-12-09 23:21:02.793988
6	6	5	7	2024-10-08	2024-10-10	400000.00	Dipesan	2024-12-09 23:21:02.793988
7	7	12	8	2024-11-15	2024-11-17	520000.00	Selesai	2024-12-09 23:21:02.793988
8	8	2	9	2024-12-01	2024-12-03	350000.00	Dipesan	2024-12-09 23:21:02.793988
9	9	30	10	2024-11-22	2024-11-24	850000.00	Selesai	2024-12-09 23:21:02.793988
10	10	7	11	2024-12-14	2024-12-16	650000.00	Tertunda	2024-12-09 23:21:02.793988
11	11	18	12	2024-11-09	2024-11-11	500000.00	Selesai	2024-12-09 23:21:02.793988
12	12	22	13	2024-10-12	2024-10-14	470000.00	Dipesan	2024-12-09 23:21:02.793988
13	13	6	14	2024-12-03	2024-12-05	420000.00	Tertunda	2024-12-09 23:21:02.793988
14	14	11	15	2024-11-18	2024-11-20	530000.00	Selesai	2024-12-09 23:21:02.793988
15	15	16	1	2024-12-20	2024-12-22	460000.00	Dipesan	2024-12-09 23:21:02.793988
16	16	4	2	2024-10-20	2024-10-22	300000.00	Tertunda	2024-12-09 23:21:02.793988
17	17	19	3	2024-11-30	2024-12-02	780000.00	Selesai	2024-12-09 23:21:02.793988
18	18	8	5	2024-10-15	2024-10-17	620000.00	Dipesan	2024-12-09 23:21:02.793988
19	19	9	6	2024-12-01	2024-12-03	560000.00	Selesai	2024-12-09 23:21:02.793988
20	20	23	7	2024-11-05	2024-11-07	670000.00	Selesai	2024-12-09 23:21:02.793988
21	21	14	8	2024-10-11	2024-10-13	750000.00	Dipesan	2024-12-09 23:21:02.793988
22	22	28	9	2024-12-05	2024-12-07	900000.00	Selesai	2024-12-09 23:21:02.793988
23	23	24	10	2024-11-22	2024-11-24	950000.00	Selesai	2024-12-09 23:21:02.793988
24	24	27	11	2024-12-02	2024-12-04	820000.00	Dipesan	2024-12-09 23:21:02.793988
25	25	21	12	2024-11-15	2024-11-17	680000.00	Selesai	2024-12-09 23:21:02.793988
26	26	26	13	2024-10-05	2024-10-07	630000.00	Dipesan	2024-12-09 23:21:02.793988
27	27	13	14	2024-12-10	2024-12-12	750000.00	Tertunda	2024-12-09 23:21:02.793988
28	28	1	15	2024-11-12	2024-11-14	480000.00	Selesai	2024-12-09 23:21:02.793988
29	29	17	14	2024-10-15	2024-10-17	590000.00	Dipesan	2024-12-09 23:21:02.793988
30	30	3	1	2024-12-11	2024-12-13	400000.00	Tertunda	2024-12-09 23:21:02.793988
\.


--
-- Data for Name: tamu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tamu (id_tamu, nama, telepon, email, alamat, waktu_dibuat) FROM stdin;
1	Rafael Mahendra	081938472839	rafael@example.com	Jl. Sejahtera No. 10, Jakarta	2024-12-09 23:20:42.39841
2	Agnes Paramita	082153784920	agnes@example.com	Jl. Merdeka No. 24, Bandung	2024-12-09 23:20:42.39841
3	Sofia Amelia	085172839406	sofia@example.com	Jl. Garuda No. 55, Surabaya	2024-12-09 23:20:42.39841
4	Teguh Wicaksono	083745019283	teguh@example.com	Jl. Sudirman No. 78, Bali	2024-12-09 23:20:42.39841
5	Dina Melati	089643728195	dina@example.com	Jl. Pahlawan No. 22, Yogyakarta	2024-12-09 23:20:42.39841
6	Johan Kurniawan	084739204857	johan@example.com	Jl. Bunga No. 49, Medan	2024-12-09 23:20:42.39841
7	Fiona Pratiwi	087182736524	fiona@example.com	Jl. Raya No. 89, Makassar	2024-12-09 23:20:42.39841
8	Taufik Ardiansyah	086245910384	taufik@example.com	Jl. Cempaka No. 90, Palembang	2024-12-09 23:20:42.39841
9	Rina Nurfitri	085961230478	rina@example.com	Jl. Anggrek No. 103, Semarang	2024-12-09 23:20:42.39841
10	Lina Purnama	088365017492	lina@example.com	Jl. Melati No. 67, Malang	2024-12-09 23:20:42.39841
11	Iwan Setiawan	081784506382	iwan@example.com	Jl. Merpati No. 20, Jakarta	2024-12-09 23:20:42.39841
12	Nina Rahayu	087645829103	nina@example.com	Jl. Kamboja No. 33, Bandung	2024-12-09 23:20:42.39841
13	Lukas Hendrawan	085671903482	lukas@example.com	Jl. Pahlawan No. 47, Surabaya	2024-12-09 23:20:42.39841
14	Karina Dewi	082439571203	karina@example.com	Jl. Cempaka No. 55, Bali	2024-12-09 23:20:42.39841
15	Deni Putra	088172630948	deni@example.com	Jl. Wira No. 10, Yogyakarta	2024-12-09 23:20:42.39841
16	Mira Indriani	085238470983	mira@example.com	Jl. Anggrek No. 72, Medan	2024-12-09 23:20:42.39841
17	Yusuf Halim	083745209473	yusuf@example.com	Jl. Raya No. 28, Makassar	2024-12-09 23:20:42.39841
18	Indah Sari	085689234702	indah@example.com	Jl. Sudirman No. 40, Palembang	2024-12-09 23:20:42.39841
19	Siska Lestari	086590273194	siska@example.com	Jl. Cempaka No. 63, Semarang	2024-12-09 23:20:42.39841
20	Cindy Novita	087513042896	cindy@example.com	Jl. Pahlawan No. 88, Malang	2024-12-09 23:20:42.39841
21	Niko Prabowo	085371820392	niko@example.com	Jl. Merpati No. 18, Jakarta	2024-12-09 23:20:42.39841
22	Agustinus Santoso	082943812749	agustinus@example.com	Jl. Kamboja No. 9, Bandung	2024-12-09 23:20:42.39841
23	Tari Santika	087128374650	tari@example.com	Jl. Sumber No. 13, Surabaya	2024-12-09 23:20:42.39841
24	Albertina Yuliana	084738109452	albertina@example.com	Jl. Merdeka No. 34, Bali	2024-12-09 23:20:42.39841
25	Eka Widodo	086257943018	eka@example.com	Jl. Pahlawan No. 5, Yogyakarta	2024-12-09 23:20:42.39841
26	Hendri Hadi	088172647380	hendri@example.com	Jl. Raya No. 75, Medan	2024-12-09 23:20:42.39841
27	Martha Suryani	085628391017	martha@example.com	Jl. Anggrek No. 21, Makassar	2024-12-09 23:20:42.39841
28	Sandi Alamsyah	082319874250	sandi@example.com	Jl. Cempaka No. 17, Palembang	2024-12-09 23:20:42.39841
29	Vina Lestari	087498657321	vina@example.com	Jl. Sudirman No. 9, Semarang	2024-12-09 23:20:42.39841
30	Ferry Pratama	085173984201	ferry@example.com	Jl. Cempaka No. 66, Malang	2024-12-09 23:20:42.39841
\.


--
-- Data for Name: ulasan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ulasan (id_ulasan, id_tamu, id_reservasi, rating, komentar, waktu_dibuat) FROM stdin;
1	1	1	4	Kamar nyaman, pelayanan baik. Namun, sedikit kebisingan di malam hari.	2024-12-09 23:21:16.890537
2	2	2	5	Pengalaman yang luar biasa! Kamar sangat bersih dan pelayanan cepat.	2024-12-09 23:21:16.890537
3	3	3	3	Cukup memadai, tetapi tidak ada pemandangan indah dari kamar.	2024-12-09 23:21:16.890537
4	4	4	2	Kamar tidak sesuai ekspektasi. Air panas tidak berfungsi dengan baik.	2024-12-09 23:21:16.890537
5	5	5	4	Hotel bagus, fasilitas memadai, tetapi makanan sedikit mahal.	2024-12-09 23:21:16.890537
6	6	6	5	Sangat puas dengan pelayanan. Kamar luas dan sangat nyaman.	2024-12-09 23:21:16.890537
7	7	7	3	Pelayanan standar, tidak ada yang spesial. Kamar bersih namun tidak terlalu menarik.	2024-12-09 23:21:16.890537
8	8	8	5	Luar biasa! Pemandangan dari kamar sangat indah. Pelayanan juga sangat ramah.	2024-12-09 23:21:16.890537
9	9	9	4	Kamar bersih dan nyaman, namun ada masalah kecil dengan AC.	2024-12-09 23:21:16.890537
10	10	10	5	Semua sesuai harapan. Pengalaman menginap yang menyenangkan!	2024-12-09 23:21:16.890537
11	11	11	2	Hotel tidak seperti yang dijelaskan, banyak fasilitas yang rusak.	2024-12-09 23:21:16.890537
12	12	12	4	Pelayanan cukup baik, namun kamar agak sempit.	2024-12-09 23:21:16.890537
13	13	13	3	Tidak ada masalah besar, namun bisa lebih baik lagi.	2024-12-09 23:21:16.890537
14	14	14	4	Lokasi strategis, pelayanan cepat, namun ada sedikit masalah dengan wifi.	2024-12-09 23:21:16.890537
15	15	15	5	Sempurna! Pelayanan sangat ramah dan fasilitas sangat lengkap.	2024-12-09 23:21:16.890537
16	16	16	3	Pengalaman menginap cukup baik, hanya saja sedikit kebisingan dari luar.	2024-12-09 23:21:16.890537
17	17	17	4	Kamar bersih dan nyaman, hanya saja harga sedikit tinggi.	2024-12-09 23:21:16.890537
18	18	18	5	Layanan luar biasa! Akan menginap lagi jika ke sini.	2024-12-09 23:21:16.890537
19	19	19	2	Tidak sesuai dengan yang dijanjikan. Banyak masalah teknis di kamar.	2024-12-09 23:21:16.890537
20	20	20	4	Cukup memuaskan. Harga terjangkau dan kamar bersih.	2024-12-09 23:21:16.890537
21	21	21	5	Kamar luas dan fasilitas lengkap. Sangat puas dengan pelayanan.	2024-12-09 23:21:16.890537
22	22	22	3	Hotel cukup nyaman, namun fasilitas umum kurang terawat.	2024-12-09 23:21:16.890537
23	23	23	4	Tempat yang bagus, namun layanan makanan agak lambat.	2024-12-09 23:21:16.890537
24	24	24	5	Sangat menyenangkan! Akan kembali lagi ke sini.	2024-12-09 23:21:16.890537
25	25	25	2	Tidak puas. Banyak masalah dengan kebersihan dan kenyamanan kamar.	2024-12-09 23:21:16.890537
26	26	26	4	Semuanya baik, hanya saja check-in terlalu lama.	2024-12-09 23:21:16.890537
27	27	27	5	Kamar sangat bersih, staf sangat ramah dan membantu. Pengalaman yang hebat!	2024-12-09 23:21:16.890537
28	28	28	3	Cukup nyaman, tetapi fasilitas harus lebih lengkap.	2024-12-09 23:21:16.890537
29	29	29	4	Hotel sangat baik, hanya sedikit masalah dengan pembersihan kamar.	2024-12-09 23:21:16.890537
30	30	30	5	Sangat memuaskan, pelayanan sangat baik dan cepat.	2024-12-09 23:21:16.890537
\.


--
-- Name: kamar kamar_nomor_kamar_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kamar
    ADD CONSTRAINT kamar_nomor_kamar_key UNIQUE (nomor_kamar);


--
-- Name: kamar kamar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kamar
    ADD CONSTRAINT kamar_pkey PRIMARY KEY (id_kamar);


--
-- Name: karyawan karyawan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karyawan
    ADD CONSTRAINT karyawan_pkey PRIMARY KEY (id_karyawan);


--
-- Name: layanan layanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.layanan
    ADD CONSTRAINT layanan_pkey PRIMARY KEY (id_layanan);


--
-- Name: pembayaran pembayaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_pkey PRIMARY KEY (id_pembayaran);


--
-- Name: penggunaan_layanan penggunaan_layanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penggunaan_layanan
    ADD CONSTRAINT penggunaan_layanan_pkey PRIMARY KEY (id_penggunaan);


--
-- Name: reservasi reservasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservasi
    ADD CONSTRAINT reservasi_pkey PRIMARY KEY (id_reservasi);


--
-- Name: tamu tamu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_pkey PRIMARY KEY (id_tamu);


--
-- Name: ulasan ulasan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_pkey PRIMARY KEY (id_ulasan);


--
-- Name: pembayaran pembayaran_id_reservasi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_id_reservasi_fkey FOREIGN KEY (id_reservasi) REFERENCES public.reservasi(id_reservasi) ON DELETE CASCADE;


--
-- Name: penggunaan_layanan penggunaan_layanan_id_layanan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penggunaan_layanan
    ADD CONSTRAINT penggunaan_layanan_id_layanan_fkey FOREIGN KEY (id_layanan) REFERENCES public.layanan(id_layanan) ON DELETE CASCADE;


--
-- Name: penggunaan_layanan penggunaan_layanan_id_reservasi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penggunaan_layanan
    ADD CONSTRAINT penggunaan_layanan_id_reservasi_fkey FOREIGN KEY (id_reservasi) REFERENCES public.reservasi(id_reservasi) ON DELETE CASCADE;


--
-- Name: reservasi reservasi_id_kamar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservasi
    ADD CONSTRAINT reservasi_id_kamar_fkey FOREIGN KEY (id_kamar) REFERENCES public.kamar(id_kamar) ON DELETE CASCADE;


--
-- Name: reservasi reservasi_id_karyawan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservasi
    ADD CONSTRAINT reservasi_id_karyawan_fkey FOREIGN KEY (id_karyawan) REFERENCES public.karyawan(id_karyawan) ON DELETE SET NULL;


--
-- Name: reservasi reservasi_id_tamu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservasi
    ADD CONSTRAINT reservasi_id_tamu_fkey FOREIGN KEY (id_tamu) REFERENCES public.tamu(id_tamu) ON DELETE CASCADE;


--
-- Name: ulasan ulasan_id_reservasi_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_id_reservasi_fkey FOREIGN KEY (id_reservasi) REFERENCES public.reservasi(id_reservasi) ON DELETE CASCADE;


--
-- Name: ulasan ulasan_id_tamu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ulasan
    ADD CONSTRAINT ulasan_id_tamu_fkey FOREIGN KEY (id_tamu) REFERENCES public.tamu(id_tamu) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

