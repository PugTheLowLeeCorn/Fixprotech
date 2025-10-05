--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-10-05 09:59:28

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
-- TOC entry 5105 (class 0 OID 16951)
-- Dependencies: 253
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bookings (id, admin_notes, booking_date, booking_time, created_at, customer_name, description, email, laptop_brand, laptop_model, phone_number, service_type, status, user_id) VALUES (1, 'Nhớ mang tiền theo, thiếu tiền coi chừng tao', '2025-06-30', '08:00:00', '2025-06-29', 'Nguyễn Đăng Khoa', 'Cần thay keo và vệ sinh', 'customer01@gmail.com', 'lenovo', 'LOQ 15XIR9', '0916612354', 'CLEANING', 'APPROVED', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.bookings (id, admin_notes, booking_date, booking_time, created_at, customer_name, description, email, laptop_brand, laptop_model, phone_number, service_type, status, user_id) VALUES (2, 'ram của bạn được bảo hành 2 năm nhé, nếu có lỗi thì mang lại shop kiểm tra', '2025-07-05', '15:00:00', '2025-07-04', 'Chung Gia Kien', 'Cần shop hỗ trợ lắm thêm ram và ssd', 'khienchung@gmail.com', 'Lenovo', 'Legion Y7000P', '0123456789', 'UPGRADE', 'COMPLETED', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.bookings (id, admin_notes, booking_date, booking_time, created_at, customer_name, description, email, laptop_brand, laptop_model, phone_number, service_type, status, user_id) VALUES (3, NULL, '2025-07-05', '09:00:00', '2025-07-04', 'Kiện Chung', 'Màn bật không lên', 'kienchung@gmail.com', 'lenovo', 'Legion 5pro', '0916612354', 'DIAGNOSIS', 'PENDING', 3) ON CONFLICT DO NOTHING;


--
-- TOC entry 5072 (class 0 OID 16688)
-- Dependencies: 220
-- Data for Name: cart_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_detail (id, price, quantity, cart_id, product_id) VALUES (6, 2000000, 1, 3, 5) ON CONFLICT DO NOTHING;


--
-- TOC entry 5074 (class 0 OID 16695)
-- Dependencies: 222
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carts (id, sum, user_id) VALUES (3, 1, 2) ON CONFLICT DO NOTHING;


--
-- TOC entry 5076 (class 0 OID 16703)
-- Dependencies: 224
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (id, image, name, status, type_id) VALUES (1, '1751174968451-istockphoto-1086009348-612x612.jpg', 'Laptop', true, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, image, name, status, type_id) VALUES (2, '1751207017138-istockphoto-1086009348-612x612.jpg', 'Component', true, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.categories (id, image, name, status, type_id) VALUES (3, '1751213079145-istockphoto-1086009348-612x612.jpg', 'Tai nghe', true, 3) ON CONFLICT DO NOTHING;


--
-- TOC entry 5078 (class 0 OID 16712)
-- Dependencies: 226
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.contact (id, note, notification_read, notification_read_at, reply_message, reply_updated_at, status, subject_name, user_id) VALUES (1, 'Bán đồ dởm', false, '2025-07-01 13:49:50.287716', 'dởm bà mày', '2025-07-01 13:48:57.964326', true, 'SSD fake', 2) ON CONFLICT DO NOTHING;


--
-- TOC entry 5080 (class 0 OID 16721)
-- Dependencies: 228
-- Data for Name: factory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factory (id, name) VALUES (1, 'Lenovo') ON CONFLICT DO NOTHING;
INSERT INTO public.factory (id, name) VALUES (2, 'Dell') ON CONFLICT DO NOTHING;
INSERT INTO public.factory (id, name) VALUES (3, 'Acer') ON CONFLICT DO NOTHING;
INSERT INTO public.factory (id, name) VALUES (4, 'Kington') ON CONFLICT DO NOTHING;
INSERT INTO public.factory (id, name) VALUES (5, 'Marshall') ON CONFLICT DO NOTHING;


--
-- TOC entry 5082 (class 0 OID 16728)
-- Dependencies: 230
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.news (id, content, created_at, image_url, reference_links, status, title, updated_at) VALUES (1, 'From 30-02-25 to 31-02-25 sale 50% when buy SSD Kington', '2025-07-01 13:46:14.455762', '/upload/news/b0ff8e9c-0b9e-46dc-a2ec-3487154e0172-ssd.png', '', true, 'sale 50% for SSD Kington 256GB', NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5084 (class 0 OID 16737)
-- Dependencies: 232
-- Data for Name: order_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (1, 10000000.00, 2, 1, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (2, 8000000.00, 1, 2, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (3, 8000000.00, 1, 3, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (4, 8000000.00, 1, 4, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (5, 8000000.00, 1, 5, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (6, 8000000.00, 1, 6, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (7, 8000000.00, 1, 7, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (8, 8000000.00, 1, 8, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (9, 8000000.00, 1, 9, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (10, 8000000.00, 1, 10, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (11, 8000000.00, 1, 11, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (12, 8000000.00, 1, 12, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (13, 8000000.00, 1, 13, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (14, 8000000.00, 1, 14, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (15, 8000000.00, 1, 15, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (16, 8000000.00, 1, 16, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (17, 8000000.00, 1, 17, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (18, 8000000.00, 1, 18, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (19, 8000000.00, 1, 19, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (20, 8000000.00, 1, 20, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (21, 8000000.00, 1, 21, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (22, 8000000.00, 1, 22, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (23, 8000000.00, 1, 23, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (24, 8000000.00, 1, 24, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (25, 8000000.00, 1, 25, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (26, 10000000.00, 1, 26, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (27, 8000000.00, 1, 27, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (28, 8000000.00, 1, 28, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (29, 8000000.00, 1, 29, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (30, 8000000.00, 1, 30, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (31, 8000000.00, 1, 31, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (32, 8000000.00, 1, 32, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (33, 8000000.00, 1, 33, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (34, 8000000.00, 1, 34, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (35, 8000000.00, 1, 35, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (36, 8000000.00, 1, 36, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (37, 8000000.00, 1, 37, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (38, 8000000.00, 1, 38, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (39, 8000000.00, 1, 39, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (40, 8000000.00, 1, 40, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (41, 8000000.00, 1, 41, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (42, 8000000.00, 1, 42, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (43, 8000000.00, 1, 43, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (44, 8000000.00, 1, 44, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (45, 8000000.00, 1, 45, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (46, 8000000.00, 1, 46, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (47, 8000000.00, 1, 47, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (48, 8000000.00, 1, 48, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (49, 8000000.00, 1, 49, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (50, 8000000.00, 1, 50, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (51, 8000000.00, 1, 51, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (52, 8000000.00, 1, 52, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (53, 8000000.00, 1, 53, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (54, 8000000.00, 1, 54, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (55, 8000000.00, 1, 55, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (56, 8000000.00, 1, 56, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (57, 8000000.00, 1, 57, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (58, 8000000.00, 1, 58, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (59, 8000000.00, 1, 59, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (60, 8000000.00, 1, 60, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (61, 8000000.00, 1, 61, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (62, 8000000.00, 1, 62, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (63, 8000000.00, 1, 63, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (64, 8000000.00, 1, 64, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (65, 8000000.00, 1, 65, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (66, 8000000.00, 1, 66, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (67, 8000000.00, 1, 67, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (68, 8000000.00, 1, 68, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (69, 8000000.00, 1, 69, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (70, 8000000.00, 1, 70, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (71, 8000000.00, 1, 71, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (72, 8000000.00, 1, 72, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (73, 8000000.00, 1, 73, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (74, 8000000.00, 1, 74, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (75, 8000000.00, 1, 75, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (76, 8000000.00, 1, 76, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (77, 8000000.00, 1, 77, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (78, 8000000.00, 1, 78, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (79, 8000000.00, 1, 79, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (80, 8000000.00, 1, 80, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (81, 8000000.00, 1, 81, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (82, 8000000.00, 1, 82, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (83, 8000000.00, 1, 83, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (84, 8000000.00, 1, 84, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (85, 8000000.00, 1, 85, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (86, 8000000.00, 1, 86, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (87, 8000000.00, 1, 87, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (88, 8000000.00, 1, 88, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (89, 8000000.00, 1, 89, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (90, 8000000.00, 1, 90, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (91, 8000000.00, 1, 91, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (92, 8000000.00, 1, 92, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (93, 8000000.00, 1, 93, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (94, 8000000.00, 1, 94, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (95, 8000000.00, 1, 95, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (96, 8000000.00, 1, 96, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (97, 8000000.00, 1, 97, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (98, 8000000.00, 1, 98, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (99, 8000000.00, 1, 99, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (100, 8000000.00, 1, 100, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (101, 8000000.00, 1, 101, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (102, 8000000.00, 1, 102, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (103, 8000000.00, 1, 103, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (104, 8000000.00, 1, 104, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (105, 8000000.00, 1, 105, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (106, 8000000.00, 1, 106, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (107, 8000000.00, 1, 107, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (108, 8000000.00, 1, 108, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (109, 8000000.00, 1, 109, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.order_detail (id, price, quantity, order_id, product_id) VALUES (110, 8000000.00, 1, 110, 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 5086 (class 0 OID 16744)
-- Dependencies: 234
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (1, NULL, '2025-07-02 14:51:43.707928', 'nhanh | Transaction ID: 15049159 | Payment Time: 01/07/2025 13:10:56', '2025-07-01 13:10:11.847492', 'VNPAY', 'Vinh Long', 'Khoa', '0912345678', 'COMPLETE', 20030000, 2, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (2, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (3, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (4, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (5, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (6, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (7, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (8, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (9, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (10, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (11, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (12, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (13, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (14, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (15, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (16, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (17, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (18, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (19, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (20, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (21, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (22, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (23, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (24, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (25, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (26, NULL, NULL, 'Giao nhanh | Transaction ID: 15083203 | Payment Time: 18/07/2025 14:13:28', '2025-07-18 14:12:35.647412', 'VNPAY', 'Vinh Long', 'khoa', '0916612354', 'BANKING', 10030000, 2, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (27, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (28, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (29, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (30, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (31, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (32, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (33, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (34, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (35, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (36, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (37, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (38, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (39, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (40, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (41, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (42, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (43, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (44, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (45, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (46, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (47, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (48, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (49, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (50, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (51, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (52, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (53, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (54, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (55, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (56, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (57, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (58, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (59, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (60, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (61, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (62, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (63, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (64, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (65, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (66, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (67, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (68, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (69, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (70, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (71, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (72, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (73, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (74, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (75, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (76, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (77, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (78, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (79, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (80, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (81, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (82, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (83, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (84, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (85, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (86, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (87, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (88, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (89, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (90, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (91, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (92, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (93, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (94, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (95, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (96, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (97, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (98, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (99, NULL, '2024-01-12 15:00:00', NULL, '2024-01-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (100, NULL, '2024-02-12 15:00:00', NULL, '2024-02-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1200000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (101, NULL, '2024-03-12 15:00:00', NULL, '2024-03-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1300000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (102, NULL, '2024-04-12 15:00:00', NULL, '2024-04-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1400000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (103, NULL, '2024-05-12 15:00:00', NULL, '2024-05-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1500000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (104, NULL, '2024-06-12 15:00:00', NULL, '2024-06-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1600000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (105, NULL, '2024-07-12 15:00:00', NULL, '2024-07-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1700000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (106, NULL, '2024-08-12 15:00:00', NULL, '2024-08-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1800000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (107, NULL, '2024-09-12 15:00:00', NULL, '2024-09-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 1900000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (108, NULL, '2024-10-12 15:00:00', NULL, '2024-10-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2000000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (109, NULL, '2024-11-12 15:00:00', NULL, '2024-11-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2100000, 4, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.orders (id, cancel_date, complete_date, note, order_date, payment_method, receiver_address, receiver_name, receiver_phone, status, total_price, user_id, voucher_id) VALUES (110, NULL, '2024-12-12 15:00:00', NULL, '2024-12-10 10:00:00', 'CASH', 'Hà Nội', 'Demo User', '0123456789', 'COMPLETE', 2200000, 4, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5088 (class 0 OID 16753)
-- Dependencies: 236
-- Data for Name: product_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_review (id, rating, review_content, visible, order_detail_id, product_id, user_id) VALUES (1, 5, 'siêu mạnh, chiến game mượt, máy mát do tản nhiệt khủng', 'Yes', 1, 2, 2) ON CONFLICT DO NOTHING;


--
-- TOC entry 5090 (class 0 OID 16762)
-- Dependencies: 238
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (4, '2025-06-29 20:51:54.837576', 'NVIDIA GeForce RTX 2090 12GB GDDR6 VRAM', '1751344187908-aceNitro.png', 'Nhom', 'Acer Nitro V tiger', 8000000, 5, 'New 2025 Acer gaming laptop', 0, true, '2025-07-01 11:29:47.912635', 0, 1, 3, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (3, '2025-06-29 20:49:55.694246', 'NVIDIA GeForce RTX 5090 12GB GDDR6 VRAM', '1751344196313-DellAlien.png', 'Nhom', 'Dell Alienware', 30000000, 25, 'New 2025 dell gaming laptop', 0, true, '2025-07-01 11:29:56.315982', 0, 1, 2, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (16, '2025-06-29 22:48:54.891603', 'UHD intel core Ultra 9', '1751344207244-lenovo ThinkPad.png', 'Nhom', 'Lenovo ThinkPad ', 12500000, 23, '', 0, true, '2025-07-01 11:30:07.24544', 0, 1, 1, 2, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (18, '2025-07-01 09:39:38.729462', 'NVIDIA GeForce RTX 3050 4GB GDDR6
AMD Radeon Graphics

Dung lượng RAM	
16GB

Loại RAM	
DDR5-5600 SO-DIMM

Số khe ram	
2 khe (Tối đa 32GB)

Ổ cứng	
512GB PCIe 4.0 NVMe M.2 SSD (2 Khe cắm M.2 hỗ trợ SATA hoặc NVMe, Tối đa 1TB)', '1751344216060-asus tuf.png', 'Nhom', 'Asus Tuf gaming', 18000000, 12, '', 0, true, '2025-07-01 11:30:16.091983', 0, 1, 3, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (17, '2025-06-29 23:06:50.745172', 'Dài 7 cm - Rộng 6.6 cm - Cao 4 cm', '1751344226585-Tainghe.png', 'Nhom', 'Tai nghe Bluetooth chụp tai Marshall Major 5', 1350000, 23, '', 0, true, '2025-07-01 11:30:26.592861', 0, 3, 5, NULL, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (5, '2025-06-29 21:22:09.412214', '1TB dung lượng', '1751344236753-ssd.png', 'Nhom', 'SSD Kington', 2000000, 23, '', 0, true, '2025-07-01 11:30:36.755583', 0, 2, 4, NULL, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (1, '2025-06-29 20:43:08.741576', 'NVIDIA GeForce RTX 4070 8GB GDDR6, Boost Clock 2175MHz, TGP 140W', '1751345009819-Legion.png', 'Nhom', 'Lenovo Legion', 25000000, 25, 'New 2025 lenovo gaming laptop', 0, true, '2025-07-01 11:43:29.825407', 0, 1, 1, 1, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.products (id, created_at, detail_desc, image, material, name, price, quantity, short_desc, sold, status, updated_at, weight, category_id, factory_id, target_id, type_id) VALUES (2, '2025-06-29 20:43:56.059876', 'NVIDIA GeForce RTX 4070 8GB GDDR6, Boost Clock 2175MHz, TGP 140W', '1751344259285-Lenovo Loq.png', 'Nhom', 'Lenovo LOQ', 10000000, 22, 'New 2025 lenovo gaming laptop', 3, true, '2025-07-18 14:12:35.651934', 0, 1, 1, 1, 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 5092 (class 0 OID 16771)
-- Dependencies: 240
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, description, name) VALUES (1, 'ADMIN', 'ADMIN') ON CONFLICT DO NOTHING;
INSERT INTO public.roles (id, description, name) VALUES (2, 'EMPLOYEE', 'EMPLOYEE') ON CONFLICT DO NOTHING;
INSERT INTO public.roles (id, description, name) VALUES (3, 'CUSTOMER', 'CUSTOMER') ON CONFLICT DO NOTHING;


--
-- TOC entry 5069 (class 0 OID 16667)
-- Dependencies: 217
-- Data for Name: spring_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', '2f01e763-dc21-4f71-bd57-63a447968491', 1757467213436, 1757467276448, 2592000, 1760059276448, 'khoandce170420@fpt.edu.vn') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) VALUES ('c524d5fb-e469-445d-b48c-a2c6e08b0cb9', 'a63aac75-a58c-49dc-95a7-d0cf3e9ca2d7', 1759631522419, 1759631524487, 1800, 1759633324487, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session (primary_id, session_id, creation_time, last_access_time, max_inactive_interval, expiry_time, principal_name) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', '585dc33f-91f6-4060-861f-4aec914b5145', 1757467077429, 1759631484293, 2592000, 1762223484293, 'customer01@gmail.com') ON CONFLICT DO NOTHING;


--
-- TOC entry 5070 (class 0 OID 16675)
-- Dependencies: 218
-- Data for Name: spring_session_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'SPRING_SECURITY_CONTEXT', '\xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000026c0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000026c0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479000000000000026c0200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000d524f4c455f435553544f4d45527871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000026c0200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002463333337633862372d366666302d346537632d613664362d31643539306139383332373370737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e55736572000000000000026c0200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657374000f4c6a6176612f7574696c2f5365743b4c000870617373776f726471007e000f4c0008757365726e616d6571007e000f787001010101737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e000a737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f72000000000000026c020000787077040000000171007e00107870740014637573746f6d6572303140676d61696c2e636f6d') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'id', '\xaced00057372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'avatar', '\xaced0005740019313735313335333332333335302d6d616b6961746f2e706e67') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'email', '\xaced0005740014637573746f6d6572303140676d61696c2e636f6d') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'username', '\xaced0005740014637573746f6d6572303140676d61696c2e636f6d') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'sum', '\xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000001') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('c524d5fb-e469-445d-b48c-a2c6e08b0cb9', 'org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN', '\xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002436633834396132612d383064652d343264322d616330382d343431383534626433333233') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('c524d5fb-e469-445d-b48c-a2c6e08b0cb9', 'jakarta.servlet.jsp.jstl.fmt.request.charset', '\xaced00057400055554462d38') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN', '\xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002435306564303037622d396432332d343135652d393564302d623563306435353238303761') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'SPRING_SECURITY_SAVED_REQUEST', '\xaced0005737200416f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e44656661756c74536176656452657175657374000000000000026c02000f49000a736572766572506f72744c000b636f6e74657874506174687400124c6a6176612f6c616e672f537472696e673b4c0007636f6f6b6965737400154c6a6176612f7574696c2f41727261794c6973743b4c00076865616465727374000f4c6a6176612f7574696c2f4d61703b4c00076c6f63616c657371007e00024c001c6d61746368696e6752657175657374506172616d657465724e616d6571007e00014c00066d6574686f6471007e00014c000a706172616d657465727371007e00034c000870617468496e666f71007e00014c000b7175657279537472696e6771007e00014c000a7265717565737455524971007e00014c000a7265717565737455524c71007e00014c0006736368656d6571007e00014c000a7365727665724e616d6571007e00014c000b736572766c65745061746871007e0001787000001f90740000737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200396f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e7361766564726571756573742e5361766564436f6f6b6965000000000000026c0200084900066d61784167655a000673656375726549000776657273696f6e4c0007636f6d6d656e7471007e00014c0006646f6d61696e71007e00014c00046e616d6571007e00014c00047061746871007e00014c000576616c756571007e00017870ffffffff0000000000707074000753455353494f4e707400304e6a41314d5456694e5463744e545532595330304d6a517a4c5745354f4441744e6a457a4d6d45784d4441344e6a637878737200116a6176612e7574696c2e547265654d61700cc1f63e2d256ae60300014c000a636f6d70617261746f727400164c6a6176612f7574696c2f436f6d70617261746f723b78707372002a6a6176612e6c616e672e537472696e672443617365496e73656e736974697665436f6d70617261746f7277035c7d5c50e5ce020000787077040000000f7400066163636570747371007e000600000001770400000001740087746578742f68746d6c2c6170706c69636174696f6e2f7868746d6c2b786d6c2c6170706c69636174696f6e2f786d6c3b713d302e392c696d6167652f617669662c696d6167652f776562702c696d6167652f61706e672c2a2f2a3b713d302e382c6170706c69636174696f6e2f7369676e65642d65786368616e67653b763d62333b713d302e377874000f6163636570742d656e636f64696e677371007e000600000001770400000001740017677a69702c206465666c6174652c2062722c207a7374647874000f6163636570742d6c616e67756167657371007e00060000000177040000000174002076692c6a613b713d302e392c656e2d55533b713d302e382c656e3b713d302e377874000a636f6e6e656374696f6e7371007e00060000000177040000000174000a6b6565702d616c69766578740006636f6f6b69657371007e00060000000177040000000174003853455353494f4e3d4e6a41314d5456694e5463744e545532595330304d6a517a4c5745354f4441744e6a457a4d6d45784d4441344e6a637878740004686f73747371007e00060000000177040000000174000e6c6f63616c686f73743a38303830787400097365632d63682d75617371007e000600000001770400000001740041224368726f6d69756d223b763d22313430222c20224e6f743d413f4272616e64223b763d223234222c2022476f6f676c65204368726f6d65223b763d2231343022787400107365632d63682d75612d6d6f62696c657371007e0006000000017704000000017400023f30787400127365632d63682d75612d706c6174666f726d7371007e0006000000017704000000017400092257696e646f7773227874000e7365632d66657463682d646573747371007e000600000001770400000001740008646f63756d656e747874000e7365632d66657463682d6d6f64657371007e0006000000017704000000017400086e617669676174657874000e7365632d66657463682d736974657371007e0006000000017704000000017400046e6f6e657874000e7365632d66657463682d757365727371007e0006000000017704000000017400023f3178740019757067726164652d696e7365637572652d72657175657374737371007e000600000001770400000001740001317874000a757365722d6167656e747371007e00060000000177040000000174006f4d6f7a696c6c612f352e30202857696e646f7773204e542031302e303b2057696e36343b2078363429204170706c655765624b69742f3533372e333620284b48544d4c2c206c696b65204765636b6f29204368726f6d652f3134302e302e302e30205361666172692f3533372e333678787371007e000600000004770400000004737200106a6176612e7574696c2e4c6f63616c657ef811609c30f9ec03000649000868617368636f64654c0007636f756e74727971007e00014c000a657874656e73696f6e7371007e00014c00086c616e677561676571007e00014c000673637269707471007e00014c000776617269616e7471007e00017870ffffffff71007e000571007e0005740002766971007e000571007e0005787371007e003fffffffff71007e000571007e00057400026a6171007e000571007e0005787371007e003fffffffff740002555371007e0005740002656e71007e000571007e0005787371007e003fffffffff71007e000571007e000571007e004671007e000571007e00057878740008636f6e74696e75657400034745547371007e000c707704000000007870707400062f61646d696e74001b687474703a2f2f6c6f63616c686f73743a383038302f61646d696e740004687474707400096c6f63616c686f73747400062f61646d696e') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN', '\xaced0005737200366f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e637372662e44656661756c7443737266546f6b656e5aefb7c82fa2fbd50200034c000a6865616465724e616d657400124c6a6176612f6c616e672f537472696e673b4c000d706172616d657465724e616d6571007e00014c0005746f6b656e71007e0001787074000c582d435352462d544f4b454e7400055f6373726674002463343763326536302d356663612d343833612d623438302d643762613830373136396535') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'jakarta.servlet.jsp.jstl.fmt.request.charset', '\xaced00057400055554462d38') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'voucherCode', '\xaced0005740000') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'receiverAddress', '\xaced000574000956696e68204c6f6e67') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'amount', '\xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870001ef9b0') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'receiverPhone', '\xaced000574000a30323334333536373839') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'receiverName', '\xaced00057400146e677579e1bb856e20c491c4836e67206b686f61') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'orderInfo', '\xaced00057400026f6b') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('d0e7300f-d44b-4964-bb83-7d81478ae0ed', 'jakarta.servlet.jsp.jstl.fmt.request.charset', '\xaced00057400055554462d38') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'SPRING_SECURITY_CONTEXT', '\xaced00057372003d6f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e636f6e746578742e5365637572697479436f6e74657874496d706c000000000000026c0200014c000e61757468656e7469636174696f6e7400324c6f72672f737072696e676672616d65776f726b2f73656375726974792f636f72652f41757468656e7469636174696f6e3b78707372004f6f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e557365726e616d6550617373776f726441757468656e7469636174696f6e546f6b656e000000000000026c0200024c000b63726564656e7469616c737400124c6a6176612f6c616e672f4f626a6563743b4c00097072696e636970616c71007e0004787200476f72672e737072696e676672616d65776f726b2e73656375726974792e61757468656e7469636174696f6e2e416273747261637441757468656e7469636174696f6e546f6b656ed3aa287e6e47640e0200035a000d61757468656e746963617465644c000b617574686f7269746965737400164c6a6176612f7574696c2f436f6c6c656374696f6e3b4c000764657461696c7371007e0004787001737200266a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c654c697374fc0f2531b5ec8e100200014c00046c6973747400104c6a6176612f7574696c2f4c6973743b7872002c6a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65436f6c6c656374696f6e19420080cb5ef71e0200014c00016371007e00067870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001737200426f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e617574686f726974792e53696d706c654772616e746564417574686f72697479000000000000026c0200014c0004726f6c657400124c6a6176612f6c616e672f537472696e673b787074000a524f4c455f41444d494e7871007e000d737200486f72672e737072696e676672616d65776f726b2e73656375726974792e7765622e61757468656e7469636174696f6e2e57656241757468656e7469636174696f6e44657461696c73000000000000026c0200024c000d72656d6f74654164647265737371007e000f4c000973657373696f6e496471007e000f787074000f303a303a303a303a303a303a303a3174002436303531356235372d353536612d343234332d613938302d36313332613130303836373170737200326f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e55736572000000000000026c0200075a00116163636f756e744e6f6e457870697265645a00106163636f756e744e6f6e4c6f636b65645a001563726564656e7469616c734e6f6e457870697265645a0007656e61626c65644c000b617574686f72697469657374000f4c6a6176612f7574696c2f5365743b4c000870617373776f726471007e000f4c0008757365726e616d6571007e000f787001010101737200256a6176612e7574696c2e436f6c6c656374696f6e7324556e6d6f6469666961626c65536574801d92d18f9b80550200007871007e000a737200116a6176612e7574696c2e54726565536574dd98509395ed875b0300007870737200466f72672e737072696e676672616d65776f726b2e73656375726974792e636f72652e7573657264657461696c732e5573657224417574686f72697479436f6d70617261746f72000000000000026c020000787077040000000171007e001078707400196b686f616e646365313730343230406670742e6564752e766e') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'sum', '\xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000000') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'id', '\xaced00057372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000001') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'email', '\xaced00057400196b686f616e646365313730343230406670742e6564752e766e') ON CONFLICT DO NOTHING;
INSERT INTO public.spring_session_attributes (session_primary_id, attribute_name, attribute_bytes) VALUES ('4075393d-e9f0-4d1e-aa7a-1f1f04283b6d', 'username', '\xaced00057400196b686f616e646365313730343230406670742e6564752e766e') ON CONFLICT DO NOTHING;


--
-- TOC entry 5094 (class 0 OID 16780)
-- Dependencies: 242
-- Data for Name: target; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.target (id, name) VALUES (1, 'Gaming') ON CONFLICT DO NOTHING;
INSERT INTO public.target (id, name) VALUES (2, 'Văn Phòng') ON CONFLICT DO NOTHING;
INSERT INTO public.target (id, name) VALUES (3, 'Laptop AI') ON CONFLICT DO NOTHING;


--
-- TOC entry 5096 (class 0 OID 16787)
-- Dependencies: 244
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.types (id, created_at, description, name, status, updated_at) VALUES (1, NULL, NULL, 'Laptop', true, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.types (id, created_at, description, name, status, updated_at) VALUES (2, NULL, NULL, 'Linh Kiện', true, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.types (id, created_at, description, name, status, updated_at) VALUES (3, NULL, NULL, 'Phụ Kiện', true, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5097 (class 0 OID 16795)
-- Dependencies: 245
-- Data for Name: user_vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5099 (class 0 OID 16799)
-- Dependencies: 247
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, address, avatar, email, full_name, password, phone, status, role_id) VALUES (1, 'Vinh Nghe An', NULL, 'khoandce170420@fpt.edu.vn', 'Khoa nguyen dang', '$2a$10$GefOWjDwbufPI/cE7pYBM.T5XXJzllLdpZWG26Atf8P8B/jEcN.M6', '0916612355', true, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, address, avatar, email, full_name, password, phone, status, role_id) VALUES (2, 'Vinh Long', '1751353323350-makiato.png', 'customer01@gmail.com', 'Khoa Nguyen', '$2a$10$LUoKeORvGXZEGRVzZtO1buKQnKx4owAVTI9IvoX6NAPMwfMX/meEC', '0916612354', true, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, address, avatar, email, full_name, password, phone, status, role_id) VALUES (3, 'Ha Noi', '1751562178415-Lenovo Loq.png', 'customer02@gmail.com', 'customer', '$2a$10$zK.jLZzdBC3tYLEF0iVZHOi7I94odWU2yc0/CnjMJgAS2NXN0Qcci', '0123456788', true, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.users (id, address, avatar, email, full_name, password, phone, status, role_id) VALUES (4, 'Hà Nội', NULL, 'demo@gundam.com', 'Demo User', '123456', '0123456789', false, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5101 (class 0 OID 16808)
-- Dependencies: 249
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5103 (class 0 OID 16817)
-- Dependencies: 251
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.wishlist (id, product_id, user_id) VALUES (6, 1, 3) ON CONFLICT DO NOTHING;


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


-- Completed on 2025-10-05 09:59:28

--
-- PostgreSQL database dump complete
--

