--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-10-05 11:15:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS "LegoStore";
--
-- TOC entry 5111 (class 1262 OID 16666)
-- Name: LegoStore; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "LegoStore" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "LegoStore" OWNER TO postgres;

\connect "LegoStore"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 253 (class 1259 OID 16951)
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    admin_notes text,
    booking_date date NOT NULL,
    booking_time time(6) without time zone NOT NULL,
    created_at date,
    customer_name character varying(100) NOT NULL,
    description text,
    email character varying(255),
    laptop_brand character varying(50),
    laptop_model character varying(100) NOT NULL,
    phone_number character varying(255) NOT NULL,
    service_type character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    user_id bigint,
    CONSTRAINT bookings_service_type_check CHECK (((service_type)::text = ANY ((ARRAY['CLEANING'::character varying, 'THERMAL_PASTE'::character varying, 'REPAIR'::character varying, 'UPGRADE'::character varying, 'DIAGNOSIS'::character varying, 'OTHER'::character varying])::text[]))),
    CONSTRAINT bookings_status_check CHECK (((status)::text = ANY ((ARRAY['PENDING'::character varying, 'APPROVED'::character varying, 'REJECTED'::character varying, 'COMPLETED'::character varying, 'CANCELLED'::character varying])::text[])))
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 16950)
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO postgres;

--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 252
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- TOC entry 220 (class 1259 OID 16688)
-- Name: cart_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_detail (
    id bigint NOT NULL,
    price double precision NOT NULL,
    quantity bigint NOT NULL,
    cart_id bigint,
    product_id bigint
);


ALTER TABLE public.cart_detail OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16687)
-- Name: cart_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_detail_id_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 219
-- Name: cart_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_detail_id_seq OWNED BY public.cart_detail.id;


--
-- TOC entry 222 (class 1259 OID 16695)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    sum integer NOT NULL,
    user_id bigint,
    CONSTRAINT carts_sum_check CHECK ((sum >= 0))
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16694)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 221
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 224 (class 1259 OID 16703)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    image character varying(255),
    name character varying(255),
    status boolean NOT NULL,
    type_id bigint
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16702)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 226 (class 1259 OID 16712)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact (
    id bigint NOT NULL,
    note character varying(255),
    notification_read boolean NOT NULL,
    notification_read_at timestamp(6) without time zone,
    reply_message character varying(255),
    reply_updated_at timestamp(6) without time zone,
    status boolean NOT NULL,
    subject_name character varying(255),
    user_id bigint
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16711)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_id_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 225
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- TOC entry 228 (class 1259 OID 16721)
-- Name: factory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factory (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.factory OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16720)
-- Name: factory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factory_id_seq OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 227
-- Name: factory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factory_id_seq OWNED BY public.factory.id;


--
-- TOC entry 230 (class 1259 OID 16728)
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp(6) without time zone,
    image_url character varying(255),
    reference_links text,
    status boolean NOT NULL,
    title character varying(255) NOT NULL,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.news OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16727)
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 229
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- TOC entry 232 (class 1259 OID 16737)
-- Name: order_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_detail (
    id bigint NOT NULL,
    price numeric(38,2),
    quantity integer NOT NULL,
    order_id bigint,
    product_id bigint
);


ALTER TABLE public.order_detail OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16736)
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_detail_id_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_detail_id_seq OWNED BY public.order_detail.id;


--
-- TOC entry 234 (class 1259 OID 16744)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    cancel_date timestamp(6) without time zone,
    complete_date timestamp(6) without time zone,
    note character varying(255),
    order_date timestamp(6) without time zone,
    payment_method character varying(255),
    receiver_address character varying(255),
    receiver_name character varying(255),
    receiver_phone character varying(255),
    status character varying(255),
    total_price double precision,
    user_id bigint,
    voucher_id bigint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16743)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 233
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 236 (class 1259 OID 16753)
-- Name: product_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_review (
    id bigint NOT NULL,
    rating integer NOT NULL,
    review_content character varying(255),
    visible character varying(255),
    order_detail_id bigint NOT NULL,
    product_id bigint,
    user_id bigint
);


ALTER TABLE public.product_review OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16752)
-- Name: product_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_review_id_seq OWNER TO postgres;

--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 235
-- Name: product_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_review_id_seq OWNED BY public.product_review.id;


--
-- TOC entry 238 (class 1259 OID 16762)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    detail_desc character varying(255),
    image character varying(255),
    material character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    price double precision NOT NULL,
    quantity bigint NOT NULL,
    short_desc character varying(255),
    sold bigint NOT NULL,
    status boolean NOT NULL,
    updated_at timestamp(6) without time zone,
    weight double precision NOT NULL,
    category_id bigint,
    factory_id bigint,
    target_id bigint,
    type_id bigint
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16761)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 237
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 240 (class 1259 OID 16771)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    description character varying(255),
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16770)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 239
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 217 (class 1259 OID 16667)
-- Name: spring_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


ALTER TABLE public.spring_session OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16675)
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


ALTER TABLE public.spring_session_attributes OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16780)
-- Name: target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.target (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.target OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16779)
-- Name: target_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.target_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.target_id_seq OWNER TO postgres;

--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 241
-- Name: target_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.target_id_seq OWNED BY public.target.id;


--
-- TOC entry 244 (class 1259 OID 16787)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    description character varying(255),
    name character varying(255) NOT NULL,
    status boolean NOT NULL,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16786)
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.types_id_seq OWNER TO postgres;

--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 243
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- TOC entry 245 (class 1259 OID 16795)
-- Name: user_vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_vouchers (
    user_id bigint NOT NULL,
    voucher_id bigint NOT NULL
);


ALTER TABLE public.user_vouchers OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16799)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    address character varying(255),
    avatar character varying(255),
    email character varying(255) NOT NULL,
    full_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    status boolean NOT NULL,
    role_id bigint
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 16798)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 246
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 249 (class 1259 OID 16808)
-- Name: vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vouchers (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    discount integer NOT NULL,
    quantity integer NOT NULL,
    title character varying(255) NOT NULL,
    valid_from timestamp(6) without time zone NOT NULL,
    valid_to timestamp(6) without time zone NOT NULL,
    deleted boolean NOT NULL
);


ALTER TABLE public.vouchers OWNER TO postgres;

--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 249
-- Name: COLUMN vouchers.deleted; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.vouchers.deleted IS 'Soft-delete indicator';


--
-- TOC entry 248 (class 1259 OID 16807)
-- Name: vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_id_seq OWNER TO postgres;

--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 248
-- Name: vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vouchers_id_seq OWNED BY public.vouchers.id;


--
-- TOC entry 251 (class 1259 OID 16817)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 16816)
-- Name: wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.wishlist_id_seq OWNER TO postgres;

--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 250
-- Name: wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;


--
-- TOC entry 4850 (class 2604 OID 16954)
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- TOC entry 4834 (class 2604 OID 16691)
-- Name: cart_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_detail ALTER COLUMN id SET DEFAULT nextval('public.cart_detail_id_seq'::regclass);


--
-- TOC entry 4835 (class 2604 OID 16698)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 4836 (class 2604 OID 16706)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 4837 (class 2604 OID 16715)
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- TOC entry 4838 (class 2604 OID 16724)
-- Name: factory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factory ALTER COLUMN id SET DEFAULT nextval('public.factory_id_seq'::regclass);


--
-- TOC entry 4839 (class 2604 OID 16731)
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- TOC entry 4840 (class 2604 OID 16740)
-- Name: order_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail ALTER COLUMN id SET DEFAULT nextval('public.order_detail_id_seq'::regclass);


--
-- TOC entry 4841 (class 2604 OID 16747)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4842 (class 2604 OID 16756)
-- Name: product_review id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review ALTER COLUMN id SET DEFAULT nextval('public.product_review_id_seq'::regclass);


--
-- TOC entry 4843 (class 2604 OID 16765)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 4844 (class 2604 OID 16774)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4845 (class 2604 OID 16783)
-- Name: target id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target ALTER COLUMN id SET DEFAULT nextval('public.target_id_seq'::regclass);


--
-- TOC entry 4846 (class 2604 OID 16790)
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- TOC entry 4847 (class 2604 OID 16802)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4848 (class 2604 OID 16811)
-- Name: vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers ALTER COLUMN id SET DEFAULT nextval('public.vouchers_id_seq'::regclass);


--
-- TOC entry 4849 (class 2604 OID 16820)
-- Name: wishlist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);


--
-- TOC entry 5105 (class 0 OID 16951)
-- Dependencies: 253
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, admin_notes, booking_date, booking_time, created_at, customer_name, description, email, laptop_brand, laptop_model, phone_number, service_type, status, user_id) FROM stdin;
1	Nhớ mang tiền theo, thiếu tiền coi chừng tao	2025-06-30	08:00:00	2025-06-29	Nguyễn Đăng Khoa	Cần thay keo và vệ sinh	customer01@gmail.com	lenovo	LOQ 15XIR9	0916612354	CLEANING	APPROVED	2
2	ram của bạn được bảo hành 2 năm nhé, nếu có lỗi thì mang lại shop kiểm tra	2025-07-05	15:00:00	2025-07-04	Chung Gia Kien	Cần shop hỗ trợ lắm thêm ram và ssd	khienchung@gmail.com	Lenovo	Legion Y7000P	0123456789	UPGRADE	COMPLETED	3
3	\N	2025-07-05	09:00:00	2025-07-04	Kiện Chung	Màn bật không lên	kienchung@gmail.com	lenovo	Legion 5pro	0916612354	DIAGNOSIS	PENDING	3
\.


--
-- TOC entry 5072 (class 0 OID 16688)
-- Dependencies: 220
-- Data for Name: cart_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_detail (id, price, quantity, cart_id, product_id) FROM stdin;
6	2000000	1	3	5
\.


--
-- TOC entry 5074 (class 0 OID 16695)
-- Dependencies: 222
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, sum, user_id) FROM stdin;
3	1	2
\.


--
-- TOC entry 5076 (class 0 OID 16703)
-- Dependencies: 224
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, image, name, status, type_id) FROM stdin;
1	1751174968451-istockphoto-1086009348-612x612.jpg	Laptop	t	1
2	1751207017138-istockphoto-1086009348-612x612.jpg	Component	t	2
3	1751213079145-istockphoto-1086009348-612x612.jpg	Tai nghe	t	3
\.


--
-- TOC entry 5078 (class 0 OID 16712)
-- Dependencies: 226
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact (id, note, notification_read, notification_read_at, reply_message, reply_updated_at, status, subject_name, user_id) FROM stdin;
1	Bán đồ dởm	f	2025-07-01 13:49:50.287716	dởm bà mày	2025-07-01 13:48:57.964326	t	SSD fake	2
\.


--
-- TOC entry 5080 (class 0 OID 16721)
-- Dependencies: 228
-- Data for Name: factory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factory (id, name) FROM stdin;
1	Lenovo
2	Dell
3	Acer
4	Kington
5	Marshall
\.


--
-- TOC entry 5082 (class 0 OID 16728)
-- Dependencies: 230
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, content, created_at, image_url, reference_links, status, title, updated_at) FROM stdin;
1	From 30-02-25 to 31-02-25 sale 50% when buy SSD Kington	2025-07-01 13:46:14.455762	/upload/news/b0ff8e9c-0b9e-46dc-a2ec-3487154e0172-ssd.png		t	sale 50% for SSD Kington 256GB	\N
\.


--
-- TOC entry 5084 (class 0 OID 16737)
-- Dependencies: 232
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_detail (id, price, quantity, order_id, product_id) FROM stdin;
1	10000000.00	2	1	2
2	8000000.00	1	2	4
3	8000000.00	1	3	4
4	8000000.00	1	4	4
5	8000000.00	1	5	4
6	8000000.00	1	6	4
7	8000000.00	1	7	4
8	8000000.00	1	8	4
9	8000000.00	1	9	4
10	8000000.00	1	10	4
11	8000000.00	1	11	4
12	8000000.00	1	12	4
13	8000000.00	1	13	4
14	8000000.00	1	14	4
15	8000000.00	1	15	4
16	8000000.00	1	16	4
17	8000000.00	1	17	4
18	8000000.00	1	18	4
19	8000000.00	1	19	4
20	8000000.00	1	20	4
21	8000000.00	1	21	4
22	8000000.00	1	22	4
23	8000000.00	1	23	4
24	8000000.00	1	24	4
25	8000000.00	1	25	4
26	10000000.00	1	26	2
27	8000000.00	1	27	4
28	8000000.00	1	28	4
29	8000000.00	1	29	4
30	8000000.00	1	30	4
31	8000000.00	1	31	4
32	8000000.00	1	32	4
33	8000000.00	1	33	4
34	8000000.00	1	34	4
35	8000000.00	1	35	4
36	8000000.00	1	36	4
37	8000000.00	1	37	4
38	8000000.00	1	38	4
39	8000000.00	1	39	4
40	8000000.00	1	40	4
41	8000000.00	1	41	4
42	8000000.00	1	42	4
43	8000000.00	1	43	4
44	8000000.00	1	44	4
45	8000000.00	1	45	4
46	8000000.00	1	46	4
47	8000000.00	1	47	4
48	8000000.00	1	48	4
49	8000000.00	1	49	4
50	8000000.00	1	50	4
51	8000000.00	1	51	4
52	8000000.00	1	52	4
53	8000000.00	1	53	4
54	8000000.00	1	54	4
55	8000000.00	1	55	4
56	8000000.00	1	56	4
57	8000000.00	1	57	4
58	8000000.00	1	58	4
59	8000000.00	1	59	4
60	8000000.00	1	60	4
61	8000000.00	1	61	4
62	8000000.00	1	62	4
63	8000000.00	1	63	4
64	8000000.00	1	64	4
65	8000000.00	1	65	4
66	8000000.00	1	66	4
67	8000000.00	1	67	4
68	8000000.00	1	68	4
69	8000000.00	1	69	4
70	8000000.00	1	70	4
71	8000000.00	1	71	4
72	8000000.00	1	72	4
73	8000000.00	1	73	4
74	8000000.00	1	74	4
75	8000000.00	1	75	4
76	8000000.00	1	76	4
77	8000000.00	1	77	4
78	8000000.00	1	78	4
79	8000000.00	1	79	4
80	8000000.00	1	80	4
81	8000000.00	1	81	4
82	8000000.00	1	82	4
83	8000000.00	1	83	4
84	8000000.00	1	84	4
85	8000000.00	1	85	4
86	8000000.00	1	86	4
87	8000000.00	1	87	4
88	8000000.00	1	88	4
89	8000000.00	1	89	4
90	8000000.00	1	90	4
91	8000000.00	1	91	4
92	8000000.00	1	92	4
93	8000000.00	1	93	4
94	8000000.00	1	94	4
95	8000000.00	1	95	4
96	8000000.00	1	96	4
97	8000000.00	1	97	4
98	8000000.00	1	98	4
99	8000000.00	1	99	4
100	8000000.00	1	100	4
101	8000000.00	1	101	4
102	8000000.00	1	102	4
103	8000000.00	1	103	4
104	8000000.00	1	104	4
105	8000000.00	1	105	4
106	8000000.00	1	106	4
107	8000000.00	1	107	4
108	8000000.00	1	108	4
109	8000000.00	1	109	4
110	8000000.00	1	110	4
\.


--
-- TOC entry 5086 (class 0 OID 16744)
-- Dependencies: 234
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) FROM stdin;
1	\N	2025-07-02 14:51:43.707928	nhanh | Transaction ID: 15049159 | Payment Time: 01/07/2025 13:10:56	2025-07-01 13:10:11.847492	VNPAY	Vinh Long	Khoa	0912345678	COMPLETE	20030000	2	\N
2	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
3	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
4	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
5	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
6	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
7	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
8	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
9	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
10	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
11	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
12	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
13	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
14	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
15	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
16	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
17	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
18	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
19	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
20	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
21	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
22	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
23	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
24	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
25	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
26	\N	\N	Giao nhanh | Transaction ID: 15083203 | Payment Time: 18/07/2025 14:13:28	2025-07-18 14:12:35.647412	VNPAY	Vinh Long	khoa	0916612354	BANKING	10030000	2	\N
27	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
28	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
29	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
30	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
31	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
32	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
33	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
34	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
35	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
36	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
37	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
38	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
39	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
40	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
41	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
42	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
43	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
44	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
45	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
46	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
47	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
48	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
49	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
50	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
51	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
52	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
53	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
54	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
55	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
56	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
57	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
58	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
59	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
60	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
61	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
62	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
63	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
64	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
65	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
66	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
67	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
68	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
69	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
70	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
71	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
72	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
73	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
74	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
75	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
76	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
77	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
78	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
79	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
80	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
81	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
82	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
83	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
84	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
85	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
86	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
87	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
88	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
89	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
90	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
91	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
92	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
93	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
94	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
95	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
96	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
97	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
98	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
99	\N	2024-01-12 15:00:00	\N	2024-01-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1100000	4	\N
100	\N	2024-02-12 15:00:00	\N	2024-02-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1200000	4	\N
101	\N	2024-03-12 15:00:00	\N	2024-03-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1300000	4	\N
102	\N	2024-04-12 15:00:00	\N	2024-04-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1400000	4	\N
103	\N	2024-05-12 15:00:00	\N	2024-05-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1500000	4	\N
104	\N	2024-06-12 15:00:00	\N	2024-06-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1600000	4	\N
105	\N	2024-07-12 15:00:00	\N	2024-07-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1700000	4	\N
106	\N	2024-08-12 15:00:00	\N	2024-08-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1800000	4	\N
107	\N	2024-09-12 15:00:00	\N	2024-09-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	1900000	4	\N
108	\N	2024-10-12 15:00:00	\N	2024-10-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2000000	4	\N
109	\N	2024-11-12 15:00:00	\N	2024-11-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2100000	4	\N
110	\N	2024-12-12 15:00:00	\N	2024-12-10 10:00:00	CASH	Hà Nội	Demo User	0123456789	COMPLETE	2200000	4	\N
\.


--
-- TOC entry 5088 (class 0 OID 16753)
-- Dependencies: 236
-- Data for Name: product_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_review (id, rating, review_content, visible, order_detail_id, product_id, user_id) FROM stdin;
1	5	siêu mạnh, chiến game mượt, máy mát do tản nhiệt khủng	Yes	1	2	2
\.


--
-- TOC entry 5090 (class 0 OID 16762)
-- Dependencies: 238
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) FROM stdin;
4	2025-06-29 20:51:54.837576	NVIDIA GeForce RTX 2090 12GB GDDR6 VRAM	1751344187908-aceNitro.png	Nhom	Acer Nitro V tiger	8000000	5	New 2025 Acer gaming laptop	0	t	2025-07-01 11:29:47.912635	0	1	3	1	1
3	2025-06-29 20:49:55.694246	NVIDIA GeForce RTX 5090 12GB GDDR6 VRAM	1751344196313-DellAlien.png	Nhom	Dell Alienware	30000000	25	New 2025 dell gaming laptop	0	t	2025-07-01 11:29:56.315982	0	1	2	1	1
16	2025-06-29 22:48:54.891603	UHD intel core Ultra 9	1751344207244-lenovo ThinkPad.png	Nhom	Lenovo ThinkPad 	12500000	23		0	t	2025-07-01 11:30:07.24544	0	1	1	2	1
18	2025-07-01 09:39:38.729462	NVIDIA GeForce RTX 3050 4GB GDDR6\r\nAMD Radeon Graphics\r\n\r\nDung lượng RAM\t\r\n16GB\r\n\r\nLoại RAM\t\r\nDDR5-5600 SO-DIMM\r\n\r\nSố khe ram\t\r\n2 khe (Tối đa 32GB)\r\n\r\nỔ cứng\t\r\n512GB PCIe 4.0 NVMe M.2 SSD (2 Khe cắm M.2 hỗ trợ SATA hoặc NVMe, Tối đa 1TB)	1751344216060-asus tuf.png	Nhom	Asus Tuf gaming	18000000	12		0	t	2025-07-01 11:30:16.091983	0	1	3	1	1
17	2025-06-29 23:06:50.745172	Dài 7 cm - Rộng 6.6 cm - Cao 4 cm	1751344226585-Tainghe.png	Nhom	Tai nghe Bluetooth chụp tai Marshall Major 5	1350000	23		0	t	2025-07-01 11:30:26.592861	0	3	5	\N	3
5	2025-06-29 21:22:09.412214	1TB dung lượng	1751344236753-ssd.png	Nhom	SSD Kington	2000000	23		0	t	2025-07-01 11:30:36.755583	0	2	4	\N	2
1	2025-06-29 20:43:08.741576	NVIDIA GeForce RTX 4070 8GB GDDR6, Boost Clock 2175MHz, TGP 140W	1751345009819-Legion.png	Nhom	Lenovo Legion	25000000	25	New 2025 lenovo gaming laptop	0	t	2025-07-01 11:43:29.825407	0	1	1	1	1
2	2025-06-29 20:43:56.059876	NVIDIA GeForce RTX 4070 8GB GDDR6, Boost Clock 2175MHz, TGP 140W	1751344259285-Lenovo Loq.png	Nhom	Lenovo LOQ	10000000	22	New 2025 lenovo gaming laptop	3	t	2025-07-18 14:12:35.651934	0	1	1	1	1
\.


--
-- TOC entry 5092 (class 0 OID 16771)
-- Dependencies: 240
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, description, name) FROM stdin;
1	ADMIN	ADMIN
2	EMPLOYEE	EMPLOYEE
3	CUSTOMER	CUSTOMER
\.


--
-- TOC entry 5069 (class 0 OID 16667)
-- Dependencies: 217
-- Data for Name: spring_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) FROM stdin;
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	2f01e763-dc21-4f71-bd57-63a447968491	1757467213436	1757467276448	2592000	1760059276448	khoandce170420@fpt.edu.vn
c524d5fb-e469-445d-b48c-a2c6e08b0cb9	a63aac75-a58c-49dc-95a7-d0cf3e9ca2d7	1759631522419	1759631524487	1800	1759633324487	\N
d0e7300f-d44b-4964-bb83-7d81478ae0ed	585dc33f-91f6-4060-861f-4aec914b5145	1757467077429	1759631484293	2592000	1762223484293	customer01@gmail.com
\.


--
-- TOC entry 5070 (class 0 OID 16675)
-- Dependencies: 218
-- Data for Name: spring_session_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) FROM stdin;
d0e7300f-d44b-4964-bb83-7d81478ae0ed	SPRING_SECURITY_CONTEXT	\\xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000026c0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000026c0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479000000000000026c0200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000d524f4c455f435553544f4d45527871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000026c0200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002463333337633862372d366666302d346537632d613664362d31643539306139383332373370737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e55736572000000000000026c0200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657374000f4c6a6176612f7574696c2f5365743b4c000870617373776f726471007e000f4c0008757365726e616d6571007e000f787001010101737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e000a737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f72000000000000026c020000787077040000000171007e00107870740014637573746f6d6572303140676d61696c2e636f6d
d0e7300f-d44b-4964-bb83-7d81478ae0ed	id	\\xaced00057372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002
d0e7300f-d44b-4964-bb83-7d81478ae0ed	avatar	\\xaced0005740019313735313335333332333335302d6d616b6961746f2e706e67
d0e7300f-d44b-4964-bb83-7d81478ae0ed	email	\\xaced0005740014637573746f6d6572303140676d61696c2e636f6d
d0e7300f-d44b-4964-bb83-7d81478ae0ed	username	\\xaced0005740014637573746f6d6572303140676d61696c2e636f6d
d0e7300f-d44b-4964-bb83-7d81478ae0ed	sum	\\xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000001
c524d5fb-e469-445d-b48c-a2c6e08b0cb9	org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN	\\xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002436633834396132612d383064652d343264322d616330382d343431383534626433333233
c524d5fb-e469-445d-b48c-a2c6e08b0cb9	jakarta.servlet.jsp.jstl.fmt.request.charset	\\xaced00057400055554462d38
d0e7300f-d44b-4964-bb83-7d81478ae0ed	org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN	\\xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002435306564303037622d396432332d343135652d393564302d623563306435353238303761
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	SPRING_SECURITY_SAVED_REQUEST	\\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e44656661756c74536176656452657175657374000000000000026c02000f49000a736572766572506f72744c000b636f6e74657874506174687400124c6a6176612f6c616e672f537472696e673b4c0007636f6f6b6965737400154c6a6176612f7574696c2f41727261794c6973743b4c00076865616465727374000f4c6a6176612f7574696c2f4d61703b4c00076c6f63616c657371007e00024c001c6d61746368696e6752657175657374506172616d657465724e616d6571007e00014c00066d6574686f6471007e00014c000a706172616d657465727371007e00034c000870617468496e666f71007e00014c000b7175657279537472696e6771007e00014c000a7265717565737455524971007e00014c000a7265717565737455524c71007e00014c0006736368656d6571007e00014c000a7365727665724e616d6571007e00014c000b736572766c65745061746871007e0001787000001f90740000737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200396f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e5361766564436f6f6b6965000000000000026c0200084900066d61784167655a000673656375726549000776657273696f6e4c0007636f6d6d656e7471007e00014c0006646f6d61696e71007e00014c00046e616d6571007e00014c00047061746871007e00014c000576616c756571007e00017870ffffffff0000000000707074000753455353494f4e707400304e6a41314d5456694e5463744e545532595330304d6a517a4c5745354f4441744e6a457a4d6d45784d4441344e6a637878737200116a6176612e7574696c2e547265654d61700cc1f63e2d256ae60300014c000a636f6d70617261746f727400164c6a6176612f7574696c2f436f6d70617261746f723b78707372002a6a6176612e6c616e672e537472696e672443617365496e73656e736974697665436f6d70617261746f7277035c7d5c50e5ce020000787077040000000f7400066163636570747371007e000600000001770400000001740087746578742f68746d6c2c6170706c69636174696f6e2f7868746d6c2b786d6c2c6170706c69636174696f6e2f786d6c3b713d302e392c696d6167652f617669662c696d6167652f776562702c696d6167652f61706e672c2a2f2a3b713d302e382c6170706c69636174696f6e2f7369676e65642d65786368616e67653b763d62333b713d302e377874000f6163636570742d656e636f64696e677371007e000600000001770400000001740017677a69702c206465666c6174652c2062722c207a7374647874000f6163636570742d6c616e67756167657371007e00060000000177040000000174002076692c6a613b713d302e392c656e2d55533b713d302e382c656e3b713d302e377874000a636f6e6e656374696f6e7371007e00060000000177040000000174000a6b6565702d616c69766578740006636f6f6b69657371007e00060000000177040000000174003853455353494f4e3d4e6a41314d5456694e5463744e545532595330304d6a517a4c5745354f4441744e6a457a4d6d45784d4441344e6a637878740004686f73747371007e00060000000177040000000174000e6c6f63616c686f73743a38303830787400097365632d63682d75617371007e000600000001770400000001740041224368726f6d69756d223b763d22313430222c20224e6f743d413f4272616e64223b763d223234222c2022476f6f676c65204368726f6d65223b763d2231343022787400107365632d63682d75612d6d6f62696c657371007e0006000000017704000000017400023f30787400127365632d63682d75612d706c6174666f726d7371007e0006000000017704000000017400092257696e646f7773227874000e7365632d66657463682d646573747371007e000600000001770400000001740008646f63756d656e747874000e7365632d66657463682d6d6f64657371007e0006000000017704000000017400086e617669676174657874000e7365632d66657463682d736974657371007e0006000000017704000000017400046e6f6e657874000e7365632d66657463682d757365727371007e0006000000017704000000017400023f3178740019757067726164652d696e7365637572652d72657175657374737371007e000600000001770400000001740001317874000a757365722d6167656e747371007e00060000000177040000000174006f4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f3134302e302e302e30205361666172692f3533372e333678787371007e000600000004770400000004737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e74727971007e00014c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff71007e000571007e0005740002766971007e000571007e0005787371007e003fffffffff71007e000571007e00057400026a6171007e000571007e0005787371007e003fffffffff740002555371007e0005740002656e71007e000571007e0005787371007e003fffffffff71007e000571007e000571007e004671007e000571007e00057878740008636f6e74696e75657400034745547371007e000c707704000000007870707400062f61646d696e74001b687474703a2f2f6c6f63616c686f73743a383038302f61646d696e740004687474707400096c6f63616c686f73747400062f61646d696e
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN	\\xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002463343763326536302d356663612d343833612d623438302d643762613830373136396535
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	jakarta.servlet.jsp.jstl.fmt.request.charset	\\xaced00057400055554462d38
d0e7300f-d44b-4964-bb83-7d81478ae0ed	voucherCode	\\xaced0005740000
d0e7300f-d44b-4964-bb83-7d81478ae0ed	receiverAddress	\\xaced000574000956696e68204c6f6e67
d0e7300f-d44b-4964-bb83-7d81478ae0ed	amount	\\xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870001ef9b0
d0e7300f-d44b-4964-bb83-7d81478ae0ed	receiverPhone	\\xaced000574000a30323334333536373839
d0e7300f-d44b-4964-bb83-7d81478ae0ed	receiverName	\\xaced00057400146e677579e1bb856e20c491c4836e67206b686f61
d0e7300f-d44b-4964-bb83-7d81478ae0ed	orderInfo	\\xaced00057400026f6b
d0e7300f-d44b-4964-bb83-7d81478ae0ed	jakarta.servlet.jsp.jstl.fmt.request.charset	\\xaced00057400055554462d38
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	SPRING_SECURITY_CONTEXT	\\xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000026c0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000026c0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479000000000000026c0200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000026c0200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002436303531356235372d353536612d343234332d613938302d36313332613130303836373170737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e55736572000000000000026c0200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657374000f4c6a6176612f7574696c2f5365743b4c000870617373776f726471007e000f4c0008757365726e616d6571007e000f787001010101737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e000a737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f72000000000000026c020000787077040000000171007e001078707400196b686f616e646365313730343230406670742e6564752e766e
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	sum	\\xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	id	\\xaced00057372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000001
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	email	\\xaced00057400196b686f616e646365313730343230406670742e6564752e766e
4075393d-e9f0-4d1e-aa7a-1f1f04283b6d	username	\\xaced00057400196b686f616e646365313730343230406670742e6564752e766e
\.


--
-- TOC entry 5094 (class 0 OID 16780)
-- Dependencies: 242
-- Data for Name: target; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.target (id, name) FROM stdin;
1	Gaming
2	Văn Phòng
3	Laptop AI
\.


--
-- TOC entry 5096 (class 0 OID 16787)
-- Dependencies: 244
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, created_at, description, name, status, updated_at) FROM stdin;
1	\N	\N	Laptop	t	\N
2	\N	\N	Linh Kiện	t	\N
3	\N	\N	Phụ Kiện	t	\N
\.


--
-- TOC entry 5097 (class 0 OID 16795)
-- Dependencies: 245
-- Data for Name: user_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_vouchers (user_id, voucher_id) FROM stdin;
\.


--
-- TOC entry 5099 (class 0 OID 16799)
-- Dependencies: 247
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, address, avatar, email, full_name, password, phone, status, role_id) FROM stdin;
1	Vinh Nghe An	\N	khoandce170420@fpt.edu.vn	Khoa nguyen dang	$2a$10$GefOWjDwbufPI/cE7pYBM.T5XXJzllLdpZWG26Atf8P8B/jEcN.M6	0916612355	t	1
2	Vinh Long	1751353323350-makiato.png	customer01@gmail.com	Khoa Nguyen	$2a$10$LUoKeORvGXZEGRVzZtO1buKQnKx4owAVTI9IvoX6NAPMwfMX/meEC	0916612354	t	3
3	Ha Noi	1751562178415-Lenovo Loq.png	customer02@gmail.com	customer	$2a$10$zK.jLZzdBC3tYLEF0iVZHOi7I94odWU2yc0/CnjMJgAS2NXN0Qcci	0123456788	t	3
4	Hà Nội	\N	demo@gundam.com	Demo User	123456	0123456789	f	\N
\.


--
-- TOC entry 5101 (class 0 OID 16808)
-- Dependencies: 249
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vouchers (id, code, description, discount, quantity, title, valid_from, valid_to, deleted) FROM stdin;
\.


--
-- TOC entry 5103 (class 0 OID 16817)
-- Dependencies: 251
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, product_id, user_id) FROM stdin;
6	1	3
\.


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 252
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 3, true);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 219
-- Name: cart_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_detail_id_seq', 6, true);


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 221
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 3, true);


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 223
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 3, true);


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 225
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_id_seq', 1, true);


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 227
-- Name: factory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factory_id_seq', 5, true);


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 229
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, true);


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_detail_id_seq', 110, true);


--
-- TOC entry 5139 (class 0 OID 0)
-- Dependencies: 233
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 110, true);


--
-- TOC entry 5140 (class 0 OID 0)
-- Dependencies: 235
-- Name: product_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_review_id_seq', 1, true);


--
-- TOC entry 5141 (class 0 OID 0)
-- Dependencies: 237
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 18, true);


--
-- TOC entry 5142 (class 0 OID 0)
-- Dependencies: 239
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- TOC entry 5143 (class 0 OID 0)
-- Dependencies: 241
-- Name: target_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.target_id_seq', 3, true);


--
-- TOC entry 5144 (class 0 OID 0)
-- Dependencies: 243
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 1, false);


--
-- TOC entry 5145 (class 0 OID 0)
-- Dependencies: 246
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 5146 (class 0 OID 0)
-- Dependencies: 248
-- Name: vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vouchers_id_seq', 1, false);


--
-- TOC entry 5147 (class 0 OID 0)
-- Dependencies: 250
-- Name: wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wishlist_id_seq', 6, true);


--
-- TOC entry 4900 (class 2606 OID 16960)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- TOC entry 4862 (class 2606 OID 16693)
-- Name: cart_detail cart_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_detail
    ADD CONSTRAINT cart_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 4864 (class 2606 OID 16701)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 16710)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4870 (class 2606 OID 16719)
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 4872 (class 2606 OID 16726)
-- Name: factory factory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factory
    ADD CONSTRAINT factory_pkey PRIMARY KEY (id);


--
-- TOC entry 4874 (class 2606 OID 16735)
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- TOC entry 4876 (class 2606 OID 16742)
-- Name: order_detail order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- TOC entry 4878 (class 2606 OID 16751)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4880 (class 2606 OID 16760)
-- Name: product_review product_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT product_review_pkey PRIMARY KEY (id);


--
-- TOC entry 4884 (class 2606 OID 16769)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4886 (class 2606 OID 16778)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4860 (class 2606 OID 16681)
-- Name: spring_session_attributes spring_session_attributes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);


--
-- TOC entry 4858 (class 2606 OID 16671)
-- Name: spring_session spring_session_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);


--
-- TOC entry 4888 (class 2606 OID 16785)
-- Name: target target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.target
    ADD CONSTRAINT target_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 16794)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 4894 (class 2606 OID 16828)
-- Name: vouchers uk_30ftp2biebbvpik8e49wlmady; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT uk_30ftp2biebbvpik8e49wlmady UNIQUE (code);


--
-- TOC entry 4866 (class 2606 OID 16824)
-- Name: carts uk_64t7ox312pqal3p7fg9o503c2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT uk_64t7ox312pqal3p7fg9o503c2 UNIQUE (user_id);


--
-- TOC entry 4882 (class 2606 OID 16826)
-- Name: product_review uk_jtd53o66ltwf9lcv4xp7bgria; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT uk_jtd53o66ltwf9lcv4xp7bgria UNIQUE (order_detail_id);


--
-- TOC entry 4892 (class 2606 OID 16806)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4896 (class 2606 OID 16815)
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 4898 (class 2606 OID 16822)
-- Name: wishlist wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);


--
-- TOC entry 4854 (class 1259 OID 16672)
-- Name: spring_session_ix1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);


--
-- TOC entry 4855 (class 1259 OID 16673)
-- Name: spring_session_ix2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);


--
-- TOC entry 4856 (class 1259 OID 16674)
-- Name: spring_session_ix3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);


--
-- TOC entry 4909 (class 2606 OID 16859)
-- Name: orders fk32ql8ubntj5uh44ph9659tiih; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk32ql8ubntj5uh44ph9659tiih FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4918 (class 2606 OID 16904)
-- Name: user_vouchers fk40ig7khk2v79rbqaj98mf1g2q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_vouchers
    ADD CONSTRAINT fk40ig7khk2v79rbqaj98mf1g2q FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id);


--
-- TOC entry 4921 (class 2606 OID 16919)
-- Name: wishlist fk6p7qhvy1bfkri13u29x6pu8au; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fk6p7qhvy1bfkri13u29x6pu8au FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4914 (class 2606 OID 16889)
-- Name: products fk7efmy5eawvapcgt19t16i3tfc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk7efmy5eawvapcgt19t16i3tfc FOREIGN KEY (factory_id) REFERENCES public.factory(id);


--
-- TOC entry 4919 (class 2606 OID 16909)
-- Name: user_vouchers fk90ahc2var0yrghyxr9tapdokg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_vouchers
    ADD CONSTRAINT fk90ahc2var0yrghyxr9tapdokg FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4904 (class 2606 OID 16839)
-- Name: carts fkb5o626f86h46m4s7ms6ginnop; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT fkb5o626f86h46m4s7ms6ginnop FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4902 (class 2606 OID 16829)
-- Name: cart_detail fkbql1m2v2po7hcawonqsgqex88; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_detail
    ADD CONSTRAINT fkbql1m2v2po7hcawonqsgqex88 FOREIGN KEY (cart_id) REFERENCES public.carts(id);


--
-- TOC entry 4906 (class 2606 OID 16844)
-- Name: contact fkbxl6anxo14q097g8cd2e51v55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT fkbxl6anxo14q097g8cd2e51v55 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4907 (class 2606 OID 16854)
-- Name: order_detail fkc7q42e9tu0hslx6w4wxgomhvn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fkc7q42e9tu0hslx6w4wxgomhvn FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4903 (class 2606 OID 16834)
-- Name: cart_detail fkclb1c0wg3mofxnpgidib1t987; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_detail
    ADD CONSTRAINT fkclb1c0wg3mofxnpgidib1t987 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4910 (class 2606 OID 16864)
-- Name: orders fkdimvsocblb17f45ikjr6xn1wj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkdimvsocblb17f45ikjr6xn1wj FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id);


--
-- TOC entry 4923 (class 2606 OID 16961)
-- Name: bookings fkeyog2oic85xg7hsu2je2lx3s6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT fkeyog2oic85xg7hsu2je2lx3s6 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4911 (class 2606 OID 16869)
-- Name: product_review fkfli4lg5b89qemkt6b0nbraiax; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT fkfli4lg5b89qemkt6b0nbraiax FOREIGN KEY (order_detail_id) REFERENCES public.order_detail(id);


--
-- TOC entry 4915 (class 2606 OID 16894)
-- Name: products fkglin55cplgkiohd65wttjb4v5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkglin55cplgkiohd65wttjb4v5 FOREIGN KEY (target_id) REFERENCES public.target(id);


--
-- TOC entry 4912 (class 2606 OID 16879)
-- Name: product_review fkib6mkfaqaj0beph37y4qxmu9x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT fkib6mkfaqaj0beph37y4qxmu9x FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4905 (class 2606 OID 16966)
-- Name: categories fkkm5wja7uslctdl0vqy2q3p2r8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fkkm5wja7uslctdl0vqy2q3p2r8 FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- TOC entry 4913 (class 2606 OID 16874)
-- Name: product_review fklkf2n9dkjx32vcqqmds9v62; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_review
    ADD CONSTRAINT fklkf2n9dkjx32vcqqmds9v62 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4916 (class 2606 OID 16899)
-- Name: products fkoeqkpxafyckvhf0g4cxc62yn8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkoeqkpxafyckvhf0g4cxc62yn8 FOREIGN KEY (type_id) REFERENCES public.types(id);


--
-- TOC entry 4917 (class 2606 OID 16884)
-- Name: products fkog2rp4qthbtt2lfyhfo32lsw9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fkog2rp4qthbtt2lfyhfo32lsw9 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4920 (class 2606 OID 16914)
-- Name: users fkp56c1712k691lhsyewcssf40f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkp56c1712k691lhsyewcssf40f FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 4908 (class 2606 OID 16849)
-- Name: order_detail fkrws2q0si6oyd6il8gqe2aennc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_detail
    ADD CONSTRAINT fkrws2q0si6oyd6il8gqe2aennc FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4922 (class 2606 OID 16924)
-- Name: wishlist fktrd6335blsefl2gxpb8lr0gr7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT fktrd6335blsefl2gxpb8lr0gr7 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4901 (class 2606 OID 16682)
-- Name: spring_session_attributes spring_session_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;


-- Completed on 2025-10-05 11:15:05

--
-- PostgreSQL database dump complete
--

