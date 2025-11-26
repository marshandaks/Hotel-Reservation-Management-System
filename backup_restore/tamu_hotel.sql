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
-- Name: tamu tamu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tamu
    ADD CONSTRAINT tamu_pkey PRIMARY KEY (id_tamu);


--
-- PostgreSQL database dump complete
--

