-
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE guess_number;
--
-- Name: guess_number; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guess_number WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guess_number OWNER TO freecodecamp;

\connect guess_number

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    username character varying(25),
    games_played integer,
    best_game integer
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES ('user_1659644378198', 2, 158);
INSERT INTO public.guesses VALUES ('user_1659644378199', 5, 93);
INSERT INTO public.guesses VALUES ('user_1659644506754', 2, 599);
INSERT INTO public.guesses VALUES ('user_1659644506755', 5, 53);
INSERT INTO public.guesses VALUES ('Renan', 2, 1);
INSERT INTO public.guesses VALUES ('user_1659645568116', 2, 136);
INSERT INTO public.guesses VALUES ('user_1659645568117', 5, 342);
INSERT INTO public.guesses VALUES ('user_1659645626181', 2, 374);
INSERT INTO public.guesses VALUES ('user_1659645626182', 5, 251);


--
-- PostgreSQL database dump complete
--

