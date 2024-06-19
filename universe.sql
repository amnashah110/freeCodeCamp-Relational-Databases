--
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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_in_light_years numeric(12,2),
    discovered boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_stars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_stars (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_stars_id integer NOT NULL
);


ALTER TABLE public.galaxy_stars OWNER TO freecodecamp;

--
-- Name: galaxy_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_stars_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_stars_id_seq OWNED BY public.galaxy_stars.galaxy_stars_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    radius_in_km numeric(6,2),
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    mass double precision NOT NULL,
    age_in_billion_years integer,
    habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    temperature integer,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_stars galaxy_stars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars ALTER COLUMN galaxy_stars_id SET DEFAULT nextval('public.galaxy_stars_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', NULL, true, 'Includes the solar system');
INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 2.54, true, 'Spiral galaxy, nearest to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 11.60, true, 'One of the brightest galaxies');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 500.00, true, 'Lenticular Ring Galaxy');
INSERT INTO public.galaxy VALUES (5, 'Black-Eye Galaxy', 17.00, true, 'Has a dark band of absorbing dust infront of the nucleus');
INSERT INTO public.galaxy VALUES (6, 'Comet Galaxy', 3200.00, true, 'Resembles the Pinwheel Galaxy');


--
-- Data for Name: galaxy_stars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_stars VALUES (1, 1, 'Andromedae', 1);
INSERT INTO public.galaxy_stars VALUES (2, 2, 'Milky Way', 2);
INSERT INTO public.galaxy_stars VALUES (2, 3, 'Milky Way', 3);
INSERT INTO public.galaxy_stars VALUES (2, 4, 'Milky Way', 4);
INSERT INTO public.galaxy_stars VALUES (2, 5, 'Milky Way', 5);
INSERT INTO public.galaxy_stars VALUES (2, 6, 'Milky Way', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2, 1737.00, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.27, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, false);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 1560.00, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5, 2631.00, true);
INSERT INTO public.moon VALUES (6, 'Io', 5, 1821.60, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, true);
INSERT INTO public.moon VALUES (8, 'Miranda', 7, 235.80, true);
INSERT INTO public.moon VALUES (9, 'Ariel', 7, 578.90, true);
INSERT INTO public.moon VALUES (10, 'Umbriel', 7, 584.70, true);
INSERT INTO public.moon VALUES (11, 'Titania', 7, 788.40, true);
INSERT INTO public.moon VALUES (12, 'Oberon', 7, 761.40, true);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 2574.70, true);
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, 252.10, true);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 763.80, true);
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 734.50, false);
INSERT INTO public.moon VALUES (17, 'Dione', 6, 561.40, true);
INSERT INTO public.moon VALUES (18, 'Mimas', 6, 198.20, true);
INSERT INTO public.moon VALUES (19, 'Charon', 11, 606.00, true);
INSERT INTO public.moon VALUES (20, 'Nix', 11, 49.80, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (8, 'Neptune', 1.0239999999999999e+26, 5, false, 2);
INSERT INTO public.planet VALUES (2, 'Earth', 5.97e+24, 5, true, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 4.867e+24, 5, false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 5.683e+26, 5, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 8.681e+25, 5, false, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 6.39e+23, 5, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1.898e+27, 5, false, 2);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 6.567e+25, 5, true, 5);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 6.567e+25, 5, true, 5);
INSERT INTO public.planet VALUES (11, 'Pluto', 1.3100000000000001e+22, 5, false, 2);
INSERT INTO public.planet VALUES (12, 'Ceres', 9.1e+22, 5, false, 2);
INSERT INTO public.planet VALUES (1, 'Upsilon Andromedae b', 1, 1, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 2, 5772, true);
INSERT INTO public.star VALUES (1, 'Beta Andromedae', 1, 3842, false);
INSERT INTO public.star VALUES (3, 'Altair', 2, 7700, false);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 2, 5790, true);
INSERT INTO public.star VALUES (6, 'Antares', 2, 6100, true);
INSERT INTO public.star VALUES (4, 'Arcturus', 2, 4290, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_stars_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_stars galaxy_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_pkey PRIMARY KEY (galaxy_stars_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_stars unique_galaxy_stars_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT unique_galaxy_stars_id UNIQUE (galaxy_id, star_id);


--
-- Name: galaxy unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: galaxy_stars galaxy_stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_stars galaxy_stars_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_stars
    ADD CONSTRAINT galaxy_stars_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

