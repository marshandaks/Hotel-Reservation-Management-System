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
-- PostgreSQL database dump complete
--

