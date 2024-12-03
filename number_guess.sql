--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: guessed; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guessed (
    user_id integer,
    guess_id integer NOT NULL,
    guess integer NOT NULL
);


ALTER TABLE public.guessed OWNER TO freecodecamp;

--
-- Name: guessed_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guessed_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guessed_guess_id_seq OWNER TO freecodecamp;

--
-- Name: guessed_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guessed_guess_id_seq OWNED BY public.guessed.guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: guessed guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessed ALTER COLUMN guess_id SET DEFAULT nextval('public.guessed_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: guessed; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guessed VALUES (33, 1, 852);
INSERT INTO public.guessed VALUES (33, 2, 964);
INSERT INTO public.guessed VALUES (34, 3, 393);
INSERT INTO public.guessed VALUES (34, 4, 925);
INSERT INTO public.guessed VALUES (33, 5, 262);
INSERT INTO public.guessed VALUES (33, 6, 51);
INSERT INTO public.guessed VALUES (33, 7, 906);
INSERT INTO public.guessed VALUES (35, 8, 664);
INSERT INTO public.guessed VALUES (35, 9, 250);
INSERT INTO public.guessed VALUES (36, 10, 868);
INSERT INTO public.guessed VALUES (36, 11, 267);
INSERT INTO public.guessed VALUES (35, 12, 543);
INSERT INTO public.guessed VALUES (35, 13, 426);
INSERT INTO public.guessed VALUES (35, 14, 899);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'levent');
INSERT INTO public.users VALUES (2, 'user_1733253187198');
INSERT INTO public.users VALUES (3, 'user_1733253187197');
INSERT INTO public.users VALUES (4, 'user_1733253334289');
INSERT INTO public.users VALUES (5, 'user_1733253334288');
INSERT INTO public.users VALUES (6, 'user_1733253568853');
INSERT INTO public.users VALUES (7, 'user_1733253568852');
INSERT INTO public.users VALUES (8, 'user_1733253773077');
INSERT INTO public.users VALUES (9, 'user_1733253773077');
INSERT INTO public.users VALUES (10, 'user_1733253773076');
INSERT INTO public.users VALUES (11, 'user_1733253773076');
INSERT INTO public.users VALUES (12, 'user_1733253773077');
INSERT INTO public.users VALUES (13, 'user_1733253773077');
INSERT INTO public.users VALUES (14, 'user_1733253773077');
INSERT INTO public.users VALUES (15, 'user_1733253792324');
INSERT INTO public.users VALUES (16, 'user_1733253792324');
INSERT INTO public.users VALUES (17, 'user_1733253792323');
INSERT INTO public.users VALUES (18, 'user_1733253792323');
INSERT INTO public.users VALUES (19, 'user_1733253792324');
INSERT INTO public.users VALUES (20, 'user_1733253792324');
INSERT INTO public.users VALUES (21, 'user_1733253792324');
INSERT INTO public.users VALUES (22, 'user_1733253803423');
INSERT INTO public.users VALUES (23, 'user_1733253803423');
INSERT INTO public.users VALUES (24, 'user_1733253803422');
INSERT INTO public.users VALUES (25, 'user_1733253803422');
INSERT INTO public.users VALUES (26, 'user_1733253803423');
INSERT INTO public.users VALUES (27, 'user_1733253803423');
INSERT INTO public.users VALUES (28, 'user_1733253803423');
INSERT INTO public.users VALUES (29, 'levent');
INSERT INTO public.users VALUES (30, 'leevnt');
INSERT INTO public.users VALUES (31, 'user_1733256416601');
INSERT INTO public.users VALUES (32, 'user_1733256416600');
INSERT INTO public.users VALUES (33, 'user_1733256497989');
INSERT INTO public.users VALUES (34, 'user_1733256497988');
INSERT INTO public.users VALUES (35, 'user_1733256526284');
INSERT INTO public.users VALUES (36, 'user_1733256526283');


--
-- Name: guessed_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guessed_guess_id_seq', 14, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 36, true);


--
-- Name: guessed guessed_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessed
    ADD CONSTRAINT guessed_pkey PRIMARY KEY (guess_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: guessed fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guessed
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

