--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.18 (Ubuntu 10.18-0ubuntu0.18.04.1)

-- Started on 2021-10-08 06:12:26 EDT

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

DROP DATABASE pos_development;
--
-- TOC entry 3099 (class 1262 OID 57895)
-- Name: pos_development; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE pos_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE pos_development OWNER TO postgres;

\connect pos_development

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
-- TOC entry 1 (class 3079 OID 13039)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 57904)
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO deploy;

--
-- TOC entry 203 (class 1259 OID 57949)
-- Name: customers; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email_address character varying,
    phone_number character varying,
    address character varying,
    city character varying,
    state character varying,
    zip character varying,
    published boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    store_configuration_id integer
);


ALTER TABLE public.customers OWNER TO deploy;

--
-- TOC entry 202 (class 1259 OID 57947)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO deploy;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 202
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- TOC entry 213 (class 1259 OID 58005)
-- Name: item_categories; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.item_categories (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.item_categories OWNER TO deploy;

--
-- TOC entry 212 (class 1259 OID 58003)
-- Name: item_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.item_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_categories_id_seq OWNER TO deploy;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 212
-- Name: item_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.item_categories_id_seq OWNED BY public.item_categories.id;


--
-- TOC entry 223 (class 1259 OID 58119)
-- Name: item_stocks; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.item_stocks (
    id bigint NOT NULL,
    item_id bigint,
    quantity integer,
    remarks character varying,
    store_configuration_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.item_stocks OWNER TO deploy;

--
-- TOC entry 222 (class 1259 OID 58117)
-- Name: item_stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.item_stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_stocks_id_seq OWNER TO deploy;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 222
-- Name: item_stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.item_stocks_id_seq OWNED BY public.item_stocks.id;


--
-- TOC entry 205 (class 1259 OID 57961)
-- Name: items; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.items (
    id integer NOT NULL,
    sku character varying,
    name character varying,
    description text,
    price numeric(8,2),
    stock_amount integer,
    amount_sold integer DEFAULT 0,
    cost_price numeric(8,2),
    published boolean DEFAULT true,
    stock_in_handss integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    item_category_id integer,
    supplier character varying,
    manufacture_at date,
    expire_at date,
    min_items integer,
    item_unit integer,
    status integer,
    document character varying,
    lot integer,
    brand character varying,
    supplier_id integer,
    item_img character varying,
    discount integer,
    store_configuration_id integer,
    is_online boolean DEFAULT true
);


ALTER TABLE public.items OWNER TO deploy;

--
-- TOC entry 204 (class 1259 OID 57959)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO deploy;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 204
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 215 (class 1259 OID 58016)
-- Name: items_returns; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.items_returns (
    id bigint NOT NULL,
    quantity integer,
    return_at date,
    item_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.items_returns OWNER TO deploy;

--
-- TOC entry 214 (class 1259 OID 58014)
-- Name: items_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.items_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_returns_id_seq OWNER TO deploy;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 214
-- Name: items_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.items_returns_id_seq OWNED BY public.items_returns.id;


--
-- TOC entry 219 (class 1259 OID 58041)
-- Name: leads; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.leads (
    id bigint NOT NULL,
    name character varying,
    organization character varying,
    email character varying,
    phone character varying,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.leads OWNER TO deploy;

--
-- TOC entry 218 (class 1259 OID 58039)
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leads_id_seq OWNER TO deploy;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 218
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- TOC entry 207 (class 1259 OID 57974)
-- Name: line_items; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.line_items (
    id integer NOT NULL,
    item_id integer,
    quantity integer DEFAULT 1,
    price numeric(8,2),
    total_price numeric(8,2),
    sale_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    profit integer
);


ALTER TABLE public.line_items OWNER TO deploy;

--
-- TOC entry 206 (class 1259 OID 57972)
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.line_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.line_items_id_seq OWNER TO deploy;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 206
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.line_items_id_seq OWNED BY public.line_items.id;


--
-- TOC entry 221 (class 1259 OID 58090)
-- Name: logs; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.logs (
    id bigint NOT NULL,
    log_detail character varying,
    logable_type character varying,
    logable_id bigint,
    store_configuration_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.logs OWNER TO deploy;

--
-- TOC entry 220 (class 1259 OID 58088)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO deploy;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 220
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 209 (class 1259 OID 57983)
-- Name: payments; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    sale_id integer,
    amount numeric(8,2),
    payment_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remaining_amount integer,
    detail character varying
);


ALTER TABLE public.payments OWNER TO deploy;

--
-- TOC entry 208 (class 1259 OID 57981)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO deploy;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 208
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 201 (class 1259 OID 57938)
-- Name: sales; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.sales (
    id integer NOT NULL,
    amount numeric(8,2),
    total_amount numeric(8,2),
    remaining_amount numeric,
    discount numeric(8,2),
    tax numeric(8,2),
    customer_id integer,
    comments text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sale_type integer DEFAULT 0 NOT NULL,
    sale_status integer DEFAULT 0 NOT NULL,
    store_configuration_id integer
);


ALTER TABLE public.sales OWNER TO deploy;

--
-- TOC entry 200 (class 1259 OID 57936)
-- Name: sales_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.sales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_id_seq OWNER TO deploy;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 200
-- Name: sales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;


--
-- TOC entry 196 (class 1259 OID 57896)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO deploy;

--
-- TOC entry 211 (class 1259 OID 57994)
-- Name: store_configurations; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.store_configurations (
    id integer NOT NULL,
    store_name character varying,
    store_description text,
    email_address character varying,
    phone_number character varying,
    website_url character varying,
    address character varying,
    city character varying,
    state character varying,
    zip character varying,
    currency character varying,
    tax_rate numeric(8,2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.store_configurations OWNER TO deploy;

--
-- TOC entry 210 (class 1259 OID 57992)
-- Name: store_configurations_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.store_configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_configurations_id_seq OWNER TO deploy;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 210
-- Name: store_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.store_configurations_id_seq OWNED BY public.store_configurations.id;


--
-- TOC entry 217 (class 1259 OID 58030)
-- Name: suppliers; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.suppliers (
    id bigint NOT NULL,
    name character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.suppliers OWNER TO deploy;

--
-- TOC entry 216 (class 1259 OID 58028)
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_id_seq OWNER TO deploy;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 216
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- TOC entry 199 (class 1259 OID 57914)
-- Name: users; Type: TABLE; Schema: public; Owner: deploy
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying DEFAULT ''::character varying NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    can_update_users boolean DEFAULT false,
    can_update_items boolean DEFAULT true,
    can_update_configuration boolean DEFAULT false,
    can_view_reports boolean DEFAULT false,
    can_update_sale_discount boolean DEFAULT false,
    can_remove_sales boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    store_configuration_id integer
);


ALTER TABLE public.users OWNER TO deploy;

--
-- TOC entry 198 (class 1259 OID 57912)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: deploy
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO deploy;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: deploy
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2891 (class 2604 OID 57952)
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 58008)
-- Name: item_categories id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.item_categories ALTER COLUMN id SET DEFAULT nextval('public.item_categories_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 58122)
-- Name: item_stocks id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.item_stocks ALTER COLUMN id SET DEFAULT nextval('public.item_stocks_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 57964)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 58019)
-- Name: items_returns id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.items_returns ALTER COLUMN id SET DEFAULT nextval('public.items_returns_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 58044)
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 57977)
-- Name: line_items id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.line_items ALTER COLUMN id SET DEFAULT nextval('public.line_items_id_seq'::regclass);


--
-- TOC entry 2905 (class 2604 OID 58093)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 57986)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 57941)
-- Name: sales id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 57997)
-- Name: store_configurations id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.store_configurations ALTER COLUMN id SET DEFAULT nextval('public.store_configurations_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 58033)
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- TOC entry 2877 (class 2604 OID 57917)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3067 (class 0 OID 57904)
-- Dependencies: 197
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.ar_internal_metadata (key, value, created_at, updated_at) VALUES ('environment', 'production', '2021-06-22 11:55:29.228053', '2021-07-26 09:13:47.877201');


--
-- TOC entry 3073 (class 0 OID 57949)
-- Dependencies: 203
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (1, 'Muhammad ', 'Adeel', '', '03044008820', '', '', '', '', true, '2021-06-22 14:05:20.769953', '2021-06-22 14:05:20.769953', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (2, 'Muhammad', 'Anas', '', '03049377950', '', '', '', '', true, '2021-06-22 17:34:48.830118', '2021-07-02 05:38:12.5389', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (3, 'mian', 'shery', '', '03004805544', '', '', '', '', true, '2021-07-02 17:43:29.549213', '2021-07-02 17:43:29.549213', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (4, 'Mr zohaib', 'Dfc', '', '03014993933', '', '', '', '', true, '2021-07-06 16:56:06.776442', '2021-07-06 16:56:06.776442', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (13, 'BroadwaY', '....', '', '03010022206', '', '', '', '', true, '2021-07-10 17:18:32.301424', '2021-07-10 17:18:32.301424', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (14, 'Muhammad riaz', '', '', '03017977672', '', '', '', '', true, '2021-07-11 04:07:13.348159', '2021-07-12 13:35:24.127606', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (15, 'Mr Gulam rasool', '', '', '03215366073', '', '', '', '', true, '2021-07-12 15:13:14.520024', '2021-07-12 15:13:14.520024', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (17, 'Rashid frozen chicken', '', '', '', '', '', '', '', true, '2021-07-13 14:34:48.897628', '2021-07-13 14:34:48.897628', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (23, 'amirad', NULL, NULL, '03014965032', 'krk char chodi char chodiii chodi', NULL, NULL, NULL, true, '2021-07-14 05:02:41.428025', '2021-07-14 05:02:41.428025', NULL);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (29, 'Amir', NULL, NULL, '03001234567', 'Krk pkistan', NULL, NULL, NULL, true, '2021-07-14 09:43:37.075794', '2021-07-14 09:43:37.075794', NULL);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (30, 'Iqra shoukat', NULL, NULL, '03096568061', 'Shadab colony house no 1 street no 1 chung, lahore', NULL, NULL, NULL, true, '2021-07-14 09:48:57.067412', '2021-07-14 09:48:57.067412', NULL);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (31, 'Shabeer bhi', '', '', '', '', '', '', '', true, '2021-07-14 13:04:34.391226', '2021-07-14 13:04:34.391226', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (32, 'Naeem', NULL, NULL, '03070016143', 'Madina colony Phool Nagar', NULL, NULL, NULL, true, '2021-07-15 08:55:44.238452', '2021-07-15 08:55:44.238452', NULL);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (33, '🐔 chicken pizza 🍕Hut', 'Sarfaraz butt saab', '', '03004101705', 'Chunia near menu shop', '', '', '', true, '2021-07-28 16:45:14.329468', '2021-07-28 16:45:14.329468', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (34, 'Up town', '', '', '03006540288', 'Chunia near menu shop', 'Chunia', '', '', true, '2021-07-28 16:56:18.45306', '2021-07-28 16:56:18.45306', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (35, 'Royal mart', '', '', '03015682783', '', 'Chunia', '', '', true, '2021-07-28 16:57:43.45388', '2021-07-28 16:57:43.45388', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (36, 'Gulzar sha', '', '', '03090929381', '', 'kot Radha kishen', '', '', true, '2021-07-29 11:07:37.010641', '2021-07-29 11:07:37.010641', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (37, 'Huzayfa cash and carry', '', '', '03136481288', '', 'Chunia', '', '', true, '2021-07-31 08:22:39.287983', '2021-07-31 08:22:39.287983', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (39, 'Imran', '', '', '03238470000', '', 'Riwind', '', '', true, '2021-08-06 10:38:32.887532', '2021-08-06 11:50:38.441506', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (40, 'Mr Majad SFC ', ' KRK', '', '03217002949', '', 'krk', '', '', true, '2021-08-09 07:49:12.844239', '2021-08-09 07:50:07.434677', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (38, 'Shaban', '', '', '03424710546', '', '', '', '', true, '2021-08-02 12:51:03.416913', '2021-08-13 14:58:11.43465', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (41, 'Adnan bhi', 'Menu', '', '', '', '', '', '', true, '2021-08-15 13:46:07.936868', '2021-08-15 13:46:07.936868', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (42, 'Irfan', '', '', '03084559391', '', '', '', '', true, '2021-08-18 08:29:39.417847', '2021-08-18 08:29:39.417847', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (44, 'Electric Sr food', '', '', '03004232876', '', 'Chunia', '', '', true, '2021-08-22 17:33:58.432963', '2021-08-22 17:34:32.930322', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (45, 'Saad', '', '', '03007172777', '', 'Chunia', '', '', true, '2021-08-22 17:40:40.23284', '2021-08-22 17:40:40.23284', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (46, 'Al majeed', '', '', '03094967805', '', 'Chunia', '', '', true, '2021-08-22 17:43:31.848967', '2021-08-22 17:43:31.848967', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (47, 'D mart', '', '', '', '', 'kot Radha kishen', '', '', true, '2021-08-22 17:46:04.644983', '2021-08-22 17:46:04.644983', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (48, 'Pizza valley', '', '', '', '', 'Riwind', '', '', true, '2021-08-22 17:47:27.53375', '2021-08-22 17:47:27.53375', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (49, 'Pizza plus', '', '', '', '', 'Riwind', '', '', true, '2021-08-22 17:49:46.732816', '2021-08-22 17:49:46.732816', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (50, 'Ali Hassan', '', '', '03044786670', 'Patiyo wali gali', 'kot Radha kishen', '', '', true, '2021-08-23 08:15:12.399596', '2021-08-23 08:15:12.399596', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (51, 'Usman', '', '', '03147644316', '', 'kot Radha kishen', '', '', true, '2021-08-28 03:56:06.964254', '2021-08-28 03:56:06.964254', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (52, 'Zafar', '', '', '03008823252', '', 'kot Radha kishen', '', '', true, '2021-08-28 14:56:28.885258', '2021-08-28 14:56:28.885258', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (53, 'Amir majeed', '', '', '03039127705', '', 'Chunia', '', '', true, '2021-09-19 08:15:51.504294', '2021-09-19 08:15:51.504294', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (54, 'Kamran', '', '', '03216590071', '', 'Patoki', '', '', true, '2021-09-19 09:45:31.12709', '2021-09-19 09:45:31.12709', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (55, 'Waqas ijaz', '', '', '03002582888', '', 'Patoki', '', '', true, '2021-09-19 10:33:23.680559', '2021-09-19 10:33:23.680559', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (56, 'Umair sb', '', '', '03136477766', '', 'Patoki', '', '', true, '2021-09-19 10:35:24.075069', '2021-09-19 10:35:24.075069', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (57, 'Ansari piza souq', 'Waheed billa', '', '03041623234', '', 'raiwind', '', '', true, '2021-09-20 07:42:10.860439', '2021-09-20 07:42:10.860439', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (12, 'After', 'Nine', '', '03245656139', '', 'Riwind', '', '', true, '2021-07-10 15:50:39.440775', '2021-09-27 09:39:17.509497', 1);
INSERT INTO public.customers (id, first_name, last_name, email_address, phone_number, address, city, state, zip, published, created_at, updated_at, store_configuration_id) VALUES (58, 'Umar', '', '', '03006507534', 'Qameeyti gar', 'Riwind', '', '', true, '2021-10-01 04:52:29.250412', '2021-10-01 04:52:29.250412', 1);


--
-- TOC entry 3083 (class 0 OID 58005)
-- Dependencies: 213
-- Data for Name: item_categories; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (15, 'Nuggets', '', '2021-07-24 12:10:56.656411', '2021-07-24 12:10:56.656411');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (16, 'Burger Patty', '', '2021-07-24 12:11:08.728611', '2021-07-24 12:11:08.728611');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (17, 'seekh kabab', '', '2021-07-24 12:11:25.089997', '2021-07-24 12:11:25.089997');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (18, 'gola kabab', '', '2021-07-24 12:11:35.2508', '2021-07-24 12:11:35.2508');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (19, 'shami kabab', '', '2021-07-24 12:11:44.13254', '2021-07-24 12:11:44.13254');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (20, 'chapli kabab', '', '2021-07-24 12:11:57.653497', '2021-07-24 12:11:57.653497');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (21, 'pop corn', '', '2021-07-24 12:12:30.062204', '2021-07-24 12:12:30.062204');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (22, 'kofta', '', '2021-07-24 12:16:38.471007', '2021-07-24 12:16:38.471007');
INSERT INTO public.item_categories (id, name, description, created_at, updated_at) VALUES (23, 'Primary food', '', '2021-10-02 08:16:55.537326', '2021-10-02 08:16:55.537326');


--
-- TOC entry 3093 (class 0 OID 58119)
-- Dependencies: 223
-- Data for Name: item_stocks; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (1, 12, 10, '', 1, '2021-07-28 12:59:47.029338', '2021-07-28 12:59:47.029338');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (2, 3, 8, '', 1, '2021-07-28 13:02:11.919662', '2021-07-28 13:02:11.919662');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (3, 1, 10, '', 1, '2021-07-28 13:02:41.717607', '2021-07-28 13:02:41.717607');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (4, 7, 15, '', 1, '2021-07-28 13:03:05.716405', '2021-07-28 13:03:05.716405');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (5, 40, 5, NULL, 1, '2021-07-28 13:07:44.600168', '2021-07-28 13:07:44.600168');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (6, 8, -1, 'Mistakenly was added', 1, '2021-07-28 13:14:22.977887', '2021-07-28 13:14:22.977887');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (7, 26, 8, '', 1, '2021-08-01 14:46:17.93765', '2021-08-01 14:46:17.93765');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (8, 41, 250, NULL, 1, '2021-08-02 12:46:44.914679', '2021-08-02 12:46:44.914679');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (9, 26, 10, '', 1, '2021-08-04 12:56:19.57032', '2021-08-04 12:56:19.57032');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (10, 36, -1, 'one nugget was added mistakenly', 1, '2021-08-04 13:59:50.396749', '2021-08-04 13:59:50.396749');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (11, 8, 1, '', 1, '2021-08-04 14:09:29.085678', '2021-08-04 14:09:29.085678');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (12, 42, 28, NULL, 1, '2021-08-05 14:02:52.329088', '2021-08-05 14:02:52.329088');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (13, 43, 2, NULL, 1, '2021-08-05 15:44:49.135802', '2021-08-05 15:44:49.135802');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (14, 35, 15, '', 1, '2021-08-06 06:22:56.711288', '2021-08-06 06:22:56.711288');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (15, 1, 10, '', 1, '2021-08-11 11:52:08.839119', '2021-08-11 11:52:08.839119');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (16, 3, 10, '', 1, '2021-08-11 11:52:31.02868', '2021-08-11 11:52:31.02868');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (17, 7, 10, '', 1, '2021-08-11 11:52:46.328647', '2021-08-11 11:52:46.328647');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (18, 11, 10, '', 1, '2021-08-11 11:53:00.128837', '2021-08-11 11:53:00.128837');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (19, 12, 10, '', 1, '2021-08-11 11:53:14.52848', '2021-08-11 11:53:14.52848');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (20, 28, 20, '', 1, '2021-08-11 11:53:28.628465', '2021-08-11 11:53:28.628465');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (21, 26, 15, '', 1, '2021-08-12 14:17:53.535009', '2021-08-12 14:17:53.535009');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (22, 34, 7, '', 1, '2021-08-12 14:18:36.836378', '2021-08-12 14:18:36.836378');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (23, 44, 5, NULL, 1, '2021-08-12 14:22:42.036253', '2021-08-12 14:22:42.036253');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (24, 45, 200, NULL, 1, '2021-08-13 14:50:28.642197', '2021-08-13 14:50:28.642197');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (25, 46, 5, NULL, 1, '2021-08-17 15:01:40.135257', '2021-08-17 15:01:40.135257');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (26, 47, 5, NULL, 1, '2021-08-17 15:04:22.425883', '2021-08-17 15:04:22.425883');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (27, 48, 2, NULL, 1, '2021-08-17 15:05:17.845384', '2021-08-17 15:05:17.845384');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (28, 35, 5, '', 1, '2021-08-20 13:41:02.000635', '2021-08-20 13:41:02.000635');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (29, 46, 5, '', 1, '2021-08-20 13:41:58.284155', '2021-08-20 13:41:58.284155');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (30, 36, 5, '', 1, '2021-08-20 13:42:22.392156', '2021-08-20 13:42:22.392156');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (31, 26, 6, '', 1, '2021-08-20 13:42:41.083427', '2021-08-20 13:42:41.083427');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (32, 24, 5, '', 1, '2021-08-20 13:43:02.683648', '2021-08-20 13:43:02.683648');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (33, 37, 5, '', 1, '2021-08-20 13:43:25.683715', '2021-08-20 13:43:25.683715');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (34, 49, 5, NULL, 1, '2021-08-22 05:08:39.385115', '2021-08-22 05:08:39.385115');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (35, 50, 0, NULL, 1, '2021-08-22 05:11:18.271017', '2021-08-22 05:11:18.271017');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (36, 1, 15, '', 1, '2021-08-22 17:17:34.742989', '2021-08-22 17:17:34.742989');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (37, 2, 5, '', 1, '2021-08-22 17:18:23.28652', '2021-08-22 17:18:23.28652');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (38, 7, 2, '', 1, '2021-08-22 17:19:13.317442', '2021-08-22 17:19:13.317442');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (39, 28, 12, '', 1, '2021-08-22 17:20:05.628259', '2021-08-22 17:20:05.628259');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (40, 3, 6, '', 1, '2021-08-22 17:20:51.626832', '2021-08-22 17:20:51.626832');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (41, 50, 10, '', 1, '2021-08-22 17:21:21.503961', '2021-08-22 17:21:21.503961');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (42, 32, 5, '', 1, '2021-08-22 17:21:45.732934', '2021-08-22 17:21:45.732934');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (43, 5, 5, '', 1, '2021-08-22 17:23:07.759604', '2021-08-22 17:23:07.759604');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (44, 51, 6, NULL, 1, '2021-08-22 17:24:25.435204', '2021-08-22 17:24:25.435204');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (45, 52, 11, NULL, 1, '2021-08-22 17:26:00.626964', '2021-08-22 17:26:00.626964');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (46, 34, 12, '', 1, '2021-08-23 12:13:21.612504', '2021-08-23 12:13:21.612504');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (47, 53, 35, NULL, 1, '2021-08-23 15:12:58.902331', '2021-08-23 15:12:58.902331');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (48, 54, 5, NULL, 1, '2021-08-24 13:51:12.047664', '2021-08-24 13:51:12.047664');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (49, 54, 30, '', 1, '2021-08-24 13:52:37.957792', '2021-08-24 13:52:37.957792');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (50, 55, 20, NULL, 1, '2021-08-25 16:36:46.071285', '2021-08-25 16:36:46.071285');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (51, 42, 28, '', 1, '2021-08-26 14:50:21.32194', '2021-08-26 14:50:21.32194');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (52, 34, 5, '', 1, '2021-08-30 10:06:10.391163', '2021-08-30 10:06:10.391163');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (53, 35, 15, '', 1, '2021-08-30 10:07:23.49122', '2021-08-30 10:07:23.49122');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (54, 46, 1, '', 1, '2021-08-30 10:07:38.893815', '2021-08-30 10:07:38.893815');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (55, 36, 10, '', 1, '2021-08-30 10:08:08.697589', '2021-08-30 10:08:08.697589');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (56, 26, 7, '', 1, '2021-08-30 10:08:23.392002', '2021-08-30 10:08:23.392002');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (57, 37, 6, '', 1, '2021-08-30 10:08:40.891424', '2021-08-30 10:08:40.891424');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (58, 56, 2, NULL, 1, '2021-09-02 14:49:20.909041', '2021-09-02 14:49:20.909041');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (59, 57, 1, NULL, 1, '2021-09-02 14:50:38.589296', '2021-09-02 14:50:38.589296');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (60, 58, 2, NULL, 1, '2021-09-13 16:14:56.20771', '2021-09-13 16:14:56.20771');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (61, 1, 6, '', 1, '2021-09-13 16:18:46.594717', '2021-09-13 16:18:46.594717');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (62, 32, 3, '', 1, '2021-09-13 16:19:03.9947', '2021-09-13 16:19:03.9947');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (63, 59, 4, NULL, 1, '2021-09-13 16:34:14.097878', '2021-09-13 16:34:14.097878');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (64, 1, 20, '', 1, '2021-09-13 16:39:06.392991', '2021-09-13 16:39:06.392991');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (65, 7, 7, '', 1, '2021-09-13 16:39:22.393526', '2021-09-13 16:39:22.393526');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (66, 28, 7, '', 1, '2021-09-13 16:39:37.092971', '2021-09-13 16:39:37.092971');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (67, 3, 8, '', 1, '2021-09-13 16:39:50.893133', '2021-09-13 16:39:50.893133');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (68, 50, 11, '', 1, '2021-09-13 16:40:15.992564', '2021-09-13 16:40:15.992564');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (69, 5, 7, '', 1, '2021-09-13 16:41:49.691904', '2021-09-13 16:41:49.691904');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (70, 52, 2, '', 1, '2021-09-13 16:42:13.282733', '2021-09-13 16:42:13.282733');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (71, 4, 10, '', 1, '2021-09-13 16:42:58.491462', '2021-09-13 16:42:58.491462');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (72, 60, 10, NULL, 1, '2021-09-14 08:10:11.899774', '2021-09-14 08:10:11.899774');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (73, 61, 10, NULL, 1, '2021-09-14 08:12:07.599226', '2021-09-14 08:12:07.599226');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (74, 62, 10, NULL, 1, '2021-09-14 08:14:38.59982', '2021-09-14 08:14:38.59982');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (75, 63, 10, NULL, 1, '2021-09-14 08:15:36.300121', '2021-09-14 08:15:36.300121');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (76, 64, 5, NULL, 1, '2021-09-14 10:03:10.399731', '2021-09-14 10:03:10.399731');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (77, 29, 3, '', 1, '2021-09-15 04:14:48.692778', '2021-09-15 04:14:48.692778');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (78, 2, 2, '', 1, '2021-09-15 08:17:02.0733', '2021-09-15 08:17:02.0733');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (79, 46, 5, '', 1, '2021-09-15 08:32:12.586907', '2021-09-15 08:32:12.586907');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (80, 26, 12, '', 1, '2021-09-15 08:42:07.715116', '2021-09-15 08:42:07.715116');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (81, 36, 24, '', 1, '2021-09-15 08:48:08.826073', '2021-09-15 08:48:08.826073');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (82, 37, 12, '', 1, '2021-09-15 08:52:07.308531', '2021-09-15 08:52:07.308531');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (83, 7, 2, '', 1, '2021-09-15 08:53:00.429224', '2021-09-15 08:53:00.429224');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (84, 34, 11, '', 1, '2021-09-15 08:55:03.524877', '2021-09-15 08:55:03.524877');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (85, 9, 1, '', 1, '2021-09-15 08:56:26.124995', '2021-09-15 08:56:26.124995');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (86, 43, 2, '', 1, '2021-09-15 08:58:14.225077', '2021-09-15 08:58:14.225077');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (87, 34, 6, '', 1, '2021-09-15 14:23:14.582667', '2021-09-15 14:23:14.582667');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (88, 27, 6, '', 1, '2021-09-15 14:23:28.482625', '2021-09-15 14:23:28.482625');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (89, 42, 34, '', 1, '2021-09-15 14:24:50.981293', '2021-09-15 14:24:50.981293');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (90, 55, 6, '', 1, '2021-09-15 14:25:15.980876', '2021-09-15 14:25:15.980876');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (91, 65, 6, NULL, 1, '2021-09-15 14:26:47.180146', '2021-09-15 14:26:47.180146');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (92, 66, 5, NULL, 1, '2021-09-15 15:09:54.295872', '2021-09-15 15:09:54.295872');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (93, 67, 2, NULL, 1, '2021-09-18 14:58:17.832858', '2021-09-18 14:58:17.832858');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (94, 68, 1, NULL, 1, '2021-09-18 15:01:50.780539', '2021-09-18 15:01:50.780539');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (95, 36, 5, '', 1, '2021-09-18 15:03:03.643251', '2021-09-18 15:03:03.643251');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (96, 46, 6, '', 1, '2021-09-18 15:03:32.798057', '2021-09-18 15:03:32.798057');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (97, 34, 3, '', 1, '2021-09-18 15:04:01.95662', '2021-09-18 15:04:01.95662');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (98, 55, 8, '', 1, '2021-09-18 15:10:56.643041', '2021-09-18 15:10:56.643041');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (99, 65, 12, '', 1, '2021-09-18 15:11:15.22432', '2021-09-18 15:11:15.22432');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (100, 42, 8, '', 1, '2021-09-18 15:11:35.965436', '2021-09-18 15:11:35.965436');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (101, 69, 2, NULL, 1, '2021-09-18 15:32:22.301395', '2021-09-18 15:32:22.301395');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (102, 7, 10, '', 1, '2021-09-19 09:22:18.950616', '2021-09-19 09:22:18.950616');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (103, 4, 1, '', 1, '2021-09-20 07:20:52.233246', '2021-09-20 07:20:52.233246');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (104, 1, 7, '', 1, '2021-09-20 07:21:07.155386', '2021-09-20 07:21:07.155386');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (105, 28, 6, '', 1, '2021-09-20 07:21:25.533921', '2021-09-20 07:21:25.533921');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (106, 11, 4, '', 1, '2021-09-20 07:21:48.333783', '2021-09-20 07:21:48.333783');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (107, 7, 10, '', 1, '2021-09-20 07:22:11.146344', '2021-09-20 07:22:11.146344');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (108, 10, 1, '', 1, '2021-09-20 07:22:57.345862', '2021-09-20 07:22:57.345862');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (109, 2, 1, '', 1, '2021-09-20 07:23:14.534997', '2021-09-20 07:23:14.534997');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (110, 49, 10, '', 1, '2021-09-20 07:23:40.235347', '2021-09-20 07:23:40.235347');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (111, 50, 4, '', 1, '2021-09-20 07:24:10.236208', '2021-09-20 07:24:10.236208');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (112, 6, 2, '', 1, '2021-09-20 07:24:40.437193', '2021-09-20 07:24:40.437193');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (113, 53, 30, '', 1, '2021-09-20 13:29:32.320193', '2021-09-20 13:29:32.320193');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (114, 54, 30, '', 1, '2021-09-20 13:29:45.712007', '2021-09-20 13:29:45.712007');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (115, 69, 1, '', 1, '2021-09-20 14:06:14.90568', '2021-09-20 14:06:14.90568');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (116, 55, 27, '', 1, '2021-09-23 14:06:41.969291', '2021-09-23 14:06:41.969291');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (117, 42, 27, '', 1, '2021-09-23 14:07:28.269256', '2021-09-23 14:07:28.269256');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (118, 55, -12, 'Galti say add ho gy thy', 1, '2021-09-23 14:08:51.370346', '2021-09-23 14:08:51.370346');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (119, 70, 2, NULL, 1, '2021-09-23 14:12:44.871824', '2021-09-23 14:12:44.871824');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (120, 71, 3, NULL, 1, '2021-09-23 14:14:39.172652', '2021-09-23 14:14:39.172652');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (121, 72, 4, NULL, 1, '2021-09-23 14:16:06.144872', '2021-09-23 14:16:06.144872');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (122, 34, 3, '', 1, '2021-09-23 14:17:22.173748', '2021-09-23 14:17:22.173748');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (123, 73, 5, NULL, 1, '2021-09-23 15:17:01.177092', '2021-09-23 15:17:01.177092');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (124, 4, 5, '', 1, '2021-09-23 15:17:48.375319', '2021-09-23 15:17:48.375319');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (125, 40, -1, '', 1, '2021-09-23 15:20:07.405777', '2021-09-23 15:20:07.405777');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (126, 50, 1, '', 1, '2021-09-23 15:22:56.934554', '2021-09-23 15:22:56.934554');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (127, 7, -10, 'Sale error', 1, '2021-09-23 15:23:40.983571', '2021-09-23 15:23:40.983571');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (128, 74, 3, NULL, 1, '2021-09-25 13:21:09.571622', '2021-09-25 13:21:09.571622');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (129, 75, 2, NULL, 1, '2021-09-25 13:22:08.825254', '2021-09-25 13:22:08.825254');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (130, 68, 2, '', 1, '2021-09-25 13:47:25.696825', '2021-09-25 13:47:25.696825');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (131, 34, 3, '', 1, '2021-09-25 13:47:36.896749', '2021-09-25 13:47:36.896749');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (132, 35, 15, '', 1, '2021-09-25 13:47:53.896615', '2021-09-25 13:47:53.896615');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (133, 36, 9, '', 1, '2021-09-25 13:48:14.006016', '2021-09-25 13:48:14.006016');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (134, 69, 6, '', 1, '2021-09-25 13:48:33.015573', '2021-09-25 13:48:33.015573');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (135, 26, 2, '', 1, '2021-09-25 13:48:47.195891', '2021-09-25 13:48:47.195891');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (136, 46, 10, '', 1, '2021-09-25 13:48:57.896816', '2021-09-25 13:48:57.896816');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (137, 37, 10, '', 1, '2021-09-25 13:49:10.216586', '2021-09-25 13:49:10.216586');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (138, 7, 50, '', 1, '2021-09-28 13:17:54.003933', '2021-09-28 13:17:54.003933');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (139, 1, 8, '', 1, '2021-09-28 13:18:22.702746', '2021-09-28 13:18:22.702746');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (140, 50, 15, '', 1, '2021-09-28 13:18:41.90237', '2021-09-28 13:18:41.90237');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (141, 13, 5, '', 1, '2021-09-28 13:18:55.303226', '2021-09-28 13:18:55.303226');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (142, 7, -1, '1phata Howa tha wapis kr diya', 1, '2021-09-28 13:21:19.102302', '2021-09-28 13:21:19.102302');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (143, 70, 4, '', 1, '2021-09-29 14:07:19.874469', '2021-09-29 14:07:19.874469');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (144, 76, 4, NULL, 1, '2021-10-01 04:38:54.829822', '2021-10-01 04:38:54.829822');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (145, 77, 2, NULL, 1, '2021-10-01 04:40:51.730179', '2021-10-01 04:40:51.730179');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (146, 34, 40, '', 1, '2021-10-01 04:44:49.429039', '2021-10-01 04:44:49.429039');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (147, 35, 15, '', 1, '2021-10-01 04:47:09.22907', '2021-10-01 04:47:09.22907');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (148, 26, 10, '', 1, '2021-10-01 04:47:22.152191', '2021-10-01 04:47:22.152191');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (149, 69, 8, '', 1, '2021-10-01 04:47:41.773722', '2021-10-01 04:47:41.773722');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (150, 37, 10, '', 1, '2021-10-01 04:48:02.277875', '2021-10-01 04:48:02.277875');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (151, 68, 1, '', 1, '2021-10-01 04:48:18.199093', '2021-10-01 04:48:18.199093');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (152, 64, 2, '', 1, '2021-10-01 04:48:31.728848', '2021-10-01 04:48:31.728848');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (153, 53, 35, '', 1, '2021-10-01 04:53:17.129285', '2021-10-01 04:53:17.129285');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (154, 54, 35, '', 1, '2021-10-01 04:53:25.19076', '2021-10-01 04:53:25.19076');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (155, 42, 28, '', 1, '2021-10-02 14:37:50.722796', '2021-10-02 14:37:50.722796');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (156, 34, -4, 'Mistakenly was added', 1, '2021-10-03 07:54:43.640971', '2021-10-03 07:54:43.640971');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (157, 66, 8, '', 1, '2021-10-03 07:56:50.128509', '2021-10-03 07:56:50.128509');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (158, 21, -7, 'Item wast due to expire', 1, '2021-10-03 07:59:01.417107', '2021-10-03 07:59:01.417107');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (159, 22, -7, 'Item wast due to expire', 1, '2021-10-03 08:00:22.130709', '2021-10-03 08:00:22.130709');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (160, 20, -1, '1phata Howa tha wapis kr diya', 1, '2021-10-03 08:00:38.730739', '2021-10-03 08:00:38.730739');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (161, 76, 30, '', 1, '2021-10-05 05:14:06.229357', '2021-10-05 05:14:06.229357');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (162, 55, 10, '', 1, '2021-10-05 14:15:19.327951', '2021-10-05 14:15:19.327951');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (163, 59, 10, '', 1, '2021-10-06 04:57:28.329878', '2021-10-06 04:57:28.329878');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (164, 7, 5, '', 1, '2021-10-06 04:58:12.928921', '2021-10-06 04:58:12.928921');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (165, 34, 2, '', 1, '2021-10-06 13:29:10.429124', '2021-10-06 13:29:10.429124');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (166, 31, 10, '', 1, '2021-10-06 13:29:26.243464', '2021-10-06 13:29:26.243464');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (167, 43, 1, '', 1, '2021-10-06 13:29:38.329134', '2021-10-06 13:29:38.329134');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (168, 71, 2, '', 1, '2021-10-06 13:29:47.929559', '2021-10-06 13:29:47.929559');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (169, 60, 25, '', 1, '2021-10-07 13:35:35.032498', '2021-10-07 13:35:35.032498');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (170, 65, 10, '', 1, '2021-10-07 13:49:27.230065', '2021-10-07 13:49:27.230065');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (171, 15, 1, '', 1, '2021-10-07 13:53:53.529933', '2021-10-07 13:53:53.529933');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (172, 17, 1, '', 1, '2021-10-07 15:47:15.346552', '2021-10-07 15:47:15.346552');
INSERT INTO public.item_stocks (id, item_id, quantity, remarks, store_configuration_id, created_at, updated_at) VALUES (173, 78, 1, NULL, 1, '2021-10-07 15:48:46.420544', '2021-10-07 15:48:46.420544');


--
-- TOC entry 3075 (class 0 OID 57961)
-- Dependencies: 205
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (61, NULL, 'KNA economy gola kabab 500g', '18 pcs', 230.00, 8, 2, 180.00, true, NULL, '2021-09-14 08:12:07.399484', '2021-10-04 04:05:37.668731', 18, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Kna', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (69, NULL, 'Menu tempora 500g', '', 300.00, 12, 5, 230.00, true, NULL, '2021-09-18 15:32:22.202611', '2021-10-02 07:58:18.64469', NULL, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'IMG_20211002_125444.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (27, '', 'Plain paratha 30pcs', '30 Pcs', 630.00, 0, 7, 570.00, true, NULL, '2021-07-02 05:39:51.940184', '2021-10-02 08:08:20.944722', NULL, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'IMG-20210817-WA0008.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (30, '', 'wing delight', '', 210.00, 0, 5, 160.00, true, NULL, '2021-07-02 17:28:43.641557', '2021-08-04 12:53:18.357591', NULL, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, 'Wings-Delight-Large.jpg', 199, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (50, NULL, 'Economy seekh kabab 600g', '', 280.00, 6, 35, 220.00, true, NULL, '2021-08-22 05:11:18.177736', '2021-10-04 14:01:34.610692', 17, NULL, NULL, '2022-07-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Seekh-Kabab.jpg', 265, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (73, NULL, 'Menu chicken pakora 500g', '', 300.00, 5, 0, 260.00, true, NULL, '2021-09-23 15:17:00.497842', '2021-10-02 08:13:51.445183', NULL, NULL, NULL, '2022-11-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'images__5_.jpeg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (65, NULL, 'Sabroso kofta 900g', '', 500.00, 0, 28, 415.00, true, NULL, '2021-09-15 14:26:46.788749', '2021-10-07 13:49:26.64464', 22, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Sabroso', NULL, 'Kofta.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (62, NULL, 'Kna economy chapli kabab 500g', '8 pcs', 200.00, 9, 1, 160.00, true, NULL, '2021-09-14 08:14:38.301601', '2021-10-04 14:02:05.309574', 20, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Kna', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (18, '', 'Tail 2KG', '', 630.00, 0, 2, 600.00, true, NULL, '2021-06-22 13:18:12.965954', '2021-10-02 08:17:54.465247', 23, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (15, '', 'Menu Economy Neck 1KG', '', 130.00, 0, 2, 100.00, true, NULL, '2021-06-22 13:12:07.325645', '2021-10-07 13:53:53.144362', 23, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (19, '', 'Wing Tip 2KG', '', 100.00, 0, 2, 70.00, true, NULL, '2021-06-22 13:22:43.800934', '2021-10-02 08:18:22.538131', 23, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (58, NULL, 'Menu Branded Neck 1kg', '', 120.00, 0, 2, 91.00, true, NULL, '2021-09-13 16:14:53.60565', '2021-10-07 14:00:32.05124', 23, NULL, NULL, '2021-09-30', NULL, 1, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (67, NULL, 'Menu panjabi samosa', '', 100.00, 1, 1, 60.00, true, NULL, '2021-09-18 14:58:17.778911', '2021-09-30 05:20:55.442106', NULL, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (63, NULL, 'Kna economy kofta 500g', '12 PCs', 150.00, 10, 0, 110.00, true, NULL, '2021-09-14 08:15:36.104136', '2021-09-14 08:15:36.104136', 22, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Kna', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (16, '', 'Gizzard 1KG', '', 180.00, 0, 4, 146.00, true, NULL, '2021-06-22 13:13:17.666804', '2021-10-02 08:18:42.53821', 23, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, NULL, NULL, 1, false);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (55, NULL, 'Sabrosoo Nuggets 1kg', '', 530.00, 4, 55, 415.00, true, NULL, '2021-08-25 16:36:46.023579', '2021-10-07 14:28:26.932734', 15, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Sabrosoo', NULL, 'Nuggets.jpg', 524, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (49, NULL, 'Economy Kofta 500g', '15/16 pcs', 200.00, 0, 15, 150.00, true, NULL, '2021-08-22 05:08:39.17222', '2021-09-20 07:37:28.927183', 22, NULL, NULL, '2021-10-31', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Kofta.jpg', 194, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (76, NULL, 'Mbk trial Nuggets 1kg', '', 370.00, 2, 32, 250.00, true, NULL, '2021-10-01 04:38:54.729617', '2021-10-07 14:35:33.23657', 16, NULL, NULL, '2022-01-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, 'Nuggets.jpg', 350, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (60, NULL, 'Kna economy seekh kabab 500g', '12 pcs', 200.00, 24, 9, 160.00, true, NULL, '2021-09-14 08:10:11.608538', '2021-10-07 14:36:42.246051', 17, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Kna', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (53, NULL, 'HFC Kofta 500g ', '12 pcs', 150.00, 2, 98, 110.00, true, NULL, '2021-08-23 15:12:58.6912', '2021-10-05 13:20:40.849861', 22, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Hafiz Haroon chicken', NULL, 'Kofta.jpg', 144, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (45, NULL, '9 cuts 🐔2.22kg', '', 580.00, 0, 200, 566.00, true, NULL, '2021-08-13 14:50:28.445122', '2021-10-02 08:19:55.740853', 23, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, false);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (17, '', 'Heart 1KG', '', 280.00, 1, 2, 220.00, true, NULL, '2021-06-22 13:15:01.335989', '2021-10-07 15:50:47.044528', 23, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (41, NULL, 'S/o 2 joint Wing', '', 258.00, 0, 250, 246.00, true, NULL, '2021-08-02 12:46:44.823399', '2021-10-02 08:20:28.538264', 23, NULL, NULL, '2021-08-02', NULL, 1, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, false);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (32, '', 'Neck qeema 1kg', '', 205.00, 2, 11, 175.00, true, NULL, '2021-07-04 05:55:14.039401', '2021-10-02 15:06:29.968576', NULL, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, 'images.jpeg', 200, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (1, '', 'Premium nuggets 1KG', '44/45 Pcs', 500.00, 9, 113, 435.00, true, NULL, '2021-06-22 12:12:47.324491', '2021-10-07 17:13:02.640604', 15, NULL, NULL, '2023-06-23', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Nuggets.jpg', 489, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (21, '', 'chapli kabab 500gram', '', 200.00, 0, 3, 160.00, true, NULL, '2021-06-22 15:21:06.543381', '2021-10-03 07:59:01.016803', 20, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'KNA', NULL, 'Chapli-Kabab.jpg', 160, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (77, NULL, 'Mbk trial crispy burger patties 1kg', '', 370.00, 0, 2, 250.00, true, NULL, '2021-10-01 04:40:51.35205', '2021-10-05 14:49:14.846006', 15, NULL, NULL, '2022-01-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, 'IMG-20210625-WA0001.jpg', 350, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (24, '', 'tika bite 500 gram', '', 250.00, 0, 6, 200.00, true, NULL, '2021-06-22 17:22:03.376145', '2021-10-06 05:03:19.944681', NULL, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, 'IMG_20210829_211740.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (25, '', 'vegitable samosa 480 gram', '', 120.00, 0, 1, 80.00, true, NULL, '2021-06-22 17:23:31.319195', '2021-07-03 17:19:11.539017', NULL, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (68, NULL, 'Menu hand craft', '', 280.00, 0, 4, 250.00, true, NULL, '2021-09-18 15:01:50.66675', '2021-10-03 15:01:30.920882', NULL, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'images__3_.jpeg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (43, NULL, 'ch.Samosa 480gram', '', 150.00, 0, 5, 90.00, true, NULL, '2021-08-05 15:44:48.961539', '2021-10-06 13:36:08.706677', NULL, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, NULL, 145, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (14, '', 'Gola Kabab 500 Gram', '', 250.00, 0, 2, 210.00, true, NULL, '2021-06-22 13:06:38.391014', '2021-07-24 12:17:52.581476', 18, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'KNA', NULL, 'GolaKabab.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (72, NULL, 'Economy crispy fillet 565 gram', '5pcs', 300.00, 1, 3, 250.00, true, NULL, '2021-09-23 14:16:05.938925', '2021-10-02 08:00:13.040607', NULL, NULL, NULL, '2021-03-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'images.jpeg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (59, NULL, 'Mbk premium Tika bite 1kg', '', 600.00, 0, 14, 500.00, true, NULL, '2021-09-13 16:34:14.005121', '2021-10-06 05:02:23.147026', NULL, NULL, NULL, '2021-09-30', NULL, 1, NULL, NULL, NULL, 'Mbk', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (26, '', 'chicken pop corn 500 gram', '', 250.00, 6, 65, 210.00, true, NULL, '2021-06-22 17:24:21.81968', '2021-10-06 08:26:09.044574', 21, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, 'IMG-20210625-WA0000.jpg', 245, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (9, '', 'Kofta 480 Gram', '16 Pcs', 270.00, 3, 4, 225.00, true, NULL, '2021-06-22 12:42:51.203594', '2021-09-23 15:24:20.102894', 22, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Kofta.jpg', 259, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (28, '', 'Pop corn 400 g', '', 300.00, 4, 54, 260.00, true, NULL, '2021-07-02 12:01:37.538802', '2021-09-20 07:27:49.04956', 21, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, 'PopcornChicken.jpg', 289, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (38, NULL, 'Pop corn 500 g', '', 350.00, 0, 1, 310.00, true, NULL, '2021-07-24 17:48:05.785777', '2021-10-06 14:41:24.250274', 21, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, 'IMG-20210625-WA0000.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (7, '', 'Seekh Kabab 900 Grams', '30 Pcs', 500.00, 2, 113, 460.00, true, NULL, '2021-06-22 12:39:10.965439', '2021-10-07 13:48:20.743142', 17, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Seekh-Kabab.jpg', 489, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (54, NULL, 'HFC Seekh Kabab 600g', '', 210.00, 0, 100, 170.00, true, NULL, '2021-08-24 13:51:11.946284', '2021-10-03 07:48:34.397846', NULL, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Hafiz Haroon', NULL, 'Seekh-Kabab.jpg', 204, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (36, NULL, 'Economy Nuggets 500g', '21/22 Pcs', 250.00, 1, 63, 200.00, true, NULL, '2021-07-19 01:08:21.638165', '2021-10-07 16:01:16.329837', 15, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'Nuggets.jpg', 239, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (5, '', 'Nuggets Economy Pack 500 Grams', '21/22 Pcs', 240.00, 1, 24, 190.00, true, NULL, '2021-06-22 12:25:32.451508', '2021-10-06 15:35:19.57042', 15, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Nuggets.jpg', 230, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (66, NULL, 'Menu economy plain burger petty  500g', '8 pcs', 230.00, 10, 3, 135.00, true, NULL, '2021-09-15 15:09:53.90059', '2021-10-03 07:56:49.922279', 16, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'IMG-20210625-WA0001.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (8, '', 'Seekh Kabab 450 Grams', '15 Pcs', 300.00, 0, 14, 240.00, true, NULL, '2021-06-22 12:40:48.304929', '2021-08-19 01:25:20.9796', 17, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Seekh-Kabab.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (12, '', 'Gola Kabab 480 Grams', '12 Pcs', 325.00, 1, 29, 290.00, true, NULL, '2021-06-22 12:47:07.214049', '2021-09-20 09:52:11.832561', 18, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'GolaKabab.jpg', 310, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (39, NULL, 'Seekh kabab 400g', '12 Pcs', 250.00, 4, 3, 180.00, true, NULL, '2021-07-24 17:50:55.894106', '2021-08-18 08:23:44.212917', 17, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, 'Seekh-Kabab.jpg', 240, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (40, NULL, 'Chapli kabab 1080 grams', '12 Pcs', 490.00, 0, 4, 425.00, true, NULL, '2021-07-28 13:07:44.497764', '2021-10-01 04:50:13.739966', 20, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, 'Chapli-Kabab.jpg', 480, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (64, NULL, 'menu haryali boti 530g', '', 300.00, 3, 4, 212.00, true, NULL, '2021-09-14 10:03:10.200052', '2021-10-06 08:26:40.439851', NULL, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, 'images__2_.jpeg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (22, '', 'Seekh Kabab 500 Grams', '', 230.00, 0, 2, 200.00, true, NULL, '2021-06-22 15:22:10.836223', '2021-10-03 08:00:21.729943', 17, NULL, NULL, '2023-04-21', NULL, 3, NULL, NULL, NULL, 'KNA', NULL, 'Seekh-Kabab.jpg', 200, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (2, '', 'Premium nuggets 480 Grams', '20/21 pcs', 250.00, 3, 18, 220.00, true, NULL, '2021-06-22 12:14:40.061277', '2021-09-25 13:25:46.196519', 15, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Nuggets.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (44, NULL, 'Economy Chicken Tulip', '', 230.00, 2, 3, 130.00, true, NULL, '2021-08-12 14:22:41.741626', '2021-10-02 08:12:04.448719', NULL, NULL, NULL, '2021-08-28', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, 'images__4_.jpeg', 219, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (42, NULL, 'Nuggets 1kg', '', 520.00, 0, 153, 399.00, true, NULL, '2021-08-05 14:02:52.246992', '2021-10-06 08:17:44.750884', 15, NULL, NULL, '2021-08-31', NULL, 1, NULL, NULL, NULL, 'Menu', NULL, 'Nuggets.jpg', 500, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (11, '', 'Gola Kabab 1KG', '25 Pcs', 630.00, 5, 14, 575.00, true, NULL, '2021-06-22 12:45:08.822113', '2021-09-20 07:29:19.636651', 18, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'GolaKabab.jpg', 610, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (52, NULL, 'Ch.veg spring roll 12pcs', '12 pcs', 220.00, 3, 10, 190.00, true, NULL, '2021-08-22 17:26:00.535632', '2021-10-06 14:40:56.586491', NULL, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (20, '', 'kofta 500 gram', '
', 180.00, 0, 8, 140.00, true, NULL, '2021-06-22 15:19:42.975381', '2021-10-06 14:37:47.339301', 22, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'KNA', NULL, 'Kofta.jpg', 140, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (37, NULL, 'Economy Gola kabab', '', 320.00, 16, 48, 260.00, true, NULL, '2021-07-19 01:09:56.641133', '2021-10-08 09:52:44.930631', 18, NULL, NULL, '2021-10-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'GolaKabab.jpg', 309, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (75, NULL, 'Menu economy wings 1kg', '1kg', 250.00, 1, 1, 210.00, true, NULL, '2021-09-25 13:22:08.509804', '2021-10-07 14:36:21.246182', 23, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, false);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (10, '', 'Kofta 1KG', '33/34 Pcs', 490.00, 0, 3, 450.00, true, NULL, '2021-06-22 12:43:56.971501', '2021-09-20 07:34:53.458183', 22, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Kofta.jpg', 479, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (34, NULL, '🍔 Economy Burger patty 1kg', '', 450.00, 22, 71, 270.00, true, NULL, '2021-07-18 18:40:19.722952', '2021-10-06 13:29:10.230054', 16, NULL, NULL, '2021-10-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'IMG-20210625-WA0001.jpg', 419, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (71, NULL, 'Ch spring roll ', '8 pcs', 100.00, 1, 4, 65.00, true, NULL, '2021-09-23 14:14:38.792551', '2021-10-06 15:23:50.145935', NULL, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (4, '', 'Nuggets Economy Pack 1KG', '44/45 Pcs', 450.00, 6, 32, 360.00, true, NULL, '2021-06-22 12:22:36.904818', '2021-10-03 15:00:35.212172', 15, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Nuggets.jpg', 439, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (56, NULL, 'AFC Kofta 500g', '12 pcs', 150.00, 1, 1, 105.00, true, NULL, '2021-09-02 14:49:20.697462', '2021-09-14 15:18:44.138088', 22, NULL, NULL, '2022-08-01', NULL, 3, NULL, NULL, NULL, 'AFC', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (48, NULL, 'chicken paratha 4 pcs', '4pcs', 250.00, 0, 2, 200.00, true, NULL, '2021-08-17 15:05:17.74588', '2021-08-18 08:24:33.109139', NULL, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, 'IMG-20210817-WA0009.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (33, NULL, 'Leaver 1kg', '', 170.00, 0, 2, 150.00, true, NULL, '2021-07-16 07:04:01.134958', '2021-10-02 08:19:43.543372', 23, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, NULL, 165, 1, false);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (47, NULL, 'Plain paratha 5pcs', '5pcs', 130.00, 0, 5, 95.00, true, NULL, '2021-08-17 15:04:22.237048', '2021-08-18 08:24:46.399123', NULL, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'menu', NULL, 'IMG-20210817-WA0008.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (74, NULL, 'Menu mix meat🍖 1kg', '1kg', 290.00, 0, 3, 225.00, true, NULL, '2021-09-25 13:21:09.382401', '2021-10-07 14:36:52.990408', 23, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, false);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (13, '', 'Shami Kabab 480 Grams', '12 Pcs', 230.00, 3, 17, 190.00, true, NULL, '2021-06-22 12:48:47.524367', '2021-09-28 13:18:55.11514', 19, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Shami-Kabab.jpg', 209, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (78, NULL, 'Menu neck qeema', '', 250.00, 1, 0, 210.00, true, NULL, '2021-10-07 15:48:46.144243', '2021-10-07 15:48:46.144243', 23, NULL, NULL, '2021-10-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (3, '', 'Premium Crispy Burger patty 1KG', '16 Pcs', 500.00, 5, 49, 435.00, true, NULL, '2021-06-22 12:18:48.565521', '2021-09-28 11:18:00.117987', 16, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Burger-Patty.jpg', 489, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (6, '', 'Burger Patty Ecocomy 500 Grams', '08 Pcs', 240.00, 0, 12, 195.00, true, NULL, '2021-06-22 12:28:22.336922', '2021-09-20 07:44:27.350725', 16, NULL, NULL, '2023-05-21', NULL, 3, NULL, NULL, NULL, 'MBK', NULL, 'Burger-Patty.jpg', 235, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (57, NULL, 'AFC Seekh kabab 600g', '', 250.00, 0, 1, 160.00, true, NULL, '2021-09-02 14:50:38.516821', '2021-09-14 15:19:01.622282', 17, NULL, NULL, '2021-08-01', NULL, 3, NULL, NULL, NULL, 'AFC', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (70, NULL, 'Economy chuggets', '', 250.00, 3, 3, 190.00, true, NULL, '2021-09-23 14:12:44.780387', '2021-10-02 08:03:58.240754', NULL, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'images__1_.jpeg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (46, NULL, 'Economy chapli kabab 500gram', '6 pcs', 200.00, 9, 23, 175.00, true, NULL, '2021-08-17 15:01:39.840964', '2021-10-07 14:32:14.445682', 20, NULL, NULL, '2023-07-16', NULL, 3, NULL, NULL, NULL, 'MENU', NULL, 'Chapli-Kabab.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (31, '', 'Kofta 500g', '', 250.00, 6, 6, 180.00, true, NULL, '2021-07-03 08:41:04.939209', '2021-10-07 08:59:55.552652', 22, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'Kofta.jpg', NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (51, NULL, 'Seekh kabab roll 12pcs', '12 pcs', 250.00, 0, 6, 220.00, true, NULL, '2021-08-22 17:24:25.13402', '2021-10-06 14:41:15.840789', NULL, NULL, NULL, '2021-08-31', NULL, 3, NULL, NULL, NULL, 'Mbk', NULL, NULL, NULL, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (29, '', 'Shami kabab menu 1kg', '', 480.00, 2, 2, 390.00, true, NULL, '2021-07-02 12:04:35.839838', '2021-09-25 13:36:47.27662', 19, NULL, NULL, '2021-07-31', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'Shami-Kabab.jpg', 469, 1, true);
INSERT INTO public.items (id, sku, name, description, price, stock_amount, amount_sold, cost_price, published, stock_in_handss, created_at, updated_at, item_category_id, supplier, manufacture_at, expire_at, min_items, item_unit, status, document, lot, brand, supplier_id, item_img, discount, store_configuration_id, is_online) VALUES (35, NULL, 'Economy Seekh kabab 500g', '', 330.00, 10, 74, 270.00, true, NULL, '2021-07-18 18:42:57.103441', '2021-10-06 13:38:27.140519', 17, NULL, NULL, '2021-09-30', NULL, 3, NULL, NULL, NULL, 'Menu', NULL, 'Seekh-Kabab.jpg', 319, 1, true);


--
-- TOC entry 3085 (class 0 OID 58016)
-- Dependencies: 215
-- Data for Name: items_returns; Type: TABLE DATA; Schema: public; Owner: deploy
--



--
-- TOC entry 3089 (class 0 OID 58041)
-- Dependencies: 219
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.leads (id, name, organization, email, phone, slug, created_at, updated_at) VALUES (1, 'amir', 'my org', 'amirad2020@gmail.com', '03014965032', 'efiyoijrkulcpykvkkulrrdwunkracvkdukqtytbsffrdhxmly', '2021-07-08 13:42:00.351333', '2021-07-08 13:42:00.351333');


--
-- TOC entry 3077 (class 0 OID 57974)
-- Dependencies: 207
-- Data for Name: line_items; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (117, 8, 1, 300.00, 300.00, 69, '2021-07-19 16:11:08.239583', '2021-07-19 16:11:08.239583', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (58, 5, 1, 220.00, 220.00, 29, '2021-07-08 07:41:06.675635', '2021-07-08 07:41:23.575611', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (59, 12, 5, 300.00, 1500.00, 30, '2021-07-08 07:44:47.355311', '2021-07-08 14:55:01.023739', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (61, 32, 1, 280.00, 280.00, 32, '2021-07-08 15:38:35.39738', '2021-07-08 15:38:35.39738', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (63, 16, 1, 180.00, 180.00, 34, '2021-07-09 13:07:48.304004', '2021-07-09 13:07:48.304004', 34);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (118, 7, 4, 500.00, 2000.00, 70, '2021-07-24 17:23:36.836992', '2021-07-24 17:51:24.794194', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (65, 20, 1, 140.00, 140.00, 36, '2021-07-09 14:48:04.6036', '2021-07-09 14:48:15.307794', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (66, 3, 1, 500.00, 500.00, 37, '2021-07-10 15:44:13.446972', '2021-07-10 15:44:13.446972', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (49, 30, 1, 200.00, 200.00, 21, '2021-07-06 13:01:14.306594', '2021-07-06 13:03:31.209745', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (67, 4, 1, 450.00, 450.00, 37, '2021-07-10 15:44:38.140759', '2021-07-10 15:44:38.140759', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (68, 7, 1, 500.00, 500.00, 37, '2021-07-10 15:44:45.847403', '2021-07-10 15:44:45.847403', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (70, 3, 1, 500.00, 500.00, 38, '2021-07-10 17:19:10.402686', '2021-07-10 17:19:10.402686', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (137, 1, 6, 480.00, 2880.00, 77, '2021-07-28 17:02:28.431666', '2021-07-28 17:03:14.092193', 270);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (69, 1, 1, 480.00, 480.00, 38, '2021-07-10 17:19:00.612439', '2021-07-10 17:19:30.504997', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (52, 7, 1, 500.00, 500.00, 23, '2021-07-06 16:53:55.343257', '2021-07-06 16:53:55.343257', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (74, 2, 1, 250.00, 250.00, 39, '2021-07-10 17:34:39.687761', '2021-07-10 17:34:39.687761', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (51, 1, 5, 470.00, 2350.00, 23, '2021-07-06 16:52:47.643317', '2021-07-07 00:02:22.61235', 175);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (53, 4, 1, 420.00, 420.00, 23, '2021-07-07 00:01:26.203192', '2021-07-07 00:02:35.305541', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (73, 3, 1, 480.00, 480.00, 39, '2021-07-10 17:34:34.390125', '2021-07-10 17:35:00.688473', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (71, 1, 1, 480.00, 480.00, 39, '2021-07-10 17:34:22.2885', '2021-07-10 17:36:26.800537', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (72, 7, 1, 490.00, 490.00, 39, '2021-07-10 17:34:27.487453', '2021-07-10 18:29:45.449523', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (75, 2, 1, 250.00, 250.00, 40, '2021-07-11 03:33:34.805769', '2021-07-11 03:33:34.805769', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (141, 1, 6, 480.00, 2880.00, 80, '2021-07-31 08:16:57.917398', '2021-07-31 08:19:11.154352', 270);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (107, 13, 3, 200.00, 600.00, 64, '2021-07-18 16:53:06.007053', '2021-07-18 17:14:41.284547', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (76, 1, 2, 480.00, 960.00, 41, '2021-07-11 03:35:34.903617', '2021-07-11 03:35:51.200213', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (77, 7, 1, 500.00, 500.00, 41, '2021-07-11 03:35:58.202656', '2021-07-11 03:35:58.202656', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (120, 8, 6, 250.00, 1500.00, 70, '2021-07-24 17:51:54.090151', '2021-07-24 17:52:21.889577', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (78, 1, 1, 480.00, 480.00, 42, '2021-07-11 03:46:11.591631', '2021-07-11 03:46:23.3977', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (79, 2, 1, 250.00, 250.00, 42, '2021-07-11 03:46:34.992038', '2021-07-11 03:46:34.992038', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (80, 12, 1, 320.00, 320.00, 43, '2021-07-12 15:11:59.804145', '2021-07-12 15:11:59.804145', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (109, 37, 1, 270.00, 270.00, 65, '2021-07-19 01:11:54.569537', '2021-07-19 01:12:08.618141', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (81, 3, 2, 500.00, 1000.00, 44, '2021-07-13 12:41:47.634155', '2021-07-13 12:42:07.438709', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (82, 1, 1, 470.00, 470.00, 45, '2021-07-13 14:33:25.500588', '2021-07-13 14:33:33.610879', 35);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (88, 6, 1, 229.00, 229.00, 51, '2021-07-14 05:02:41.826829', '2021-07-14 05:02:41.826829', 34);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (94, 6, 1, 229.00, 229.00, 57, '2021-07-14 09:43:37.257958', '2021-07-14 09:43:37.257958', 34);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (95, 6, 1, 229.00, 229.00, 58, '2021-07-14 09:48:57.06955', '2021-07-14 09:48:57.06955', 34);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (96, 1, 1, 500.00, 500.00, 59, '2021-07-14 12:48:46.416696', '2021-07-14 12:48:46.416696', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (97, 4, 1, 450.00, 450.00, 59, '2021-07-14 13:01:29.498108', '2021-07-14 13:01:29.498108', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (98, 5, 1, 240.00, 240.00, 59, '2021-07-14 13:01:48.701896', '2021-07-14 13:01:48.701896', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (99, 7, 1, 500.00, 500.00, 59, '2021-07-14 13:02:17.497865', '2021-07-14 13:02:17.497865', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (100, 11, 1, 630.00, 630.00, 59, '2021-07-14 13:02:32.435885', '2021-07-14 13:02:32.435885', 55);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (101, 3, 1, 500.00, 500.00, 59, '2021-07-14 13:02:50.597924', '2021-07-14 13:02:50.597924', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (102, 28, 1, 300.00, 300.00, 59, '2021-07-14 13:02:58.410612', '2021-07-14 13:02:58.410612', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (145, 12, 5, 325.00, 1625.00, 80, '2021-07-31 08:17:43.971837', '2021-07-31 08:18:11.175193', 175);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (121, 1, 3, 500.00, 1500.00, 70, '2021-07-24 17:52:38.487087', '2021-07-24 17:52:43.994483', 195);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (110, 36, 1, 220.00, 220.00, 22, '2021-07-19 01:13:37.852425', '2021-07-19 01:14:06.84937', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (122, 3, 9, 500.00, 4500.00, 70, '2021-07-24 17:53:26.573583', '2021-07-24 17:54:06.295052', 585);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (138, 28, 2, 280.00, 560.00, 77, '2021-07-28 17:03:34.835192', '2021-07-28 17:03:50.548316', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (128, 12, 5, 300.00, 1500.00, 73, '2021-07-28 16:37:53.135605', '2021-07-28 16:39:37.146162', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (114, 36, 2, 230.00, 460.00, 67, '2021-07-19 15:36:05.458124', '2021-07-19 15:36:20.755996', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (123, 6, 6, 230.00, 1380.00, 70, '2021-07-24 17:54:36.787443', '2021-07-24 17:55:03.691318', 210);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (130, 13, 5, 200.00, 1000.00, 73, '2021-07-28 16:39:15.530958', '2021-07-28 16:39:49.87952', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (113, 5, 2, 240.00, 480.00, 67, '2021-07-19 15:35:34.450538', '2021-07-19 15:37:01.684331', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (106, 12, 2, 300.00, 600.00, 64, '2021-07-18 16:52:53.908232', '2021-07-26 15:23:03.840457', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (131, 3, 2, 500.00, 1000.00, 74, '2021-07-28 16:58:23.61333', '2021-07-28 16:58:30.746894', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (108, 4, 3, 390.00, 1170.00, 64, '2021-07-18 16:53:35.215296', '2021-07-26 15:23:40.335261', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (116, 35, 10, 300.00, 3000.00, 68, '2021-07-19 16:08:59.138355', '2021-07-19 16:09:12.750181', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (132, 1, 1, 500.00, 500.00, 75, '2021-07-28 16:59:41.341722', '2021-07-28 16:59:41.341722', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (115, 37, 5, 300.00, 1500.00, 68, '2021-07-19 16:08:30.018231', '2021-07-19 16:09:16.353787', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (133, 1, 1, 500.00, 500.00, 76, '2021-07-28 17:00:43.938388', '2021-07-28 17:00:43.938388', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (139, 36, 1, 220.00, 220.00, 78, '2021-07-28 17:06:50.635203', '2021-07-28 17:07:01.940945', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (134, 7, 1, 500.00, 500.00, 76, '2021-07-28 17:00:57.45796', '2021-07-28 17:00:57.45796', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (144, 11, 2, 610.00, 1220.00, 80, '2021-07-31 08:17:36.445527', '2021-07-31 08:18:26.984767', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (153, 35, 20, 290.00, 5800.00, 89, '2021-08-05 14:47:19.831491', '2021-08-05 14:48:08.651053', 400);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (146, 4, 10, 390.00, 3900.00, 83, '2021-08-01 14:44:27.851613', '2021-08-01 14:44:56.351296', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (143, 28, 6, 290.00, 1740.00, 80, '2021-07-31 08:17:24.888969', '2021-07-31 08:18:54.661301', 180);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (136, 7, 6, 500.00, 3000.00, 77, '2021-07-28 17:02:17.438906', '2021-07-28 17:02:47.026194', 150);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (140, 20, 4, 150.00, 600.00, 79, '2021-07-29 11:05:25.805646', '2021-07-29 11:06:06.306453', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (135, 3, 4, 500.00, 2000.00, 77, '2021-07-28 17:02:01.264453', '2021-07-28 17:02:53.710658', 260);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (142, 7, 7, 500.00, 3500.00, 80, '2021-07-31 08:17:11.553423', '2021-07-31 08:18:57.459363', 175);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (148, 26, 8, 250.00, 2000.00, 83, '2021-08-01 14:46:41.356004', '2021-08-01 14:47:03.151144', 320);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (151, 36, 4, 230.00, 920.00, 88, '2021-08-05 14:08:28.840052', '2021-08-05 14:09:01.843014', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (159, 1, 2, 500.00, 1000.00, 91, '2021-08-06 10:33:43.934257', '2021-08-06 10:33:51.018147', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (149, 41, 250, 258.00, 64500.00, 84, '2021-08-02 12:48:38.723368', '2021-08-02 12:48:56.826839', 3000);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (154, 42, 28, 485.00, 13580.00, 89, '2021-08-05 14:48:31.548266', '2021-08-05 14:48:52.345288', 2408);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (150, 30, 1, 250.00, 250.00, 86, '2021-08-04 12:53:18.275705', '2021-08-04 12:54:52.37287', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (156, 26, 4, 250.00, 1000.00, 91, '2021-08-06 10:32:25.940014', '2021-08-06 10:32:35.828542', 160);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (152, 33, 2, 120.00, 240.00, 88, '2021-08-05 14:09:09.838818', '2021-08-05 14:09:24.739792', -60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (157, 7, 1, 500.00, 500.00, 91, '2021-08-06 10:32:47.844005', '2021-08-06 10:32:47.844005', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (155, 2, 1, 230.00, 230.00, 90, '2021-08-05 14:52:35.542721', '2021-08-05 14:52:46.939238', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (158, 35, 2, 300.00, 600.00, 91, '2021-08-06 10:33:01.03271', '2021-08-06 10:33:24.938155', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (161, 43, 1, 150.00, 150.00, 93, '2021-08-07 15:29:07.03735', '2021-08-07 15:29:07.03735', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (160, 8, 5, 250.00, 1250.00, 92, '2021-08-06 14:21:46.107982', '2021-08-06 14:22:10.210374', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (164, 26, 1, 250.00, 250.00, 95, '2021-08-09 14:50:46.740286', '2021-08-09 14:50:46.740286', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (163, 36, 1, 220.00, 220.00, 94, '2021-08-09 07:38:46.935143', '2021-08-09 07:39:12.832966', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (162, 5, 1, 220.00, 220.00, 94, '2021-08-09 07:38:40.391575', '2021-08-09 07:39:18.141218', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (165, 37, 1, 320.00, 320.00, 95, '2021-08-09 14:50:58.237546', '2021-08-09 14:50:58.237546', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (166, 26, 5, 250.00, 1250.00, 96, '2021-08-09 15:35:50.14453', '2021-08-09 15:35:56.845351', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (167, 2, 2, 250.00, 500.00, 98, '2021-08-10 10:50:55.542168', '2021-08-10 10:51:05.040357', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (169, 2, 1, 250.00, 250.00, 99, '2021-08-10 15:57:02.437396', '2021-08-10 15:57:02.437396', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (168, 6, 1, 250.00, 250.00, 99, '2021-08-10 15:56:40.142337', '2021-08-10 15:56:47.536332', 55);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (170, 3, 1, 500.00, 500.00, 100, '2021-08-11 09:38:08.73924', '2021-08-11 09:38:08.73924', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (233, 1, 1, 500.00, 500.00, 131, '2021-08-22 17:41:42.035153', '2021-08-22 17:41:42.035153', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (184, 45, 200, 580.00, 116000.00, 107, '2021-08-13 14:55:48.941458', '2021-08-13 14:56:02.944272', 2800);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (198, 5, 1, 220.00, 220.00, 116, '2021-08-18 08:22:42.517101', '2021-08-18 08:27:37.797616', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (205, 36, 1, 250.00, 250.00, 117, '2021-08-18 09:09:56.516098', '2021-08-18 09:09:56.516098', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (206, 2, 1, 250.00, 250.00, 118, '2021-08-18 09:45:47.318894', '2021-08-18 09:45:47.318894', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (172, 28, 12, 290.00, 3480.00, 100, '2021-08-11 09:38:46.733355', '2021-08-11 09:41:52.536852', 360);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (185, 37, 10, 300.00, 3000.00, 108, '2021-08-13 17:49:30.549914', '2021-08-13 17:50:13.327664', 400);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (173, 11, 6, 610.00, 3660.00, 100, '2021-08-11 09:40:59.437927', '2021-08-11 09:42:49.244831', 210);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (186, 34, 6, 380.00, 2280.00, 108, '2021-08-13 17:49:47.747001', '2021-08-13 17:50:13.725544', 660);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (171, 1, 6, 480.00, 2880.00, 100, '2021-08-11 09:38:32.039536', '2021-08-11 09:43:13.245053', 270);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (234, 3, 1, 500.00, 500.00, 131, '2021-08-22 17:41:50.339411', '2021-08-22 17:41:50.339411', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (207, 1, 1, 435.00, 435.00, 119, '2021-08-19 01:23:31.142539', '2021-08-19 02:24:29.328145', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (187, 13, 5, 210.00, 1050.00, 110, '2021-08-13 17:52:46.452931', '2021-08-13 17:53:02.637802', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (225, 51, 2, 270.00, 540.00, 129, '2021-08-22 17:35:31.83518', '2021-08-22 17:35:49.040759', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (208, 2, 1, 220.00, 220.00, 119, '2021-08-19 01:24:02.537338', '2021-08-19 02:24:39.33693', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (176, 12, 6, 305.00, 1830.00, 101, '2021-08-11 10:03:46.739226', '2021-08-11 10:04:00.530349', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (177, 9, 1, 250.00, 250.00, 101, '2021-08-11 10:09:23.738825', '2021-08-11 10:09:30.241185', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (188, 44, 3, 180.00, 540.00, 110, '2021-08-13 17:53:09.216735', '2021-08-13 17:53:35.225757', 150);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (210, 8, 1, 240.00, 240.00, 119, '2021-08-19 01:25:20.96319', '2021-08-19 02:24:54.447711', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (179, 7, 3, 500.00, 1500.00, 102, '2021-08-11 10:22:37.841014', '2021-08-11 10:22:46.431511', 75);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (235, 1, 1, 500.00, 500.00, 132, '2021-08-22 17:43:47.735837', '2021-08-22 17:43:47.735837', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (178, 1, 2, 480.00, 960.00, 102, '2021-08-11 10:22:10.734379', '2021-08-11 10:22:49.339638', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (209, 26, 1, 210.00, 210.00, 119, '2021-08-19 01:24:57.538349', '2021-08-19 02:26:37.398459', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (181, 7, 1, 475.00, 475.00, 103, '2021-08-12 14:23:36.984552', '2021-08-12 14:23:54.01393', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (189, 32, 4, 180.00, 720.00, 110, '2021-08-13 17:53:52.536702', '2021-08-13 17:54:11.316896', -280);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (180, 1, 1, 435.00, 435.00, 103, '2021-08-12 14:23:25.261737', '2021-08-12 14:24:00.448275', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (190, 21, 1, 200.00, 200.00, 111, '2021-08-13 17:57:36.142166', '2021-08-13 17:57:36.142166', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (182, 35, 1, 270.00, 270.00, 103, '2021-08-12 14:24:32.146367', '2021-08-12 14:24:46.447721', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (211, 1, 1, 500.00, 500.00, 120, '2021-08-21 09:05:53.203578', '2021-08-21 09:05:53.203578', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (193, 43, 1, 120.00, 120.00, 113, '2021-08-14 14:04:01.510741', '2021-08-14 14:04:42.946128', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (226, 3, 1, 490.00, 490.00, 129, '2021-08-22 17:36:10.235097', '2021-08-22 17:36:22.137047', 55);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (213, 1, 2, 500.00, 1000.00, 123, '2021-08-22 13:27:09.838655', '2021-08-22 13:27:15.144729', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (191, 6, 3, 210.00, 630.00, 113, '2021-08-14 14:03:24.535527', '2021-08-14 14:07:11.042633', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (192, 3, 2, 475.00, 950.00, 113, '2021-08-14 14:03:49.632625', '2021-08-14 14:07:14.669823', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (214, 28, 2, 300.00, 600.00, 123, '2021-08-22 13:27:24.583174', '2021-08-22 13:27:28.642217', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (215, 7, 1, 500.00, 500.00, 123, '2021-08-22 13:27:33.436057', '2021-08-22 13:27:33.436057', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (216, 11, 1, 630.00, 630.00, 123, '2021-08-22 13:27:40.438591', '2021-08-22 13:27:40.438591', 55);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (217, 10, 1, 490.00, 490.00, 123, '2021-08-22 13:27:55.769661', '2021-08-22 13:27:55.769661', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (196, 39, 1, 250.00, 250.00, 115, '2021-08-16 06:48:26.441818', '2021-08-16 06:48:26.441818', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (197, 2, 1, 250.00, 250.00, 115, '2021-08-16 06:48:59.749484', '2021-08-16 06:48:59.749484', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (194, 35, 2, 285.00, 570.00, 114, '2021-08-15 13:44:02.348074', '2021-08-17 14:09:00.735867', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (195, 26, 10, 230.00, 2300.00, 114, '2021-08-15 13:44:24.489454', '2021-08-17 14:09:09.278104', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (227, 50, 1, 250.00, 250.00, 129, '2021-08-22 17:36:33.034951', '2021-08-22 17:36:44.739157', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (199, 46, 5, 200.00, 1000.00, 116, '2021-08-18 08:23:01.711039', '2021-08-18 08:23:08.009291', 125);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (243, 4, 2, 440.00, 880.00, 136, '2021-08-22 17:50:13.438337', '2021-08-22 17:50:24.542219', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (218, 34, 1, 380.00, 380.00, 125, '2021-08-22 17:26:40.336686', '2021-08-22 17:27:38.240943', 110);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (201, 28, 2, 300.00, 600.00, 116, '2021-08-18 08:23:54.603228', '2021-08-18 08:24:01.396387', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (228, 49, 1, 170.00, 170.00, 129, '2021-08-22 17:37:01.039474', '2021-08-22 17:37:10.137943', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (203, 48, 2, 250.00, 500.00, 116, '2021-08-18 08:24:28.005373', '2021-08-18 08:24:33.110344', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (236, 1, 2, 500.00, 1000.00, 133, '2021-08-22 17:45:07.26624', '2021-08-22 17:45:14.350653', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (204, 47, 5, 130.00, 650.00, 116, '2021-08-18 08:24:41.711576', '2021-08-18 08:24:46.400013', 175);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (219, 2, 4, 250.00, 1000.00, 126, '2021-08-22 17:28:16.433699', '2021-08-22 17:28:26.142373', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (202, 26, 2, 230.00, 460.00, 116, '2021-08-18 08:24:11.005214', '2021-08-18 08:26:51.205162', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (200, 39, 2, 230.00, 460.00, 116, '2021-08-18 08:23:37.803119', '2021-08-18 08:27:08.803465', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (229, 28, 4, 290.00, 1160.00, 129, '2021-08-22 17:37:23.04976', '2021-08-22 17:37:31.728545', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (220, 1, 3, 480.00, 1440.00, 127, '2021-08-22 17:29:42.335458', '2021-08-22 17:30:01.841291', 135);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (221, 7, 1, 500.00, 500.00, 127, '2021-08-22 17:30:16.92517', '2021-08-22 17:30:16.92517', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (237, 28, 1, 290.00, 290.00, 134, '2021-08-22 17:46:22.838318', '2021-08-22 17:46:31.228526', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (222, 3, 2, 500.00, 1000.00, 127, '2021-08-22 17:30:29.835672', '2021-08-22 17:30:37.832529', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (238, 3, 1, 500.00, 500.00, 135, '2021-08-22 17:47:47.338232', '2021-08-22 17:47:47.338232', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (239, 1, 1, 500.00, 500.00, 135, '2021-08-22 17:47:54.945414', '2021-08-22 17:47:54.945414', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (223, 28, 2, 290.00, 580.00, 127, '2021-08-22 17:31:06.14949', '2021-08-22 17:31:19.109577', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (224, 1, 1, 500.00, 500.00, 128, '2021-08-22 17:34:52.038187', '2021-08-22 17:34:52.038187', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (244, 40, 1, 470.00, 470.00, 136, '2021-08-22 17:50:33.531067', '2021-08-22 17:50:47.339531', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (240, 28, 2, 290.00, 580.00, 135, '2021-08-22 17:48:07.239023', '2021-08-22 17:48:16.741223', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (231, 52, 6, 230.00, 1380.00, 129, '2021-08-22 17:38:21.347686', '2021-08-22 17:38:35.130721', 240);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (230, 1, 6, 480.00, 2880.00, 129, '2021-08-22 17:37:54.034758', '2021-08-22 17:39:22.746742', 270);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (251, 54, 30, 180.00, 5400.00, 140, '2021-08-24 13:54:02.481699', '2021-08-24 13:54:49.065173', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (245, 50, 1, 250.00, 250.00, 136, '2021-08-22 17:50:58.104347', '2021-08-22 17:51:02.738026', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (232, 50, 4, 250.00, 1000.00, 131, '2021-08-22 17:41:20.538007', '2021-08-22 17:41:29.83887', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (246, 51, 1, 250.00, 250.00, 137, '2021-08-23 06:26:12.105579', '2021-08-23 06:26:12.105579', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (242, 52, 2, 250.00, 500.00, 135, '2021-08-22 17:48:50.532166', '2021-08-22 17:49:01.642162', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (247, 4, 1, 425.00, 425.00, 138, '2021-08-23 08:15:35.703653', '2021-08-23 08:15:49.509385', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (249, 34, 12, 380.00, 4560.00, 139, '2021-08-23 12:14:53.445497', '2021-08-23 12:15:27.42944', 1320);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (250, 53, 30, 120.00, 3600.00, 140, '2021-08-24 13:53:44.566373', '2021-08-24 13:54:55.559417', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (254, 55, 5, 485.00, 2425.00, 143, '2021-08-25 16:38:35.302086', '2021-08-25 16:38:51.544726', 350);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (252, 36, 1, 250.00, 250.00, 141, '2021-08-25 16:37:17.655072', '2021-08-25 16:37:17.655072', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (253, 36, 1, 250.00, 250.00, 142, '2021-08-25 16:38:04.32478', '2021-08-25 16:38:04.32478', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (256, 32, 1, 190.00, 190.00, 145, '2021-08-27 12:20:57.367047', '2021-08-27 12:21:07.858935', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (255, 42, 15, 485.00, 7275.00, 144, '2021-08-26 14:51:37.632815', '2021-08-26 14:51:50.938278', 1290);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (258, 55, 4, 480.00, 1920.00, 146, '2021-08-28 03:47:51.245683', '2021-08-28 03:48:03.549299', 260);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (257, 34, 3, 435.00, 1305.00, 146, '2021-08-28 03:47:23.149705', '2021-08-28 03:47:37.035705', 495);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (259, 26, 4, 250.00, 1000.00, 146, '2021-08-28 03:49:30.342971', '2021-08-28 03:50:41.662443', 160);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (260, 36, 1, 220.00, 220.00, 147, '2021-08-28 05:54:33.698583', '2021-08-28 05:54:39.401095', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (261, 35, 1, 280.00, 280.00, 148, '2021-08-28 07:35:52.003136', '2021-08-28 07:36:10.791694', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (262, 35, 4, 300.00, 1200.00, 149, '2021-08-28 14:06:46.362511', '2021-08-28 14:08:15.663738', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (263, 32, 1, 190.00, 190.00, 149, '2021-08-28 14:07:02.565188', '2021-08-28 14:07:57.161516', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (264, 1, 2, 445.00, 890.00, 149, '2021-08-28 14:07:17.16135', '2021-08-28 14:08:07.763377', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (268, 36, 1, 250.00, 250.00, 151, '2021-08-29 09:26:30.21015', '2021-08-29 09:26:30.21015', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (266, 46, 1, 190.00, 190.00, 150, '2021-08-28 14:53:12.283199', '2021-08-28 14:53:44.29449', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (267, 34, 1, 380.00, 380.00, 150, '2021-08-28 14:55:31.894393', '2021-08-28 14:55:51.089383', 110);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (269, 36, 1, 220.00, 220.00, 152, '2021-08-29 09:27:23.610006', '2021-08-29 09:28:20.904349', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (270, 53, 3, 150.00, 450.00, 153, '2021-08-29 11:34:16.60974', '2021-08-29 11:34:49.617747', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (298, 4, 2, 400.00, 800.00, 184, '2021-09-13 16:51:39.597727', '2021-09-13 16:51:55.497724', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (271, 54, 1, 220.00, 220.00, 154, '2021-08-29 13:50:20.816187', '2021-08-29 13:51:26.71308', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (339, 50, 1, 270.00, 270.00, 200, '2021-09-14 09:07:18.817835', '2021-09-14 09:07:25.613435', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (297, 59, 2, 600.00, 1200.00, 184, '2021-09-13 16:51:03.795739', '2021-09-13 16:52:10.782346', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (272, 37, 2, 300.00, 600.00, 155, '2021-08-29 14:27:51.298284', '2021-08-29 14:28:05.209292', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (316, 50, 1, 250.00, 250.00, 193, '2021-09-13 17:01:27.70121', '2021-09-13 17:01:32.207732', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (273, 50, 1, 250.00, 250.00, 159, '2021-08-29 15:02:27.204727', '2021-08-29 15:02:44.706222', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (274, 42, 1, 500.00, 500.00, 162, '2021-08-29 15:55:27.063727', '2021-08-29 15:55:48.500219', 101);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (333, 28, 2, 260.00, 520.00, 197, '2021-09-13 17:11:01.406595', '2021-09-13 17:11:10.412196', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (275, 36, 1, 220.00, 220.00, 164, '2021-08-30 10:09:04.893791', '2021-08-30 10:09:16.909347', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (276, 49, 1, 200.00, 200.00, 165, '2021-08-31 07:31:15.890392', '2021-08-31 07:31:15.890392', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (299, 4, 4, 400.00, 1600.00, 185, '2021-09-13 16:52:47.79752', '2021-09-13 16:52:55.799861', 160);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (277, 42, 1, 500.00, 500.00, 166, '2021-08-31 09:21:55.001808', '2021-08-31 09:22:08.100331', 101);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (278, 35, 1, 300.00, 300.00, 168, '2021-08-31 09:28:51.748733', '2021-08-31 09:28:58.539115', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (317, 50, 1, 250.00, 250.00, 194, '2021-09-13 17:01:51.195946', '2021-09-13 17:01:57.867606', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (279, 36, 1, 230.00, 230.00, 168, '2021-08-31 09:29:28.83144', '2021-08-31 09:29:33.432372', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (300, 1, 3, 480.00, 1440.00, 186, '2021-09-13 16:53:33.897883', '2021-09-13 16:53:45.511529', 135);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (318, 5, 1, 200.00, 200.00, 194, '2021-09-13 17:02:13.457492', '2021-09-13 17:02:18.485647', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (301, 3, 2, 500.00, 1000.00, 186, '2021-09-13 16:53:54.511123', '2021-09-13 16:54:01.563204', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (280, 36, 1, 230.00, 230.00, 170, '2021-08-31 12:45:03.658233', '2021-08-31 12:45:39.462855', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (281, 32, 1, 190.00, 190.00, 170, '2021-08-31 12:45:29.959208', '2021-08-31 12:45:50.552081', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (302, 7, 2, 500.00, 1000.00, 186, '2021-09-13 16:54:11.038034', '2021-09-13 16:54:14.999523', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (282, 13, 1, 210.00, 210.00, 171, '2021-08-31 14:58:55.946014', '2021-08-31 14:59:15.142032', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (283, 36, 1, 250.00, 250.00, 172, '2021-08-31 15:20:40.249739', '2021-08-31 15:20:40.249739', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (284, 49, 1, 170.00, 170.00, 174, '2021-09-02 07:46:02.114627', '2021-09-02 07:46:20.396586', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (285, 36, 1, 250.00, 250.00, 176, '2021-09-02 12:56:48.494683', '2021-09-02 12:56:48.494683', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (327, 50, 2, 220.00, 440.00, 196, '2021-09-13 17:06:28.810852', '2021-09-13 17:06:36.59292', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (286, 24, 1, 200.00, 200.00, 178, '2021-09-02 13:38:09.502192', '2021-09-02 13:38:16.505067', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (319, 4, 1, 420.00, 420.00, 195, '2021-09-13 17:03:02.633305', '2021-09-13 17:03:12.918191', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (287, 53, 2, 150.00, 300.00, 179, '2021-09-02 14:43:47.709163', '2021-09-02 14:43:53.097566', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (288, 20, 1, 130.00, 130.00, 179, '2021-09-02 14:44:17.897221', '2021-09-02 14:44:23.706639', -10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (290, 26, 1, 250.00, 250.00, 182, '2021-09-03 06:56:31.866147', '2021-09-03 06:56:31.866147', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (303, 28, 2, 290.00, 580.00, 186, '2021-09-13 16:54:43.09812', '2021-09-13 16:54:53.011057', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (291, 59, 2, 600.00, 1200.00, 183, '2021-09-13 16:43:48.401032', '2021-09-13 16:43:58.293052', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (292, 32, 1, 190.00, 190.00, 183, '2021-09-13 16:44:06.298143', '2021-09-13 16:44:17.901175', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (293, 50, 1, 250.00, 250.00, 183, '2021-09-13 16:44:31.696506', '2021-09-13 16:44:41.047438', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (305, 50, 1, 250.00, 250.00, 187, '2021-09-13 16:56:25.100425', '2021-09-13 16:56:32.203257', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (294, 4, 1, 400.00, 400.00, 183, '2021-09-13 16:45:03.579002', '2021-09-13 16:45:19.402527', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (295, 5, 1, 200.00, 200.00, 183, '2021-09-13 16:45:37.335766', '2021-09-13 16:45:47.835567', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (306, 28, 1, 290.00, 290.00, 187, '2021-09-13 16:56:39.593497', '2021-09-13 16:56:48.813085', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (296, 52, 2, 230.00, 460.00, 183, '2021-09-13 16:45:58.850513', '2021-09-13 16:46:15.703873', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (345, 34, 2, 435.00, 870.00, 201, '2021-09-14 09:15:09.908111', '2021-09-14 09:15:36.319933', 330);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (334, 29, 1, 420.00, 420.00, 198, '2021-09-14 07:56:23.808305', '2021-09-14 07:56:35.315771', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (321, 50, 2, 250.00, 500.00, 195, '2021-09-13 17:03:53.404598', '2021-09-13 17:04:13.804057', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (307, 4, 1, 420.00, 420.00, 188, '2021-09-13 16:57:17.009656', '2021-09-13 16:57:24.204565', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (308, 4, 1, 400.00, 400.00, 189, '2021-09-13 16:58:27.10234', '2021-09-13 16:58:35.009656', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (309, 1, 1, 500.00, 500.00, 190, '2021-09-13 16:58:58.724209', '2021-09-13 16:58:58.724209', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (310, 3, 1, 500.00, 500.00, 190, '2021-09-13 16:59:08.039811', '2021-09-13 16:59:08.039811', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (311, 50, 1, 250.00, 250.00, 190, '2021-09-13 16:59:19.90392', '2021-09-13 16:59:25.003249', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (322, 3, 1, 480.00, 480.00, 195, '2021-09-13 17:04:26.054907', '2021-09-13 17:04:33.505343', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (312, 32, 1, 200.00, 200.00, 191, '2021-09-13 16:59:47.200781', '2021-09-13 16:59:55.703133', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (313, 50, 1, 250.00, 250.00, 191, '2021-09-13 17:00:03.302346', '2021-09-13 17:00:07.202264', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (314, 50, 1, 250.00, 250.00, 192, '2021-09-13 17:00:29.901675', '2021-09-13 17:00:38.069977', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (328, 5, 4, 185.00, 740.00, 196, '2021-09-13 17:07:00.340356', '2021-09-13 17:07:12.22963', -20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (315, 5, 1, 200.00, 200.00, 193, '2021-09-13 17:01:06.003932', '2021-09-13 17:01:17.89797', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (340, 46, 1, 230.00, 230.00, 200, '2021-09-14 09:07:39.509479', '2021-09-14 09:07:50.208642', 55);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (329, 10, 1, 500.00, 500.00, 196, '2021-09-13 17:07:32.148588', '2021-09-13 17:07:44.829571', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (324, 12, 2, 290.00, 580.00, 196, '2021-09-13 17:05:32.100315', '2021-09-13 17:05:48.594137', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (335, 37, 1, 300.00, 300.00, 199, '2021-09-14 08:42:54.508945', '2021-09-14 08:43:04.93028', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (325, 28, 2, 260.00, 520.00, 196, '2021-09-13 17:05:59.50214', '2021-09-13 17:06:07.908491', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (330, 49, 2, 160.00, 320.00, 196, '2021-09-13 17:08:12.135363', '2021-09-13 17:09:14.540069', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (326, 3, 2, 435.00, 870.00, 196, '2021-09-13 17:06:12.89922', '2021-09-13 17:06:23.513552', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (336, 35, 1, 300.00, 300.00, 199, '2021-09-14 08:43:19.308057', '2021-09-14 08:43:25.211667', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (331, 1, 10, 435.00, 4350.00, 197, '2021-09-13 17:10:10.405757', '2021-09-13 17:10:23.415914', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (341, 54, 1, 250.00, 250.00, 200, '2021-09-14 09:08:05.811017', '2021-09-14 09:08:15.208568', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (332, 7, 5, 460.00, 2300.00, 197, '2021-09-13 17:10:39.505836', '2021-09-14 14:30:32.361659', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (349, 37, 10, 300.00, 3000.00, 202, '2021-09-14 09:18:48.307995', '2021-09-14 09:18:58.903293', 400);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (338, 36, 1, 230.00, 230.00, 199, '2021-09-14 08:44:15.1092', '2021-09-14 08:44:22.511866', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (342, 1, 1, 480.00, 480.00, 200, '2021-09-14 09:08:26.506836', '2021-09-14 09:08:35.919708', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (289, 46, 4, 190.00, 760.00, 182, '2021-09-03 06:56:25.617203', '2021-09-14 08:49:02.117037', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (346, 26, 2, 250.00, 500.00, 201, '2021-09-14 09:15:49.007945', '2021-09-14 09:15:53.912659', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (343, 36, 1, 250.00, 250.00, 201, '2021-09-14 09:14:02.516031', '2021-09-14 09:14:02.516031', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (344, 55, 1, 480.00, 480.00, 201, '2021-09-14 09:14:21.899538', '2021-09-14 09:14:28.408565', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (348, 34, 5, 380.00, 1900.00, 202, '2021-09-14 09:18:02.618035', '2021-09-14 09:18:37.110467', 550);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (347, 42, 10, 485.00, 4850.00, 202, '2021-09-14 09:17:32.010264', '2021-09-14 09:17:43.016797', 860);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (350, 37, 1, 300.00, 300.00, 203, '2021-09-14 09:23:38.222003', '2021-09-14 09:23:45.408828', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (352, 54, 1, 200.00, 200.00, 205, '2021-09-14 09:26:05.209941', '2021-09-14 09:26:11.313373', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (353, 36, 1, 230.00, 230.00, 205, '2021-09-14 09:26:27.116079', '2021-09-14 09:26:35.707805', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (356, 42, 1, 485.00, 485.00, 207, '2021-09-14 09:36:17.821068', '2021-09-14 09:36:17.821068', 86);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (354, 36, 4, 230.00, 920.00, 206, '2021-09-14 09:32:42.616127', '2021-09-14 09:32:55.115924', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (355, 36, 4, 230.00, 920.00, 207, '2021-09-14 09:35:38.601535', '2021-09-14 09:35:55.473484', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (358, 26, 1, 260.00, 260.00, 209, '2021-09-14 09:56:01.816667', '2021-09-14 09:56:09.309962', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (359, 6, 1, 210.00, 210.00, 209, '2021-09-14 09:56:28.508633', '2021-09-14 09:56:36.804395', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (360, 5, 2, 200.00, 400.00, 209, '2021-09-14 09:57:02.308646', '2021-09-14 09:57:13.411131', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (362, 60, 2, 250.00, 500.00, 209, '2021-09-14 09:58:07.409081', '2021-09-14 09:58:20.811279', 180);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (363, 54, 1, 200.00, 200.00, 209, '2021-09-14 09:58:32.47449', '2021-09-14 09:58:42.309869', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (337, 20, 1, 150.00, 150.00, 199, '2021-09-14 08:43:39.208692', '2021-09-14 14:16:31.899688', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (351, 28, 2, 300.00, 600.00, 204, '2021-09-14 09:25:00.099101', '2021-09-14 10:30:23.710539', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (364, 37, 1, 300.00, 300.00, 209, '2021-09-14 09:58:53.608912', '2021-09-14 09:59:02.221563', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (438, 34, 6, 380.00, 2280.00, 251, '2021-09-22 17:07:01.751493', '2021-09-22 17:07:14.833368', 660);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (385, 9, 1, 250.00, 250.00, 217, '2021-09-14 15:08:18.340316', '2021-09-14 15:08:35.33398', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (366, 64, 1, 300.00, 300.00, 210, '2021-09-14 10:03:36.008785', '2021-09-14 10:03:36.008785', 88);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (386, 36, 1, 250.00, 250.00, 219, '2021-09-14 15:09:05.733764', '2021-09-14 15:09:05.733764', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (365, 35, 2, 300.00, 600.00, 209, '2021-09-14 09:59:17.808663', '2021-09-14 10:04:54.716708', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (414, 11, 4, 610.00, 2440.00, 238, '2021-09-20 07:29:06.462889', '2021-09-20 07:29:19.637505', 140);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (387, 56, 1, 120.00, 120.00, 204, '2021-09-14 15:18:44.131134', '2021-09-14 15:18:54.427769', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (368, 1, 1, 420.00, 420.00, 209, '2021-09-14 10:06:49.70417', '2021-09-14 10:06:56.517359', -15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (388, 57, 1, 170.00, 170.00, 204, '2021-09-14 15:19:01.619475', '2021-09-14 15:19:07.227604', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (429, 60, 1, 250.00, 250.00, 249, '2021-09-20 14:03:55.317319', '2021-09-20 14:04:05.519805', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (369, 7, 4, 490.00, 1960.00, 211, '2021-09-14 10:08:46.90866', '2021-09-14 10:09:05.210871', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (389, 43, 1, 120.00, 120.00, 220, '2021-09-15 13:30:25.977531', '2021-09-15 13:30:44.792979', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (370, 1, 4, 475.00, 1900.00, 211, '2021-09-14 10:09:18.60881', '2021-09-14 10:09:29.510867', 160);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (424, 35, 3, 300.00, 900.00, 245, '2021-09-20 13:28:50.660765', '2021-09-20 13:29:04.715188', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (415, 10, 1, 480.00, 480.00, 239, '2021-09-20 07:34:53.45074', '2021-09-20 07:35:01.252486', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (390, 36, 2, 230.00, 460.00, 221, '2021-09-15 13:31:29.782222', '2021-09-15 13:31:42.483821', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (371, 3, 2, 490.00, 980.00, 211, '2021-09-14 10:09:40.210383', '2021-09-14 10:09:52.699805', 110);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (391, 60, 1, 200.00, 200.00, 222, '2021-09-15 13:48:23.619015', '2021-09-15 13:48:23.619015', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (372, 28, 2, 280.00, 560.00, 211, '2021-09-14 10:10:00.408769', '2021-09-14 10:10:11.009691', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (403, 36, 2, 240.00, 480.00, 232, '2021-09-18 15:15:52.260158', '2021-09-18 15:16:36.366603', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (404, 68, 1, 280.00, 280.00, 233, '2021-09-18 15:19:19.86583', '2021-09-18 15:19:19.86583', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (392, 55, 15, 435.00, 6525.00, 223, '2021-09-15 14:27:29.689381', '2021-09-15 14:27:45.19086', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (373, 24, 3, 225.00, 675.00, 213, '2021-09-14 14:38:37.817034', '2021-09-14 14:38:47.31403', 75);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (374, 37, 2, 280.00, 560.00, 213, '2021-09-14 14:38:54.012259', '2021-09-14 14:39:03.116041', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (416, 2, 1, 240.00, 240.00, 240, '2021-09-20 07:35:40.753659', '2021-09-20 07:35:46.866211', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (393, 65, 6, 435.00, 2610.00, 223, '2021-09-15 14:27:57.588107', '2021-09-15 14:28:12.600805', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (375, 26, 5, 225.00, 1125.00, 213, '2021-09-14 14:39:08.513468', '2021-09-14 14:39:17.017532', 75);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (405, 55, 2, 480.00, 960.00, 233, '2021-09-18 15:21:40.562331', '2021-09-18 15:22:04.763465', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (376, 35, 3, 285.00, 855.00, 213, '2021-09-14 14:39:25.900316', '2021-09-14 14:39:41.505823', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (430, 36, 1, 250.00, 250.00, 249, '2021-09-20 14:04:35.114321', '2021-09-20 14:04:35.114321', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (367, 36, 2, 240.00, 480.00, 209, '2021-09-14 10:05:48.608535', '2021-09-14 14:48:38.818828', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (406, 64, 1, 250.00, 250.00, 233, '2021-09-18 15:24:31.2628', '2021-09-18 15:27:55.365104', 38);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (377, 42, 28, 485.00, 13580.00, 214, '2021-09-14 14:50:55.314297', '2021-09-14 14:51:00.328218', 2408);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (417, 1, 1, 480.00, 480.00, 241, '2021-09-20 07:36:12.853675', '2021-09-20 07:36:20.280249', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (394, 27, 6, 600.00, 3600.00, 223, '2021-09-15 14:28:35.78762', '2021-09-15 14:29:16.397322', 180);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (378, 34, 2, 380.00, 760.00, 214, '2021-09-14 14:51:12.932029', '2021-09-14 14:51:23.633782', 220);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (379, 1, 2, 500.00, 1000.00, 215, '2021-09-14 14:51:58.128206', '2021-09-14 14:52:08.229649', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (380, 7, 2, 500.00, 1000.00, 215, '2021-09-14 14:52:22.927255', '2021-09-14 14:52:30.812301', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (407, 69, 2, 250.00, 500.00, 233, '2021-09-18 15:33:12.268213', '2021-09-18 15:33:23.666376', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (381, 26, 4, 300.00, 1200.00, 215, '2021-09-14 14:52:36.921694', '2021-09-14 14:52:55.528125', 360);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (396, 66, 2, 210.00, 420.00, 227, '2021-09-15 15:11:06.306592', '2021-09-15 15:11:41.418818', 150);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (397, 36, 1, 250.00, 250.00, 227, '2021-09-15 15:12:05.810679', '2021-09-15 15:12:05.810679', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (382, 34, 5, 380.00, 1900.00, 216, '2021-09-14 14:54:29.229275', '2021-09-14 14:54:42.931821', 550);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (383, 58, 1, 120.00, 120.00, 217, '2021-09-14 15:07:23.337597', '2021-09-14 15:07:23.337597', 29);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (408, 60, 1, 190.00, 190.00, 234, '2021-09-18 15:38:17.533889', '2021-09-18 15:38:26.081033', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (384, 36, 2, 230.00, 460.00, 217, '2021-09-14 15:07:43.029013', '2021-09-14 15:08:03.393719', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (425, 53, 30, 120.00, 3600.00, 247, '2021-09-20 13:29:56.822213', '2021-09-20 13:30:10.229858', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (399, 46, 10, 195.00, 1950.00, 230, '2021-09-18 15:12:21.257825', '2021-09-18 15:12:31.000799', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (410, 40, 1, 500.00, 500.00, 236, '2021-09-19 09:22:55.207987', '2021-09-19 09:23:06.910637', 75);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (435, 37, 8, 300.00, 2400.00, 251, '2021-09-22 17:05:59.451115', '2021-09-22 17:06:11.351654', 320);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (418, 49, 10, 150.00, 1500.00, 242, '2021-09-20 07:36:56.153733', '2021-09-20 07:37:28.928028', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (400, 34, 6, 380.00, 2280.00, 230, '2021-09-18 15:12:42.762613', '2021-09-18 15:13:26.312138', 660);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (409, 7, 10, 490.00, 4900.00, 236, '2021-09-19 09:22:43.751104', '2021-09-19 09:23:13.812505', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (401, 65, 4, 435.00, 1740.00, 231, '2021-09-18 15:13:56.958006', '2021-09-18 15:14:06.67387', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (432, 36, 1, 230.00, 230.00, 250, '2021-09-20 14:05:19.514714', '2021-09-20 14:05:37.315193', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (431, 69, 1, 250.00, 250.00, 250, '2021-09-20 14:05:10.728511', '2021-09-20 14:05:41.014742', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (419, 50, 3, 250.00, 750.00, 243, '2021-09-20 07:42:55.258631', '2021-09-20 07:43:07.263213', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (420, 3, 1, 500.00, 500.00, 243, '2021-09-20 07:43:25.254093', '2021-09-20 07:43:25.254093', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (413, 28, 6, 290.00, 1740.00, 238, '2021-09-20 07:27:36.398974', '2021-09-20 07:27:49.050643', 180);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (412, 1, 6, 475.00, 2850.00, 238, '2021-09-20 07:27:21.646519', '2021-09-20 07:27:53.452682', 240);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (426, 54, 30, 180.00, 5400.00, 247, '2021-09-20 13:30:16.421858', '2021-09-20 14:52:43.320415', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (421, 6, 1, 230.00, 230.00, 244, '2021-09-20 07:44:27.348313', '2021-09-20 07:44:34.160402', 35);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (422, 4, 1, 430.00, 430.00, 244, '2021-09-20 07:44:49.657398', '2021-09-20 07:44:57.062054', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (427, 60, 1, 200.00, 200.00, 248, '2021-09-20 13:32:17.720664', '2021-09-20 13:32:17.720664', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (423, 50, 1, 270.00, 270.00, 244, '2021-09-20 07:45:05.747136', '2021-09-20 07:45:11.959389', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (402, 55, 3, 435.00, 1305.00, 231, '2021-09-18 15:14:25.291797', '2021-09-20 14:58:14.002053', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (436, 35, 3, 300.00, 900.00, 251, '2021-09-22 17:06:20.650551', '2021-09-22 17:06:37.156543', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (428, 55, 1, 480.00, 480.00, 248, '2021-09-20 13:33:18.521399', '2021-09-20 13:33:28.620816', 65);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (433, 54, 1, 170.00, 170.00, 250, '2021-09-21 04:51:16.406001', '2021-09-21 04:51:26.309716', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (434, 42, 10, 485.00, 4850.00, 251, '2021-09-22 17:05:41.350814', '2021-09-22 17:05:48.344545', 860);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (437, 46, 1, 185.00, 185.00, 251, '2021-09-22 17:06:43.360855', '2021-09-22 17:06:53.874562', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (442, 43, 1, 150.00, 150.00, 252, '2021-09-22 17:08:29.333729', '2021-09-22 17:08:29.333729', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (444, 42, 28, 485.00, 13580.00, 254, '2021-09-23 14:10:47.073836', '2021-09-23 14:10:55.599028', 2408);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (446, 66, 1, 220.00, 220.00, 255, '2021-09-23 14:18:52.885928', '2021-09-23 14:19:04.688652', 85);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (443, 55, 10, 435.00, 4350.00, 253, '2021-09-23 14:09:48.272929', '2021-09-23 14:10:06.387091', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (445, 34, 1, 430.00, 430.00, 255, '2021-09-23 14:18:15.483148', '2021-09-23 14:18:24.684563', 160);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (449, 42, 1, 470.00, 470.00, 255, '2021-09-23 14:20:21.597065', '2021-09-23 14:20:30.882576', 71);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (448, 5, 2, 200.00, 400.00, 255, '2021-09-23 14:19:53.884899', '2021-09-23 14:20:47.095892', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (450, 60, 1, 220.00, 220.00, 256, '2021-09-23 14:34:36.310094', '2021-09-23 14:34:45.584794', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (451, 36, 3, 250.00, 750.00, 257, '2021-09-23 15:21:05.395728', '2021-09-23 15:21:12.701672', 150);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (452, 55, 2, 480.00, 960.00, 257, '2021-09-23 15:22:05.895753', '2021-09-23 15:22:18.502193', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (453, 13, 1, 210.00, 210.00, 257, '2021-09-23 15:24:04.695407', '2021-09-23 15:24:10.600662', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (454, 9, 1, 250.00, 250.00, 257, '2021-09-23 15:24:20.088831', '2021-09-23 15:24:29.393662', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (457, 22, 1, 1.00, 1.00, 259, '2021-09-24 14:09:26.089547', '2021-10-01 07:02:42.434172', -199);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (456, 60, 1, 190.00, 190.00, 259, '2021-09-24 14:08:52.90141', '2021-09-30 05:14:58.642683', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (440, 35, 1, 285.00, 285.00, 252, '2021-09-22 17:08:04.157395', '2021-09-24 14:13:32.790769', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (458, 70, 1, 240.00, 240.00, 259, '2021-09-24 14:09:53.089293', '2021-09-24 14:09:59.79666', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (439, 37, 2, 280.00, 560.00, 252, '2021-09-22 17:07:49.991676', '2021-09-24 14:13:20.780901', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (441, 26, 5, 225.00, 1125.00, 252, '2021-09-22 17:08:15.474566', '2021-09-24 14:13:46.396512', 75);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (455, 7, 2, 480.00, 960.00, 258, '2021-09-23 15:45:03.745444', '2021-09-25 13:46:54.40497', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (459, 5, 1, 200.00, 200.00, 260, '2021-09-24 14:15:11.192943', '2021-09-24 14:15:17.987254', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (492, 26, 2, 270.00, 540.00, 282, '2021-09-28 15:56:08.567879', '2021-09-28 15:56:16.107317', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (523, 7, 3, 490.00, 1470.00, 300, '2021-10-03 15:02:33.002705', '2021-10-03 15:03:59.707561', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (477, 7, 25, 484.00, 12100.00, 274, '2021-09-27 15:13:34.771111', '2021-09-27 15:13:54.65499', 600);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (488, 36, 5, 250.00, 1250.00, 282, '2021-09-28 15:54:38.217271', '2021-09-28 15:57:18.416816', 250);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (462, 70, 1, 240.00, 240.00, 262, '2021-09-25 13:23:01.479309', '2021-09-25 13:23:11.588477', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (478, 7, 3, 500.00, 1500.00, 275, '2021-09-28 08:34:53.904444', '2021-09-28 08:35:18.208279', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (463, 74, 1, 260.00, 260.00, 262, '2021-09-25 13:23:28.286741', '2021-09-25 13:23:35.989475', 35);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (464, 50, 2, 270.00, 540.00, 263, '2021-09-25 13:25:08.291598', '2021-09-25 13:25:28.49378', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (465, 2, 1, 250.00, 250.00, 263, '2021-09-25 13:25:46.189759', '2021-09-25 13:25:46.189759', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (479, 1, 3, 480.00, 1440.00, 275, '2021-09-28 08:35:26.309652', '2021-09-28 08:36:46.512466', 135);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (505, 54, 4, 250.00, 1000.00, 290, '2021-10-01 04:54:29.645053', '2021-10-01 04:54:52.249064', 320);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (461, 72, 3, 260.00, 780.00, 261, '2021-09-24 14:16:38.387996', '2021-09-25 13:27:48.887886', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (506, 53, 1, 150.00, 150.00, 290, '2021-10-01 04:55:01.441696', '2021-10-01 04:55:01.441696', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (495, 35, 4, 285.00, 1140.00, 284, '2021-09-29 14:01:14.891331', '2021-09-29 14:02:24.17535', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (460, 71, 3, 75.00, 225.00, 261, '2021-09-24 14:16:23.587003', '2021-09-25 13:28:08.490272', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (466, 29, 1, 450.00, 450.00, 266, '2021-09-25 13:36:47.178086', '2021-09-25 13:37:00.873026', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (515, 54, 1, 250.00, 250.00, 297, '2021-10-03 07:48:34.200694', '2021-10-03 07:49:50.194146', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (496, 37, 1, 300.00, 300.00, 285, '2021-09-29 14:40:20.879458', '2021-09-29 14:40:30.176713', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (469, 36, 1, 250.00, 250.00, 270, '2021-09-26 07:58:36.205511', '2021-09-26 07:58:36.205511', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (471, 35, 1, 300.00, 300.00, 270, '2021-09-26 07:58:52.111567', '2021-09-26 07:58:57.309753', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (482, 13, 2, 200.00, 400.00, 277, '2021-09-28 09:35:20.710798', '2021-09-28 09:35:31.912959', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (533, 76, 2, 345.00, 690.00, 307, '2021-10-05 05:42:04.348513', '2021-10-05 05:42:34.746537', 190);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (481, 50, 3, 260.00, 780.00, 277, '2021-09-28 09:34:58.201929', '2021-09-28 09:35:57.111344', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (470, 15, 1, 110.00, 110.00, 269, '2021-09-26 07:58:45.518422', '2021-09-26 07:59:06.406586', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (507, 53, 30, 120.00, 3600.00, 291, '2021-10-01 04:55:54.642586', '2021-10-01 04:56:10.445973', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (467, 35, 5, 285.00, 1425.00, 267, '2021-09-25 13:53:38.30158', '2021-09-26 08:00:42.706751', 75);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (497, 55, 10, 435.00, 4350.00, 286, '2021-09-29 17:17:15.742011', '2021-09-29 17:17:58.14206', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (468, 26, 2, 225.00, 450.00, 267, '2021-09-25 13:53:57.402008', '2021-09-26 08:00:55.885317', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (472, 35, 1, 300.00, 300.00, 271, '2021-09-26 08:36:07.113264', '2021-09-26 08:36:42.716218', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (480, 7, 4, 480.00, 1920.00, 277, '2021-09-28 09:34:30.318401', '2021-09-28 10:25:38.504489', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (473, 3, 2, 500.00, 1000.00, 272, '2021-09-26 11:15:30.810654', '2021-09-26 11:15:35.718469', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (483, 3, 2, 500.00, 1000.00, 278, '2021-09-28 11:17:56.114692', '2021-09-28 11:18:00.119193', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (474, 69, 2, 270.00, 540.00, 272, '2021-09-26 11:16:36.109978', '2021-09-26 13:43:56.316586', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (517, 68, 1, 300.00, 300.00, 298, '2021-10-03 09:04:17.934639', '2021-10-03 09:04:25.4358', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (498, 65, 10, 435.00, 4350.00, 286, '2021-09-29 17:18:03.232906', '2021-09-29 17:18:17.136641', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (484, 7, 5, 480.00, 2400.00, 279, '2021-09-28 13:14:40.213109', '2021-09-28 13:36:30.41249', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (522, 26, 5, 250.00, 1250.00, 300, '2021-10-03 15:02:12.009497', '2021-10-03 15:05:09.301656', 200);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (493, 32, 1, 190.00, 190.00, 283, '2021-09-29 05:11:52.509719', '2021-09-30 05:10:24.526195', 15);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (508, 54, 30, 180.00, 5400.00, 291, '2021-10-01 04:56:25.240908', '2021-10-01 04:56:39.33499', 300);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (485, 65, 8, 435.00, 3480.00, 280, '2021-09-28 13:44:21.212958', '2021-09-28 13:44:46.10494', 160);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (494, 42, 1, 480.00, 480.00, 283, '2021-09-29 05:12:33.701755', '2021-09-30 05:10:31.148675', 81);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (486, 34, 4, 380.00, 1520.00, 281, '2021-09-28 15:52:32.70898', '2021-09-28 15:52:46.514919', 440);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (499, 70, 1, 240.00, 240.00, 287, '2021-09-30 05:20:35.536276', '2021-09-30 05:20:42.741278', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (528, 42, 1, 480.00, 480.00, 303, '2021-10-04 04:59:29.329601', '2021-10-04 04:59:39.43683', 81);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (476, 3, 5, 490.00, 2450.00, 273, '2021-09-27 14:42:33.867061', '2021-09-27 14:44:56.927195', 275);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (487, 35, 2, 300.00, 600.00, 282, '2021-09-28 15:53:45.608826', '2021-09-28 15:53:55.514', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (475, 7, 5, 490.00, 2450.00, 273, '2021-09-27 14:42:22.269876', '2021-09-27 14:45:01.66848', 150);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (500, 67, 1, 70.00, 70.00, 287, '2021-09-30 05:20:55.435537', '2021-09-30 05:21:00.932496', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (489, 55, 1, 470.00, 470.00, 282, '2021-09-28 15:55:05.509055', '2021-09-28 15:55:11.008804', 55);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (509, 36, 1, 240.00, 240.00, 292, '2021-10-01 06:19:27.827177', '2021-10-01 06:19:39.026245', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (490, 1, 1, 470.00, 470.00, 282, '2021-09-28 15:55:27.007064', '2021-09-28 15:55:33.407444', 35);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (501, 68, 1, 300.00, 300.00, 288, '2021-10-01 03:01:15.531624', '2021-10-01 03:01:29.930074', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (491, 42, 1, 500.00, 500.00, 282, '2021-09-28 15:55:56.00368', '2021-09-28 15:56:03.241786', 101);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (520, 35, 5, 300.00, 1500.00, 300, '2021-10-03 15:01:03.109087', '2021-10-03 15:05:17.912786', 150);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (510, 36, 1, 230.00, 230.00, 293, '2021-10-02 05:06:33.04339', '2021-10-02 05:06:45.12921', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (502, 40, 2, 470.00, 940.00, 289, '2021-10-01 04:50:00.230533', '2021-10-01 04:50:13.744848', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (518, 76, 4, 350.00, 1400.00, 300, '2021-10-03 14:58:55.214563', '2021-10-03 14:59:48.398824', 400);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (503, 50, 6, 250.00, 1500.00, 289, '2021-10-01 04:50:23.43297', '2021-10-01 04:50:37.644706', 180);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (512, 35, 1, 300.00, 300.00, 294, '2021-10-02 14:33:56.827505', '2021-10-02 14:34:03.125026', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (504, 5, 1, 200.00, 200.00, 290, '2021-10-01 04:54:12.140848', '2021-10-01 04:54:19.543224', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (519, 4, 1, 400.00, 400.00, 300, '2021-10-03 15:00:34.801282', '2021-10-03 15:00:44.91254', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (529, 53, 1, 140.00, 140.00, 304, '2021-10-04 05:02:51.336971', '2021-10-04 05:03:10.123478', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (513, 36, 1, 160.00, 160.00, 295, '2021-10-02 14:43:10.229609', '2021-10-03 06:49:23.214336', -40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (514, 42, 1, 480.00, 480.00, 296, '2021-10-03 06:51:24.985404', '2021-10-03 06:51:33.384415', 81);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (524, 42, 20, 485.00, 9700.00, 301, '2021-10-03 15:48:44.616605', '2021-10-03 15:49:11.417824', 1720);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (516, 61, 1, 200.00, 200.00, 297, '2021-10-03 07:49:09.318594', '2021-10-03 07:49:17.808599', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (530, 50, 1, 250.00, 250.00, 305, '2021-10-04 14:01:34.318221', '2021-10-04 14:01:41.413382', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (521, 68, 1, 300.00, 300.00, 300, '2021-10-03 15:01:30.414248', '2021-10-03 15:03:28.316898', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (531, 62, 1, 200.00, 200.00, 305, '2021-10-04 14:02:05.302945', '2021-10-04 14:02:05.302945', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (536, 42, 1, 480.00, 480.00, 309, '2021-10-05 13:21:22.639707', '2021-10-05 13:21:44.152607', 81);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (525, 34, 15, 380.00, 5700.00, 301, '2021-10-03 15:49:26.898863', '2021-10-03 15:49:46.309632', 1650);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (526, 64, 1, 300.00, 300.00, 301, '2021-10-03 16:10:51.913351', '2021-10-03 16:10:51.913351', 88);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (532, 34, 1, 400.00, 400.00, 306, '2021-10-04 14:48:04.10913', '2021-10-04 14:48:11.723039', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (527, 61, 1, 200.00, 200.00, 302, '2021-10-04 04:05:37.568158', '2021-10-04 04:05:50.586627', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (537, 42, 1, 520.00, 520.00, 310, '2021-10-05 13:56:04.149656', '2021-10-05 13:56:04.149656', 121);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (541, 74, 1, 270.00, 270.00, 312, '2021-10-05 15:10:32.739374', '2021-10-05 15:10:37.946067', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (538, 34, 1, 400.00, 400.00, 310, '2021-10-05 13:56:41.237833', '2021-10-05 13:57:10.639007', 130);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (535, 53, 1, 160.00, 160.00, 309, '2021-10-05 13:20:40.841542', '2021-10-05 13:20:48.439895', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (539, 76, 25, 335.00, 8375.00, 311, '2021-10-05 14:22:43.139906', '2021-10-05 16:07:29.346741', 2125);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (540, 77, 2, 335.00, 670.00, 311, '2021-10-05 14:49:02.240002', '2021-10-05 14:49:14.848835', 170);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (542, 7, 4, 490.00, 1960.00, 311, '2021-10-05 16:12:03.53507', '2021-10-05 16:13:31.135522', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (544, 24, 1, 250.00, 250.00, 314, '2021-10-06 05:03:19.938996', '2021-10-06 05:03:19.938996', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (543, 59, 10, 570.00, 5700.00, 314, '2021-10-06 05:02:09.740056', '2021-10-06 05:02:23.148925', 700);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (546, 26, 2, 265.00, 530.00, 316, '2021-10-06 08:26:03.945798', '2021-10-06 13:34:44.839963', 110);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (547, 64, 1, 330.00, 330.00, 316, '2021-10-06 08:26:40.436825', '2021-10-06 13:34:55.149657', 118);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (545, 42, 4, 515.00, 2060.00, 316, '2021-10-06 08:17:19.143702', '2021-10-06 13:31:04.331553', 464);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (548, 43, 1, 140.00, 140.00, 317, '2021-10-06 13:36:08.700232', '2021-10-06 13:36:15.439276', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (549, 36, 1, 230.00, 230.00, 317, '2021-10-06 13:37:17.073071', '2021-10-06 13:37:24.540294', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (550, 35, 1, 320.00, 320.00, 317, '2021-10-06 13:38:27.040667', '2021-10-06 13:38:31.433121', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (552, 31, 1, 250.00, 250.00, 318, '2021-10-06 14:38:01.032282', '2021-10-06 14:38:01.032282', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (553, 36, 1, 250.00, 250.00, 318, '2021-10-06 14:38:16.238869', '2021-10-06 14:38:16.238869', 50);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (555, 51, 3, 220.00, 660.00, 319, '2021-10-06 14:41:06.944586', '2021-10-06 14:41:15.844982', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (556, 38, 1, 310.00, 310.00, 319, '2021-10-06 14:41:24.24117', '2021-10-06 14:41:38.840792', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (560, 5, 1, 200.00, 200.00, 321, '2021-10-06 15:35:19.559147', '2021-10-06 15:35:30.440698', 10);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (561, 7, 1, 500.00, 500.00, 322, '2021-10-07 05:20:02.836643', '2021-10-07 05:20:02.836643', 40);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (562, 36, 2, 250.00, 500.00, 322, '2021-10-07 05:20:28.834328', '2021-10-07 05:20:34.678597', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (563, 36, 1, 230.00, 230.00, 323, '2021-10-07 06:31:52.045612', '2021-10-07 06:32:00.440469', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (564, 31, 1, 240.00, 240.00, 324, '2021-10-07 07:05:11.533736', '2021-10-07 07:05:16.94856', 60);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (565, 31, 1, 250.00, 250.00, 325, '2021-10-07 08:59:55.545625', '2021-10-07 08:59:55.545625', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (566, 7, 2, 500.00, 1000.00, 326, '2021-10-07 13:48:15.344931', '2021-10-07 13:48:20.744953', 80);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (567, 58, 1, 110.00, 110.00, 327, '2021-10-07 14:00:31.951972', '2021-10-07 14:00:56.144647', 19);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (570, 37, 2, 320.00, 640.00, 328, '2021-10-07 14:28:48.958981', '2021-10-07 14:29:07.75345', 120);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (568, 55, 1, 500.00, 500.00, 328, '2021-10-07 14:28:25.845155', '2021-10-07 14:29:12.038662', 85);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (569, 46, 1, 200.00, 200.00, 328, '2021-10-07 14:28:35.440006', '2021-10-07 14:32:14.44894', 25);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (571, 76, 1, 350.00, 350.00, 329, '2021-10-07 14:35:33.233594', '2021-10-07 14:35:39.245631', 100);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (572, 75, 1, 230.00, 230.00, 329, '2021-10-07 14:36:21.239116', '2021-10-07 14:36:29.439461', 20);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (574, 74, 1, 270.00, 270.00, 329, '2021-10-07 14:36:52.987745', '2021-10-07 14:37:01.844818', 45);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (573, 60, 1, 250.00, 250.00, 329, '2021-10-07 14:36:42.239167', '2021-10-07 14:37:22.23922', 90);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (575, 36, 1, 200.00, 200.00, 330, '2021-10-07 16:01:16.14574', '2021-10-07 16:01:27.840568', 0);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (558, 71, 1, 70.00, 70.00, 320, '2021-10-06 15:23:50.138573', '2021-10-07 16:02:46.128041', 5);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (559, 31, 1, 250.00, 250.00, 320, '2021-10-06 15:24:31.739873', '2021-10-07 16:04:00.522526', 70);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (557, 36, 1, 230.00, 230.00, 320, '2021-10-06 15:23:29.037923', '2021-10-07 16:04:02.942345', 30);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (576, 1, 2, 489.00, 978.00, 331, '2021-10-07 17:06:38.644656', '2021-10-07 17:06:38.644656', 108);
INSERT INTO public.line_items (id, item_id, quantity, price, total_price, sale_id, created_at, updated_at, profit) VALUES (577, 37, 1, 300.00, 300.00, 332, '2021-10-08 09:52:44.539076', '2021-10-08 09:53:05.940512', 40);


--
-- TOC entry 3091 (class 0 OID 58090)
-- Dependencies: 221
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: deploy
--



--
-- TOC entry 3079 (class 0 OID 57983)
-- Dependencies: 209
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (10, 21, 200.00, 'credit', '2021-07-06 13:03:46.706388', '2021-07-06 13:03:46.706388', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (11, 22, 220.00, 'credit', '2021-07-06 16:50:19.238311', '2021-07-06 16:50:19.238311', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (12, 29, 220.00, 'credit', '2021-07-08 07:41:57.774487', '2021-07-08 07:41:57.774487', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (13, 32, 280.00, 'credit', '2021-07-08 15:38:46.646766', '2021-07-08 15:38:46.646766', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (14, 34, 180.00, 'credit', '2021-07-09 13:07:58.641256', '2021-07-09 13:07:58.641256', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (15, 36, 140.00, 'credit', '2021-07-09 14:48:25.902274', '2021-07-09 14:48:25.902274', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (16, 37, 1450.00, 'credit', '2021-07-10 15:49:30.946176', '2021-07-10 15:49:30.946176', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (17, 38, 980.00, 'credit', '2021-07-10 17:22:29.566663', '2021-07-10 17:22:29.566663', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (18, 39, 1700.00, 'credit', '2021-07-10 17:37:02.236923', '2021-07-10 17:37:02.236923', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (19, 40, 250.00, 'credit', '2021-07-11 03:41:58.093738', '2021-07-11 03:41:58.093738', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (20, 41, 1460.00, 'credit', '2021-07-11 03:44:30.467384', '2021-07-11 03:44:30.467384', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (21, 42, 730.00, 'credit', '2021-07-11 03:47:34.489802', '2021-07-11 03:47:34.489802', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (22, 43, 320.00, 'credit', '2021-07-12 15:13:52.933525', '2021-07-12 15:13:52.933525', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (23, 23, 2270.00, 'credit', '2021-07-12 15:23:18.226421', '2021-07-12 15:23:18.226421', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (24, 44, 1000.00, 'credit', '2021-07-13 12:42:11.229587', '2021-07-13 12:42:11.229587', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (25, 45, 470.00, 'credit', '2021-07-13 14:35:58.799058', '2021-07-13 14:35:58.799058', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (26, 65, 270.00, 'credit', '2021-07-19 01:12:20.735094', '2021-07-19 01:12:20.735094', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (30, 67, 730.00, 'credit', '2021-07-19 15:37:31.44973', '2021-07-19 15:37:31.44973', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (31, 23, 1000.00, 'credit', '2021-07-19 16:09:58.420663', '2021-07-19 16:09:58.420663', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (32, 68, 2000.00, 'credit', '2021-07-19 16:10:22.879667', '2021-07-19 16:10:22.879667', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (33, 68, 2500.00, 'credit', '2021-07-24 10:27:37.717743', '2021-07-24 10:27:37.717743', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (34, 70, 10880.00, 'credit', '2021-07-24 18:01:12.482204', '2021-07-24 18:01:12.482204', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (35, 64, 2370.00, 'credit', '2021-07-26 15:30:09.342913', '2021-07-26 15:30:09.342913', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (36, 30, 1500.00, 'credit', '2021-07-26 15:30:25.448109', '2021-07-26 15:30:25.448109', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (37, 67, 210.00, 'credit', '2021-07-27 00:42:38.784472', '2021-07-27 00:42:38.784472', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (38, 59, 3100.00, 'credit', '2021-07-27 00:43:37.833148', '2021-07-27 00:43:37.833148', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (39, 74, 1000.00, 'credit', '2021-07-28 16:58:42.445209', '2021-07-28 16:58:42.445209', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (40, 75, 500.00, 'credit', '2021-07-28 17:00:04.158089', '2021-07-28 17:00:04.158089', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (41, 76, 1000.00, 'credit', '2021-07-28 17:01:25.534656', '2021-07-28 17:01:25.534656', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (42, 77, 8440.00, 'credit', '2021-07-28 17:04:44.487257', '2021-07-28 17:04:44.487257', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (43, 78, 200.00, 'credit', '2021-07-28 17:07:13.134928', '2021-07-28 17:07:13.134928', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (44, 80, 10965.00, 'credit', '2021-07-31 08:19:44.405259', '2021-07-31 08:19:44.405259', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (45, 84, 64500.00, 'credit', '2021-08-02 12:49:20.222407', '2021-08-02 12:49:20.222407', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (46, 79, 600.00, 'credit', '2021-08-03 01:40:18.505495', '2021-08-03 01:40:18.505495', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (47, 86, 250.00, 'credit', '2021-08-04 12:55:01.070043', '2021-08-04 12:55:01.070043', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (48, 88, 1160.00, 'credit', '2021-08-05 14:09:49.33851', '2021-08-05 14:09:49.33851', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (49, 90, 230.00, 'credit', '2021-08-05 14:53:22.436172', '2021-08-05 14:53:22.436172', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (50, 89, 5000.00, 'credit', '2021-08-05 14:58:23.437326', '2021-08-05 14:58:23.437326', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (51, 89, 5000.00, 'credit', '2021-08-05 15:06:16.039647', '2021-08-05 15:06:16.039647', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (52, 91, 3100.00, 'credit', '2021-08-06 13:33:35.426102', '2021-08-06 13:33:35.426102', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (53, 73, 2500.00, 'credit', '2021-08-06 14:13:57.918338', '2021-08-06 14:13:57.918338', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (54, 83, 5900.00, 'credit', '2021-08-06 14:14:47.702237', '2021-08-06 14:14:47.702237', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (55, 93, 150.00, 'credit', '2021-08-07 15:29:22.434728', '2021-08-07 15:29:22.434728', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (56, 94, 440.00, 'credit', '2021-08-09 07:40:36.034144', '2021-08-09 07:40:36.034144', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (57, 95, 570.00, 'credit', '2021-08-09 15:01:44.534611', '2021-08-09 15:01:44.534611', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (58, 96, 1250.00, 'credit', '2021-08-09 15:36:32.129016', '2021-08-09 15:36:32.129016', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (59, 98, 500.00, 'credit', '2021-08-10 10:51:15.923704', '2021-08-10 10:51:15.923704', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (60, 99, 500.00, 'credit', '2021-08-10 15:57:13.03426', '2021-08-10 15:57:13.03426', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (61, 100, 10520.00, 'credit', '2021-08-11 18:02:41.749162', '2021-08-11 18:02:41.749162', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (62, 101, 2080.00, 'credit', '2021-08-11 18:03:10.545125', '2021-08-11 18:03:10.545125', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (63, 102, 2460.00, 'credit', '2021-08-11 18:03:34.535021', '2021-08-11 18:03:34.535021', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (64, 103, 1180.00, 'credit', '2021-08-12 14:24:59.581767', '2021-08-12 14:24:59.581767', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (65, 107, 116000.00, 'credit', '2021-08-13 14:56:41.634152', '2021-08-13 14:56:41.634152', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (66, 89, 9380.00, 'credit', '2021-08-13 17:52:16.842856', '2021-08-13 17:52:16.842856', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (67, 111, 200.00, 'credit', '2021-08-13 17:57:53.633856', '2021-08-13 17:57:53.633856', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (68, 59, 20.00, 'credit', '2021-08-14 12:17:48.085602', '2021-08-14 12:17:48.085602', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (69, 115, 500.00, 'credit', '2021-08-16 08:26:43.333847', '2021-08-16 08:26:43.333847', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (70, 114, 2870.00, 'credit', '2021-08-17 14:09:31.938939', '2021-08-17 14:09:31.938939', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (71, 116, 3890.00, 'credit', '2021-08-18 08:41:07.017577', '2021-08-18 08:41:07.017577', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (72, 117, 250.00, 'credit', '2021-08-18 09:10:21.917105', '2021-08-18 09:10:21.917105', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (73, 118, 250.00, 'credit', '2021-08-18 09:45:59.714044', '2021-08-18 09:45:59.714044', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (74, 120, 500.00, 'credit', '2021-08-21 09:06:05.602522', '2021-08-21 09:06:05.602522', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (75, 126, 1000.00, 'credit', '2021-08-22 17:28:39.933148', '2021-08-22 17:28:39.933148', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (76, 127, 3520.00, 'credit', '2021-08-22 17:33:11.839488', '2021-08-22 17:33:11.839488', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (77, 128, 500.00, 'credit', '2021-08-22 17:35:00.93803', '2021-08-22 17:35:00.93803', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (78, 129, 6870.00, 'credit', '2021-08-22 17:39:40.43437', '2021-08-22 17:39:40.43437', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (79, 131, 2000.00, 'credit', '2021-08-22 17:42:07.336205', '2021-08-22 17:42:07.336205', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (80, 132, 500.00, 'credit', '2021-08-22 17:43:56.835327', '2021-08-22 17:43:56.835327', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (81, 133, 1000.00, 'credit', '2021-08-22 17:45:32.43386', '2021-08-22 17:45:32.43386', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (82, 135, 2080.00, 'credit', '2021-08-22 17:49:14.103216', '2021-08-22 17:49:14.103216', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (83, 136, 1600.00, 'credit', '2021-08-22 17:51:13.746889', '2021-08-22 17:51:13.746889', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (84, 134, 290.00, 'credit', '2021-08-22 17:52:19.433851', '2021-08-22 17:52:19.433851', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (85, 137, 250.00, 'credit', '2021-08-23 06:26:22.510314', '2021-08-23 06:26:22.510314', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (86, 138, 425.00, 'credit', '2021-08-23 08:16:13.001956', '2021-08-23 08:16:13.001956', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (87, 123, 3220.00, 'credit', '2021-08-24 13:41:00.174444', '2021-08-24 13:41:00.174444', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (88, 140, 9000.00, 'credit', '2021-08-24 13:55:17.558419', '2021-08-24 13:55:17.558419', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (89, 108, 5280.00, 'credit', '2021-08-24 15:12:49.797991', '2021-08-24 15:12:49.797991', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (90, 108, -60.00, 'credit', '2021-08-24 15:14:51.605928', '2021-08-24 15:14:51.605928', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (91, 113, 1700.00, 'credit', '2021-08-24 15:31:10.401074', '2021-08-24 15:31:10.401074', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (92, 110, 2310.00, 'credit', '2021-08-24 15:32:01.92488', '2021-08-24 15:32:01.92488', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (93, 92, 1250.00, 'credit', '2021-08-24 15:32:32.225881', '2021-08-24 15:32:32.225881', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (94, 141, 250.00, 'credit', '2021-08-25 16:37:37.897192', '2021-08-25 16:37:37.897192', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (95, 142, 250.00, 'credit', '2021-08-25 16:38:15.797692', '2021-08-25 16:38:15.797692', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (96, 146, 4225.00, 'credit', '2021-08-28 05:52:33.08913', '2021-08-28 05:52:33.08913', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (97, 147, 220.00, 'credit', '2021-08-28 05:54:56.997911', '2021-08-28 05:54:56.997911', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (98, 145, 190.00, 'credit', '2021-08-28 05:57:31.101231', '2021-08-28 05:57:31.101231', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (99, 148, 280.00, 'credit', '2021-08-28 07:36:20.189903', '2021-08-28 07:36:20.189903', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (100, 150, 570.00, 'credit', '2021-08-28 14:57:59.386117', '2021-08-28 14:57:59.386117', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (101, 144, 7000.00, 'credit', '2021-08-28 15:44:58.882431', '2021-08-28 15:44:58.882431', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (102, 151, 250.00, 'credit', '2021-08-29 09:26:40.502514', '2021-08-29 09:26:40.502514', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (103, 152, 220.00, 'credit', '2021-08-29 09:28:24.907602', '2021-08-29 09:28:24.907602', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (104, 153, 450.00, 'credit', '2021-08-29 11:35:48.401711', '2021-08-29 11:35:48.401711', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (105, 154, 220.00, 'credit', '2021-08-29 13:51:34.203579', '2021-08-29 13:51:34.203579', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (106, 155, 600.00, 'credit', '2021-08-29 14:28:39.002559', '2021-08-29 14:28:39.002559', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (107, 159, 250.00, 'credit', '2021-08-29 15:03:10.602854', '2021-08-29 15:03:10.602854', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (108, 162, 500.00, 'credit', '2021-08-29 15:56:13.301846', '2021-08-29 15:56:13.301846', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (109, 164, 220.00, 'credit', '2021-08-30 10:09:24.304214', '2021-08-30 10:09:24.304214', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (110, 165, 200.00, 'credit', '2021-08-31 07:31:26.209944', '2021-08-31 07:31:26.209944', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (111, 166, 500.00, 'credit', '2021-08-31 09:22:15.598', '2021-08-31 09:22:15.598', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (112, 168, 530.00, 'credit', '2021-08-31 09:29:53.560726', '2021-08-31 09:29:53.560726', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (113, 170, 420.00, 'credit', '2021-08-31 12:46:15.953991', '2021-08-31 12:46:15.953991', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (114, 171, 210.00, 'credit', '2021-08-31 15:09:51.322741', '2021-08-31 15:09:51.322741', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (115, 172, 250.00, 'credit', '2021-08-31 15:21:57.757449', '2021-08-31 15:21:57.757449', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (116, 144, 275.00, 'credit', '2021-08-31 16:20:40.309873', '2021-08-31 16:20:40.309873', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (117, 139, 4560.00, 'credit', '2021-08-31 16:21:06.102827', '2021-08-31 16:21:06.102827', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (118, 108, 60.00, 'credit', '2021-08-31 16:21:51.901082', '2021-08-31 16:21:51.901082', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (119, 125, 105.00, 'credit', '2021-08-31 16:22:27.102597', '2021-08-31 16:22:27.102597', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (120, 174, 170.00, 'credit', '2021-09-02 07:50:08.315507', '2021-09-02 07:50:08.315507', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (121, 176, 250.00, 'credit', '2021-09-02 12:57:00.798053', '2021-09-02 12:57:00.798053', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (122, 178, 200.00, 'credit', '2021-09-02 13:38:26.741356', '2021-09-02 13:38:26.741356', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (123, 182, 440.00, 'credit', '2021-09-03 06:56:52.730769', '2021-09-03 06:56:52.730769', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (124, 183, 2700.00, 'credit', '2021-09-13 16:47:37.336779', '2021-09-13 16:47:37.336779', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (125, 184, 2000.00, 'credit', '2021-09-13 16:52:19.236023', '2021-09-13 16:52:19.236023', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (126, 185, 1600.00, 'credit', '2021-09-13 16:53:03.597103', '2021-09-13 16:53:03.597103', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (127, 186, 4020.00, 'credit', '2021-09-13 16:55:30.921766', '2021-09-13 16:55:30.921766', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (128, 187, 540.00, 'credit', '2021-09-13 16:56:58.892733', '2021-09-13 16:56:58.892733', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (129, 188, 420.00, 'credit', '2021-09-13 16:57:33.099787', '2021-09-13 16:57:33.099787', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (130, 189, 400.00, 'credit', '2021-09-13 16:58:41.700286', '2021-09-13 16:58:41.700286', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (131, 190, 1250.00, 'credit', '2021-09-13 16:59:36.200313', '2021-09-13 16:59:36.200313', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (132, 191, 450.00, 'credit', '2021-09-13 17:00:15.732448', '2021-09-13 17:00:15.732448', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (133, 192, 250.00, 'credit', '2021-09-13 17:00:46.590955', '2021-09-13 17:00:46.590955', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (134, 193, 450.00, 'credit', '2021-09-13 17:01:41.599708', '2021-09-13 17:01:41.599708', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (135, 194, 450.00, 'credit', '2021-09-13 17:02:26.698175', '2021-09-13 17:02:26.698175', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (136, 195, 1400.00, 'credit', '2021-09-13 17:04:53.003826', '2021-09-13 17:04:53.003826', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (137, 196, 3970.00, 'credit', '2021-09-13 17:09:25.692593', '2021-09-13 17:09:25.692593', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (138, 197, 7170.00, 'credit', '2021-09-13 17:11:20.302828', '2021-09-13 17:11:20.302828', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (139, 198, 420.00, 'credit', '2021-09-14 07:56:45.108732', '2021-09-14 07:56:45.108732', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (140, 200, 1230.00, 'credit', '2021-09-14 09:09:58.107824', '2021-09-14 09:09:58.107824', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (141, 201, 2100.00, 'credit', '2021-09-14 09:16:11.503549', '2021-09-14 09:16:11.503549', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (142, 203, 300.00, 'credit', '2021-09-14 09:24:03.908998', '2021-09-14 09:24:03.908998', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (143, 205, 430.00, 'credit', '2021-09-14 09:26:45.204612', '2021-09-14 09:26:45.204612', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (144, 206, 920.00, 'credit', '2021-09-14 09:33:34.668104', '2021-09-14 09:33:34.668104', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (145, 208, 230.00, 'credit', '2021-09-14 09:38:14.519739', '2021-09-14 09:38:14.519739', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (146, 209, 3350.00, 'credit', '2021-09-14 10:07:26.605781', '2021-09-14 10:07:26.605781', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (147, 211, 5400.00, 'credit', '2021-09-14 10:10:29.703892', '2021-09-14 10:10:29.703892', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (148, 210, 300.00, 'credit', '2021-09-14 10:25:15.618578', '2021-09-14 10:25:15.618578', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (149, 199, 1080.00, 'credit', '2021-09-14 10:33:00.209633', '2021-09-14 10:33:00.209633', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (150, 199, -100.00, 'credit', '2021-09-14 14:17:04.90934', '2021-09-14 14:17:04.90934', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (151, 213, 3215.00, 'credit', '2021-09-14 14:39:51.709759', '2021-09-14 14:39:51.709759', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (152, 208, -230.00, 'credit', '2021-09-14 14:45:34.812947', '2021-09-14 14:45:34.812947', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (153, 209, 20.00, 'credit', '2021-09-14 14:49:06.01723', '2021-09-14 14:49:06.01723', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (154, 219, 250.00, 'credit', '2021-09-14 15:09:15.229474', '2021-09-14 15:09:15.229474', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (155, 217, 830.00, 'credit', '2021-09-14 15:09:32.829619', '2021-09-14 15:09:32.829619', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (156, 220, 120.00, 'credit', '2021-09-15 13:30:51.996741', '2021-09-15 13:30:51.996741', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (157, 221, 460.00, 'credit', '2021-09-15 13:46:39.624937', '2021-09-15 13:46:39.624937', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (158, 222, 200.00, 'credit', '2021-09-15 13:48:45.660915', '2021-09-15 13:48:45.660915', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (159, 227, 670.00, 'credit', '2021-09-15 15:12:48.520054', '2021-09-15 15:12:48.520054', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (160, 223, 12735.00, 'credit', '2021-09-15 15:13:40.19722', '2021-09-15 15:13:40.19722', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (161, 232, 480.00, 'credit', '2021-09-18 15:16:42.087732', '2021-09-18 15:16:42.087732', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (162, 232, 480.00, 'credit', '2021-09-18 15:18:44.055715', '2021-09-18 15:18:44.055715', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (163, 232, -480.00, 'credit', '2021-09-18 15:18:56.406956', '2021-09-18 15:18:56.406956', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (164, 233, 1990.00, 'credit', '2021-09-18 15:33:33.363713', '2021-09-18 15:33:33.363713', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (165, 234, 190.00, 'credit', '2021-09-18 15:39:30.56778', '2021-09-18 15:39:30.56778', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (166, 202, 9750.00, 'credit', '2021-09-18 15:44:38.852131', '2021-09-18 15:44:38.852131', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (167, 207, 1405.00, 'credit', '2021-09-18 15:45:24.200665', '2021-09-18 15:45:24.200665', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (168, 214, 7675.00, 'credit', '2021-09-18 15:46:43.057771', '2021-09-18 15:46:43.057771', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (169, 231, 3915.00, 'credit', '2021-09-18 16:18:51.992605', '2021-09-18 16:18:51.992605', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (170, 236, 5400.00, 'credit', '2021-09-19 09:23:44.099349', '2021-09-19 09:23:44.099349', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (171, 238, 7030.00, 'credit', '2021-09-20 07:33:55.655365', '2021-09-20 07:33:55.655365', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (172, 239, 480.00, 'credit', '2021-09-20 07:35:14.049247', '2021-09-20 07:35:14.049247', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (173, 240, 240.00, 'credit', '2021-09-20 07:35:55.455358', '2021-09-20 07:35:55.455358', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (174, 241, 480.00, 'credit', '2021-09-20 07:36:29.158753', '2021-09-20 07:36:29.158753', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (175, 242, 1500.00, 'credit', '2021-09-20 07:37:37.949103', '2021-09-20 07:37:37.949103', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (176, 243, 1250.00, 'credit', '2021-09-20 07:43:44.969767', '2021-09-20 07:43:44.969767', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (177, 244, 930.00, 'credit', '2021-09-20 07:45:22.553079', '2021-09-20 07:45:22.553079', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (178, 248, 680.00, 'credit', '2021-09-20 13:33:48.617724', '2021-09-20 13:33:48.617724', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (179, 231, -870.00, 'credit', '2021-09-20 13:44:44.116526', '2021-09-20 13:44:44.116526', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (180, 204, 870.00, 'credit', '2021-09-20 13:45:25.226319', '2021-09-20 13:45:25.226319', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (181, 231, 870.00, 'credit', '2021-09-20 13:51:46.417904', '2021-09-20 13:51:46.417904', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (182, 204, -870.00, 'credit', '2021-09-20 13:52:18.617227', '2021-09-20 13:52:18.617227', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (183, 223, -12735.00, 'credit', '2021-09-20 13:53:09.720827', '2021-09-20 13:53:09.720827', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (184, 231, -3915.00, 'credit', '2021-09-20 13:53:44.42905', '2021-09-20 13:53:44.42905', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (185, 249, 500.00, 'credit', '2021-09-20 14:04:45.611687', '2021-09-20 14:04:45.611687', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (186, 149, 2280.00, 'credit', '2021-09-20 14:56:23.410263', '2021-09-20 14:56:23.410263', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (187, 204, 890.00, 'credit', '2021-09-20 14:57:21.119133', '2021-09-20 14:57:21.119133', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (188, 223, 12735.00, 'credit', '2021-09-20 14:58:54.309472', '2021-09-20 14:58:54.309472', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (189, 231, 3045.00, 'credit', '2021-09-20 14:59:09.113111', '2021-09-20 14:59:09.113111', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (190, 245, 900.00, 'credit', '2021-09-20 14:59:31.408622', '2021-09-20 14:59:31.408622', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (191, 247, 9000.00, 'credit', '2021-09-20 14:59:50.608068', '2021-09-20 14:59:50.608068', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (192, 215, 3200.00, 'credit', '2021-09-20 15:01:24.308507', '2021-09-20 15:01:24.308507', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (193, 250, 480.00, 'credit', '2021-09-21 04:50:00.320776', '2021-09-21 04:50:00.320776', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (194, 250, 170.00, 'credit', '2021-09-21 04:51:37.013468', '2021-09-21 04:51:37.013468', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (195, 216, 1900.00, 'credit', '2021-09-21 06:55:16.909303', '2021-09-21 06:55:16.909303', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (196, 230, 4230.00, 'credit', '2021-09-21 06:55:41.310491', '2021-09-21 06:55:41.310491', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (197, 216, -900.00, 'credit', '2021-09-21 06:57:07.813029', '2021-09-21 06:57:07.813029', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (198, 216, 900.00, 'credit', '2021-09-22 17:04:14.245688', '2021-09-22 17:04:14.245688', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (199, 214, 6665.00, 'credit', '2021-09-22 17:05:11.84579', '2021-09-22 17:05:11.84579', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (200, 255, 1520.00, 'credit', '2021-09-23 14:21:45.182094', '2021-09-23 14:21:45.182094', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (201, 256, 220.00, 'credit', '2021-09-23 14:34:55.689517', '2021-09-23 14:34:55.689517', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (202, 257, 750.00, 'credit', '2021-09-23 15:21:27.993969', '2021-09-23 15:21:27.993969', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (203, 257, 960.00, 'credit', '2021-09-23 15:22:36.797734', '2021-09-23 15:22:36.797734', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (204, 257, 460.00, 'credit', '2021-09-23 15:24:39.08953', '2021-09-23 15:24:39.08953', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (205, 143, 2425.00, 'credit', '2021-09-24 13:55:41.005106', '2021-09-24 13:55:41.005106', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (206, 259, 530.00, 'credit', '2021-09-24 14:10:22.88917', '2021-09-24 14:10:22.88917', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (207, 252, 2120.00, 'credit', '2021-09-24 14:14:20.38394', '2021-09-24 14:14:20.38394', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (208, 260, 200.00, 'credit', '2021-09-24 14:15:42.886062', '2021-09-24 14:15:42.886062', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (209, 251, 10000.00, 'credit', '2021-09-24 16:50:16.405385', '2021-09-24 16:50:16.405385', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (210, 125, 275.00, 'credit', '2021-09-25 02:35:31.803322', '2021-09-25 02:35:31.803322', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (211, 262, 500.00, 'credit', '2021-09-25 13:23:56.576817', '2021-09-25 13:23:56.576817', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (212, 263, 790.00, 'credit', '2021-09-25 13:25:58.901721', '2021-09-25 13:25:58.901721', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (213, 261, 1005.00, 'credit', '2021-09-25 13:28:20.28468', '2021-09-25 13:28:20.28468', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (214, 266, 450.00, 'credit', '2021-09-25 13:37:15.07143', '2021-09-25 13:37:15.07143', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (215, 270, 550.00, 'credit', '2021-09-26 07:59:11.509595', '2021-09-26 07:59:11.509595', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (216, 269, 110.00, 'credit', '2021-09-26 07:59:20.405418', '2021-09-26 07:59:20.405418', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (217, 267, 1875.00, 'credit', '2021-09-26 08:01:15.304552', '2021-09-26 08:01:15.304552', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (218, 271, 300.00, 'credit', '2021-09-26 08:37:06.910937', '2021-09-26 08:37:06.910937', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (219, 253, 4350.00, 'credit', '2021-09-26 15:03:10.625169', '2021-09-26 15:03:10.625169', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (220, 258, 960.00, 'credit', '2021-09-26 15:03:25.521799', '2021-09-26 15:03:25.521799', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (221, 272, 1540.00, 'credit', '2021-09-26 15:03:38.721756', '2021-09-26 15:03:38.721756', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (222, 275, 2940.00, 'credit', '2021-09-28 08:55:04.009871', '2021-09-28 08:55:04.009871', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (223, 274, 12100.00, 'credit', '2021-09-28 09:12:40.116645', '2021-09-28 09:12:40.116645', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (224, 277, 3100.00, 'credit', '2021-09-28 10:25:53.718155', '2021-09-28 10:25:53.718155', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (225, 273, 4900.00, 'credit', '2021-09-28 12:14:12.508834', '2021-09-28 12:14:12.508834', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (226, 278, 1000.00, 'credit', '2021-09-28 12:24:17.706873', '2021-09-28 12:24:17.706873', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (227, 282, 3830.00, 'credit', '2021-09-28 15:57:48.714223', '2021-09-28 15:57:48.714223', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (228, 251, 615.00, 'credit', '2021-09-29 14:11:40.887284', '2021-09-29 14:11:40.887284', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (229, 254, 9385.00, 'credit', '2021-09-29 14:13:52.43759', '2021-09-29 14:13:52.43759', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (230, 285, 300.00, 'credit', '2021-09-29 14:41:21.780124', '2021-09-29 14:41:21.780124', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (231, 283, 670.00, 'credit', '2021-09-30 05:12:24.046186', '2021-09-30 05:12:24.046186', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (232, 288, 300.00, 'credit', '2021-10-01 03:01:39.748843', '2021-10-01 03:01:39.748843', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (233, 289, 2440.00, 'credit', '2021-10-01 04:50:55.537311', '2021-10-01 04:50:55.537311', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (234, 290, 1350.00, 'credit', '2021-10-01 04:55:19.840059', '2021-10-01 04:55:19.840059', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (235, 292, 240.00, 'credit', '2021-10-01 06:19:48.028308', '2021-10-01 06:19:48.028308', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (236, 259, -100.00, 'credit', '2021-10-01 07:01:43.000238', '2021-10-01 07:01:43.000238', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (237, 259, 100.00, 'credit', '2021-10-01 07:02:25.051474', '2021-10-01 07:02:25.051474', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (238, 259, -99.00, 'credit', '2021-10-01 07:03:13.338015', '2021-10-01 07:03:13.338015', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (239, 287, 310.00, 'credit', '2021-10-02 05:05:54.746391', '2021-10-02 05:05:54.746391', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (240, 294, 300.00, 'credit', '2021-10-02 14:34:41.02228', '2021-10-02 14:34:41.02228', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (241, 284, 1140.00, 'credit', '2021-10-02 14:36:15.520619', '2021-10-02 14:36:15.520619', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (242, 279, 2400.00, 'credit', '2021-10-02 14:40:15.032774', '2021-10-02 14:40:15.032774', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (243, 280, 3480.00, 'credit', '2021-10-02 14:40:32.124397', '2021-10-02 14:40:32.124397', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (244, 286, 8700.00, 'credit', '2021-10-02 14:40:49.128536', '2021-10-02 14:40:49.128536', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (245, 291, 6000.00, 'credit', '2021-10-02 14:41:15.147045', '2021-10-02 14:41:15.147045', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (246, 254, 13580.00, 'credit', '2021-10-02 15:56:16.502061', '2021-10-02 15:56:16.502061', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (247, 254, -13580.00, 'credit', '2021-10-02 15:56:35.726013', '2021-10-02 15:56:35.726013', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (248, 254, 4195.00, 'credit', '2021-10-02 15:56:56.541204', '2021-10-02 15:56:56.541204', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (249, 281, 1520.00, 'credit', '2021-10-02 16:00:33.831463', '2021-10-02 16:00:33.831463', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (250, 295, 160.00, 'credit', '2021-10-03 06:49:29.926619', '2021-10-03 06:49:29.926619', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (251, 293, 230.00, 'credit', '2021-10-03 06:49:48.184919', '2021-10-03 06:49:48.184919', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (252, 297, 450.00, 'credit', '2021-10-03 07:50:37.301211', '2021-10-03 07:50:37.301211', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (253, 298, 300.00, 'credit', '2021-10-03 14:56:33.205324', '2021-10-03 14:56:33.205324', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (254, 302, 200.00, 'credit', '2021-10-04 04:06:08.578616', '2021-10-04 04:06:08.578616', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (255, 296, 480.00, 'credit', '2021-10-04 04:55:46.129639', '2021-10-04 04:55:46.129639', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (256, 304, 140.00, 'credit', '2021-10-04 05:03:17.836942', '2021-10-04 05:03:17.836942', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (257, 305, 450.00, 'credit', '2021-10-04 14:02:29.60575', '2021-10-04 14:02:29.60575', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (258, 306, 400.00, 'credit', '2021-10-04 14:48:19.705747', '2021-10-04 14:48:19.705747', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (259, 307, 690.00, 'credit', '2021-10-05 05:46:10.633372', '2021-10-05 05:46:10.633372', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (260, 303, 480.00, 'credit', '2021-10-05 13:13:54.635268', '2021-10-05 13:13:54.635268', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (261, 309, 140.00, 'credit', '2021-10-05 13:22:28.928931', '2021-10-05 13:22:28.928931', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (262, 310, 920.00, 'credit', '2021-10-05 13:57:27.43714', '2021-10-05 13:57:27.43714', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (263, 312, 270.00, 'credit', '2021-10-05 15:10:46.738578', '2021-10-05 15:10:46.738578', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (264, 291, 3000.00, 'credit', '2021-10-05 16:28:21.237266', '2021-10-05 16:28:21.237266', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (265, 311, 11005.00, 'credit', '2021-10-05 16:30:00.534507', '2021-10-05 16:30:00.534507', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (266, 300, 1350.00, 'credit', '2021-10-05 16:31:05.039388', '2021-10-05 16:31:05.039388', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (267, 314, 5950.00, 'credit', '2021-10-06 07:46:46.737904', '2021-10-06 07:46:46.737904', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (268, 318, 500.00, 'credit', '2021-10-06 14:38:25.039622', '2021-10-06 14:38:25.039622', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (269, 319, 970.00, 'credit', '2021-10-06 14:41:51.03242', '2021-10-06 14:41:51.03242', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (270, 309, 500.00, 'credit', '2021-10-06 15:22:35.834088', '2021-10-06 15:22:35.834088', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (271, 321, 200.00, 'credit', '2021-10-06 15:35:42.438461', '2021-10-06 15:35:42.438461', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (272, 301, 7000.00, 'credit', '2021-10-06 15:42:18.238037', '2021-10-06 15:42:18.238037', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (273, 322, 1000.00, 'credit', '2021-10-07 05:20:48.84489', '2021-10-07 05:20:48.84489', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (274, 323, 230.00, 'credit', '2021-10-07 06:32:08.137466', '2021-10-07 06:32:08.137466', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (275, 324, 240.00, 'credit', '2021-10-07 07:05:24.037992', '2021-10-07 07:05:24.037992', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (276, 325, 250.00, 'credit', '2021-10-07 09:00:06.4378', '2021-10-07 09:00:06.4378', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (277, 326, 1000.00, 'credit', '2021-10-07 13:48:32.037982', '2021-10-07 13:48:32.037982', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (278, 327, 110.00, 'credit', '2021-10-07 14:01:03.83111', '2021-10-07 14:01:03.83111', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (279, 328, 1340.00, 'credit', '2021-10-07 14:31:43.542609', '2021-10-07 14:31:43.542609', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (280, 329, 1100.00, 'credit', '2021-10-07 14:37:59.837706', '2021-10-07 14:37:59.837706', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (281, 330, 200.00, 'credit', '2021-10-07 16:02:06.854827', '2021-10-07 16:02:06.854827', NULL, NULL);
INSERT INTO public.payments (id, sale_id, amount, payment_type, created_at, updated_at, remaining_amount, detail) VALUES (282, 332, 300.00, 'credit', '2021-10-08 09:53:16.037504', '2021-10-08 09:53:16.037504', NULL, NULL);


--
-- TOC entry 3071 (class 0 OID 57938)
-- Dependencies: 201
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (40, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-11 03:32:35.499397', '2021-07-11 03:41:58.204181', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (22, NULL, 220.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-06 16:48:39.641519', '2021-07-19 01:14:06.852156', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (42, NULL, 730.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-11 03:45:59.790004', '2021-07-11 03:47:34.491508', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (41, NULL, 1460.00, 0.0, NULL, NULL, 14, NULL, '2021-07-11 03:35:22.909545', '2021-07-11 04:07:41.069264', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (59, NULL, 3120.00, 0.0, NULL, NULL, 31, NULL, '2021-07-14 12:42:28.084532', '2021-08-14 12:17:49.050112', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (43, NULL, 320.00, 0.0, NULL, NULL, 15, NULL, '2021-07-12 15:11:48.204222', '2021-07-12 15:13:52.935006', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (89, NULL, 19380.00, 0.0, NULL, NULL, 4, NULL, '2021-08-05 14:47:07.989611', '2021-08-13 17:52:16.844901', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (88, NULL, 1160.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-05 14:08:14.537368', '2021-08-05 14:09:49.340993', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (21, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-06 13:00:57.002505', '2021-07-06 13:03:46.707824', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (96, NULL, 1250.00, 0.0, NULL, NULL, 2, NULL, '2021-08-09 15:35:32.933075', '2021-08-09 15:36:38.137196', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-08 07:10:46.957781', '2021-07-08 07:10:46.957781', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (29, NULL, 220.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-08 07:40:49.469341', '2021-07-08 07:41:57.776069', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (72, NULL, NULL, 0.0, NULL, NULL, 2, NULL, '2021-07-27 16:40:32.329177', '2021-07-28 05:54:38.315002', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (32, NULL, 280.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-08 15:38:28.003855', '2021-07-08 15:38:46.648276', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (34, NULL, 180.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-09 13:07:39.101633', '2021-07-09 13:07:58.642748', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (36, NULL, 140.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-09 14:47:50.606789', '2021-07-09 14:48:25.903797', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (45, NULL, 470.00, 0.0, NULL, NULL, 17, NULL, '2021-07-13 14:33:09.457284', '2021-07-13 14:35:58.800775', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-09 17:00:10.834012', '2021-08-09 17:00:10.834012', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (37, NULL, 1450.00, 0.0, NULL, NULL, 12, NULL, '2021-07-10 15:43:55.000051', '2021-07-10 15:51:30.145265', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (103, NULL, 1180.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-12 14:23:08.845696', '2021-08-12 14:24:59.583555', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (44, NULL, 1000.00, 0.0, NULL, NULL, 12, NULL, '2021-07-13 12:41:40.435165', '2021-07-13 15:59:37.8938', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (98, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-10 10:50:44.333681', '2021-08-10 10:51:15.92524', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (38, NULL, 980.00, 0.0, NULL, NULL, 13, NULL, '2021-07-10 17:18:51.597489', '2021-07-10 17:22:29.568137', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (51, NULL, 229.00, 229.0, NULL, NULL, 23, NULL, '2021-07-14 05:02:41.616216', '2021-07-14 05:02:41.616216', 1, 1, NULL);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (91, NULL, 3100.00, 0.0, NULL, NULL, 39, NULL, '2021-08-06 10:32:09.242138', '2021-08-06 13:33:35.427546', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (73, NULL, 2500.00, 0.0, NULL, NULL, 2, NULL, '2021-07-28 16:36:45.333052', '2021-08-06 14:13:57.99643', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (83, NULL, 5900.00, 0.0, NULL, NULL, 2, NULL, '2021-08-01 14:44:01.448221', '2021-08-06 14:14:47.704712', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (57, NULL, 229.00, 229.0, NULL, NULL, 29, NULL, '2021-07-14 09:43:37.077832', '2021-07-14 09:43:37.077832', 1, 1, NULL);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (39, NULL, 1700.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-10 17:34:12.012547', '2021-07-10 18:29:45.453715', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (58, NULL, 229.00, 229.0, NULL, NULL, 30, NULL, '2021-07-14 09:48:57.068332', '2021-07-14 09:48:57.068332', 1, 1, NULL);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-13 14:46:20.933017', '2021-08-13 14:46:20.933017', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (23, NULL, 3270.00, 0.0, NULL, NULL, 4, NULL, '2021-07-06 16:52:33.342985', '2021-07-19 16:09:58.42254', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (80, NULL, 10965.00, 0.0, NULL, NULL, 37, NULL, '2021-07-31 08:16:43.6539', '2021-07-31 08:22:50.150944', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (69, NULL, 300.00, 300.0, NULL, NULL, 3, NULL, '2021-07-19 16:10:57.683051', '2021-07-19 16:11:15.438324', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-01 12:24:17.017756', '2021-08-01 12:24:17.017756', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-01 14:43:44.448922', '2021-08-01 14:43:44.448922', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (68, NULL, 4500.00, 0.0, NULL, NULL, 4, NULL, '2021-07-19 16:08:11.738002', '2021-07-24 10:27:37.719338', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-15 10:00:32.933528', '2021-07-15 10:00:32.933528', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-18 02:12:36.733582', '2021-07-18 02:12:36.733582', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (75, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-28 16:58:49.349553', '2021-07-28 17:00:04.159851', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (76, NULL, 1000.00, 0.0, NULL, NULL, 34, NULL, '2021-07-28 17:00:26.533988', '2021-07-28 17:01:25.537939', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (99, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-10 15:56:28.842618', '2021-08-10 15:57:13.038128', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (93, NULL, 150.00, 0.0, NULL, NULL, 15, NULL, '2021-08-07 15:28:16.233066', '2021-08-07 15:29:32.364649', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (65, NULL, 270.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-19 01:10:09.53427', '2021-07-19 01:12:20.926155', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (105, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, '2021-08-13 14:50:34.033617', '2021-08-13 14:51:55.628242', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (70, NULL, 10880.00, 0.0, NULL, NULL, 12, NULL, '2021-07-24 17:23:06.482823', '2021-07-24 18:01:12.485117', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (84, NULL, 64500.00, 0.0, NULL, NULL, 38, NULL, '2021-08-02 12:48:31.321165', '2021-08-02 12:51:22.534249', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (71, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, '2021-07-25 06:07:42.828961', '2021-07-25 06:08:56.539592', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (77, NULL, 8440.00, 0.0, NULL, NULL, 33, NULL, '2021-07-28 17:01:49.550114', '2021-07-28 17:04:57.094299', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (74, NULL, 1000.00, 0.0, NULL, NULL, 35, NULL, '2021-07-28 16:58:00.565321', '2021-07-28 17:06:22.970298', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (64, NULL, 2370.00, 0.0, NULL, NULL, 2, NULL, '2021-07-18 16:52:07.612865', '2021-07-26 15:30:09.534611', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (30, NULL, 1500.00, 0.0, NULL, NULL, 2, NULL, '2021-07-08 07:44:27.257452', '2021-07-26 15:30:25.454509', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (67, NULL, 940.00, 0.0, NULL, NULL, NULL, NULL, '2021-07-19 15:34:49.350151', '2021-07-27 00:42:38.78633', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (79, NULL, 600.00, 0.0, NULL, NULL, 36, NULL, '2021-07-29 11:05:17.59668', '2021-08-03 01:40:18.692366', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-04 12:51:28.760822', '2021-08-04 12:51:28.760822', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (78, NULL, 220.00, 20.0, NULL, NULL, NULL, NULL, '2021-07-28 17:06:38.633882', '2021-07-28 17:07:13.13735', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-13 14:55:33.232993', '2021-08-13 14:55:33.232993', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (86, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-04 12:53:01.776855', '2021-08-04 12:55:01.071499', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-05 14:03:13.137766', '2021-08-05 14:03:13.137766', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (94, NULL, 440.00, 0.0, NULL, NULL, 40, NULL, '2021-08-09 07:38:28.19522', '2021-08-09 07:50:25.235408', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (117, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-18 09:09:12.305526', '2021-08-18 09:10:21.918789', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (90, NULL, 230.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-05 14:52:14.446733', '2021-08-05 14:53:22.438007', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (107, NULL, 116000.00, 0.0, NULL, NULL, 38, NULL, '2021-08-13 14:55:41.548926', '2021-08-13 14:58:28.434185', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (95, NULL, 570.00, 0.0, NULL, NULL, 15, NULL, '2021-08-09 14:50:38.333052', '2021-08-09 15:03:44.337348', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (100, NULL, 10520.00, 0.0, NULL, NULL, 37, NULL, '2021-08-11 09:37:54.438531', '2021-08-11 18:02:41.828634', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (101, NULL, 2080.00, 0.0, NULL, NULL, 37, NULL, '2021-08-11 10:03:37.937138', '2021-08-11 18:03:10.546789', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (102, NULL, 2460.00, 0.0, NULL, NULL, 33, NULL, '2021-08-11 10:21:43.943017', '2021-08-11 18:03:34.541108', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (120, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-21 09:05:27.510672', '2021-08-21 09:06:05.605013', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (115, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-16 06:48:08.03719', '2021-08-16 08:26:43.337336', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (118, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-18 09:45:31.812796', '2021-08-18 09:45:59.717903', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (92, NULL, 1250.00, 0.0, NULL, NULL, 2, NULL, '2021-08-06 14:21:37.700861', '2021-08-24 15:32:32.228276', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (110, NULL, 2310.00, 0.0, NULL, NULL, 2, NULL, '2021-08-13 17:52:31.676696', '2021-08-24 15:32:01.926711', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-13 17:51:05.337729', '2021-08-13 17:51:05.337729', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (111, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-13 17:57:27.332881', '2021-08-13 17:57:53.635236', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-13 18:09:46.128256', '2021-08-13 18:09:46.128256', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (147, NULL, 220.00, 0.0, NULL, NULL, 50, NULL, '2021-08-28 05:54:14.897713', '2021-08-28 05:54:57.014588', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (114, NULL, 2870.00, 0.0, NULL, NULL, 41, NULL, '2021-08-15 13:43:47.339759', '2021-08-17 14:09:31.94446', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-22 09:26:19.285342', '2021-08-22 09:26:19.285342', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (116, NULL, 3890.00, 0.0, NULL, NULL, 42, NULL, '2021-08-18 08:22:23.416789', '2021-08-18 08:41:07.096775', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (119, NULL, 1105.00, 1105.0, NULL, NULL, NULL, NULL, '2021-08-19 01:23:13.033136', '2021-08-19 02:26:37.400411', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (113, NULL, 1700.00, 0.0, NULL, NULL, 2, NULL, '2021-08-14 14:03:05.034261', '2021-08-24 15:31:10.402885', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-22 14:09:15.128822', '2021-08-22 14:09:15.128822', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (126, NULL, 1000.00, 0.0, NULL, NULL, 35, NULL, '2021-08-22 17:27:50.232919', '2021-08-22 17:28:39.934758', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (125, NULL, 380.00, 0.0, NULL, NULL, 4, NULL, '2021-08-22 17:26:14.9371', '2021-09-25 02:35:31.997312', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (127, NULL, 3520.00, 0.0, NULL, NULL, 33, NULL, '2021-08-22 17:29:25.732895', '2021-08-22 17:33:11.846015', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (128, NULL, 500.00, 0.0, NULL, NULL, 44, NULL, '2021-08-22 17:34:37.830801', '2021-08-22 17:35:00.940163', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (129, NULL, 6870.00, 0.0, NULL, NULL, 37, NULL, '2021-08-22 17:35:09.307751', '2021-08-22 17:39:40.627671', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-22 17:39:50.752104', '2021-08-22 17:39:50.752104', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (131, NULL, 2000.00, 0.0, NULL, NULL, 45, NULL, '2021-08-22 17:40:45.232834', '2021-08-22 17:42:07.341306', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (132, NULL, 500.00, 0.0, NULL, NULL, 46, NULL, '2021-08-22 17:43:36.330727', '2021-08-22 17:43:56.836603', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (133, NULL, 1000.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-22 17:44:53.132979', '2021-08-22 17:45:32.435137', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (108, NULL, 5280.00, 0.0, NULL, NULL, 4, NULL, '2021-08-13 17:49:13.853259', '2021-08-31 16:21:51.902641', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (123, NULL, 3220.00, 0.0, NULL, NULL, 39, NULL, '2021-08-22 13:27:01.94491', '2021-08-24 13:41:00.26851', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (198, NULL, 420.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-14 07:56:45.111043', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (164, NULL, 220.00, 0.0, NULL, NULL, 50, NULL, '2021-08-30 10:08:46.99852', '2021-08-30 10:09:24.310247', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (165, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-31 07:30:49.376463', '2021-08-31 07:31:26.230766', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (146, NULL, 4225.00, 0.0, NULL, NULL, 51, NULL, '2021-08-28 03:47:13.929239', '2021-08-28 05:52:33.178613', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (145, NULL, 190.00, 0.0, NULL, NULL, 50, NULL, '2021-08-27 12:20:39.941673', '2021-08-28 05:57:31.10291', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (200, NULL, 1230.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-03 16:47:45', '2021-09-14 09:09:58.10932', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (166, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-31 09:21:21.882319', '2021-08-31 09:22:15.690069', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (135, NULL, 2080.00, 0.0, NULL, NULL, 48, NULL, '2021-08-22 17:47:32.834052', '2021-08-22 17:49:14.104459', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (148, NULL, 280.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-28 07:35:43.183577', '2021-08-28 07:36:20.191393', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-31 09:22:32.297275', '2021-08-31 09:22:32.297275', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (208, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, '2021-09-11 16:47:45', '2021-09-14 14:45:34.824475', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (136, NULL, 1600.00, 0.0, NULL, NULL, 49, NULL, '2021-08-22 17:49:52.53292', '2021-08-22 17:51:22.834431', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (134, NULL, 290.00, 0.0, NULL, NULL, 47, NULL, '2021-08-22 17:46:10.036245', '2021-08-22 17:52:19.437233', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (168, NULL, 530.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-31 09:28:39.742453', '2021-08-31 09:29:53.580651', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (137, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-23 06:25:39.301035', '2021-08-23 06:26:22.594606', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (204, NULL, 890.00, 0.0, NULL, NULL, 2, NULL, '2021-09-06 16:47:45', '2021-09-20 14:57:21.120477', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-31 12:43:55.647552', '2021-08-31 12:43:55.647552', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (138, NULL, 425.00, 0.0, NULL, NULL, 50, NULL, '2021-08-23 08:15:18.301717', '2021-08-23 08:16:20.502478', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (205, NULL, 430.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-07 16:47:45', '2021-09-14 09:26:45.208738', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (210, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-12 16:47:45', '2021-09-14 10:25:15.623858', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (150, NULL, 570.00, 0.0, NULL, NULL, 52, NULL, '2021-08-28 14:52:27.085601', '2021-08-28 14:57:59.390673', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (206, NULL, 920.00, 0.0, NULL, NULL, 4, NULL, '2021-09-09 16:47:45', '2021-09-14 10:28:30.908944', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (182, NULL, 1010.00, 570.0, NULL, NULL, 52, NULL, '2021-09-03 06:55:59.915166', '2021-09-14 08:49:02.120419', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (170, NULL, 420.00, 0.0, NULL, NULL, 50, NULL, '2021-08-31 12:44:48.589086', '2021-08-31 12:46:15.96985', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (151, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-29 09:25:58.409452', '2021-08-29 09:26:40.504226', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (197, NULL, 7170.00, 0.0, NULL, NULL, 2, NULL, '2021-09-05 16:47:45', '2021-09-14 14:30:32.363974', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (152, NULL, 220.00, 0.0, NULL, NULL, 50, NULL, '2021-08-29 09:27:13.801865', '2021-08-29 09:28:34.202698', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (140, NULL, 9000.00, 0.0, NULL, NULL, 2, NULL, '2021-08-24 13:53:36.060865', '2021-08-24 13:55:17.559805', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (141, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-25 16:37:07.905042', '2021-08-25 16:37:37.990651', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (171, NULL, 210.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-31 14:58:41.048856', '2021-08-31 15:09:51.325511', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (153, NULL, 450.00, 0.0, NULL, NULL, 36, NULL, '2021-08-29 11:34:01.094093', '2021-08-29 11:35:48.403309', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (142, NULL, 250.00, 0.0, NULL, NULL, 50, NULL, '2021-08-25 16:37:47.255848', '2021-08-26 04:12:06.843691', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (172, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-31 15:19:57.568183', '2021-08-31 15:21:57.764788', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (144, NULL, 7275.00, 0.0, NULL, NULL, 4, NULL, '2021-08-26 14:50:35.324891', '2021-08-31 16:20:40.31231', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (139, NULL, 4560.00, 0.0, NULL, NULL, 4, NULL, '2021-08-23 12:13:47.134913', '2021-08-31 16:21:06.113155', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (154, NULL, 220.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-29 13:49:56.101199', '2021-08-29 13:51:34.214553', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-02 05:40:29.910504', '2021-09-02 05:40:29.910504', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (174, NULL, 170.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-02 07:45:45.209046', '2021-09-02 07:50:08.394159', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-02 12:52:38.291641', '2021-09-02 12:52:38.291641', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (155, NULL, 600.00, 0.0, NULL, NULL, 51, NULL, '2021-08-29 14:27:43.202866', '2021-08-29 14:28:39.004357', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-29 14:59:41.501111', '2021-08-29 14:59:41.501111', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-29 15:00:39.005191', '2021-08-29 15:00:39.005191', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-29 15:01:57.300963', '2021-08-29 15:01:57.300963', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (201, NULL, 2100.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-04 16:47:45', '2021-09-14 09:16:11.50487', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (159, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-29 15:02:15.201868', '2021-08-29 15:03:10.605689', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-29 15:53:19.509096', '2021-08-29 15:53:19.509096', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-29 15:53:30.340348', '2021-08-29 15:53:30.340348', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (176, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-02 12:56:35.395733', '2021-09-02 12:57:01.001881', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-02 13:06:49.468963', '2021-09-02 13:06:49.468963', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (162, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-08-29 15:55:09.306624', '2021-08-29 15:56:13.311903', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-08-30 10:04:22.197031', '2021-08-30 10:04:22.197031', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (178, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-02 13:37:41.698137', '2021-09-02 13:38:26.757164', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (203, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-06 16:47:45', '2021-09-14 09:24:03.91047', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (179, NULL, 430.00, 430.0, NULL, NULL, 36, NULL, '2021-09-02 14:43:30.297523', '2021-09-02 14:44:32.699519', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-02 14:44:36.697345', '2021-09-02 14:44:36.697345', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-03 06:55:54.657281', '2021-09-03 06:55:54.657281', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (209, NULL, 3370.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-12 16:47:45', '2021-09-14 14:49:06.01985', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (223, NULL, 12735.00, 0.0, NULL, NULL, 2, NULL, '2021-09-15 14:27:11.283689', '2021-09-20 14:58:54.310957', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (207, NULL, 1405.00, 0.0, NULL, NULL, 4, NULL, '2021-09-10 16:47:45', '2021-09-18 15:45:24.20181', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (191, NULL, 450.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 17:00:15.734541', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (195, NULL, 1400.00, 0.0, NULL, NULL, 48, NULL, '2021-09-05 16:47:45', '2021-09-13 17:05:16.197025', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (192, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 17:00:46.592179', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (186, NULL, 4020.00, 0.0, NULL, NULL, 33, NULL, '2021-09-05 16:47:45', '2021-09-13 16:55:30.938672', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (193, NULL, 450.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 17:01:41.600957', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (187, NULL, 540.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 16:56:58.894101', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (183, NULL, 2700.00, 0.0, NULL, NULL, 37, NULL, '2021-09-05 16:47:45', '2021-09-13 16:47:45.197026', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (188, NULL, 420.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 16:57:33.101119', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (199, NULL, 980.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-14 14:17:05.021334', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (194, NULL, 450.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 17:02:26.69961', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (189, NULL, 400.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 16:58:41.701651', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (184, NULL, 2000.00, 0.0, NULL, NULL, 45, NULL, '2021-09-05 16:47:45', '2021-09-13 16:52:23.304684', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (185, NULL, 1600.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 16:53:03.59832', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (213, NULL, 3215.00, 0.0, NULL, NULL, 41, NULL, '2021-09-07 00:00:00', '2021-09-14 14:39:57.908561', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (190, NULL, 1250.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 16:59:36.201612', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (196, NULL, 3970.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-05 16:47:45', '2021-09-13 17:09:25.722182', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (143, NULL, 2425.00, 0.0, NULL, NULL, 4, NULL, '2021-08-25 16:38:24.686852', '2021-09-24 13:55:41.400519', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (214, NULL, 14340.00, 0.0, NULL, NULL, 4, NULL, '2021-09-12 00:00:00', '2021-09-22 17:05:11.849263', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (211, NULL, 5400.00, 0.0, NULL, NULL, 33, NULL, '2021-09-12 16:47:45', '2021-09-14 10:10:29.708422', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (215, NULL, 3200.00, 0.0, NULL, NULL, 41, NULL, '2021-09-12 00:00:00', '2021-09-20 15:01:24.309857', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (212, NULL, NULL, NULL, NULL, NULL, 41, NULL, '2021-09-12 16:47:45', '2021-09-14 10:11:38.708557', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (216, NULL, 1900.00, 0.0, NULL, NULL, 4, NULL, '2021-09-13 00:00:00', '2021-09-22 17:04:14.541816', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (217, NULL, 830.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-14 15:06:52.211187', '2021-09-14 15:09:32.83291', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (218, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-14 15:08:44.233634', '2021-09-14 15:08:44.233634', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (219, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-14 15:08:45.723582', '2021-09-14 15:09:15.231192', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (220, NULL, 120.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-15 13:30:12.080501', '2021-09-15 13:30:52.173537', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (221, NULL, 460.00, 0.0, NULL, NULL, 50, NULL, '2021-09-15 13:31:13.775503', '2021-09-15 13:46:39.627786', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (222, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-15 13:47:08.44469', '2021-09-15 13:48:45.662543', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (224, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 14:31:27.496235', '2021-09-15 14:31:27.496235', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-18 14:30:37.123535', '2021-09-18 14:30:37.123535', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-15 14:44:35.796706', '2021-09-15 14:44:35.796706', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (225, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, '2021-09-15 14:36:43.693439', '2021-09-15 14:37:11.704597', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (227, NULL, 670.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-15 15:09:59.800115', '2021-09-15 15:12:48.697543', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (149, NULL, 2280.00, 0.0, NULL, NULL, 2, NULL, '2021-08-28 14:06:35.976962', '2021-09-20 14:56:23.502855', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (242, NULL, 1500.00, 0.0, NULL, NULL, 31, NULL, '2021-09-20 07:36:44.348995', '2021-09-20 07:37:37.953486', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (295, NULL, 160.00, 0.0, NULL, NULL, 50, NULL, '2021-10-02 14:42:41.840927', '2021-10-03 06:49:29.966562', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (268, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-25 13:56:27.496438', '2021-09-25 13:56:27.496438', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (243, NULL, 1250.00, 0.0, NULL, NULL, 57, NULL, '2021-09-20 07:37:47.348447', '2021-09-20 07:43:45.048517', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (293, NULL, 230.00, 0.0, NULL, NULL, 50, NULL, '2021-10-02 05:06:09.836379', '2021-10-03 06:49:48.18638', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (251, NULL, 10615.00, 0.0, NULL, NULL, 4, NULL, '2021-09-22 17:05:28.252448', '2021-09-29 14:11:41.177983', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (244, NULL, 930.00, 0.0, NULL, NULL, 13, NULL, '2021-09-20 07:44:02.453207', '2021-09-20 07:45:22.557267', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (252, NULL, 2120.00, 0.0, NULL, NULL, 41, NULL, '2021-09-22 17:07:41.032722', '2021-09-24 14:14:20.387569', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (270, NULL, 550.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-26 07:56:52.908525', '2021-09-26 07:59:11.510936', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (232, NULL, 480.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-18 15:15:29.855639', '2021-09-18 15:18:56.408134', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (269, NULL, 110.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-26 07:56:42.059731', '2021-09-26 07:59:20.407043', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-20 13:29:14.61527', '2021-09-20 13:29:14.61527', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (260, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-24 14:14:39.884477', '2021-09-24 14:15:42.889161', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (267, NULL, 1875.00, 0.0, NULL, NULL, 41, NULL, '2021-09-25 13:50:19.310983', '2021-09-26 08:01:15.305962', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (233, NULL, 1990.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-18 15:19:06.755545', '2021-09-18 15:33:33.365019', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (229, NULL, NULL, 0.0, NULL, NULL, NULL, NULL, '2021-09-18 14:44:09.419815', '2021-09-18 15:36:47.290882', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (234, NULL, 190.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-18 15:37:39.123227', '2021-09-18 15:39:30.569154', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (202, NULL, 9750.00, 0.0, NULL, NULL, 4, NULL, '2021-09-04 16:47:45', '2021-09-18 15:44:38.853364', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (235, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-19 07:49:25.2039', '2021-09-19 07:49:25.2039', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (288, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-01 03:00:42.441004', '2021-10-01 03:01:39.889259', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (275, NULL, 2940.00, 0.0, NULL, NULL, 33, NULL, '2021-09-28 08:34:02.10648', '2021-09-28 08:55:04.20548', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (248, NULL, 680.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-20 13:31:56.220908', '2021-09-20 13:33:48.621706', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (236, NULL, 5400.00, 0.0, NULL, NULL, 53, NULL, '2021-09-19 09:22:29.609496', '2021-09-19 09:23:44.100938', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-19 10:32:37.474494', '2021-09-19 10:32:37.474494', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (271, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-26 08:35:42.982956', '2021-09-26 08:37:06.917267', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (274, NULL, 12100.00, 0.0, NULL, NULL, 53, NULL, '2021-09-27 15:13:02.284418', '2021-09-28 09:12:40.324045', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (276, NULL, NULL, NULL, NULL, NULL, 37, NULL, '2021-09-28 09:33:11.70828', '2021-09-28 09:33:18.913879', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (262, NULL, 500.00, 0.0, NULL, NULL, 50, NULL, '2021-09-25 13:22:53.284645', '2021-09-25 13:23:56.57853', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (249, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-20 14:02:17.112313', '2021-09-20 14:04:45.617739', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (238, NULL, 7030.00, 0.0, NULL, NULL, 37, NULL, '2021-09-20 07:25:06.244526', '2021-09-20 07:33:55.726867', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (255, NULL, 1520.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-23 14:17:58.481435', '2021-09-23 14:21:45.495514', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (239, NULL, 480.00, 0.0, NULL, NULL, 33, NULL, '2021-09-20 07:34:03.345533', '2021-09-20 07:35:14.050545', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (240, NULL, 240.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-20 07:35:26.749352', '2021-09-20 07:35:55.459934', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (256, NULL, 220.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-23 14:34:27.900534', '2021-09-23 14:34:55.691168', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (231, NULL, 3045.00, 0.0, NULL, NULL, 2, NULL, '2021-09-18 15:13:34.456497', '2021-09-20 14:59:09.117372', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (241, NULL, 480.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-20 07:36:03.948986', '2021-09-20 07:36:29.160361', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (245, NULL, 900.00, 0.0, NULL, NULL, 2, NULL, '2021-09-20 13:28:10.920716', '2021-09-20 14:59:31.410059', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (247, NULL, 9000.00, 0.0, NULL, NULL, 2, NULL, '2021-09-20 13:29:50.715489', '2021-09-20 14:59:50.609638', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (253, NULL, 4350.00, 0.0, NULL, NULL, 2, NULL, '2021-09-23 14:09:20.277727', '2021-09-26 15:03:10.714834', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (263, NULL, 790.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-25 13:24:19.481616', '2021-09-25 13:25:59.079539', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (264, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-25 13:26:21.500386', '2021-09-25 13:26:21.500386', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (250, NULL, 650.00, 0.0, NULL, NULL, 50, NULL, '2021-09-20 14:04:53.128459', '2021-09-21 04:51:37.60301', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (230, NULL, 4230.00, 0.0, NULL, NULL, 4, NULL, '2021-09-18 15:12:01.051516', '2021-09-21 06:55:41.316776', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (258, NULL, 960.00, 0.0, NULL, NULL, 2, NULL, '2021-09-23 15:44:44.475847', '2021-09-26 15:03:25.52442', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (272, NULL, 1540.00, 0.0, NULL, NULL, 2, NULL, '2021-09-26 11:15:08.001065', '2021-09-26 15:03:38.723098', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (285, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-29 14:40:03.076431', '2021-09-29 14:41:21.960258', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (261, NULL, 1005.00, 0.0, NULL, NULL, 41, NULL, '2021-09-24 14:16:08.876879', '2021-09-25 13:28:20.286144', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (265, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-09-25 13:33:39.47412', '2021-09-25 13:33:39.47412', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (257, NULL, 2170.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-23 15:20:51.692652', '2021-09-23 15:24:39.092577', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (294, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-02 14:33:39.517437', '2021-10-02 14:34:41.414484', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (266, NULL, 450.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-25 13:36:28.861476', '2021-09-25 13:37:15.363984', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (284, NULL, 1140.00, 0.0, NULL, NULL, 41, NULL, '2021-09-29 14:00:00.180456', '2021-10-02 14:36:15.525351', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (279, NULL, 2400.00, 0.0, NULL, NULL, 2, NULL, '2021-09-28 13:14:18.305986', '2021-10-02 14:40:15.324319', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (292, NULL, 240.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-01 06:18:50.859628', '2021-10-01 06:19:48.727949', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (289, NULL, 2440.00, 0.0, NULL, NULL, 49, NULL, '2021-10-01 04:49:12.33764', '2021-10-01 04:50:55.538792', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (277, NULL, 3100.00, 0.0, NULL, NULL, 37, NULL, '2021-09-28 09:34:20.604363', '2021-09-28 10:25:53.724744', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (303, NULL, 480.00, 0.0, NULL, NULL, 50, NULL, '2021-10-04 04:59:13.324348', '2021-10-05 13:13:54.641916', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (280, NULL, 3480.00, 0.0, NULL, NULL, 2, NULL, '2021-09-28 13:44:05.908456', '2021-10-02 14:40:32.125831', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (283, NULL, 670.00, 0.0, NULL, NULL, 50, NULL, '2021-09-29 05:11:36.700061', '2021-09-30 05:12:24.124671', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (273, NULL, 4900.00, 0.0, NULL, NULL, 12, NULL, '2021-09-27 14:41:58.168559', '2021-09-28 12:14:12.51091', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (278, NULL, 1000.00, 0.0, NULL, NULL, 13, NULL, '2021-09-28 11:17:41.00844', '2021-09-28 12:24:17.713775', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (282, NULL, 3830.00, 0.0, NULL, NULL, NULL, NULL, '2021-09-28 15:53:08.804813', '2021-09-28 15:57:48.72104', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (286, NULL, 8700.00, 0.0, NULL, NULL, 2, NULL, '2021-09-29 17:16:51.128721', '2021-10-02 14:40:49.131714', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (311, NULL, 11005.00, 0.0, NULL, NULL, 2, NULL, '2021-10-05 14:22:16.197245', '2021-10-05 16:30:00.538333', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (259, NULL, 431.00, 0.0, NULL, NULL, 50, NULL, '2021-09-24 14:08:14.544686', '2021-10-01 07:03:13.909549', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (287, NULL, 310.00, 0.0, NULL, NULL, 50, NULL, '2021-09-30 05:20:20.832446', '2021-10-02 05:05:55.730277', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (290, NULL, 1350.00, 0.0, NULL, NULL, 58, NULL, '2021-10-01 04:52:35.736774', '2021-10-01 04:55:19.846572', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (297, NULL, 450.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-03 07:47:26.004542', '2021-10-03 07:50:37.309675', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (304, NULL, 140.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-04 05:02:16.124399', '2021-10-04 05:03:17.918259', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (302, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-04 04:04:43.870598', '2021-10-04 04:06:08.967035', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (296, NULL, 480.00, 0.0, NULL, NULL, 50, NULL, '2021-10-03 06:50:01.984315', '2021-10-04 04:55:46.134909', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (254, NULL, 13580.00, 0.0, NULL, NULL, 4, NULL, '2021-09-23 14:10:19.827122', '2021-10-02 15:56:56.54458', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (281, NULL, 1520.00, 0.0, NULL, NULL, 4, NULL, '2021-09-28 15:52:08.797994', '2021-10-02 16:00:33.83319', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (298, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-03 09:04:06.133676', '2021-10-03 14:56:33.321947', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-03 14:57:20.008469', '2021-10-03 14:57:20.008469', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (306, NULL, 400.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-04 14:47:45.017048', '2021-10-04 14:48:19.70944', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (310, NULL, 920.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-05 13:55:49.941503', '2021-10-05 13:57:27.629034', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (305, NULL, 450.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-04 14:01:20.80866', '2021-10-04 14:02:30.001652', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (307, NULL, 690.00, 0.0, NULL, NULL, 40, NULL, '2021-10-05 05:41:48.536554', '2021-10-05 05:46:10.828732', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (308, NULL, NULL, 0.0, NULL, NULL, 53, NULL, '2021-10-05 07:24:01.632349', '2021-10-05 14:01:20.947107', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (301, NULL, 15700.00, 8700.0, NULL, NULL, 4, NULL, '2021-10-03 15:46:39.805238', '2021-10-06 15:42:18.240178', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (291, NULL, 9000.00, 0.0, NULL, NULL, 2, NULL, '2021-10-01 04:55:27.639816', '2021-10-05 16:28:21.238843', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (312, NULL, 270.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-05 15:10:24.33238', '2021-10-05 15:10:46.740846', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (313, NULL, NULL, NULL, NULL, NULL, 2, NULL, '2021-10-05 15:44:05.532454', '2021-10-05 15:44:15.347277', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (300, NULL, 6320.00, 4970.0, NULL, NULL, 2, NULL, '2021-10-03 14:58:34.603979', '2021-10-05 16:31:05.129322', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-06 06:00:40.240632', '2021-10-06 06:00:40.240632', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (314, NULL, 5950.00, 0.0, NULL, NULL, 53, NULL, '2021-10-06 05:01:41.03642', '2021-10-06 07:46:46.741642', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (316, NULL, 2920.00, 2920.0, NULL, NULL, 37, NULL, '2021-10-06 08:14:38.796346', '2021-10-06 13:34:55.15244', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (317, NULL, 690.00, 690.0, NULL, NULL, NULL, NULL, '2021-10-06 13:35:52.737349', '2021-10-06 13:38:31.434787', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (318, NULL, 500.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-06 14:37:16.629745', '2021-10-06 14:38:25.327148', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (319, NULL, 970.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-06 14:40:13.233067', '2021-10-06 14:41:51.034294', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (309, NULL, 640.00, 0.0, NULL, NULL, 50, NULL, '2021-10-05 13:20:27.445496', '2021-10-06 15:22:35.839204', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (321, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-06 15:34:41.349841', '2021-10-06 15:35:42.44058', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (322, NULL, 1000.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 05:19:52.535301', '2021-10-07 05:20:48.847279', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (323, NULL, 230.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 06:31:32.952509', '2021-10-07 06:32:08.138994', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (324, NULL, 240.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 07:05:00.637608', '2021-10-07 07:05:24.039857', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (325, NULL, 250.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 08:59:45.737736', '2021-10-07 09:00:06.440029', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (326, NULL, 1000.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 13:48:03.440531', '2021-10-07 13:48:32.044622', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (327, NULL, 110.00, 0.0, NULL, NULL, 41, NULL, '2021-10-07 14:00:07.437326', '2021-10-07 14:01:03.930324', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (328, NULL, 1340.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 14:28:16.247189', '2021-10-07 14:32:14.629644', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (329, NULL, 1100.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 14:35:21.036552', '2021-10-07 14:37:59.839317', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (330, NULL, 200.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-07 16:01:00.557818', '2021-10-07 16:02:06.856545', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (320, NULL, 550.00, 550.0, NULL, NULL, 50, NULL, '2021-10-06 15:23:07.928435', '2021-10-07 16:04:02.948735', 0, 0, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (331, NULL, 978.00, 978.0, NULL, NULL, 30, NULL, '2021-10-07 17:06:38.642304', '2021-10-07 17:11:07.231463', 1, 2, 1);
INSERT INTO public.sales (id, amount, total_amount, remaining_amount, discount, tax, customer_id, comments, created_at, updated_at, sale_type, sale_status, store_configuration_id) VALUES (332, NULL, 300.00, 0.0, NULL, NULL, NULL, NULL, '2021-10-08 09:52:03.136479', '2021-10-08 09:53:16.039049', 0, 0, 1);


--
-- TOC entry 3066 (class 0 OID 57896)
-- Dependencies: 196
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.schema_migrations (version) VALUES ('20131114173358');
INSERT INTO public.schema_migrations (version) VALUES ('20131114232731');
INSERT INTO public.schema_migrations (version) VALUES ('20131114233208');
INSERT INTO public.schema_migrations (version) VALUES ('20131115042412');
INSERT INTO public.schema_migrations (version) VALUES ('20131115042701');
INSERT INTO public.schema_migrations (version) VALUES ('20131130191933');
INSERT INTO public.schema_migrations (version) VALUES ('20131205212936');
INSERT INTO public.schema_migrations (version) VALUES ('20140420165735');
INSERT INTO public.schema_migrations (version) VALUES ('20201213152737');
INSERT INTO public.schema_migrations (version) VALUES ('20201213155334');
INSERT INTO public.schema_migrations (version) VALUES ('20210120042540');
INSERT INTO public.schema_migrations (version) VALUES ('20210120043504');
INSERT INTO public.schema_migrations (version) VALUES ('20210618023308');
INSERT INTO public.schema_migrations (version) VALUES ('20210627025000');
INSERT INTO public.schema_migrations (version) VALUES ('20210701040732');
INSERT INTO public.schema_migrations (version) VALUES ('20210703085612');
INSERT INTO public.schema_migrations (version) VALUES ('20210704021550');
INSERT INTO public.schema_migrations (version) VALUES ('20210706134620');
INSERT INTO public.schema_migrations (version) VALUES ('20210707070819');
INSERT INTO public.schema_migrations (version) VALUES ('20210708131938');
INSERT INTO public.schema_migrations (version) VALUES ('20210709060346');
INSERT INTO public.schema_migrations (version) VALUES ('20210709120637');
INSERT INTO public.schema_migrations (version) VALUES ('20210724131731');
INSERT INTO public.schema_migrations (version) VALUES ('20210725083831');


--
-- TOC entry 3081 (class 0 OID 57994)
-- Dependencies: 211
-- Data for Name: store_configurations; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.store_configurations (id, store_name, store_description, email_address, phone_number, website_url, address, city, state, zip, currency, tax_rate, created_at, updated_at) VALUES (1, 'HERFY FOOD PVT LIMITED', '', 'amirad2020@gmail.com', '03014965032', 'http://validsol.com', 'Wapda Town', 'Lahore', '', '', 'Rs: ', NULL, '2021-06-22 11:56:12.454377', '2021-09-27 14:56:53.369687');


--
-- TOC entry 3087 (class 0 OID 58030)
-- Dependencies: 217
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: deploy
--



--
-- TOC entry 3069 (class 0 OID 57914)
-- Dependencies: 199
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: deploy
--

INSERT INTO public.users (id, username, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, can_update_users, can_update_items, can_update_configuration, can_view_reports, can_update_sale_discount, can_remove_sales, created_at, updated_at, store_configuration_id) VALUES (2, 'amirad2020@gmail.com', 'amirad2020@gmail.com', '$2a$10$VD89./qW9iCAv4VjjYR/FeQaGRr.ufzUaUHGYHzJCfJuj3jSWLguy', NULL, NULL, '2021-08-29 09:25:46.301154', 640, '2021-10-08 09:51:55.251404', '2021-10-07 17:05:05.207939', '111.119.187.23', '103.151.43.14', true, true, true, true, false, true, '2021-06-22 11:56:14.055336', '2021-10-08 09:51:55.251882', 1);
INSERT INTO public.users (id, username, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, can_update_users, can_update_items, can_update_configuration, can_view_reports, can_update_sale_discount, can_remove_sales, created_at, updated_at, store_configuration_id) VALUES (1, 'amir@herfi.com', 'amir@herfi.com', '$2a$10$PH5KnxVfB8yfF6t1C0//qOptvcwOzLoNn3dle2N39CEEJWwYHtI7y', NULL, NULL, NULL, 2, '2021-08-02 13:05:16.719795', '2021-08-01 08:39:48.242989', '111.119.187.4', '127.0.0.1', true, true, true, true, true, true, '2021-06-22 11:55:09.306232', '2021-08-02 13:05:16.720367', 1);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 202
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.customers_id_seq', 58, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 212
-- Name: item_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.item_categories_id_seq', 23, true);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 222
-- Name: item_stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.item_stocks_id_seq', 173, true);


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 204
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.items_id_seq', 78, true);


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 214
-- Name: items_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.items_returns_id_seq', 1, false);


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 218
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.leads_id_seq', 1, true);


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 206
-- Name: line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.line_items_id_seq', 577, true);


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 220
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 208
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.payments_id_seq', 282, true);


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 200
-- Name: sales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.sales_id_seq', 332, true);


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 210
-- Name: store_configurations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.store_configurations_id_seq', 1, true);


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 216
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 198
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: deploy
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 2910 (class 2606 OID 57911)
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- TOC entry 2919 (class 2606 OID 57958)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 2929 (class 2606 OID 58013)
-- Name: item_categories item_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.item_categories
    ADD CONSTRAINT item_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2942 (class 2606 OID 58127)
-- Name: item_stocks item_stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.item_stocks
    ADD CONSTRAINT item_stocks_pkey PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 57971)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 2932 (class 2606 OID 58021)
-- Name: items_returns items_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.items_returns
    ADD CONSTRAINT items_returns_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 58049)
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 57980)
-- Name: line_items line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 58098)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 57991)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 2917 (class 2606 OID 57946)
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);


--
-- TOC entry 2908 (class 2606 OID 57903)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2927 (class 2606 OID 58002)
-- Name: store_configurations store_configurations_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.store_configurations
    ADD CONSTRAINT store_configurations_pkey PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 58038)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 57932)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 1259 OID 58133)
-- Name: index_item_stocks_on_item_id; Type: INDEX; Schema: public; Owner: deploy
--

CREATE INDEX index_item_stocks_on_item_id ON public.item_stocks USING btree (item_id);


--
-- TOC entry 2930 (class 1259 OID 58027)
-- Name: index_items_returns_on_item_id; Type: INDEX; Schema: public; Owner: deploy
--

CREATE INDEX index_items_returns_on_item_id ON public.items_returns USING btree (item_id);


--
-- TOC entry 2937 (class 1259 OID 58099)
-- Name: index_logs_on_logable_type_and_logable_id; Type: INDEX; Schema: public; Owner: deploy
--

CREATE INDEX index_logs_on_logable_type_and_logable_id ON public.logs USING btree (logable_type, logable_id);


--
-- TOC entry 2911 (class 1259 OID 57933)
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: deploy
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- TOC entry 2912 (class 1259 OID 57935)
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: deploy
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- TOC entry 2913 (class 1259 OID 57934)
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: deploy
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- TOC entry 2944 (class 2606 OID 58128)
-- Name: item_stocks fk_rails_95760101ae; Type: FK CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.item_stocks
    ADD CONSTRAINT fk_rails_95760101ae FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 2943 (class 2606 OID 58022)
-- Name: items_returns fk_rails_9e8e55da8e; Type: FK CONSTRAINT; Schema: public; Owner: deploy
--

ALTER TABLE ONLY public.items_returns
    ADD CONSTRAINT fk_rails_9e8e55da8e FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-10-08 06:13:51 EDT

--
-- PostgreSQL database dump complete
--

