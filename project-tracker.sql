--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: grades; Type: TABLE; Schema: public; Owner: Tiela
--

CREATE TABLE public.grades (
    grades_id integer NOT NULL,
    student_github character varying(30),
    project_title character varying(30),
    grade integer
);


ALTER TABLE public.grades OWNER TO "Tiela";

--
-- Name: grades_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: Tiela
--

CREATE SEQUENCE public.grades_grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_grades_id_seq OWNER TO "Tiela";

--
-- Name: grades_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Tiela
--

ALTER SEQUENCE public.grades_grades_id_seq OWNED BY public.grades.grades_id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: Tiela
--

CREATE TABLE public.projects (
    title character varying(30) NOT NULL,
    description text,
    max_grade integer
);


ALTER TABLE public.projects OWNER TO "Tiela";

--
-- Name: students; Type: TABLE; Schema: public; Owner: Tiela
--

CREATE TABLE public.students (
    github character varying(30) NOT NULL,
    first_name character varying(30),
    last_name character varying(30)
);


ALTER TABLE public.students OWNER TO "Tiela";

--
-- Name: grades grades_id; Type: DEFAULT; Schema: public; Owner: Tiela
--

ALTER TABLE ONLY public.grades ALTER COLUMN grades_id SET DEFAULT nextval('public.grades_grades_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: Tiela
--

COPY public.grades (grades_id, student_github, project_title, grade) FROM stdin;
1	bradbunny	Markov	45
2	bradbunny	CHAT GPT	32
3	bender	CHAT GPT	10
4	bender	Markov	30
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: Tiela
--

COPY public.projects (title, description, max_grade) FROM stdin;
Markov	Tweets generated from chains	50
CHAT GPT	CHAT gpt audio	45
Cooking	Recipe generator	601
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: Tiela
--

COPY public.students (github, first_name, last_name) FROM stdin;
bradbunny	Brad	Bunny
bender	Bender	Robot
\.


--
-- Name: grades_grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Tiela
--

SELECT pg_catalog.setval('public.grades_grades_id_seq', 4, true);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: Tiela
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (grades_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: Tiela
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (title);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: Tiela
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (github);


--
-- Name: grades grades_project_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Tiela
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_project_title_fkey FOREIGN KEY (project_title) REFERENCES public.projects(title);


--
-- Name: grades grades_student_github_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Tiela
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_github_fkey FOREIGN KEY (student_github) REFERENCES public.students(github);


--
-- PostgreSQL database dump complete
--

