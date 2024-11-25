--
-- PostgreSQL database dump
--

-- Dumped from database version 16.5
-- Dumped by pg_dump version 16.5

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

--
-- Name: audit_chien_update(); Type: FUNCTION; Schema: public; Owner: daniel
--

CREATE FUNCTION public.audit_chien_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO AuditChiens (
        IdChien,
        NomChien,
        IdRace,
        SexeChien,
        NumTatouageChien,
        DateNaissanceChien,
        CouleurPelageChien,
        IdClient,
        PrixVente,
        DateVente,
        DateModification
    ) VALUES (
        OLD.IdChien,
        OLD.NomChien,
        OLD.IdRace,
        OLD.SexeChien,
        OLD.NumTatouageChien,
        OLD.DateNaissanceChien,
        OLD.CouleurPelageChien,
        OLD.IdClient,
        OLD.PrixVente,
        OLD.DateVente,
        NOW()
    );
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.audit_chien_update() OWNER TO daniel;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auditchiens; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.auditchiens (
    idchien integer NOT NULL,
    nomchien character varying(45) NOT NULL,
    idrace integer,
    sexechien boolean,
    numtatouagechien character varying(45) DEFAULT NULL::character varying,
    datenaissancechien date,
    couleurpelagechien character varying(45) DEFAULT NULL::character varying,
    idclient integer,
    prixvente numeric(10,0) DEFAULT NULL::numeric,
    datevente date,
    datemodification timestamp without time zone
);


ALTER TABLE public.auditchiens OWNER TO daniel;

--
-- Name: auditchiens_idchien_seq; Type: SEQUENCE; Schema: public; Owner: daniel
--

CREATE SEQUENCE public.auditchiens_idchien_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditchiens_idchien_seq OWNER TO daniel;

--
-- Name: auditchiens_idchien_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniel
--

ALTER SEQUENCE public.auditchiens_idchien_seq OWNED BY public.auditchiens.idchien;


--
-- Name: chiens; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.chiens (
    idchien integer NOT NULL,
    nomchien character varying(45) NOT NULL,
    idrace integer,
    sexechien boolean,
    numtatouagechien character varying(45) DEFAULT NULL::character varying,
    datenaissancechien date,
    couleurpelagechien character varying(45) DEFAULT NULL::character varying,
    idclient integer,
    prixvente numeric(10,0) DEFAULT NULL::numeric,
    datevente date
);


ALTER TABLE public.chiens OWNER TO daniel;

--
-- Name: chiens_idchien_seq; Type: SEQUENCE; Schema: public; Owner: daniel
--

CREATE SEQUENCE public.chiens_idchien_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chiens_idchien_seq OWNER TO daniel;

--
-- Name: chiens_idchien_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniel
--

ALTER SEQUENCE public.chiens_idchien_seq OWNED BY public.chiens.idchien;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.clients (
    idclient integer NOT NULL,
    nomclient character varying(45) NOT NULL,
    prenomclient character varying(45) NOT NULL,
    adresseclient character varying(45) NOT NULL,
    cpclient character varying(10) NOT NULL,
    villeclient character varying(60) NOT NULL,
    paysclient character varying(45) NOT NULL,
    telclient character varying(45) DEFAULT NULL::character varying,
    emailclient character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.clients OWNER TO daniel;

--
-- Name: clients_idclient_seq; Type: SEQUENCE; Schema: public; Owner: daniel
--

CREATE SEQUENCE public.clients_idclient_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_idclient_seq OWNER TO daniel;

--
-- Name: clients_idclient_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniel
--

ALTER SEQUENCE public.clients_idclient_seq OWNED BY public.clients.idclient;


--
-- Name: races; Type: TABLE; Schema: public; Owner: daniel
--

CREATE TABLE public.races (
    idrace integer NOT NULL,
    nomrace character varying(45) NOT NULL
);


ALTER TABLE public.races OWNER TO daniel;

--
-- Name: races_idrace_seq; Type: SEQUENCE; Schema: public; Owner: daniel
--

CREATE SEQUENCE public.races_idrace_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.races_idrace_seq OWNER TO daniel;

--
-- Name: races_idrace_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: daniel
--

ALTER SEQUENCE public.races_idrace_seq OWNED BY public.races.idrace;


--
-- Name: auditchiens idchien; Type: DEFAULT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.auditchiens ALTER COLUMN idchien SET DEFAULT nextval('public.auditchiens_idchien_seq'::regclass);


--
-- Name: chiens idchien; Type: DEFAULT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.chiens ALTER COLUMN idchien SET DEFAULT nextval('public.chiens_idchien_seq'::regclass);


--
-- Name: clients idclient; Type: DEFAULT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.clients ALTER COLUMN idclient SET DEFAULT nextval('public.clients_idclient_seq'::regclass);


--
-- Name: races idrace; Type: DEFAULT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.races ALTER COLUMN idrace SET DEFAULT nextval('public.races_idrace_seq'::regclass);


--
-- Data for Name: auditchiens; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.auditchiens (idchien, nomchien, idrace, sexechien, numtatouagechien, datenaissancechien, couleurpelagechien, idclient, prixvente, datevente, datemodification) FROM stdin;
1	Wouf	5	t	55260	2021-09-24	Blanc	1	980	2023-08-25	2024-11-21 07:56:29.545917
\.


--
-- Data for Name: chiens; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.chiens (idchien, nomchien, idrace, sexechien, numtatouagechien, datenaissancechien, couleurpelagechien, idclient, prixvente, datevente) FROM stdin;
2	Mentalo	6	f	\N	2017-09-15	Blanc	2	966	2023-10-25
3	Maggie	6	t	99279	2014-03-27	Brun	3	883	2022-06-27
4	Whisky	2	t	35941	2020-03-11	Doré	4	543	2023-02-05
5	Bibi	6	t	88123	2020-10-10	Beige	\N	894	\N
6	Buddy	4	t	\N	2019-02-05	Rouge	5	250	2020-01-01
7	Sophie	5	f	\N	2016-07-01	Doré	5	644	2022-03-30
8	Molly	2	f	38281	2018-06-16	Gris	\N	\N	\N
9	Padbol	7	f	\N	2014-02-27	Blanc et noir	\N	685	\N
10	Buddy	4	t	\N	2019-02-05	Rouge	6	847	2023-08-14
11	Bibi	8	f	61006	2018-06-30	Noir	7	692	2022-09-28
12	Bibi	8	f	705423	2010-04-15	Blanc	8	197	2021-02-22
13	Whisky	8	t	\N	2019-09-25	Beige	\N	\N	\N
14	Rocky	3	t	\N	2019-06-15	Noir	\N	\N	\N
15	Whisky	6	t	\N	2018-09-02	Gris	9	449	2022-07-28
16	Duke	2	t	\N	2019-06-13	Noir et blanc	10	300	2020-01-13
17	Buddy	5	t	\N	2015-02-13	Brun	11	410	2023-09-17
18	Lucy	9	f	56352	2019-10-01	Brun	3	363	2022-03-14
19	Whisky	10	t	\N	2017-08-03	Noir	12	484	2023-12-01
20	Dora	5	f	25536	2023-07-01	Blanc	5	1000	2022-03-30
21	Shrek	1	t	\N	2018-09-02	Vert	12	250	2022-07-28
1	Wouf	5	t	55260	2021-09-24	Blanc	1	999	2023-08-25
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.clients (idclient, nomclient, prenomclient, adresseclient, cpclient, villeclient, paysclient, telclient, emailclient) FROM stdin;
1	Moreau	Anne	9 Rue du Cleps	31000	Toulouse	France	0616273216	anne.moreau@orange.fr
2	Mitchell	Eddy	97 Rue de Paris	75020	Paris	France	0158444288	e.mitchell@hotmail.fr
3	Moreau	William	33 Rue de Crimée	75020	Paris	France	0163243007	william.moreau@free.fr
4	Moreau	Lucia	20 Rue de la soif	75010	Paris	France	0142613306	lucia.moreau@orange.fr
5	Johnson	Céline	52 Rue du sac à dos	69008	Lyon	France	0618490352	celine.johnson@gmail.com
6	Thomas	Nathalie	76 Boulevard des Rousses	69002	Lyon	France 	0748072289	jean.martin@gmail.com
7	Martin	Nathalie	102 Avenue Phoque	70010	Paris	France	0176091014	emilie.moreau@free.fr
8	Gonzalez	Anne	49 Avenue de la joie	06118	Nice	France	0703825524	anne.gonzalez@hotmail.com
9	Hernandez	José	26 rue Chivas	58010	Donzy	France	0713522885	j.hernandez@gmail.com
10	Hernandez	Samuel	15 rue des Violettes	75020	Paris	France	0167531477	youyou@hotmail.fr
11	Rorbert	Sophia	43 Rue Désirée	69025	Lyon	France	0608507445	sophia.robert@gmail.com
12	Hernandez	José	26 rue de la Modération	58010	Donzy	France	0614523296	j.hernandez2@gmail.com
13	Drier	Vincent	10 impasse des Pigeons	58000	Mesvre	France	\N	\N
\.


--
-- Data for Name: races; Type: TABLE DATA; Schema: public; Owner: daniel
--

COPY public.races (idrace, nomrace) FROM stdin;
1	Pitbull
2	Rottweiler
3	Chiwawa
4	Labrador
5	Dalmatien
6	Husky
7	Yorkshire
8	Poodle
9	Fox Terrier
10	Boxer
\.


--
-- Name: auditchiens_idchien_seq; Type: SEQUENCE SET; Schema: public; Owner: daniel
--

SELECT pg_catalog.setval('public.auditchiens_idchien_seq', 1, false);


--
-- Name: chiens_idchien_seq; Type: SEQUENCE SET; Schema: public; Owner: daniel
--

SELECT pg_catalog.setval('public.chiens_idchien_seq', 21, true);


--
-- Name: clients_idclient_seq; Type: SEQUENCE SET; Schema: public; Owner: daniel
--

SELECT pg_catalog.setval('public.clients_idclient_seq', 13, true);


--
-- Name: races_idrace_seq; Type: SEQUENCE SET; Schema: public; Owner: daniel
--

SELECT pg_catalog.setval('public.races_idrace_seq', 10, true);


--
-- Name: auditchiens auditchiens_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.auditchiens
    ADD CONSTRAINT auditchiens_pkey PRIMARY KEY (idchien);


--
-- Name: chiens chiens_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.chiens
    ADD CONSTRAINT chiens_pkey PRIMARY KEY (idchien);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (idclient);


--
-- Name: races races_pkey; Type: CONSTRAINT; Schema: public; Owner: daniel
--

ALTER TABLE ONLY public.races
    ADD CONSTRAINT races_pkey PRIMARY KEY (idrace);


--
-- Name: chiens before_update_chiens; Type: TRIGGER; Schema: public; Owner: daniel
--

CREATE TRIGGER before_update_chiens BEFORE UPDATE ON public.chiens FOR EACH ROW EXECUTE FUNCTION public.audit_chien_update();


--
-- Name: FUNCTION audit_chien_update(); Type: ACL; Schema: public; Owner: daniel
--

GRANT ALL ON FUNCTION public.audit_chien_update() TO data_engineer;


--
-- Name: TABLE auditchiens; Type: ACL; Schema: public; Owner: daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.auditchiens TO data_engineer;


--
-- Name: SEQUENCE auditchiens_idchien_seq; Type: ACL; Schema: public; Owner: daniel
--

GRANT ALL ON SEQUENCE public.auditchiens_idchien_seq TO data_engineer;


--
-- Name: TABLE chiens; Type: ACL; Schema: public; Owner: daniel
--

GRANT SELECT ON TABLE public.chiens TO data_analyst;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.chiens TO data_engineer;


--
-- Name: SEQUENCE chiens_idchien_seq; Type: ACL; Schema: public; Owner: daniel
--

GRANT ALL ON SEQUENCE public.chiens_idchien_seq TO data_engineer;


--
-- Name: TABLE clients; Type: ACL; Schema: public; Owner: daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.clients TO data_engineer;


--
-- Name: SEQUENCE clients_idclient_seq; Type: ACL; Schema: public; Owner: daniel
--

GRANT ALL ON SEQUENCE public.clients_idclient_seq TO data_engineer;


--
-- Name: TABLE races; Type: ACL; Schema: public; Owner: daniel
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.races TO data_engineer;


--
-- Name: SEQUENCE races_idrace_seq; Type: ACL; Schema: public; Owner: daniel
--

GRANT ALL ON SEQUENCE public.races_idrace_seq TO data_engineer;


--
-- PostgreSQL database dump complete
--

