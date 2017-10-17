--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2017-10-17 14:11:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 181 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2047 (class 0 OID 0)
-- Dependencies: 181
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 172 (class 1259 OID 19817)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 19886)
-- Name: order_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_ (
    id bigint NOT NULL,
    currency integer,
    note character varying(255),
    date bytea,
    price numeric(19,2),
    status integer
);


ALTER TABLE order_ OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 19884)
-- Name: order__id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE order__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order__id_seq OWNER TO postgres;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 173
-- Name: order__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE order__id_seq OWNED BY order_.id;


--
-- TOC entry 176 (class 1259 OID 19897)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE role (
    role_id integer NOT NULL,
    role character varying(255)
);


ALTER TABLE role OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 19895)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE role_role_id_seq OWNER TO postgres;

--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 175
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE role_role_id_seq OWNED BY role.role_id;


--
-- TOC entry 178 (class 1259 OID 19905)
-- Name: user_; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_ (
    user_id bigint NOT NULL,
    date bytea,
    enabled boolean,
    f_name character varying(255),
    gender integer,
    inn bigint,
    l_name character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE user_ OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 19903)
-- Name: user__user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user__user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user__user_id_seq OWNER TO postgres;

--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 177
-- Name: user__user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user__user_id_seq OWNED BY user_.user_id;


--
-- TOC entry 179 (class 1259 OID 19914)
-- Name: user_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_order (
    id bigint,
    user_id bigint NOT NULL
);


ALTER TABLE user_order OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 19919)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_role (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE user_role OWNER TO postgres;

--
-- TOC entry 1905 (class 2604 OID 19889)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_ ALTER COLUMN id SET DEFAULT nextval('order__id_seq'::regclass);


--
-- TOC entry 1906 (class 2604 OID 19900)
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY role ALTER COLUMN role_id SET DEFAULT nextval('role_role_id_seq'::regclass);


--
-- TOC entry 1907 (class 2604 OID 19908)
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_ ALTER COLUMN user_id SET DEFAULT nextval('user__user_id_seq'::regclass);


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 172
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1, false);


--
-- TOC entry 2033 (class 0 OID 19886)
-- Dependencies: 174
-- Data for Name: order_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_ (id, currency, note, date, price, status) FROM stdin;
5	0	fgh	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e10a100b323a1992054078	67.00	1
6	1	ghjghj	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e10a100b341e119557c078	56.00	1
7	2	dfhfgh	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e10a100b342d1b0f7d8078	67.87	1
10	1	rthgh	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e10a1014073533240a8078	455.00	1
18	0	сарар	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e10a110d2d0402ebae4078	34.00	1
9	2	fgjghj	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770e05000007e10a1014072b2a60ffc078	5656.00	1
\.


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 173
-- Name: order__id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('order__id_seq', 18, true);


--
-- TOC entry 2035 (class 0 OID 19897)
-- Dependencies: 176
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY role (role_id, role) FROM stdin;
1	ROLE_ADMIN
2	ROLE_USER
3	ROLE_ANONYMOUS
\.


--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 175
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('role_role_id_seq', 1, false);


--
-- TOC entry 2037 (class 0 OID 19905)
-- Dependencies: 178
-- Data for Name: user_; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_ (user_id, date, enabled, f_name, gender, inn, l_name, password, username) FROM stdin;
2	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007d0050a78	t	22	1	22	22	$2a$10$ssvq3Jn7cWmd9r6yX/UF.u6xQbPkCE/2J4wGdkrpu9Y.MS92DS1oO	22
3	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007da0a0a78	t	admin	0	1111	admin	$2a$10$YpI/5d8HQBPq/52eTt2ts.K0D0eLcs2Ss/UkfTrebPAYsAXIwLHuO	admin
1	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007cb050a78	t	11	0	11	11	$2a$10$gPnmPCgnsR5GDuZlKt4X.O/bgxnD39ZKK7lhY.kJkZyhJ8lsaNaC6	11
4	\\xaced00057372000d6a6176612e74696d652e536572955d84ba1b2248b20c00007870770703000007cb050a78	t	yj	0	444	yj	$2a$10$Qlv5YKrsNpqZtRRJe/0GnuC68/LHaW1OBlFibCfLUSaQjGcLSiMPC	yj
\.


--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 177
-- Name: user__user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user__user_id_seq', 7, true);


--
-- TOC entry 2038 (class 0 OID 19914)
-- Dependencies: 179
-- Data for Name: user_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_order (id, user_id) FROM stdin;
1	5
2	6
2	7
4	9
4	10
1	18
\.


--
-- TOC entry 2039 (class 0 OID 19919)
-- Dependencies: 180
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_role (user_id, role_id) FROM stdin;
1	2
2	2
3	1
4	2
\.


--
-- TOC entry 1909 (class 2606 OID 19894)
-- Name: order__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_
    ADD CONSTRAINT order__pkey PRIMARY KEY (id);


--
-- TOC entry 1911 (class 2606 OID 19902)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 1913 (class 2606 OID 19913)
-- Name: user__pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_
    ADD CONSTRAINT user__pkey PRIMARY KEY (user_id);


--
-- TOC entry 1915 (class 2606 OID 19918)
-- Name: user_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_order
    ADD CONSTRAINT user_order_pkey PRIMARY KEY (user_id);


--
-- TOC entry 1917 (class 2606 OID 19923)
-- Name: user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 1918 (class 2606 OID 19924)
-- Name: fk6hoihq3y3fj5vn5r58iau6wa8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_order
    ADD CONSTRAINT fk6hoihq3y3fj5vn5r58iau6wa8 FOREIGN KEY (id) REFERENCES user_(user_id);


--
-- TOC entry 1919 (class 2606 OID 19929)
-- Name: fk8j49bc3nhhv3dsah4n3ad9ite; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_order
    ADD CONSTRAINT fk8j49bc3nhhv3dsah4n3ad9ite FOREIGN KEY (user_id) REFERENCES order_(id);


--
-- TOC entry 1921 (class 2606 OID 19939)
-- Name: fk9j34cgjanbs56h6h7k8xk25wy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fk9j34cgjanbs56h6h7k8xk25wy FOREIGN KEY (user_id) REFERENCES user_(user_id);


--
-- TOC entry 1920 (class 2606 OID 19934)
-- Name: fka68196081fvovjhkek5m97n3y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES role(role_id);


--
-- TOC entry 2046 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-10-17 14:11:42

--
-- PostgreSQL database dump complete
--

