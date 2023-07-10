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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type character varying(20),
    distance_in_kpc integer,
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mean_radius_in_km integer,
    orbital_period_in_days numeric(10,2),
    discovery_year integer,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    orbital_period_in_days numeric(10,2),
    earth_mass numeric(10,2),
    temperature_in_k integer,
    has_life boolean,
    has_moon boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    stellar_class character varying(20),
    mass_solar numeric(8,4),
    radius_solar numeric(8,4),
    orbiting_planets integer,
    galaxy_id integer NOT NULL,
    constellation_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Centaurus', 'Centaurus is a bright constellation in the southern sky. It represents a centaur; a creature that is half human, half horse.');
INSERT INTO public.constellation VALUES (2, 'Pegasus', 'Pegasus is a constellation in the northern sky, named after the winged horse Pegasus in Greek mythology.');
INSERT INTO public.constellation VALUES (3, 'Lyra', 'Lyra is a small constellation. Lyra was often represented as a vulture or an eagle carrying a lyre, and hence is sometimes referred to as Vultur Cadens or Aquila Cadens.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral', 8, 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'spiral', 765, 'The Andromeda Galaxy is the nearest major galaxy to the Milky Way. The galaxy''s name stems from the area of Earth''s sky in which it appears, the constellation of Andromeda.');
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Spheroidal Galaxy', 'elliptical', 65, 'Heading for a collision
with the Milky Way');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'peculiar', 9550, 'It has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its outer disk, which is viewed almost edge-on. The dark dust lane and the bulge give it the appearance of a sombrero hat (thus the name).');
INSERT INTO public.galaxy VALUES (5, 'Messier 82', 'starburst', 3500, 'Also known as NGC 3034, Cigar Galaxy or M82, Messier 82 is about five times more luminous than the Milky Way and its central region is about one hundred times more luminous.');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'spiral', 50, 'It contains a stellar bar that is geometrically off center, suggesting that it was a barred dwarf spiral galaxy before its spiral arms were disrupted, likely by tidal interactions from the Small Magellanic Cloud and the Milky Way''s gravity.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 27.32, 0, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 0.32, 1877, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 1.26, 1877, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1822, 1.77, 1610, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1561, 3.55, 1610, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 7.16, 1610, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 16.69, 1610, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 84, 0.50, 1892, 5);
INSERT INTO public.moon VALUES (9, 'Leda', 10, 240.92, 1974, 5);
INSERT INTO public.moon VALUES (10, 'Thebe', 49, 0.68, 1979, 5);
INSERT INTO public.moon VALUES (11, 'Ersa', 2, 250.40, 2018, 5);
INSERT INTO public.moon VALUES (12, 'Mimas', 198, 0.94, 1789, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 533, 1.89, 1684, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 561, 2.74, 1684, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 764, 4.52, 1672, 6);
INSERT INTO public.moon VALUES (16, 'Titan', 2575, 15.95, 1655, 6);
INSERT INTO public.moon VALUES (17, 'Iapetus', 736, 79.33, 1671, 6);
INSERT INTO public.moon VALUES (18, 'Phoebe', 107, 550.00, 1898, 6);
INSERT INTO public.moon VALUES (19, 'Beli', 3, 1088.00, 2004, 6);
INSERT INTO public.moon VALUES (20, 'Ariel', 578, 2.52, 1851, 7);
INSERT INTO public.moon VALUES (21, 'Titania', 789, 8.71, 1787, 7);
INSERT INTO public.moon VALUES (22, 'Triton', 1353, 5.90, 1846, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 87.97, 0.06, 437, false, false, 8);
INSERT INTO public.planet VALUES (2, 'Venus', 224.70, 0.82, 232, false, false, 8);
INSERT INTO public.planet VALUES (3, 'Earth', 365.26, 1.00, 288, true, true, 8);
INSERT INTO public.planet VALUES (4, 'Mars', 686.98, 0.11, 209, false, true, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4332.58, 317.80, 88, false, true, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', 10759.22, 95.16, 88, false, true, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', 30688.50, 14.54, 76, false, true, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', 60195.00, 17.15, 72, false, true, 8);
INSERT INTO public.planet VALUES (9, '51 Pegasi b', 4.23, 150.00, 1284, false, false, 10);
INSERT INTO public.planet VALUES (10, 'Kepler-20e', 6.10, 1.03, 1040, false, false, 11);
INSERT INTO public.planet VALUES (11, 'Kepler-20f', 19.58, 1.00, 705, false, false, 11);
INSERT INTO public.planet VALUES (12, 'Kepler-20d', 77.61, 20.00, 369, false, false, 11);
INSERT INTO public.planet VALUES (13, 'Wolf 1061c', 17.90, 4.30, 223, false, false, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (8, 'Sun', 'yellow dwarf', 1.0000, 1.0000, 8, 1, NULL);
INSERT INTO public.star VALUES (12, 'Tau Ceti', 'yellow dwarf', 0.7830, 0.7930, 4, 1, NULL);
INSERT INTO public.star VALUES (13, 'Wolf 1061', 'red dwarf', 0.3040, 0.3190, 3, 1, NULL);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 'red dwarf', 0.1221, 0.1542, 2, 1, 1);
INSERT INTO public.star VALUES (10, '51 Pegasi', 'yellow dwarf', 1.1200, 1.2370, 1, 1, 2);
INSERT INTO public.star VALUES (11, 'Kepler-20', 'G8', 0.9290, 0.9164, 5, 1, 3);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

