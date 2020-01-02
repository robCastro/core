--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-11-15 18:39:52 CST

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

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 25295)
-- Name: marca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.marca (
    id_marca integer NOT NULL,
    nombre_marca character varying(128) NOT NULL,
    activo_marca boolean NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 25293)
-- Name: marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.marca_id_marca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 196
-- Name: marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.marca_id_marca_seq OWNED BY public.marca.id_marca;


--
-- TOC entry 199 (class 1259 OID 25303)
-- Name: mercancia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mercancia (
    id_mercancia integer NOT NULL,
    id_tipo_mercancia integer NOT NULL,
    id_envia integer NOT NULL,
    id_recibe integer NOT NULL,
    descripcion_mercancia character varying(1024) NOT NULL,
    cantidad_mercancia integer NOT NULL,
    valor_mercancia numeric(20,2) NOT NULL,
    seguro_mercancia numeric(20,2) NOT NULL,
    flete_mercancia numeric(20,2) NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 25301)
-- Name: mercancia_id_mercancia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mercancia_id_mercancia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 198
-- Name: mercancia_id_mercancia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mercancia_id_mercancia_seq OWNED BY public.mercancia.id_mercancia;


--
-- TOC entry 201 (class 1259 OID 25314)
-- Name: pais; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pais (
    id_pais integer NOT NULL,
    nombre_pais character varying(128) NOT NULL,
    activo_pais boolean NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 25312)
-- Name: pais_id_pais_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pais_id_pais_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 200
-- Name: pais_id_pais_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pais_id_pais_seq OWNED BY public.pais.id_pais;


-- Ingresado manualmente
CREATE TABLE public.plugin (
    id_plugin integer NOT NULL,
    url_plugin character varying(1024) NOT NULL,
    activo_plugin boolean NOT NULL,
    desarrollo_url_plugin boolean NOT NULL
);


CREATE SEQUENCE public.plugin_id_plugin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.plugin_id_plugin_seq OWNED BY public.plugin.id_plugin;

--
-- TOC entry 203 (class 1259 OID 25322)
-- Name: responsable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.responsable (
    id_responsable integer NOT NULL,
    id_pais integer NOT NULL,
    nombres_responsable character varying(128) NOT NULL,
    apellidos_responsable character varying(128),
    fecha_nac_responsable date,
    direccion_responsable character varying(1024),
    activo_responsable boolean NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 25320)
-- Name: responsable_id_responsable_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.responsable_id_responsable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 202
-- Name: responsable_id_responsable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.responsable_id_responsable_seq OWNED BY public.responsable.id_responsable;


--
-- TOC entry 205 (class 1259 OID 25333)
-- Name: tipo_mercancia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_mercancia (
    id_tipo_mercancia integer NOT NULL,
    tip_id_tipo_mercancia integer,
    descripcio_tipo_mercancia character varying(1024) NOT NULL,
    activo_tipo_mercancia boolean NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 25331)
-- Name: tipo_mercancia_id_tipo_mercancia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_mercancia_id_tipo_mercancia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_mercancia_id_tipo_mercancia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_mercancia_id_tipo_mercancia_seq OWNED BY public.tipo_mercancia.id_tipo_mercancia;


--
-- TOC entry 207 (class 1259 OID 25344)
-- Name: transporte; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transporte (
    id_transporte integer NOT NULL,
    id_pais integer NOT NULL,
    id_marca integer NOT NULL,
    placa_transporte character varying(32) NOT NULL,
    modelo_transporte character varying(128),
    activo_transporte boolean NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25342)
-- Name: transporte_id_transporte_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transporte_id_transporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 206
-- Name: transporte_id_transporte_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transporte_id_transporte_seq OWNED BY public.transporte.id_transporte;


--
-- TOC entry 2827 (class 2604 OID 25298)
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marca ALTER COLUMN id_marca SET DEFAULT nextval('public.marca_id_marca_seq'::regclass);


--
-- TOC entry 2828 (class 2604 OID 25306)
-- Name: mercancia id_mercancia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mercancia ALTER COLUMN id_mercancia SET DEFAULT nextval('public.mercancia_id_mercancia_seq'::regclass);


--
-- TOC entry 2829 (class 2604 OID 25317)
-- Name: pais id_pais; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pais ALTER COLUMN id_pais SET DEFAULT nextval('public.pais_id_pais_seq'::regclass);


--
-- TOC entry 2830 (class 2604 OID 25325)
-- Name: responsable id_responsable; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.responsable ALTER COLUMN id_responsable SET DEFAULT nextval('public.responsable_id_responsable_seq'::regclass);


--
-- TOC entry 2831 (class 2604 OID 25336)
-- Name: tipo_mercancia id_tipo_mercancia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_mercancia ALTER COLUMN id_tipo_mercancia SET DEFAULT nextval('public.tipo_mercancia_id_tipo_mercancia_seq'::regclass);


--
-- TOC entry 2832 (class 2604 OID 25347)
-- Name: transporte id_transporte; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transporte ALTER COLUMN id_transporte SET DEFAULT nextval('public.transporte_id_transporte_seq'::regclass);


--
-- TOC entry 2974 (class 0 OID 25295)
-- Dependencies: 197
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.marca (id_marca, nombre_marca, activo_marca) VALUES (1, 'Mercedes Benz', true);
INSERT INTO public.marca (id_marca, nombre_marca, activo_marca) VALUES (2, 'Volvo', true);
INSERT INTO public.marca (id_marca, nombre_marca, activo_marca) VALUES (3, 'Ino', false);
INSERT INTO public.marca (id_marca, nombre_marca, activo_marca) VALUES (4, 'Isuzu', false);
INSERT INTO public.marca (id_marca, nombre_marca, activo_marca) VALUES (5, 'Ford', true);


--
-- TOC entry 2976 (class 0 OID 25303)
-- Dependencies: 199
-- Data for Name: mercancia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.mercancia (id_mercancia, id_tipo_mercancia, id_envia, id_recibe, descripcion_mercancia, cantidad_mercancia, valor_mercancia, seguro_mercancia, flete_mercancia) VALUES (1, 6, 1, 5, 'Carne porcina en trozos', 1000, 250.00, 200.00, 300.00);
INSERT INTO public.mercancia (id_mercancia, id_tipo_mercancia, id_envia, id_recibe, descripcion_mercancia, cantidad_mercancia, valor_mercancia, seguro_mercancia, flete_mercancia) VALUES (2, 7, 3, 10, 'Maiz para siembra', 5000, 150.00, 100.00, 400.00);
INSERT INTO public.mercancia (id_mercancia, id_tipo_mercancia, id_envia, id_recibe, descripcion_mercancia, cantidad_mercancia, valor_mercancia, seguro_mercancia, flete_mercancia) VALUES (3, 12, 4, 7, 'Vajilla de ceramica', 50, 500.00, 250.00, 100.00);
INSERT INTO public.mercancia (id_mercancia, id_tipo_mercancia, id_envia, id_recibe, descripcion_mercancia, cantidad_mercancia, valor_mercancia, seguro_mercancia, flete_mercancia) VALUES (4, 10, 2, 5, 'Partes de calzado', 1000, 300.00, 150.00, 200.00);
INSERT INTO public.mercancia (id_mercancia, id_tipo_mercancia, id_envia, id_recibe, descripcion_mercancia, cantidad_mercancia, valor_mercancia, seguro_mercancia, flete_mercancia) VALUES (5, 5, 1, 6, 'Tocino de cerdo', 1500, 400.00, 200.00, 250.00);
INSERT INTO public.mercancia (id_mercancia, id_tipo_mercancia, id_envia, id_recibe, descripcion_mercancia, cantidad_mercancia, valor_mercancia, seguro_mercancia, flete_mercancia) VALUES (6, 8, 3, 9, 'Arroz para consumo', 6000, 350.00, 300.00, 150.00);
INSERT INTO public.mercancia (id_mercancia, id_tipo_mercancia, id_envia, id_recibe, descripcion_mercancia, cantidad_mercancia, valor_mercancia, seguro_mercancia, flete_mercancia) VALUES (7, 11, 4, 8, 'Ladrillos de ceramica para el piso', 300, 600.00, 500.00, 200.00);


--
-- TOC entry 2978 (class 0 OID 25314)
-- Dependencies: 201
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pais (id_pais, nombre_pais, activo_pais) VALUES (1, 'El Salvador', true);
INSERT INTO public.pais (id_pais, nombre_pais, activo_pais) VALUES (2, 'Honduras', true);
INSERT INTO public.pais (id_pais, nombre_pais, activo_pais) VALUES (3, 'Nicaragua', true);
INSERT INTO public.pais (id_pais, nombre_pais, activo_pais) VALUES (4, 'Costa Rica', true);
INSERT INTO public.pais (id_pais, nombre_pais, activo_pais) VALUES (5, 'Panama', true);
INSERT INTO public.pais (id_pais, nombre_pais, activo_pais) VALUES (6, 'Belice', false);



INSERT INTO public.plugin (id_plugin, url_plugin, activo_plugin, desarrollo_url_plugin) VALUES (1, 'http://localhost:3001/', true, true);
INSERT INTO public.plugin (id_plugin, url_plugin, activo_plugin, desarrollo_url_plugin) VALUES (2, 'http://localhost:3002/', true, true);



--
-- TOC entry 2980 (class 0 OID 25322)
-- Dependencies: 203
-- Data for Name: responsable; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (1, 1, 'Luis Fernando', 'Lopez Artiaga', '1992-02-16', 'San Salvador', true);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (2, 1, 'Mario Andres', 'Campos Anaya', '1995-10-23', 'San Miguel', true);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (3, 2, 'Cesar Eduardo', 'Fernandez Quijano', '1990-11-25', 'Tegusigalpa', true);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (4, 3, 'Carlos Muricio', 'Gomez Lopez', '1985-01-02', 'Managua', true);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (5, 4, 'Erick Alejandro', 'Granados Menjivar', '1970-02-14', 'San Jose', true);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (6, 5, 'Jorge Luis', 'Reyes Maldonado', '1987-05-04', 'Panama', true);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (7, 1, 'Mauricio Enrique', 'Alfaro Aparicio', '1986-05-24', 'Santa Ana', false);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (8, 1, 'Juan Alberto', 'Guevara Rodriguez', '1996-12-01', 'LaLibertad', false);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (9, 1, 'Marcos Alberto', 'Lara Alavarenga', '1991-08-16', 'Chalatenago', true);
INSERT INTO public.responsable (id_responsable, id_pais, nombres_responsable, apellidos_responsable, fecha_nac_responsable, direccion_responsable, activo_responsable) VALUES (10, 1, 'Miguel Eduardo', 'Carcamo Aguilar', '1980-12-01', 'San Salvador', true);


--
-- TOC entry 2982 (class 0 OID 25333)
-- Dependencies: 205
-- Data for Name: tipo_mercancia; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (1, NULL, 'Carne de animales y despojos', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (2, NULL, 'Granos ', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (3, NULL, 'Zapatos, materiales, partes', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (4, NULL, 'Para pisos, paredes, decoracion, cocina', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (5, 1, 'De cerdo', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (6, 1, 'Trozos sin deshuesar', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (7, 2, 'Para siembra', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (8, 2, 'Para consumo', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (9, 3, 'Cubren el tobillo', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (10, 3, 'suelas y tacones', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (11, 4, 'Placas y baldosas', true);
INSERT INTO public.tipo_mercancia (id_tipo_mercancia, tip_id_tipo_mercancia, descripcio_tipo_mercancia, activo_tipo_mercancia) VALUES (12, 4, 'Articulos para el servicio de mesa', true);


--
-- TOC entry 2984 (class 0 OID 25344)
-- Dependencies: 207
-- Data for Name: transporte; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (1, 1, 1, 'P215-256', 'Camion', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (2, 5, 2, '12644', 'Panel', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (3, 2, 3, 'P-GH-2496', 'Trailer', false);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (4, 4, 4, 'BBH-256', 'Trailer', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (5, 1, 5, 'P589-216', 'Trailer', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (6, 2, 1, 'P-HJ-2016', 'Trailer', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (7, 1, 2, 'P986-125', 'Trailer', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (8, 1, 3, 'P698-598', 'Trailer', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (9, 3, 4, 'MT-01264', 'Trailer', true);
INSERT INTO public.transporte (id_transporte, id_pais, id_marca, placa_transporte, modelo_transporte, activo_transporte) VALUES (10, 1, 5, 'P896-986', 'Trailer', false);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 196
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.marca_id_marca_seq', 5, true);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 198
-- Name: mercancia_id_mercancia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mercancia_id_mercancia_seq', 7, true);


--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 200
-- Name: pais_id_pais_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pais_id_pais_seq', 6, true);

SELECT pg_catalog.setval('public.plugin_id_plugin_seq', 2, true);


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 202
-- Name: responsable_id_responsable_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.responsable_id_responsable_seq', 10, true);


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_mercancia_id_tipo_mercancia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_mercancia_id_tipo_mercancia_seq', 12, true);


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 206
-- Name: transporte_id_transporte_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.transporte_id_transporte_seq', 10, true);


--
-- TOC entry 2834 (class 2606 OID 25300)
-- Name: marca pk_marca; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT pk_marca PRIMARY KEY (id_marca);


--
-- TOC entry 2836 (class 2606 OID 25311)
-- Name: mercancia pk_mercancia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mercancia
    ADD CONSTRAINT pk_mercancia PRIMARY KEY (id_mercancia);


--
-- TOC entry 2838 (class 2606 OID 25319)
-- Name: pais pk_pais; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pk_pais PRIMARY KEY (id_pais);


--
-- TOC entry 2840 (class 2606 OID 25330)
-- Name: responsable pk_responsable; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT pk_responsable PRIMARY KEY (id_responsable);


--
-- TOC entry 2842 (class 2606 OID 25341)
-- Name: tipo_mercancia pk_tipo_mercancia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_mercancia
    ADD CONSTRAINT pk_tipo_mercancia PRIMARY KEY (id_tipo_mercancia);


--
-- TOC entry 2844 (class 2606 OID 25349)
-- Name: transporte pk_transporte; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT pk_transporte PRIMARY KEY (id_transporte);


--
-- TOC entry 2845 (class 2606 OID 25350)
-- Name: mercancia fk_mercanci_envia_responsa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mercancia
    ADD CONSTRAINT fk_mercanci_envia_responsa FOREIGN KEY (id_envia) REFERENCES public.responsable(id_responsable) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2846 (class 2606 OID 25355)
-- Name: mercancia fk_mercanci_recibe_responsa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mercancia
    ADD CONSTRAINT fk_mercanci_recibe_responsa FOREIGN KEY (id_recibe) REFERENCES public.responsable(id_responsable) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2847 (class 2606 OID 25360)
-- Name: mercancia fk_mercanci_relations_tipo_mer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mercancia
    ADD CONSTRAINT fk_mercanci_relations_tipo_mer FOREIGN KEY (id_tipo_mercancia) REFERENCES public.tipo_mercancia(id_tipo_mercancia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2848 (class 2606 OID 25365)
-- Name: responsable fk_responsa_relations_pais; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.responsable
    ADD CONSTRAINT fk_responsa_relations_pais FOREIGN KEY (id_pais) REFERENCES public.pais(id_pais) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2849 (class 2606 OID 25370)
-- Name: tipo_mercancia fk_tipo_mer_relations_tipo_mer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_mercancia
    ADD CONSTRAINT fk_tipo_mer_relations_tipo_mer FOREIGN KEY (tip_id_tipo_mercancia) REFERENCES public.tipo_mercancia(id_tipo_mercancia) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2851 (class 2606 OID 25380)
-- Name: transporte fk_transpor_relations_marca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT fk_transpor_relations_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2850 (class 2606 OID 25375)
-- Name: transporte fk_transpor_relations_pais; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transporte
    ADD CONSTRAINT fk_transpor_relations_pais FOREIGN KEY (id_pais) REFERENCES public.pais(id_pais) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2019-11-15 18:39:53 CST

--
-- PostgreSQL database dump complete
--

