--
-- PostgreSQL database dump
--

-- Dumped from database version 10.18
-- Dumped by pg_dump version 10.18

-- Started on 2023-02-03 14:26:13

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
-- TOC entry 203 (class 1259 OID 16425)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16423)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 16435)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16433)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 16417)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16415)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 207 (class 1259 OID 16443)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16453)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16451)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 206 (class 1259 OID 16441)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 211 (class 1259 OID 16461)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16459)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 213 (class 1259 OID 16521)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16519)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 16407)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16405)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 16396)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16394)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 230 (class 1259 OID 16667)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16633)
-- Name: main_achatentete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_achatentete (
    "ACHENT_ID" integer NOT NULL,
    "ACHENT_DOC" character varying(10) NOT NULL,
    "ACHENT_DATE" date,
    "ACHENT_CODE" integer NOT NULL,
    "ACHENT_ID_FOURN_id" integer NOT NULL
);


ALTER TABLE public.main_achatentete OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16631)
-- Name: main_achatentete_ACHENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_achatentete_ACHENT_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_achatentete_ACHENT_ID_seq" OWNER TO postgres;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 228
-- Name: main_achatentete_ACHENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_achatentete_ACHENT_ID_seq" OWNED BY public.main_achatentete."ACHENT_ID";


--
-- TOC entry 227 (class 1259 OID 16625)
-- Name: main_achatligne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_achatligne (
    "ACHLIG_ID" integer NOT NULL,
    "ACHLIG_ID_ACHENT" integer NOT NULL,
    "ACHLIG_QTY" integer NOT NULL,
    "ACHLIG_PU" double precision NOT NULL,
    "ACHLIG_REM" double precision NOT NULL,
    "ACHLIG_ID_ART_id" integer NOT NULL
);


ALTER TABLE public.main_achatligne OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16623)
-- Name: main_achatligne_ACHLIG_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_achatligne_ACHLIG_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_achatligne_ACHLIG_ID_seq" OWNER TO postgres;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 226
-- Name: main_achatligne_ACHLIG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_achatligne_ACHLIG_ID_seq" OWNED BY public.main_achatligne."ACHLIG_ID";


--
-- TOC entry 215 (class 1259 OID 16554)
-- Name: main_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_article (
    "AR_ID" integer NOT NULL,
    "AR_DESIGNATION" character varying(50) NOT NULL,
    "AR_FAMILLE" character varying(50) NOT NULL,
    "AR_PU_DEF" double precision NOT NULL,
    "AR_STOCK_REEL" integer NOT NULL,
    "AR_CODE" character varying(5) NOT NULL
);


ALTER TABLE public.main_article OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16552)
-- Name: main_article_AR_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_article_AR_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_article_AR_ID_seq" OWNER TO postgres;

--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 214
-- Name: main_article_AR_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_article_AR_ID_seq" OWNED BY public.main_article."AR_ID";


--
-- TOC entry 217 (class 1259 OID 16564)
-- Name: main_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_client (
    "CL_ID" integer NOT NULL,
    "CL_NOM" character varying(100) NOT NULL,
    "CL_ADR" text NOT NULL,
    "CL_TEL" character varying(14) NOT NULL,
    "CL_MAIL" character varying(100) NOT NULL,
    "CL_RC" character varying(15) NOT NULL,
    "CL_AI" character varying(15) NOT NULL,
    "CL_NIF" character varying(15) NOT NULL,
    "CL_CODE" integer NOT NULL,
    "CL_CODE_CHAR" character varying(5) NOT NULL
);


ALTER TABLE public.main_client OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16562)
-- Name: main_client_CL_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_client_CL_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_client_CL_ID_seq" OWNER TO postgres;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 216
-- Name: main_client_CL_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_client_CL_ID_seq" OWNED BY public.main_client."CL_ID";


--
-- TOC entry 232 (class 1259 OID 17030)
-- Name: main_famille; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_famille (
    "FAM_ID" integer NOT NULL,
    "FAM_DES" character varying(20) NOT NULL
);


ALTER TABLE public.main_famille OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17028)
-- Name: main_famille_FAM_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_famille_FAM_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_famille_FAM_ID_seq" OWNER TO postgres;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 231
-- Name: main_famille_FAM_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_famille_FAM_ID_seq" OWNED BY public.main_famille."FAM_ID";


--
-- TOC entry 219 (class 1259 OID 16577)
-- Name: main_fichecode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_fichecode (
    "FIC_ID" integer NOT NULL,
    "FIC_DESIGNATION" character varying(50) NOT NULL,
    "FIC_CODE" character varying(5) NOT NULL
);


ALTER TABLE public.main_fichecode OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16575)
-- Name: main_fichecode_FIC_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_fichecode_FIC_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_fichecode_FIC_ID_seq" OWNER TO postgres;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 218
-- Name: main_fichecode_FIC_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_fichecode_FIC_ID_seq" OWNED BY public.main_fichecode."FIC_ID";


--
-- TOC entry 221 (class 1259 OID 16589)
-- Name: main_fournisseur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_fournisseur (
    "FO_ID" integer NOT NULL,
    "FO_NOM" character varying(100) NOT NULL,
    "FO_ADR" text NOT NULL,
    "FO_TEL" character varying(14) NOT NULL,
    "FO_MAIL" character varying(100) NOT NULL,
    "FO_RC" character varying(15) NOT NULL,
    "FO_AI" character varying(15) NOT NULL,
    "FO_NIF" character varying(15) NOT NULL,
    "FO_CODE" integer NOT NULL,
    "FO_CODE_CHAR" character varying(5) NOT NULL
);


ALTER TABLE public.main_fournisseur OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16587)
-- Name: main_fournisseur_FO_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_fournisseur_FO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_fournisseur_FO_ID_seq" OWNER TO postgres;

--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 220
-- Name: main_fournisseur_FO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_fournisseur_FO_ID_seq" OWNED BY public.main_fournisseur."FO_ID";


--
-- TOC entry 225 (class 1259 OID 16612)
-- Name: main_frais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_frais (
    "FR_ID" integer NOT NULL,
    "FR_DESIGNATION" text NOT NULL,
    "FR_MONTANT" double precision NOT NULL,
    "FR_DATE" date NOT NULL,
    "FR_CODE" integer NOT NULL,
    "FR_CODE_REF" text NOT NULL,
    "FR_TYPE_id" integer NOT NULL
);


ALTER TABLE public.main_frais OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16610)
-- Name: main_frais_FR_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_frais_FR_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_frais_FR_ID_seq" OWNER TO postgres;

--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 224
-- Name: main_frais_FR_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_frais_FR_ID_seq" OWNED BY public.main_frais."FR_ID";


--
-- TOC entry 223 (class 1259 OID 16602)
-- Name: main_typefrais; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_typefrais (
    "FRT_ID" integer NOT NULL,
    "FRT_NAME" character varying(50) NOT NULL
);


ALTER TABLE public.main_typefrais OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16600)
-- Name: main_typefrais_FRT_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_typefrais_FRT_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_typefrais_FRT_ID_seq" OWNER TO postgres;

--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 222
-- Name: main_typefrais_FRT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_typefrais_FRT_ID_seq" OWNED BY public.main_typefrais."FRT_ID";


--
-- TOC entry 236 (class 1259 OID 17048)
-- Name: main_venteentete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_venteentete (
    "VNTENT_ID" integer NOT NULL,
    "VNTENT_DOC" character varying(10) NOT NULL,
    "VNTENT_DATE" date,
    "VNTENT_CODE" integer NOT NULL,
    "VNTENT_ID_CLIENT_id" integer NOT NULL
);


ALTER TABLE public.main_venteentete OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17046)
-- Name: main_venteentete_VNTENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_venteentete_VNTENT_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_venteentete_VNTENT_ID_seq" OWNER TO postgres;

--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 235
-- Name: main_venteentete_VNTENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_venteentete_VNTENT_ID_seq" OWNED BY public.main_venteentete."VNTENT_ID";


--
-- TOC entry 234 (class 1259 OID 17040)
-- Name: main_venteligne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_venteligne (
    "VNTLIG_ID" integer NOT NULL,
    "VNTLIG_ID_VNTENT" integer NOT NULL,
    "VNTLIG_QTY" integer NOT NULL,
    "VNTLIG_PU" double precision NOT NULL,
    "VNTLIG_REM" double precision NOT NULL,
    "VNTLIG_ID_ART_id" integer NOT NULL
);


ALTER TABLE public.main_venteligne OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17038)
-- Name: main_venteligne_VNTLIG_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."main_venteligne_VNTLIG_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."main_venteligne_VNTLIG_ID_seq" OWNER TO postgres;

--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 233
-- Name: main_venteligne_VNTLIG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."main_venteligne_VNTLIG_ID_seq" OWNED BY public.main_venteligne."VNTLIG_ID";


--
-- TOC entry 2798 (class 2604 OID 16679)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 16680)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2797 (class 2604 OID 16681)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 16682)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2801 (class 2604 OID 16683)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 16684)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2803 (class 2604 OID 16685)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 16686)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 16687)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2812 (class 2604 OID 16688)
-- Name: main_achatentete ACHENT_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_achatentete ALTER COLUMN "ACHENT_ID" SET DEFAULT nextval('public."main_achatentete_ACHENT_ID_seq"'::regclass);


--
-- TOC entry 2811 (class 2604 OID 16689)
-- Name: main_achatligne ACHLIG_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_achatligne ALTER COLUMN "ACHLIG_ID" SET DEFAULT nextval('public."main_achatligne_ACHLIG_ID_seq"'::regclass);


--
-- TOC entry 2805 (class 2604 OID 16690)
-- Name: main_article AR_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_article ALTER COLUMN "AR_ID" SET DEFAULT nextval('public."main_article_AR_ID_seq"'::regclass);


--
-- TOC entry 2806 (class 2604 OID 16691)
-- Name: main_client CL_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_client ALTER COLUMN "CL_ID" SET DEFAULT nextval('public."main_client_CL_ID_seq"'::regclass);


--
-- TOC entry 2813 (class 2604 OID 17033)
-- Name: main_famille FAM_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_famille ALTER COLUMN "FAM_ID" SET DEFAULT nextval('public."main_famille_FAM_ID_seq"'::regclass);


--
-- TOC entry 2807 (class 2604 OID 16692)
-- Name: main_fichecode FIC_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_fichecode ALTER COLUMN "FIC_ID" SET DEFAULT nextval('public."main_fichecode_FIC_ID_seq"'::regclass);


--
-- TOC entry 2808 (class 2604 OID 16693)
-- Name: main_fournisseur FO_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_fournisseur ALTER COLUMN "FO_ID" SET DEFAULT nextval('public."main_fournisseur_FO_ID_seq"'::regclass);


--
-- TOC entry 2810 (class 2604 OID 16694)
-- Name: main_frais FR_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_frais ALTER COLUMN "FR_ID" SET DEFAULT nextval('public."main_frais_FR_ID_seq"'::regclass);


--
-- TOC entry 2809 (class 2604 OID 16695)
-- Name: main_typefrais FRT_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_typefrais ALTER COLUMN "FRT_ID" SET DEFAULT nextval('public."main_typefrais_FRT_ID_seq"'::regclass);


--
-- TOC entry 2815 (class 2604 OID 17051)
-- Name: main_venteentete VNTENT_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_venteentete ALTER COLUMN "VNTENT_ID" SET DEFAULT nextval('public."main_venteentete_VNTENT_ID_seq"'::regclass);


--
-- TOC entry 2814 (class 2604 OID 17043)
-- Name: main_venteligne VNTLIG_ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_venteligne ALTER COLUMN "VNTLIG_ID" SET DEFAULT nextval('public."main_venteligne_VNTLIG_ID_seq"'::regclass);


--
-- TOC entry 3062 (class 0 OID 16425)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3064 (class 0 OID 16435)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3060 (class 0 OID 16417)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add article	7	add_article
26	Can change article	7	change_article
27	Can delete article	7	delete_article
28	Can view article	7	view_article
29	Can add client	8	add_client
30	Can change client	8	change_client
31	Can delete client	8	delete_client
32	Can view client	8	view_client
33	Can add fiche code	9	add_fichecode
34	Can change fiche code	9	change_fichecode
35	Can delete fiche code	9	delete_fichecode
36	Can view fiche code	9	view_fichecode
37	Can add fournisseur	10	add_fournisseur
38	Can change fournisseur	10	change_fournisseur
39	Can delete fournisseur	10	delete_fournisseur
40	Can view fournisseur	10	view_fournisseur
41	Can add type frais	11	add_typefrais
42	Can change type frais	11	change_typefrais
43	Can delete type frais	11	delete_typefrais
44	Can view type frais	11	view_typefrais
45	Can add frais	12	add_frais
46	Can change frais	12	change_frais
47	Can delete frais	12	delete_frais
48	Can view frais	12	view_frais
49	Can add achat ligne	13	add_achatligne
50	Can change achat ligne	13	change_achatligne
51	Can delete achat ligne	13	delete_achatligne
52	Can view achat ligne	13	view_achatligne
53	Can add achat entete	14	add_achatentete
54	Can change achat entete	14	change_achatentete
55	Can delete achat entete	14	delete_achatentete
56	Can view achat entete	14	view_achatentete
57	Can add famille	15	add_famille
58	Can change famille	15	change_famille
59	Can delete famille	15	delete_famille
60	Can view famille	15	view_famille
61	Can add vente ligne	16	add_venteligne
62	Can change vente ligne	16	change_venteligne
63	Can delete vente ligne	16	delete_venteligne
64	Can view vente ligne	16	view_venteligne
65	Can add vente entete	17	add_venteentete
66	Can change vente entete	17	change_venteentete
67	Can delete vente entete	17	delete_venteentete
68	Can view vente entete	17	view_venteentete
\.


--
-- TOC entry 3066 (class 0 OID 16443)
-- Dependencies: 207
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$hxGO7duXZMi9DeT3YBobJL$7ynDrrhAcUGsXHDOSeQ51Hh1o6s4eSlcPjXE8NPfTgo=	2022-09-06 11:32:47.065143+02	t	yazid			berrachedmedyazid@gmail.com	t	t	2022-09-06 11:32:21.024142+02
2	pbkdf2_sha256$260000$LrELPpFTiFjlkagqb3hcid$AW1sf42P5rTsjjrijdNUpiFB5gJ04JvCXgXUVUl/cxg=	2023-01-29 12:26:46.446959+01	t	root			yazid.berracuir@gmail.com	t	t	2023-01-02 13:02:54.634055+01
\.


--
-- TOC entry 3068 (class 0 OID 16453)
-- Dependencies: 209
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3070 (class 0 OID 16461)
-- Dependencies: 211
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3072 (class 0 OID 16521)
-- Dependencies: 213
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-09-06 11:33:14.387173+02	1	FR00000	1	[{"added": {}}]	11	1
2	2022-09-06 11:34:02.452491+02	1	FACTURE ACHAT	2	[{"changed": {"fields": ["FRT NAME"]}}]	11	1
3	2022-09-06 11:34:06.029819+02	2	ACOMPTE	1	[{"added": {}}]	11	1
4	2022-09-06 11:34:08.525714+02	3	SALAIRE	1	[{"added": {}}]	11	1
5	2022-09-06 11:34:39.091822+02	1	FR000	1	[{"added": {}}]	9	1
6	2022-09-06 11:35:22.382596+02	1	1	1	[{"added": {}}]	12	1
7	2022-09-06 11:46:24.55722+02	1	BERRACHED HADJ MUSTAPHA	1	[{"added": {}}]	10	1
8	2022-09-06 11:46:50.442053+02	2	TEST	1	[{"added": {}}]	10	1
9	2022-09-06 11:47:37.71404+02	1	1	1	[{"added": {}}]	14	1
10	2022-09-06 11:49:02.720992+02	2	FA000	1	[{"added": {}}]	9	1
11	2022-09-06 11:50:20.746102+02	1	PEROLY	1	[{"added": {}}]	7	1
12	2022-09-06 11:50:40.170427+02	2	ECROSS 33	1	[{"added": {}}]	7	1
13	2022-09-06 16:07:04.478466+02	3	2	3		12	1
14	2022-09-06 16:10:05.030801+02	1	BON ACHAT	2	[{"changed": {"fields": ["FRT NAME"]}}]	11	1
15	2022-09-06 16:10:16.40345+02	4	FACTURE ACHAT	1	[{"added": {}}]	11	1
16	2022-09-06 16:10:35.268548+02	5	BON ACHAT GANTS	1	[{"added": {}}]	11	1
17	2022-09-06 16:10:42.495097+02	6	BON ACHAT SEMELLE	1	[{"added": {}}]	11	1
18	2022-09-07 07:05:52.511415+02	2	FA	2	[{"changed": {"fields": ["FIC CODE"]}}]	9	1
19	2022-09-07 07:05:58.610122+02	1	FR	2	[{"changed": {"fields": ["FIC CODE"]}}]	9	1
20	2022-09-08 12:54:39.613486+02	7	1	3		12	1
21	2022-09-08 12:54:39.650303+02	6	1	3		12	1
22	2022-09-08 12:54:39.658319+02	5	3	3		12	1
23	2022-09-08 12:54:39.658319+02	4	2	3		12	1
24	2022-09-08 12:54:39.658319+02	1	1	3		12	1
25	2023-01-02 13:04:02.470509+01	7	AUTRES	1	[{"added": {}}]	11	2
26	2023-01-02 13:08:59.673786+01	2026	1165	2	[{"changed": {"fields": ["FR TYPE"]}}]	12	2
27	2023-01-02 13:09:36.390749+01	1	FR23	2	[{"changed": {"fields": ["FIC CODE"]}}]	9	2
28	2023-01-02 13:09:44.572782+01	2	FA23	2	[{"changed": {"fields": ["FIC CODE"]}}]	9	2
29	2023-01-18 19:44:27.686777+01	1	PEAUX BRUTE	1	[{"added": {}}]	15	2
30	2023-01-18 19:44:33.795732+01	2	CUIR SEMI FINIS	1	[{"added": {}}]	15	2
31	2023-01-18 19:44:42.240992+01	3	CUIR FINIS	1	[{"added": {}}]	15	2
32	2023-01-18 19:44:47.292707+01	4	PRODUIT CHIMIQUE	1	[{"added": {}}]	15	2
33	2023-01-18 19:47:04.672947+01	1	SARL DISTRICUIR	1	[{"added": {}}]	8	2
34	2023-01-18 19:47:18.22927+01	1	1	1	[{"added": {}}]	17	2
35	2023-01-18 19:48:24.993267+01	3	FV23	1	[{"added": {}}]	9	2
36	2023-01-18 19:51:00.218578+01	3	WETBLUE ( RUN )	1	[{"added": {}}]	7	2
37	2023-01-18 19:51:34.143574+01	4	WETBLUE ( 5EME )	1	[{"added": {}}]	7	2
38	2023-01-18 19:51:51.814398+01	5	WETBLUE ( 6EME )	1	[{"added": {}}]	7	2
39	2023-01-18 19:52:40.33097+01	6	WETBLUE ( 7EME )	1	[{"added": {}}]	7	2
40	2023-01-18 19:53:09.562516+01	7	WETBLUE ( 8EME )	1	[{"added": {}}]	7	2
41	2023-01-18 19:53:40.929294+01	8	WETBLUE ( 9EME )	1	[{"added": {}}]	7	2
42	2023-01-18 19:55:15.566635+01	9	PEAUX BRUTE 1ER CHOIX	1	[{"added": {}}]	7	2
43	2023-01-18 19:55:41.671526+01	10	PEAUX BRUTE 2EME CHOIX	1	[{"added": {}}]	7	2
44	2023-01-18 19:56:06.343635+01	11	PEAUX BRUTE 4EME CHOIX	1	[{"added": {}}]	7	2
45	2023-01-18 19:57:39.821675+01	2	BERRACHED CHAKIB	2	[{"changed": {"fields": ["FO NOM", "FO ADR", "FO TEL", "FO MAIL", "FO RC", "FO AI", "FO NIF"]}}]	10	2
46	2023-01-20 18:48:16.662331+01	2030	1166	2	[{"changed": {"fields": ["FR TYPE", "FR CODE REF"]}}]	12	2
47	2023-01-29 12:27:09.083875+01	2051	1186	2	[{"changed": {"fields": ["FR TYPE"]}}]	12	2
48	2023-01-30 13:52:46.614023+01	2066	1201	2	[{"changed": {"fields": ["FR TYPE"]}}]	12	2
49	2023-02-01 14:57:18.699639+01	2	2	1	[{"added": {}}]	8	2
50	2023-02-01 14:58:22.892574+01	3	2	1	[{"added": {}}]	10	2
51	2023-02-01 21:39:59.261917+01	8	MAINTENANCE	1	[{"added": {}}]	11	2
\.


--
-- TOC entry 3058 (class 0 OID 16407)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	main	article
8	main	client
9	main	fichecode
10	main	fournisseur
11	main	typefrais
12	main	frais
13	main	achatligne
14	main	achatentete
15	main	famille
16	main	venteligne
17	main	venteentete
\.


--
-- TOC entry 3056 (class 0 OID 16396)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-09-06 11:29:50.458671+02
2	auth	0001_initial	2022-09-06 11:29:50.599332+02
3	admin	0001_initial	2022-09-06 11:29:50.641803+02
4	admin	0002_logentry_remove_auto_add	2022-09-06 11:29:50.659505+02
5	admin	0003_logentry_add_action_flag_choices	2022-09-06 11:29:50.675462+02
6	contenttypes	0002_remove_content_type_name	2022-09-06 11:29:50.716354+02
7	auth	0002_alter_permission_name_max_length	2022-09-06 11:29:50.734311+02
8	auth	0003_alter_user_email_max_length	2022-09-06 11:29:50.752258+02
9	auth	0004_alter_user_username_opts	2022-09-06 11:29:50.769212+02
10	auth	0005_alter_user_last_login_null	2022-09-06 11:29:50.785171+02
11	auth	0006_require_contenttypes_0002	2022-09-06 11:29:50.789161+02
12	auth	0007_alter_validators_add_error_messages	2022-09-06 11:29:50.807111+02
13	auth	0008_alter_user_username_max_length	2022-09-06 11:29:50.832047+02
14	auth	0009_alter_user_last_name_max_length	2022-09-06 11:29:50.849387+02
15	auth	0010_alter_group_name_max_length	2022-09-06 11:29:50.86795+02
16	auth	0011_update_proxy_permissions	2022-09-06 11:29:50.883905+02
17	auth	0012_alter_user_first_name_max_length	2022-09-06 11:29:50.898868+02
18	main	0001_initial	2022-09-06 11:29:51.050254+02
19	sessions	0001_initial	2022-09-06 11:29:51.069595+02
20	main	0002_famille_venteentete_venteligne	2023-01-18 19:43:02.431634+01
21	main	0003_auto_20230120_1850	2023-01-20 18:50:41.446298+01
22	main	0004_auto_20230130_1358	2023-01-30 13:58:56.073306+01
\.


--
-- TOC entry 3089 (class 0 OID 16667)
-- Dependencies: 230
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
837kg8vdr90fv4gp9xeylomrxxd5xtd9	.eJxVjMsOwiAQRf-FtSEMjwZcuvcbyMAwUjWQlHZl_Hdt0oVu7znnvkTEba1xG2WJM4mzAHH63RLmR2k7oDu2W5e5t3WZk9wVedAhr53K83K4fwcVR_3WNmA2SGZCTWw0M0yBjS8KiH0IRjvHQYHPihMRaLYWgmNEBGaHSrw_8Os4Xg:1oVUwp:fxUfZEEmjcByEM5iBxzV7B8aazn5XIfvAWS-ZaUfW2w	2022-09-20 11:32:47.068163+02
9arw8q0np3jlunlitu4iavvkspmd7rrt	.eJxVjDsOwjAQRO_iGlnG9vpDSc8ZrPV6gwPIkeKkQtydREoBxTTz3sxbJFyXmtbOcxqLuAgtTr9dRnpy20F5YLtPkqa2zGOWuyIP2uVtKvy6Hu7fQcVetzVYHYiUhaAjZkNglHGoSrDOaKAtkdmjHyyBZ3DsBtKIFJSHePYsPl_AoDdL:1pCJXO:aG3GTw9e17Iyoo0jeZ2JxdAwTM1ECYvBN8sFIWssKfI	2023-01-16 13:03:30.398307+01
2yx5nkeqoewpt5r83jt7cpgf4zo2ytx5	.eJxVjDsOwjAQRO_iGlnG9vpDSc8ZrPV6gwPIkeKkQtydREoBxTTz3sxbJFyXmtbOcxqLuAgtTr9dRnpy20F5YLtPkqa2zGOWuyIP2uVtKvy6Hu7fQcVetzVYHYiUhaAjZkNglHGoSrDOaKAtkdmjHyyBZ3DsBtKIFJSHePYsPl_AoDdL:1pIDPy:xoP0uUerPn3wqbG-zTomnZwqiAKVCUKvHp6TVEB9pEE	2023-02-01 19:44:14.033173+01
jjvgp4tv3ckne8lu3ej5vtn3n59ev5wd	.eJxVjDsOwjAQRO_iGlnG9vpDSc8ZrPV6gwPIkeKkQtydREoBxTTz3sxbJFyXmtbOcxqLuAgtTr9dRnpy20F5YLtPkqa2zGOWuyIP2uVtKvy6Hu7fQcVetzVYHYiUhaAjZkNglHGoSrDOaKAtkdmjHyyBZ3DsBtKIFJSHePYsPl_AoDdL:1pIvTK:vwvsR6GnvAiY3JB5dkK3F9hB1wu_Z0ONj7wi1xxMJ9s	2023-02-03 18:46:38.028737+01
6jlo212q93wwkx741qxbuqjtieszy1b4	.eJxVjDsOwjAQRO_iGlnG9vpDSc8ZrPV6gwPIkeKkQtydREoBxTTz3sxbJFyXmtbOcxqLuAgtTr9dRnpy20F5YLtPkqa2zGOWuyIP2uVtKvy6Hu7fQcVetzVYHYiUhaAjZkNglHGoSrDOaKAtkdmjHyyBZ3DsBtKIFJSHePYsPl_AoDdL:1pM5pe:sWGSGpY9vDgVBjh7CcFK_0PYlDORj0-CR13wufSyFN8	2023-02-12 12:26:46.462903+01
\.


--
-- TOC entry 3088 (class 0 OID 16633)
-- Dependencies: 229
-- Data for Name: main_achatentete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_achatentete ("ACHENT_ID", "ACHENT_DOC", "ACHENT_DATE", "ACHENT_CODE", "ACHENT_ID_FOURN_id") FROM stdin;
1	FR00000001	2022-09-06	1	2
2	FA23000002	2023-01-18	2	2
3	FA23000003	2022-12-31	3	2
4	FA23000004	2023-01-07	4	2
5	FA23000005	2023-01-14	5	2
6	FA23000006	2023-01-22	6	2
7	FA23000007	2023-01-30	7	2
\.


--
-- TOC entry 3086 (class 0 OID 16625)
-- Dependencies: 227
-- Data for Name: main_achatligne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_achatligne ("ACHLIG_ID", "ACHLIG_ID_ACHENT", "ACHLIG_QTY", "ACHLIG_PU", "ACHLIG_REM", "ACHLIG_ID_ART_id") FROM stdin;
6	2	200	250	0	9
7	3	29	250	0	9
9	4	15	150	0	9
10	5	27	250	0	9
11	6	9	150	0	9
12	7	20	250	0	9
13	-1	180	56	0	11
\.


--
-- TOC entry 3074 (class 0 OID 16554)
-- Dependencies: 215
-- Data for Name: main_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_article ("AR_ID", "AR_DESIGNATION", "AR_FAMILLE", "AR_PU_DEF", "AR_STOCK_REEL", "AR_CODE") FROM stdin;
3	WETBLUE ( RUN )	CUIR SEMI FINIS	800	0	CSF01
4	WETBLUE ( 5EME )	CUIR SEMI FINIS	650	0	CSF02
5	WETBLUE ( 6EME )	CUIR SEMI FINIS	550	0	CSF03
6	WETBLUE ( 7EME )	CUIR SEMI FINIS	280	0	CSF04
7	WETBLUE ( 8EME )	CUIR SEMI FINIS	150	0	CSF05
8	WETBLUE ( 9EME )	CUIR SEMI FINIS	50	0	CSF06
10	PEAUX BRUTE 2EME CHOIX	PEAUX BRUTE	100	0	PB02
11	PEAUX BRUTE 4EME CHOIX	PEAUX BRUTE	0	0	PB03
9	PEAUX BRUTE 1ER CHOIX	PEAUX BRUTE	150	300	PB01
\.


--
-- TOC entry 3076 (class 0 OID 16564)
-- Dependencies: 217
-- Data for Name: main_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_client ("CL_ID", "CL_NOM", "CL_ADR", "CL_TEL", "CL_MAIL", "CL_RC", "CL_AI", "CL_NIF", "CL_CODE", "CL_CODE_CHAR") FROM stdin;
1	SARL DISTRICUIR	ZONE D_ACTIVITE OUED TLELATE, ORAN	0661202344	districuir@gmail.com	###	###	###	1	clold
2	BENDAHME	TIARET	00	K@K.K	K	K	K	2	CL002
\.


--
-- TOC entry 3091 (class 0 OID 17030)
-- Dependencies: 232
-- Data for Name: main_famille; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_famille ("FAM_ID", "FAM_DES") FROM stdin;
1	PEAUX BRUTE
2	CUIR SEMI FINIS
3	CUIR FINIS
4	PRODUIT CHIMIQUE
\.


--
-- TOC entry 3078 (class 0 OID 16577)
-- Dependencies: 219
-- Data for Name: main_fichecode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_fichecode ("FIC_ID", "FIC_DESIGNATION", "FIC_CODE") FROM stdin;
1	FRAIS	FR23
2	FACTURE ACHAT	FA23
3	FACTURE VENTE	FV23
\.


--
-- TOC entry 3080 (class 0 OID 16589)
-- Dependencies: 221
-- Data for Name: main_fournisseur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_fournisseur ("FO_ID", "FO_NOM", "FO_ADR", "FO_TEL", "FO_MAIL", "FO_RC", "FO_AI", "FO_NIF", "FO_CODE", "FO_CODE_CHAR") FROM stdin;
1	BERRACHED HADJ MUSTAPHA	ORAN	000	Z@A.A	\\\\	\\\\	\\\\	1	foold
2	BERRACHED CHAKIB	ES-SENIA ORAN	0661209770	NONE@NONE.COM	###	###	###	2	foold
3	BENDAHMA	TIARET	9	K@K.K	K	K	K	2	FO003
\.


--
-- TOC entry 3084 (class 0 OID 16612)
-- Dependencies: 225
-- Data for Name: main_frais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_frais ("FR_ID", "FR_DESIGNATION", "FR_MONTANT", "FR_DATE", "FR_CODE", "FR_CODE_REF", "FR_TYPE_id") FROM stdin;
1947	SALAIRE HOUCINE	6000	2022-08-25	1086	FR0001086	3
1957	SALAIRE YAZID	83000	2022-09-08	1096	FR0001096	3
1991	ACOMPTE ABDELKADER	1000	2022-09-28	1130	FR0001130	2
2002	FRAIS DIVERS	100	2022-10-05	1141	FR0001141	1
2005	test	55	2022-11-04	1144	FR0001144	2
2007	GANT + TORCHAN	540	2022-12-18	1146	FR0001146	1
2013	ARTICLE BUREAUTIQUE	240	2022-12-22	1152	FR0001152	1
2017	ACHAT QUINCAILLERIE GENERAL	700	2022-12-26	1156	FR0001156	1
2030	facture d_achat N° : FA23000003.	7250	2022-12-31	1166	FR2301166	4
2040	SALAIRE BOUABDELLAH	7250	2023-01-09	1176	FR230001176	3
2052	SALAIRE MILOUD	7000	2023-01-26	1187	FR230001187	3
2062	SALAIRE YAZID JANVIER	83000	2023-01-30	1197	FR230001197	3
2067	ACHAT QUINCAILLERIE GENERAL	360	2023-01-31	1202	FR230001202	1
2068	ACHAT PEINTURE ROUGE	1350	2023-02-01	1203	FR230001203	3
2077	MAINTENANCE HYDRAULIQUE CHAUDELLE	3000	2023-02-01	1212	FR230001212	8
1948	POUBELLE	3000	2022-08-27	1087	FR0001087	1
1958	ACHAT CIMENT+SABLE	1500	2022-09-08	1097	FR0001097	1
2003	ACHAT 08 ETRIES	320	2022-10-05	1142	FR0001142	1
2006	test	3000	2022-11-04	1145	FR0001145	2
2008	ACHAT QUINCAILLERIE GENERAL	890	2022-12-18	1147	FR0001147	1
2014	SALAIRE BOUABDELLAH	7250	2022-12-22	1153	FR0001153	3
2018	COUTURE GANTS	1500	2022-12-26	1157	FR0001157	5
2031	SALAIRE ABDELKADER GARDIENT	24000	2023-01-04	1167	FR230001167	3
2041	facture d_achat N° : FA23000005.	6750	2023-01-14	1177	FR230001177	2
2051	facture d_achat N° : FA23000006.	1350	2023-01-22	1186	FR230001186	4
2053	SALAIRE BOUABDELLAH	7250	2023-01-26	1188	FR230001188	3
2063	SALAIRE GERANT JANVIER	150000	2023-01-30	1198	FR230001198	3
2069	ELECTRICITE	16000	2023-02-01	1204	FR230001204	7
1949	ACOMPTE BOUABDELLAH	1000	2022-08-27	1088	FR0001088	2
1959	ACHAT CIMENT+SABLE	9500	2022-09-08	1098	FR0001098	1
2004	ACHAT FER ( CORNIERE + RAIL	1480	2022-10-05	1143	FR0001143	1
2009	ARTICLE BUREAUTIQUE	380	2022-12-21	1148	FR0001148	1
2015	SALAIRE MILOUD	4375	2022-12-22	1154	FR0001154	3
2019	VERSEMENT CHAKIB 	90000	2022-12-27	1158	FR0001158	4
2032	SALAIRE MILOUD	6250	2023-01-04	1168	FR230001168	3
2042	ACHAT QUINCAILLERIE GENERAL	265	2023-01-15	1178	FR230001178	1
2054	TOURNEUR	1500	2023-01-29	1189	FR230001189	7
2064	ACHAT QUINCAILLERIE GENERAL	1900	2023-01-30	1199	FR230001199	1
2070	COMPTABLE	5000	2023-02-01	1205	FR230001205	3
1950	ACOMPTE ABDELKADER	1000	2022-08-28	1089	FR0001089	2
1960	FRAIS DIVERS	1100	2022-09-08	1099	FR0001099	1
2010	GASOIL	1200	2022-12-21	1149	FR0001149	1
2016	ACOMPTE MILOUD	6000	2022-12-22	1155	FR0001155	2
2020	ACHAT ARTICLE ALIMENTATION	280	2022-12-27	1159	FR0001159	1
2033	FRAIS DIVERS	1250	2023-01-07	1169	FR230001169	1
2043	ACHAT 02 PALIERS	48000	2023-01-17	1179	FR230001179	1
2055	ACHAT QUINCAILLERIE GENERAL	630	2023-01-29	1190	FR230001190	1
2065	GAZ YAZID	300	2023-01-30	1200	FR230001200	1
2071	SALAIRE YAZID	83000	2023-02-01	1206	FR230001206	3
1951	ACHAT 02 ROULEAUX DE CYLOPHANE	2600	2022-08-28	1090	FR0001090	1
1961	ACHAT FAILLANCE	14400	2022-09-08	1100	FR0001100	1
1967	FRAIS DIVERS	500	2022-09-10	1106	FR0001106	1
1968	ACHAT 06 CIMENTS 	3000	2022-09-11	1107	FR0001107	1
1971	ELECTRICITE	16000	2022-09-12	1110	FR0001110	1
1972	ACHAT DISQUE A BETON	1450	2022-09-14	1111	FR0001111	1
1974	ACOMPTE ABDELKADER	500	2022-09-14	1113	FR0001113	2
1975	ACHAT QUINCAILLERIE GENERAL	180	2022-09-15	1114	FR0001114	1
1980	ACOMPTE ABDELKADER	4000	2022-09-19	1119	FR0001119	2
1984	SALAIRE MILOUD	5000	2022-09-21	1123	FR0001123	3
1985	SALAIRE HOUCINE	4750	2022-09-22	1124	FR0001124	3
1992	SALAIRE HOUCINE	7500	2022-09-29	1131	FR0001131	3
1996	ACHAT SABLE	10000	2022-10-03	1135	FR0001135	1
2011	ACHAT QUINCAILLERIE GENERAL	590	2022-12-21	1150	FR0001150	1
2021	ACHAT QUINCAILLERIE GENERAL	630	2022-12-27	1160	FR0001160	1
2034	INSTALLATION SYSTEME ALARME	38500	2023-01-07	1170	FR230001170	1
2044	ACHAT 01 SOUFLEUR ( S_E )	33000	2023-01-17	1180	FR230001180	1
2056	VERSEMENT MUSTAPHA ETUDE STATION D_EPURATION	100000	2023-01-29	1191	FR230001191	7
2066	facture d_achat N° : FA23000007.	5000	2023-01-30	1201	FR230001201	4
2072	SALAIRE GERANT	150000	2023-02-01	1207	FR230001207	3
1952	ACOMPTE BOUABDELLAH	1000	2022-08-31	1091	FR0001091	2
1962	BRIK	26000	2022-09-08	1101	FR0001101	1
1969	ACHAT 01 VOYAGE DE SABLE + 01 V SABLE DE CARRIERE	10000	2022-09-11	1108	FR0001108	1
1973	FRAIS DIVERS	290	2022-09-14	1112	FR0001112	1
1976	SALAIRE HOUCINE	3750	2022-09-15	1115	FR0001115	3
1981	ACOMPTE HOUCINE	1500	2022-09-19	1120	FR0001120	2
1986	SALAIRE BOUABDELLAH	6250	2022-09-22	1125	FR0001125	3
1993	SALAIRE BOUABDELLAH	6250	2022-09-29	1132	FR0001132	3
1997	ACHAT FER	2200	2022-10-03	1136	FR0001136	1
2012	ACHAT QUINCAILLERIE GENERAL	520	2022-12-21	1151	FR0001151	1
2022	ACHAT QUINCAILLERIE GENERAL	380	2022-12-28	1161	FR0001161	1
2035	facture d_achat N° : FA23000004.	2250	2023-01-07	1171	FR230001171	2
2045	EXTINCTEUR	3000	2023-01-17	1181	FR230001181	1
2057	SALAIRE COMPTABLE JANVIER	5000	2023-01-29	1192	FR230001192	3
1953	POUBELLE	3000	2022-08-31	1092	FR0001092	1
1963	ACHAT CIMENT ( 06)	2700	2022-09-08	1102	FR0001102	1
1970	ACHAT QUINCAILLERIE GENERAL	425	2022-09-11	1109	FR0001109	1
1977	SALAIRE BOUABDELLAH	7500	2022-09-15	1116	FR0001116	3
1982	ACHAT 10 KG CIMENT BLANC	300	2022-09-19	1121	FR0001121	1
1987	ACHAT QUINCAILLERIE GENERAL	410	2022-09-22	1126	FR0001126	1
1994	SALAIRE MILOUD	6250	2022-09-29	1133	FR0001133	3
1998	ACHAT FER 12	6750	2022-10-03	1137	FR0001137	1
2023	SALAIRE MILOUD	6250	2022-12-28	1162	FR0001162	3
2036	ACHAT CHAUX	2100	2023-01-09	1172	FR230001172	1
2046	PRESTATION GANTS	2000	2023-01-17	1182	FR230001182	5
2058	SALAIRE COMPTABLE FEVRIER	5000	2023-01-29	1193	FR230001193	3
2074	facture d_achat N° : FA23000008.	10080	2023-02-01	1209	FR230001209	4
1954	EXTINCTEUR	7600	2022-09-04	1093	FR0001093	1
1964	SALAIRE BOUABDELLAH	4000	2022-09-10	1103	FR0001103	3
1978	SALAIRE MILOUD	7500	2022-09-15	1117	FR0001117	3
1983	G50 COMPLEMENTAIRE MARS 2022	500	2022-09-20	1122	FR0001122	1
1988	FRAIS DIVERS MAISON	2065	2022-09-27	1127	FR0001127	1
1995	SALAIRE ABDELKADER GARDIENT	10500	2022-09-29	1134	FR0001134	3
1999	TRANSPORT	3500	2022-10-03	1138	FR0001138	1
2024	AHMED DISTRICUIR	7000	2022-12-28	1163	FR0001163	3
2037	PRESTATION POUBELLE	2000	2023-01-09	1173	FR230001173	1
2047	SALAIRE MILOUD	5425	2023-01-18	1183	FR230001183	3
2059	G50 DEC 2022 + JAN ET FEV 2023	83627	2023-01-29	1194	FR230001194	7
2075	SALAIRE BOUABDELLAH	6525	2023-02-01	1210	FR230001210	3
1955	FRAIS DIVERS	2100	2022-09-08	1094	FR0001094	1
1965	SALAIRE MILOUD	4000	2022-09-08	1104	FR0001104	3
1979	ACOMPTE ABDELKADER	15500	2022-09-15	1118	FR0001118	2
1989	ACHAT SABLE	10000	2022-09-28	1128	FR0001128	1
2000	ACHAT PLANCHE DE BOIS	6400	2022-10-03	1139	FR0001139	1
2025	SALAIRE BOUABDELLAH	6525	2022-12-28	1164	FR0001164	3
2038	ACHAT QUINCAILLERIE GENERAL	500	2023-01-09	1174	FR230001174	1
2048	SALAIRE BOUABDELLAH	7000	2023-01-18	1184	FR230001184	3
2060	VISA ITALIE BERRACHED SIDI MOHAMED	30000	2023-01-29	1195	FR230001195	7
2076	SALAIRE MILOUD	3750	2023-02-01	1211	FR230001211	3
862	ACHAT SABLE+BRIQUE	7500	2020-02-08	1	FR0000001	1
863	ACHAT DEUX BAR DE BOIS POUR LA SALLE DE BAIN	200	2020-02-08	2	FR0000002	1
864	ACHAT QUINCAILLERIE	990	2020-02-08	3	FR0000003	1
865	ACHAT RECEVEUR DE DOUCHE	1000	2020-02-09	4	FR0000004	1
866	ACHAT QUINCAILLERIE DIVERS	4370	2020-02-09	5	FR0000005	1
867	FACTURE N°002/20 SACQEM (ANALYSE PHYSICOCHIMIQUE	30654	2020-01-07	6	FR0000006	1
868	ACHAT QUINCAILLERIE DIVERS	3450	2020-01-05	7	FR0000007	1
869	ACHAT QUINCAILLERIE DIVERS	5000	2020-01-09	8	FR0000008	1
870	FACTURE N° FV2019/00421ACHAT LOGICIEL EURL LEADERSOFT	17850	2019-12-17	9	FR0000009	1
871	FACTURE N°6937288421 ALGERIE TELECOM	3232	2019-12-10	10	FR0000010	1
872	ACHAT GAZOIL	1900	2020-01-23	11	FR0000011	1
873	ACHAT QUINCAILLERIE DIVERS	4050	2020-01-04	12	FR0000012	1
874	ACHAT ARTICLES BUREAUTIQUE	1030	2020-01-13	13	FR0000013	1
875	ACOMPTE BELAMARA EL EID	2000	2020-02-02	14	FR0000014	1
876	ACOMPTE FRIH BENGABOU BILEL	1000	2020-02-02	15	FR0000015	1
877	ACOMPTE FRIH BENGABOU BILEL	1000	2020-02-12	16	FR0000016	1
878	ACOMPTE BELAMARA EL EID	2000	2020-02-13	17	FR0000017	1
879	ACOMPTE BENYAHHOU CHIKH	2000	2020-02-13	18	FR0000018	1
880	ACOMPTE FRIH BENGABOU BILEL	2000	2020-02-13	19	FR0000019	1
881	STC NHILI ABDELHAK	1600	2020-02-13	20	FR0000020	1
882	ACHAT ELECTRIQUE	1800	2020-02-13	21	FR0000021	1
883	ACHAT BOTTE + COLLE PVC	600	2020-02-13	22	FR0000022	1
884	TRANSPORT AVOIR	2000	2020-02-13	23	FR0000023	1
885	SOUDEUR	2200	2020-02-13	24	FR0000024	1
886	PAYEMENT BERRACHED HADJ SUR 1030 PEAUX	154500	2020-02-12	25	FR0000025	1
887	ACHAT ATTACHE DE CHAINE + 2 HORLOGE INDUSTRIELLE	5600	2020-02-15	26	FR0000026	1
888	ACOMPTE NHILI SOFIANE	2000	2020-02-15	27	FR0000027	1
889	ACOPMTE NHILI SOFIANE	13000	2020-02-16	28	FR0000028	1
890	ACOMPTE FRIH BENGABOU BILEL	6000	2020-02-16	29	FR0000029	1
891	ACOMPTE BENYAHHOU CHIKH	2000	2020-02-16	30	FR0000030	1
892	TRANSPORT AMIR	1000	2020-02-16	31	FR0000031	1
893	TRANSPORT AMIR	1000	2020-02-17	32	FR0000032	1
894	ACOMPTE BELAMARA EL EID	10000	2020-02-17	33	FR0000033	1
895	ACOMPTE MADJID	5500	2020-02-17	34	FR0000034	1
896	ACHAT PEDALE TFS 	2200	2020-02-17	35	FR0000035	1
897	TRANSPORT AMIR	2000	2020-02-18	36	FR0000036	1
898	TRANSPORT PERSONNEL	1330	2020-02-18	37	FR0000037	1
899	TRANSPORT AMIR	1000	2020-02-19	38	FR0000038	1
900	ACHAT ARTICLES BUREAUTIQUE	1900	2020-02-19	39	FR0000039	1
901	ACHAT CHAISE POUR BUREAU	4000	2020-02-19	40	FR0000040	1
902	TRANSPORT AMIR	1000	2020-02-20	41	FR0000041	1
903	STC TROIS NOUVEAUX EMPLOYES	5100	2020-02-20	42	FR0000042	1
904	CHARGEUR SAMSUNG PC PORTABLE	1200	2020-02-22	43	FR0000043	1
905	CABLE GVA 5 M	700	2020-02-22	44	FR0000044	1
906	REGEMENT BERRACHED AMIR	6000	2020-02-22	45	FR0000045	1
907	STC MADJID	3500	2020-02-22	46	FR0000046	1
908	CABLE 4*2,5 (14M) SOUPLE	2520	2020-02-24	47	FR0000047	1
909	ACHAT ARTICLE PLOMBRIE	950	2020-02-24	48	FR0000048	1
910	DEJEUNER CLASSEUR AHMED	200	2020-02-27	49	FR0000049	1
911	ACHAT BRULEUR CHAUDIERE	61000	2020-02-27	50	FR0000050	1
912	ACHAT ARTICLES PLOMBRIE 	800	2020-02-29	51	FR0000051	1
913	ACHAT PAPIER PH + AREOMETRE + TERMOMETRE	10200	2020-02-29	52	FR0000052	1
914	ACOMPTE FRIH BENGABOU BILEL	1500	2020-02-29	53	FR0000053	1
915	ACHAT ARTICLES QUINCAILLERIE GENERALE	340	2020-03-01	54	FR0000054	1
916	ACHAT ARTICLES ELECTRICITE	6450	2020-03-01	55	FR0000055	1
917	ACHAT ARTICLES QUINCAILLERIE GENERALE	2650	2020-03-01	56	FR0000056	1
918	ACHAT ARTICLES PLOMBRIE	410	2020-03-01	57	FR0000057	1
919	ACHAT ARTICLES QUINCAILLERIE GENERALE	3280	2020-03-01	58	FR0000058	1
920	SOUDEUR	9000	2020-03-02	59	FR0000059	1
921	ACHAT GASOIL POUR CHAUDIERE	1600	2020-03-03	60	FR0000060	1
922	ACHAT PEAUX HILAL 218	21000	2020-03-04	61	FR0000061	1
923	TRANSPORT PERSONNEL	3000	2020-03-05	62	FR0000062	1
924	CLASSEUR VERSEMENT	5000	2020-03-05	63	FR0000063	1
925	PLOMBIER	4000	2020-03-05	64	FR0000064	1
926	TRANSPORT DECHET	3000	2020-03-05	65	FR0000065	1
927	ELECTRICITE	10000	2020-03-05	66	FR0000066	1
928	PAYEMENT EULDJ 	105500	2020-03-05	67	FR0000067	1
929	ACOMPTE KHADIDJA	13000	2020-03-05	68	FR0000068	1
930	ACOMPTE KHADIDJA	3150	2020-03-07	69	FR0000069	1
931	HUILE POUR CHARNEURSE	12000	2020-03-07	70	FR0000070	1
932	COLLE DE JOINTURE + EPONGE	540	2020-03-07	71	FR0000071	1
933	ROULEMENT POUR CHARNEUSE	1500	2020-03-07	72	FR0000072	1
934	ACHAT QUINCAILLERIE GENERALE	2440	2020-03-07	73	FR0000073	1
935	ACHAT COURBEILLE A COURRIER + PORTE STYLO	750	2020-03-07	74	FR0000074	1
936	JAVEL	90	2020-03-08	75	FR0000075	1
937	HUILE POUR CHARNEURSE	12000	2020-03-08	76	FR0000076	1
938	ACHAT QUINCAILLERIE GENERALE	500	2020-03-08	77	FR0000077	1
939	ACHAT 3 SACS DE CHAUX	1350	2020-03-09	78	FR0000078	1
940	PAYEMENT EULDJ 	35500	2020-03-09	79	FR0000079	1
941	ACHAT PLASTIQUE NOIR 7,6 M	1140	2020-03-10	80	FR0000080	1
942	ACHAT GANT DINQI	2220	2020-03-10	81	FR0000081	1
943	ACOMPTE KHADIDJA (PAYEMENT HEBDOMADERE	7500	2020-03-11	82	FR0000082	1
944	VERSEMENT MENUISIER	14000	2020-03-12	83	FR0000083	1
945	ACHAT PEAUX HILAL 183	18000	2020-03-12	84	FR0000084	1
946	ACHAT GAZOIL POUR CHADIERE	700	2020-03-12	85	FR0000085	1
947	ACOMPTE BENYAKHOU CHEIK	5000	2020-03-14	86	FR0000086	1
948	PAYEMENT MENUISIER	16000	2020-03-15	87	FR0000087	1
949	VENTE LAINE 	12000	2020-03-11	88	FR0000088	1
950	ACHAT CHAUX	3300	2020-03-16	89	FR0000089	1
951	ACHAT PLASTIQUE ET TORCHAN POUR SULFURE	800	2020-03-17	90	FR0000090	1
952	PAYEMENT HEBDOMADAIRE TRANSPORT PERSONNEL	2500	2020-03-12	91	FR0000091	1
953	ACOMPTE ZORDALI MILOUD	10000	2020-03-17	92	FR0000092	1
954	ACOMPTE BENAMARA LAID	10000	2020-03-17	93	FR0000093	1
955	ACOMPTE BENYAKHOU CHEIK	1000	2020-03-17	94	FR0000094	1
956	ACOMPTE FRIH BENGABOU BILEL	1000	2020-03-17	95	FR0000095	1
957	PAYEMENT HEBDOMADAIRE KHADIDJA	7500	2020-03-19	96	FR0000096	1
958	FACTURE TELEPHONE	3500	2020-03-24	97	FR0000097	1
959	ACOMPTE ABBASSI	2000	2020-03-24	98	FR0000098	1
960	PAYEMENT HEBDOMADAIRE TRANSPORT PERSONNEL	3000	2020-03-24	99	FR0000099	1
961	STC ABBASSI	2000	2020-03-24	100	FR0000100	1
962	ACHAT SEL SIG	2000	2020-03-24	101	FR0000101	1
963	ACHAT SEL FAYCEL	5000	2020-03-24	102	FR0000102	1
964	ACHAT GAZOIL POUR CHADIERE	700	2020-03-24	103	FR0000103	1
965	ACOMPTE NHILI SOFIANE	1300	2020-03-24	104	FR0000104	1
966	PAYEMENT HEBDOMADAIRE KHADIDJA	7200	2020-03-24	105	FR0000105	1
967	PAYEMENT SALAIRE BENAMARA LAID	16900	2020-03-26	106	FR0000106	1
968	MAçON	3000	2020-03-28	107	FR0000107	1
969	PAYE MENSUELLE YAZID	70000	2020-03-28	108	FR0000108	1
970	MAINTENANCE SOUDEUR	2000	2020-04-11	109	FR0000109	1
971	TRANSPORT MARCHANDISES ( PEAUX BRUT DEPOT-USINE	3500	2020-04-11	110	FR0000110	1
972	PAYEMENT BENAMARA LAID	13000	2020-04-23	111	FR0000111	1
973	DON (PRIME DE RENDEMENT ) [SOFIANE+LAID]	4000	2020-04-23	112	FR0000112	1
974	PAYEMENT BENYAKHOU CHEIKH	4600	2020-04-25	113	FR0000113	1
975	REGELEMENT ACHAT PEAUX BRUT HADJ	300000	2020-04-25	114	FR0000114	1
976	ACHAT ARTICLE QUINCAILLERIE GENERALE	570	2020-04-29	115	FR0000115	1
977	VERSEMENT IMPOT	120000	2020-04-29	116	FR0000116	1
978	ACOMPTE YAZID	20000	2020-04-29	117	FR0000117	1
979	SALAIRE NHILI SOFIANE 	28000	2020-04-29	118	FR0000118	1
980	ACHAT DETANNE ( DEGRAISSANT TANNERIE )	48000	2020-05-10	119	FR0000119	1
981	CAUTION POUR ACHAT DETANNE ( 04 FUTS )	5000	2020-05-10	120	FR0000120	1
982	ACHAT SEL 4000 KG (80 SACS)	20000	2020-05-10	121	FR0000121	1
983	ACHAT PRODUIT CHIMIQUES (NSDIC FACTURE:° 150/2020	423342.5	2020-05-13	122	FR0000122	1
984	ACHAT ARTICLE QUINCAILLERIE GENERALE	2400	2020-05-13	123	FR0000123	1
985	ACHAT ARTICLE QUINCAILLERIE GENERALE	340	2020-05-18	124	FR0000124	1
986	ACHAT ARTICLE QUINCAILLERIE GENERALE	450	2020-05-20	125	FR0000125	1
987	ACHAT ARTICLE QUINCAILLERIE GENERALE	1500	2020-05-21	126	FR0000126	1
988	SERRURE POUR BUREAU	400	2020-06-01	127	FR0000127	1
989	SALAIRE NHILI SOFIANE	25000	2020-06-03	128	FR0000128	1
990	SALAIRE BERRACHED YAZID	70000	2020-06-03	129	FR0000129	1
991	ACHAT 3 SACS DE CIMENTS	1200	2020-06-08	130	FR0000130	1
992	ACHAT 4 TUBES DE NEON LED	1840	2020-06-15	131	FR0000131	1
993	ACHAT ARTICLE QUINCAILLERIE GENERALE	720	2020-06-15	132	FR0000132	1
994	ACHAT PLASTIQUE + RONDELLE + COUTEAU	610	2020-06-15	133	FR0000133	1
995	ACHAT ARTICLE QUINCAILLERIE GENERALE	100	2020-06-20	134	FR0000134	1
996	ACHAT ARTICLE QUINCAILLERIE GENERALE	250	2020-06-23	135	FR0000135	1
997	ACHAT DETERGENTS	450	2020-06-24	136	FR0000136	1
998	SALAIRE NHILI SOFIANE	21290	2020-07-01	137	FR0000137	1
999	SALAIRE BENAMARA LAID	4400	2020-07-01	138	FR0000138	1
1000	SALAIRE LHADJ	8000	2020-07-01	139	FR0000139	1
1001	SALAIRE ABOUABDALLAH	5000	2020-07-01	140	FR0000140	1
1002	SALAIRE LAHCEN	6250	2020-07-01	141	FR0000141	1
1003	CLE ETOILE + CLE A FOURCHE N° 8	520	2020-07-07	142	FR0000142	1
1004	ACHAT ARTICLE QUINCAILLERIE GENERALE	130	2020-07-07	143	FR0000143	1
1005	ACHAT ARTICLE QUINCAILLERIE GENERALE	390	2020-07-08	144	FR0000144	1
1006	ACHAT BOTTES + GANTS + PALETTE + CONTACTEUR + PLASTIQUE	16500	2020-07-11	145	FR0000145	1
1007	ACOMPTE BENAMARA LAID	8000	2020-07-16	146	FR0000146	1
1008	ACOMPTE BOUABDELLAH	8000	2020-07-16	147	FR0000147	1
1009	ACOMPTE LAHCEN	5500	2020-07-16	148	FR0000148	1
1010	ACOMPTE MOURAD	8000	2020-07-16	149	FR0000149	1
1011	SALAIRE AMINA BENATIYA	5000	2020-07-19	150	FR0000150	1
1012	SALAIRE ZAHERA BELGAID	6000	2020-07-19	151	FR0000151	1
1013	ACHAT CABLE ELECTRICITE 25 METRES	1900	2020-08-17	152	FR0000152	1
1014	ACHAT PRODUIT CHIMIQUE NSDIC BL N° 302/2020	2055844	2020-08-17	153	FR0000153	1
1015	TRANSPORT + CLARK	35000	2020-08-18	154	FR0000154	1
1016	ACHAT ARTICLES QUINCAILLERIE GENERALE	230	2020-08-24	155	FR0000155	1
1017	ACHAT ARTICLES QUINCAILLERIE GENERALE	80	2020-08-24	156	FR0000156	1
1018	REPARATION MOTEURS	65000	2020-08-24	157	FR0000157	1
1019	TRANSPORT	1500	2020-08-26	158	FR0000158	1
1020	EVA	16000	2020-08-26	159	FR0000159	1
1021	ACHAT ARTICLES QUINCAILLERIE GENERALE	2520	2020-08-26	160	FR0000160	1
1022	ACHAZT COURROI + ROULEMENT	18000	2020-08-26	161	FR0000161	1
1023	ACHAT COUROI 147*17	2000	2020-08-26	162	FR0000162	1
1024	ACHAT ARTICLE QUINCAILLERIE GENERALE	970	2020-08-26	163	FR0000163	1
1025	ACHAT ARTICLE QUINCAILLERIE GENERALE	840	2020-08-26	164	FR0000164	1
1026	ACHAT ARTICLE QUINCAILLERIE GENERALE	660	2020-08-26	165	FR0000165	1
1027	ACOMPTE LAHCEN	1250	2020-08-26	166	FR0000166	1
1028	ACOMPTE BOUABDELLAH	1000	2020-08-26	167	FR0000167	1
1029	ACHAT PEAUX BRUT BENOUDA 470 RUN + 270 4EME CHOIX	82000	2020-08-26	168	FR0000168	1
1030	ACHAT ARTICLE QUINCAILLERIE GENERALE	3740	2020-08-26	169	FR0000169	1
1031	TRANSPORT WETBLUE STIN	2000	2020-08-26	170	FR0000170	1
1032	ACHAT MACHINE A COUDRE + RENVERSSEUSE	22000	2020-09-06	171	FR0000171	1
1033	COMPTABLE : 678	15000	2020-09-06	172	FR0000172	1
1034	ACHAT PEAUX BRUT HMIDA EULDJ 595 RUN + 151 4EME	86400	2020-09-07	173	FR0000173	1
1035	ACOMPTE LAHCEN	2000	2020-09-07	174	FR0000174	1
1036	ACOMPTE BOUABDELLAH	2000	2020-09-07	175	FR0000175	1
1037	ACHAT 20 LITRE D_HUILE POUR SEDDARA	3200	2020-09-08	176	FR0000176	1
1038	TRANSPORT BASANE ALLER-RETOUR	2000	2020-09-10	177	FR0000177	1
1039	ACHAT PEAUX BENOUDA 365 RUN + 253 4EME + 7 GM	66000	2020-09-14	178	FR0000178	1
1040	ACHAT COLLE	3000	2020-09-14	179	FR0000179	1
1041	ACHAT QUINCAILLERIE GENERALE	600	2020-09-15	180	FR0000180	1
1042	ACHAT QUINCAILLERIE GENERALE	100	2020-09-15	181	FR0000181	1
1043	ACHAT PEAUX HILEL 42 RUN + 26 4EME + 8 GF (VERSEMENT)	4000	2020-09-15	182	FR0000182	1
1044	ACHAT PRODUIT CHIMIQUE DE TEST	10000	2020-09-16	183	FR0000183	1
1045	ACHAT MAZOT	1000	2020-09-16	184	FR0000184	1
1046	ACHAT PEAUX BRUT BENOUDA AHMED 465 RUN + 232 4EME + 32 GF	81000	2020-09-16	185	FR0000185	1
1047	ACHAT 4 ROUES POUR CHARIOT	7240	2020-09-20	186	FR0000186	1
1048	MAINTENANCE SOUDEUR	1000	2020-09-20	187	FR0000187	1
1049	ACOMPTE BENAMARA LAID	10000	2020-09-20	188	FR0000188	1
1050	ACOMPTE LAHCEN	8000	2020-09-20	189	FR0000189	1
1051	ACOMPTE BOUABDELLAH	8000	2020-09-20	190	FR0000190	1
1052	ACOMPTE BENDIDA MOURAD	10000	2020-09-20	191	FR0000191	1
1053	ACHAT HUILE POUR MOTEUR	1750	2020-09-20	192	FR0000192	1
1054	ACHAT PEAUX HMIDA EULDJ 711 RUN + 382 4EME	124000	2020-09-22	193	FR0000193	1
1055	ACHAT MAZOT	1900	2020-09-23	194	FR0000194	1
1056	ACHAT 14 METRE PLASTIQUE	2100	2020-09-25	195	FR0000195	1
1057	ACOMPTE BOUABDELLAH	1000	2020-09-25	196	FR0000196	1
1058	BOITE POSTALE	4200	2020-09-29	197	FR0000197	1
1059	TONER IMPRIMANTE	900	2020-09-29	198	FR0000198	1
1060	GANT DE TRAVAIL	1000	2020-09-30	199	FR0000199	1
1061	ESSENCE POUR LA REPARATION DE LA CHARNEUSE	250	2020-10-02	200	FR0000200	1
1062	PAPIER A VERRE POUR LA CHARNEUSE	200	2020-10-02	201	FR0000201	1
1063	FACTURE D_ACHAT N° : AC20003007	8900	2020-10-03	202	FR0000202	1
1064	fACTURE ACHAT N° = AC20003009	115000	2020-10-03	203	FR0000203	1
1065	HUILE POUR CHARNEUSE	9000	2020-10-03	204	FR0000204	1
1066	PVC	600	2020-10-03	205	FR0000205	1
1067	ACHAT PEAUX HIMDA EULDJ RUN 543 + 4EME 233 + G 13 + R 16	93630	2020-10-05	206	FR0000206	1
1068	TRANSPORT CHARIOT	2000	2020-10-05	207	FR0000207	1
1069	CAMION POUBELLE	3000	2020-10-06	208	FR0000208	1
1070	FACTURE ACHAT N° = AC20003009	95250	2020-10-07	209	FR0000209	1
1071	ACHAT 10 PALETTES	6000	2020-10-07	210	FR0000210	1
1072	VERSEMENT WALID	15000	2020-10-01	211	FR0000211	1
1073	VERSEMENT WALID	1000	2020-10-06	212	FR0000212	1
1074	VERSEMENT WALID	2000	2020-10-07	213	FR0000213	1
1075	EMBALLAGE SEMELLE	13500	2020-09-15	214	FR0000214	1
1076	GAZOIL POUR CHAUDIERE	2000	2020-10-01	215	FR0000215	1
1077	COURROIE POUR FOULAN	15600	2020-10-03	216	FR0000216	1
1078	ACHAT ARTICLE PLOMBRIE	400	2020-10-04	217	FR0000217	1
1079	ENTRETIEN VOITURE PARTNER	2600	2020-10-04	218	FR0000218	1
1080	ENTRETIEN VOITURE PARTNER	7400	2020-10-04	219	FR0000219	1
1081	ENTRETIEN VOITURE PARTNER	300	2020-10-05	220	FR0000220	1
1082	TRANSPORT BASANE	1000	2020-10-08	221	FR0000221	1
1083	ACHAT PEAUX BENOUDA(1456 PEAUX)	175730	2020-10-04	222	FR0000222	1
1084	ACHAT PEAUX BENOUDA (771 PEAUX )	95250	2020-10-07	223	FR0000223	1
1085	TRANSPORT CYLINDRE CHARNEUSE	1200	2020-10-08	224	FR0000224	1
1086	ACHAT ARTICLE QUINCAILLERIE GENERAL	1160	2020-10-08	225	FR0000225	1
1087	COMPLEMENT PAIMENT LAID BENAMARA	3200	2020-10-08	226	FR0000226	1
1088	ACHAT ARTICLE QUINCAILLERIE GENERAL	1340	2020-10-10	227	FR0000227	1
1089	ACHAT DIVRES	690	2020-10-10	228	FR0000228	1
1090	COMPLEMENT PAIMENT LAHCEN	3000	2020-10-10	229	FR0000229	1
1091	BOULANS+ROULEMENT	11600	2020-10-10	230	FR0000230	1
1092	VERSEMENT WALID	2000	2020-10-10	231	FR0000231	1
1093	ACOMPTE LAHCEN	2000	2020-10-12	232	FR0000232	1
1094	GAZOIL POUR CHAUDIERE	2000	2020-10-12	233	FR0000233	1
1095	SILCLIPSE POUR CHARNEUSE	240	2020-10-12	234	FR0000234	1
1096	GANTS DE TRAVAIL	1500	2020-10-13	235	FR0000235	1
1097	fACTURE ACHAT N° = AC20003011	7000	2020-10-14	236	FR0000236	1
1098	COLLE DE JOINT	480	2020-10-14	237	FR0000237	1
1099	JOINT HYDROLIQUE	600	2020-10-14	238	FR0000238	1
1100	BON D_ACHAT N°AC20004013	3760	2020-10-26	239	FR0000239	1
1101	ACOMPTE LAHCEN	1000	2020-10-26	240	FR0000240	1
1102	ACOMPTE MOURAD	2000	2020-10-26	241	FR0000241	1
1103	ACHAT SEL 45 SACS 2250 KG	11000	2020-10-26	242	FR0000242	1
1104	ACHAT ARTICLE QUINCAILLERIE GENERAL	1250	2020-10-28	243	FR0000243	1
1105	FACTURE ACHAT N° : AC20004014	5240	2020-10-29	244	FR0000244	1
1106	ACHAT RONDELLE	40	2020-10-29	245	FR0000245	1
1107	ACOMPTE LAHCEN	1000	2020-10-29	246	FR0000246	1
1108	fACTURE ACHAT N° = AC20004015	107370	2020-11-01	247	FR0000247	1
1109	fACTURE ACHAT N° = AC20004016	145540	2020-11-01	248	FR0000248	1
1110	ACHAT CHAUSSURE DE TRAVAIL	2400	2020-11-02	249	FR0000249	1
1111	SALAIRE YAZID	70000	2020-11-03	250	FR0000250	1
1112	SALAIRE LAID BENAMARA	12000	2020-11-05	251	FR0000251	1
1113	SALAIRE BOUABDELLAH	15750	2020-11-05	252	FR0000252	1
1114	SALAIRE LAHCEN	14750	2020-11-05	253	FR0000253	1
1115	SALAIRE BENDIDA MOURAD	9750	2020-11-05	254	FR0000254	1
1116	VERSEMENT WALID	1000	2020-11-03	255	FR0000255	1
1117	CASE POUR NETTOYAGE	2000	2020-11-05	256	FR0000256	1
1118	ACHAT ROULEMENT	29600	2020-11-05	257	FR0000257	1
1119	FACTURE ACHAT N° : AC20004017	130870	2020-11-05	258	FR0000258	1
1120	FACTURE ACHAT N° : AC20004018	85200	2020-11-08	259	FR0000259	1
1121	FACTURE ACHAT N° : AC20004019	84900	2020-11-09	260	FR0000260	1
1122	SWITCH POUR PEDAL CHARNEUSE	1100	2020-11-08	261	FR0000261	1
1123	GAZOIL POUR CHAUDIERE	2000	2020-10-20	262	FR0000262	1
1124	ARTICLE QUINCAILLERIE GENERAL	1025	2020-10-18	263	FR0000263	1
1125	ACHAT PLASTIQUE	1800	2020-11-03	264	FR0000264	1
1126	ACHAT ARTICLE QUINCAILLERIE GENERAL	240	2020-11-04	265	FR0000265	1
1127	FACTURE ACHAT N° : AC20004020	3990	2020-11-15	266	FR0000266	1
1128	ACHTA PALETTES	6600	2020-11-15	267	FR0000267	1
1129	BOBINAGE	32000	2020-11-15	268	FR0000268	1
1130	VERSEMENT WALID	5000	2020-11-15	269	FR0000269	1
1131	VERSEMENT WALID	1000	2020-11-15	270	FR0000270	1
1132	SONALGAZ	12500	2020-11-15	271	FR0000271	1
1133	FRAIS DIVERS	150	2020-11-15	272	FR0000272	1
1134	ACHAT PLASTIQUE 12M	1680	2020-11-22	273	FR0000273	1
1135	FACTURE ACHAT N° : AC20004021	97820	2020-11-19	274	FR0000274	1
1136	ACHAT GANTS	1500	2020-12-01	275	FR0000275	1
1137	ACHAT GANTS	1500	2020-11-16	276	FR0000276	1
1138	ACHAT GASOIL	3600	2020-12-01	277	FR0000277	1
1139	ACHAT MONCHANT	850	2020-12-01	278	FR0000278	1
1140	ACHAT CHAUX 20 SACS	6600	2020-12-01	279	FR0000279	1
1141	ACHAT CHEVIS METALLIQUE	200	2020-12-08	280	FR0000280	1
1142	SALAIRE YAZID	70000	2020-12-08	281	FR0000281	1
1143	VERSEMENT MAçON	5000	2021-01-24	282	FR0000282	1
1144	ACHAT MATERIAUX DE CONSTRUCTION	42650	2021-01-24	283	FR0000283	1
1145	ACHAT DIVERS	2530	2021-01-24	284	FR0000284	1
1146	ACOMPTE EMPLOYES	31000	2021-01-17	285	FR0000285	1
1147	VERSEMENT MAçON	10500	2021-01-25	286	FR0000286	1
1148	ACHAT BALAI	450	2021-01-26	287	FR0000287	1
1149	ACHAT CISAILLE	1450	2021-01-30	288	FR0000288	1
1150	SALAIRE BENAMARA LAID	7000	2021-02-02	289	FR0000289	1
1151	SALAIRE BOUABDELLAH	14500	2021-02-02	290	FR0000290	1
1152	SALAIRE BENDIDA MOURAD	10640	2021-02-02	291	FR0000291	1
1153	SALAIRE YAZID	70000	2021-02-02	292	FR0000292	1
1154	SALAIRE ZOUAOUI	6000	2021-02-02	293	FR0000293	1
1155	3 CARTONS+ 1 SCOTCH	400	2021-02-02	294	FR0000294	1
1156	ACHAT D2 TETE DE POTEAU	3500	2021-02-02	295	FR0000295	1
1157	ACHAT 2 LAMPES + 8 CHEVIE METALLIQUE	1250	2021-02-03	296	FR0000296	1
1158	POUBELLE	3000	2021-02-15	297	FR0000297	1
1159	LAIT POUR CHIEN	350	2021-02-15	298	FR0000298	1
1160	QUITTANCE TAMECO	800	2021-02-15	299	FR0000299	1
1161	5 FEUILLE DE CARTON	500	2021-02-15	300	FR0000300	1
1162	VERSEMENT POUBELLE ABDELLAH	1000	2021-02-15	301	FR0000301	1
1163	TRANSPORT PEAUX FINI VACHETTE	4000	2021-02-15	302	FR0000302	1
1164	TRANSPORT BASANE + OUTILLAGE	2000	2021-02-15	303	FR0000303	1
1165	MANŒUVRE 	1500	2021-02-15	304	FR0000304	1
1166	ACHAT CABLE ELECTRIQUE POUR ECLAIRAGE	1400	2021-02-15	305	FR0000305	1
1167	QUITTANCE RADIATION MEGESSERIE DE L_OUEST	800	2021-02-16	306	FR0000306	1
1168	ACHAT ARTICLE QUINCAILLERIE GENERAL	180	2021-02-16	307	FR0000307	1
1169	VERSEMENT POUBELLE ABDELLAH	3000	2021-02-16	308	FR0000308	1
1170	ACOMPTE BENAMARA WAEL	500	2021-02-16	309	FR0000309	1
1171	ACHAT 2 POTEAUX LED 150 W	12100	2021-02-14	310	FR0000310	1
1172	ACOMPTE ZOUAOUI	1000	2021-02-15	311	FR0000311	1
1173	COMPTABLE	5000	2021-02-17	312	FR0000312	1
1174	ACOMPTE EMPLOYES	20000	2021-02-17	313	FR0000313	1
1175	POUBELLE	12000	2021-02-17	314	FR0000314	1
1176	VACCIN OLLY	1500	2021-02-21	315	FR0000315	1
1177	SOUDEUR	2500	2021-02-23	316	FR0000316	1
1178	ACOMPTE WAEL	1000	2021-02-23	317	FR0000317	1
1179	VERSEMENT CHAUFFEUR ADEL	500	2021-02-23	318	FR0000318	1
1180	FRAIS DIVERS	370	2021-02-23	319	FR0000319	1
1181	ACHAT PISTOLET	3500	2021-02-22	320	FR0000320	1
1182	ACHAT CIMENT	1680	2021-02-22	321	FR0000321	1
1183	COMPTABLE	5000	2021-02-22	322	FR0000322	1
1184	ACHAT GANTS	280	2021-03-01	323	FR0000323	1
1185	SALAIRE YAZID	70000	2021-03-03	324	FR0000324	1
1186	SALAIRE MOURAD	13250	2021-03-03	325	FR0000325	1
1187	SALAIRE ZOUAOUI	18000	2021-03-03	326	FR0000326	1
1188	SALAIRE BOUABDELLAH	18250	2021-03-03	327	FR0000327	1
1189	SALAIRE WAEL	5500	2021-03-03	328	FR0000328	1
1190	FRAIS DIVERS	330	2021-03-03	329	FR0000329	1
1191	SAC POUBELLE	700	2021-03-09	330	FR0000330	1
1192	STC WAEL 	7000	2021-03-09	331	FR0000331	1
1193	FACTURE ACHAT N°: AC20006031	198000	2021-03-16	332	FR0000332	1
1194	FRAIS DIVERS	1250	2021-03-27	333	FR0000333	1
1195	FRAIS DIVERS	420	2021-03-28	334	FR0000334	1
1196	ACOMPTE ZOUAOUI	10000	2021-03-25	335	FR0000335	1
1197	FILM SEMSHOES CLASSY AND SPORT	8000	2021-03-25	336	FR0000336	1
1198	ACHAT DIVERS	500	2021-03-25	337	FR0000337	1
1199	TOURNEVIS	180	2021-03-25	338	FR0000338	1
1200	SALAIRE STC WAEL	8000	2021-03-25	339	FR0000339	1
1201	2 FILTRE POUR CHARNEUSE	8600	2021-03-25	340	FR0000340	1
1202	2 CONTACTEUR	3000	2021-03-25	341	FR0000341	1
1203	REDUCTION	1050	2021-03-25	342	FR0000342	1
1204	FRAIS DIVERS	880	2021-03-25	343	FR0000343	1
1205	ARTICLE ELECTRICITE	3500	2021-03-25	344	FR0000344	1
1206	ARTICLE ELECTRICITE	1400	2021-03-25	345	FR0000345	1
1207	ARTICLE ELECTRICITE	1300	2021-03-25	346	FR0000346	1
1208	FRAIS DIVERS	1250	2021-03-27	347	FR0000347	1
1209	FRAIS DIVERS	420	2021-03-28	348	FR0000348	1
1210	FRAIS DIVERS	700	2021-03-29	349	FR0000349	1
1211	ACOMPTE LAHCEN	2000	2021-03-29	350	FR0000350	1
1212	FRAIS DIVERS FR-381	140	2021-03-31	351	FR0000351	1
1213	FRAIS DIVERS FR-382	200	2021-04-01	352	FR0000352	1
1214	SALAIRE BOUABDELLAH	18250	2021-04-03	353	FR0000353	1
1215	SALAIRE ZAOUOUI	18000	2021-04-03	354	FR0000354	1
1216	SALAIRE MOURAD	8450	2021-04-03	355	FR0000355	1
1217	CABLE ELECTRICITE	540	2021-04-03	356	FR0000356	1
1218	FRAIS DIVERS	250	2021-04-03	357	FR0000357	1
1219	ACHAT EVA	17000	2021-04-03	358	FR0000358	1
1220	COLLE + EMBALLAGE	4100	2021-04-03	359	FR0000359	1
1221	ACHAT FLEXIBLE POUR CHARNEUSE	3700	2013-04-04	360	FR0000360	1
1222	FRAIS DIVERS	1800	2021-04-04	361	FR0000361	1
1223	ACHAT CHAUX	4760	2021-04-04	362	FR0000362	1
1224	FRAIS TOURNEUR	6000	2021-04-08	363	FR0000363	1
1225	FRAIS DIVERS	140	2021-04-08	364	FR0000364	1
1226	ACOMPTE	20000	2021-04-17	365	FR0000365	1
1227	IMPOT G50	17605	2021-04-20	366	FR0000366	1
1228	COMPTABLE	5000	2021-03-01	367	FR0000367	1
1229	COMPTABLE	5000	2021-04-01	368	FR0000368	1
1230	QUINCAILLERIE GENERAL	2400	2021-06-28	369	FR0000369	1
1231	QUINCAILLERIE GENERAL	700	2021-06-21	370	FR0000370	1
1232	QUINCAILLERIE GENERAL	1350	2021-07-12	371	FR0000371	1
1233		16700	2021-08-04	372	FR0000372	1
1234	PLASTIQUE	1120	2021-07-15	373	FR0000373	1
1235	03 GANTS MAPPA	840	2021-08-11	374	FR0000374	1
1236	COLLIER ANTI PUCES POUR OLLY	400	2021-08-11	375	FR0000375	1
1237	FACTURE ACHAT N° : AC21006061	16530	2021-08-11	376	FR0000376	1
1238	FACTURE ACHAT N° : AC21006062	14000	2021-08-16	377	FR0000377	1
1239	FACTURE ACHAT N° : AC21007062	16000	2021-08-14	378	FR0000378	1
1240	FACTURE ACHAT N° : AC21007063	9000	2021-08-14	379	FR0000379	1
1241	FACTURE ACHAT N° : AC21007064	7440	2021-08-14	380	FR0000380	1
1242	FACTURE ACHAT N° : AC21007065	7930	2021-08-19	381	FR0000381	1
1243	FACTURE ACHAT N° : AC21007066	14270	2021-08-19	382	FR0000382	1
1244	FACTURE ACHAT N° : AC21007067	10840	2021-08-19	383	FR0000383	1
1245	FACTURE ACHAT N° : AC21007068	3770	2021-08-19	384	FR0000384	1
1246	POUBELLE	3000	2021-08-20	385	FR0000385	1
1247	MAZOT POUR CHAUDIERE	1000	2021-08-20	386	FR0000386	1
1248	ACOMPTE BOUABDELLAH	10000	2021-08-17	387	FR0000387	1
1249	ACOMPTE MOHAMED BOUZEBOUJA	4000	2021-08-20	388	FR0000388	1
1250	ACHAT 03 GANTS MAPA	840	2021-08-20	389	FR0000389	1
1251	VERSEMENT WALID	5000	2021-08-20	390	FR0000390	1
1252	ACHAT PIECE POUR REPARATION CHARNEUSE GRAND HANGAR	11000	2021-08-20	391	FR0000391	1
1253	COMPTABLE MOIS AOUT 2021	5000	2021-08-20	392	FR0000392	1
1254	ACHAT SEL DU 01/08 AU 20/08	9500	2021-08-20	393	FR0000393	1
1255	ACHAT QINQUAILLERIE GENERAL	28350	2021-08-25	394	FR0000394	1
1256	QUINCAILLERIE GENERAL	55800	2021-08-25	395	FR0000395	1
1257	ACHAT 10 SACS DE CHAUX	3500	2021-08-29	396	FR0000396	1
1258	FACTURE ACHAT N° : AC21007069	15290	2021-08-29	397	FR0000397	1
1259	MOHAMED BOUZEBOUJA	8000	2021-09-01	398	FR0000398	1
1260	DJAAFAR	5000	2021-09-01	399	FR0000399	1
1261	BOUABDELLAH	17000	2021-09-01	400	FR0000400	1
1262	BENAMARA LAID	8400	2021-09-01	401	FR0000401	1
1263	DAHNACHE YAHIA 	23000	2021-09-01	402	FR0000402	1
1264	BERRACHED YAZID	70000	2021-09-01	403	FR0000403	1
1265	FACTURE ACHAT N° : AC21007070	7650	2021-09-01	404	FR0000404	1
1266	ACHAT DETERGENT	425	2021-09-02	405	FR0000405	1
1267	COMPTABLE MOIS SEPETEMBRE 2021	5000	2021-09-02	406	FR0000406	1
1268	COMPTABLE MOIS MARS AVRIL MAI JUIN JUILLET 2021	25000	2021-09-02	407	FR0000407	1
1269	MIZANE POUR VENTE LAINE	500	2021-09-06	408	FR0000408	1
1270	PLASTIQUE 20 METRE	3000	2021-09-06	409	FR0000409	1
1271	ELECTRICITE MOIS SEPTEMBRE	31000	2021-09-06	410	FR0000410	1
1272	OUVRIER POUR VENTE LAINE	3000	2021-09-06	411	FR0000411	1
1273	QUINCAILLERIE GENERAL	300	2021-09-07	412	FR0000412	1
1274	POUBELLE + MANOEUVRE 	4000	2021-09-08	413	FR0000413	1
1275	FACTURE ACHAT N° : AC21008070	8850	2021-09-08	414	FR0000414	1
1276	FACTURE ACHAT N° : AC21008071	13650	2021-09-14	415	FR0000415	1
1277	FACTURE ACHAT N° : AC21008072	7950	2021-09-14	416	FR0000416	1
1278	FACTURE ACHAT N° : AC21008073	7650	2021-09-14	417	FR0000417	1
1279	ACHAT NEON LED + SUPPORT	700	2021-09-12	418	FR0000418	1
1280	FACTURE ACHAT N° : AC21008074	12750	2021-09-26	419	FR0000419	1
1281	FACTURE ACHAT N° : AC21009072	9000	2021-09-26	420	FR0000420	1
1282	ACHAT FILS D_TTACHE	400	2021-09-25	421	FR0000421	1
1283	MAZOT	1980	2021-09-28	422	FR0000422	1
1284	QUINCAILLERIE GENERALE	600	2021-09-28	423	FR0000423	1
1285	G50 	29670	2021-09-20	424	FR0000424	1
1286	MAZOT CHAUDIERE	1950	2021-09-29	425	FR0000425	1
1287	COMPTABLE	5000	2021-10-02	426	FR0000426	1
1288	SALAIRE BERRACHED YAZID	70000	2021-10-02	427	FR0000427	1
1289	SALAIRE BOUABDELLAH	27000	2021-10-02	428	FR0000428	1
1290	SALAIRE DAHNACHE YAHIA	28000	2021-10-02	429	FR0000429	1
1291	DETERGENT	150	2021-10-02	430	FR0000430	1
1292	FACTURE ACHAT N° : AC21009073	13000	2021-10-03	431	FR0000431	1
1293	FACTURE ACHAT N° : AC21010072	11800	2021-10-03	432	FR0000432	1
1294	FACTURE ACHAT N° : AC21010073	8100	2021-10-03	433	FR0000433	1
1295	VERSEMENT WALID	1000	2021-10-03	434	FR0000434	1
1296	VERSEMENT WALID	1000	2021-10-09	435	FR0000435	1
1297	FACTURE ACHAT N° : AC21010074	8850	2021-10-06	436	FR0000436	1
1298	FACTURE ACHAT N° : AC21010075	11550	2021-10-06	437	FR0000437	1
1299	FACTURE ACHAT N° : AC21010076	9150	2021-10-06	438	FR0000438	1
1300	TOURNEUR	3800	2021-10-05	439	FR0000439	1
1301	FRAIS DIVERS	1150	2021-10-10	440	FR0000440	1
1302	MAINTENANCE BASCULE	4000	2021-10-10	441	FR0000441	1
1303	FRAIS CHARNEUSE	2000	2021-10-10	442	FR0000442	1
1304	ACHAT QUINCAILLERIE GENERAL	1100	2021-10-12	443	FR0000443	1
1305	VERSEMENT WALID	4000	2021-10-17	444	FR0000444	1
1306	ACHAT SEL	22500	2021-10-18	445	FR0000445	1
1307	FRAIS DIVERS	200	2021-10-20	446	FR0000446	1
1308	ACHAT PIERE POUR CHARNEUSE	3000	2021-10-20	447	FR0000447	1
1309	FACTURE ACHAT N° : AC21010077	8700	2021-10-17	448	FR0000448	1
1310	FACTURE ACHAT N° : AC21010078	10800	2021-10-17	449	FR0000449	1
1311	FACTURE ACHAT N° : AC21010079	6750	2021-10-17	450	FR0000450	1
1312	CONTACTEUR D25 24 V	1900	2021-10-20	451	FR0000451	1
1313	ACOMPTE BOUABDELLAH	11000	2021-10-20	452	FR0000452	1
1314	FRAIS DIVERS	1700	2021-10-23	453	FR0000453	1
1315	TOURNEUR	1500	2021-10-23	454	FR0000454	1
1316	VERSEMENT WALID	1000	2021-10-23	455	FR0000455	1
1317	FACTURE ACHAT N° : AC21010080	13950	2021-10-23	456	FR0000456	1
1318	FACTURE ACHAT N° : AC21011078	9150	2021-10-23	457	FR0000457	1
1319	FACTURE ACHAT N° : AC21011079	6150	2021-10-23	458	FR0000458	1
1320	CNAS ( DAC T3)	143075	2021-10-24	459	FR0000459	1
1321	TOURNEUR	1400	2021-10-24	460	FR0000460	1
1322	TOURNEUR	4400	2021-10-25	461	FR0000461	1
1323	FRAIS DIVERS	600	2021-10-25	462	FR0000462	1
1324	ACHAT BOBINE POUR CHARNEUSE	7500	2021-10-25	463	FR0000463	1
1325	COMPLETER ACHAT PEAUX CHAKIB	100	2021-10-29	464	FR0000464	1
1326	VIDANGE	4500	2021-10-29	465	FR0000465	1
1327	FACTURE ACHAT N° : AC21011080	14250	2021-10-31	466	FR0000466	1
1328	FACTURE ACHAT N° : AC21011081	10650	2021-10-31	467	FR0000467	1
1329	FRAIS DIVERS	1000	2021-11-02	468	FR0000468	1
1330	POTAUX 4	34500	2021-11-02	469	FR0000469	1
1331	ELECTRICITE	16000	2021-11-02	470	FR0000470	1
1332	COMPTABLE	5000	2021-11-02	471	FR0000471	1
1333	SALAIRE BERRACHED YAZID	70000	2021-11-02	472	FR0000472	1
1334	FACTURE ACHAT N° : AC21011082	8100	2021-11-02	473	FR0000473	1
1335	SALAIRE YAHIA DEHNACHE	28000	2021-11-03	474	FR0000474	1
1336	SALAIRE BOUABDELLAH	13500	2021-11-03	475	FR0000475	1
1337	FACTURE ACHAT N° : AC21011083	18450	2021-11-03	476	FR0000476	1
1338	FACTURE ACHAT N° : AC21011084	7500	2021-11-03	477	FR0000477	1
1339	DETERGENT	350	2021-11-05	478	FR0000478	1
1340	SALAIRE BOUABDELLAH	25250	2021-12-02	479	FR0000479	1
1341	SALAIRE UYAHIA DAHNACHE	28000	2021-12-02	480	FR0000480	1
1342	QUINCAILLERIE GENERAL	3450	2021-12-02	481	FR0000481	1
1343	05 GANTS MAPPA 	1400	2021-12-02	482	FR0000482	1
1344	CHAUX SAIDA 9 SACS	4050	2021-12-02	483	FR0000483	1
1345	ELECTRICITE 	16000	2021-12-02	484	FR0000484	1
1346	COMPTABLE	5000	2021-12-02	485	FR0000485	1
1347	SALAIRE YAZID	70000	2021-12-03	486	FR0000486	1
1348	ACHAT PLASTIQUE 5M	650	2021-12-05	487	FR0000487	1
1349	SOLDE TOUT COMPTE 04 EMPLOYES	4900	2021-12-05	488	FR0000488	1
1350	POUBELLE	3000	2021-12-05	489	FR0000489	1
1351	ACOMPTE RAMZI	2200	2021-12-05	490	FR0000490	1
1352	ACOMPTE OTHMANE	2000	2021-12-06	491	FR0000491	1
1353	ACHAT COLLIER DE SERAGE + CIEMENT 3 KG 	530	2021-12-06	492	FR0000492	1
1354	ACOMPTE MILOUD	500	2021-12-12	493	FR0000493	1
1355	ACOMPTE HOUARI KADDOUR ( HASNI )	1000	2021-12-13	494	FR0000494	1
1356	ACHAT 10 PALETTE	5700	2021-12-13	495	FR0000495	1
1357	REMPLISSAGE BOUTEILLE DE GAZ	220	2021-12-13	496	FR0000496	1
1358	PRET YAZID	2075	2021-12-13	497	FR0000497	1
1359	ACHAT MAZOT POUR CHAUDIERE	3800	2021-12-13	498	FR0000498	1
1360	ACHAT PRODUITS CHIMIQUE NSDIC FACTURE N° 01/2022	1460000	2022-01-02	499	FR0000499	1
1361	SALAIRE YAZID	70000	2022-01-02	500	FR0000500	1
1362	SALAIRE GERANT	150000	2022-01-02	501	FR0000501	1
1363	SALAIRE COMPTABLE	5000	2022-01-02	502	FR0000502	1
1364	SALAIRE VIDANGE	5000	2022-01-02	503	FR0000503	1
1365	ELECTRICITE	16000	2022-01-02	504	FR0000504	1
1366	SALAIRE GARDIENT YAHIA DAHNACHE	28000	2022-01-02	505	FR0000505	1
1367	SALAIRE BOUABDELLAH	23250	2022-01-02	506	FR0000506	1
1368	ACHAT POMPE HYDRAULIQUE POUR CHARNEUSE	55000	2022-01-02	507	FR0000507	1
1369	MAINTENANCE TOURNEUR	7500	2022-01-02	508	FR0000508	1
1370	JOINTS	1200	2022-01-02	509	FR0000509	1
1371	ACHAT PEAUX 112 HADJ	17920	2022-01-02	510	FR0000510	1
1372	ACHAT PEAUX BRUTE METISSE 1000 PEAUX  AC21012048	80000	2022-01-04	511	FR0000511	1
1373	ACHAT KARCHEUR	10400	2022-01-03	512	FR0000512	1
1374	VERSEMENT WALID	2000	2022-01-03	513	FR0000513	1
1375	MAINTENANCE TOURNEUR	4500	2022-01-03	514	FR0000514	1
1376	ACHAT PEAUX BRUTE MOKHATR AC21012085	144000	2022-01-04	515	FR0000515	1
1377	STC MHADJI	3100	2022-01-04	516	FR0000516	1
1378	STC MOHAMED MAZOUZ	1850	2022-01-04	517	FR0000517	1
1379	FACTURE ACHAT N°: AC21012086 ( HADJ 102 PEAUX // 160 DA)	16320	2022-01-05	518	FR0000518	1
1470	SALAIRE ABDELKARIM	4000	2022-02-04	609	FR0000609	1
1380	FACTURE ACHAT N°: AC21013085 ( MOKHATR ~323 PEAUX // 50 DA)	15000	2022-01-05	519	FR0000519	1
1381	MAINTENANCE TOURNEUR SENIA VERSEMENT SUR LE TOTAL DE 65000 DA	40000	2022-01-05	520	FR0000520	1
1382	CLARK	5500	2022-01-05	521	FR0000521	1
1383	FACTURE ACHAT N°: AC21013086 ( HADJ :63 PEAUX // 160 DA)	10080	2022-01-06	522	FR0000522	1
1384	VIDANGE	6500	2022-01-06	523	FR0000523	1
1385	ACHAT 5 GANTS MAPPA	1400	2022-01-06	524	FR0000524	1
1386	TRANSPORT PERSONNEL YAHIA	1000	2022-01-09	525	FR0000525	1
1387	GRAISSE	700	2022-01-09	526	FR0000526	1
1388	BOULAN	3200	2022-01-09	527	FR0000527	1
1389	TOURNEUR SMAIL	20000	2022-01-09	528	FR0000528	1
1390	TRANSPORT	3000	2022-01-09	529	FR0000529	1
1391	BOTTE + ESSENCE	1150	2022-01-09	530	FR0000530	1
1392	SALAIRE MILOUD	6000	2022-01-09	531	FR0000531	1
1393	SALAIRE KAMEL	5000	2022-01-09	532	FR0000532	1
1394	VERSEMENT WALID	2000	2022-01-09	533	FR0000533	1
1395	ACHAT PEAUX BRUT HADJ 109 * 160 DA AC21014085	17440	2022-01-09	534	FR0000534	1
1396	ACHAT PALAN MONT-CHARGE	6500	2022-01-09	535	FR0000535	1
1397	ACHAT NIVEAU	1100	2022-01-09	536	FR0000536	1
1398	ACHAT ROULEMENT POUR CHARNEUSE	3000	2022-01-09	537	FR0000537	1
1399	ACHAT FLEXIBLE POUR CHARNEUSE	2500	2022-01-09	538	FR0000538	1
1400	DEFLECTEUR	4000	2022-01-15	539	FR0000539	1
1401	FICHE POUR L_ELECTROVANNE CHARNEUSE PH	1300	2022-01-15	540	FR0000540	1
1402	MECHE A VIS	2400	2022-01-15	541	FR0000541	1
1403	VERSEMENT WALID	1000	2022-01-15	542	FR0000542	1
1404	FACTURE ACHAT N° : AC21014086	8160	2022-01-16	543	FR0000543	1
1405	ACHAT PAPIER A VERRE	110	2022-01-11	544	FR0000544	1
1406	SOUDEUR	2500	2022-01-11	545	FR0000545	1
1407	ACHAT 20 L HUILE HYDRAULIQUE 10W	4000	2022-01-12	546	FR0000546	1
1408	ACHAT 02 BALAIS	540	2022-01-12	547	FR0000547	1
1409	MAINTENANCE HYDRAULIQUE CHARNEUSE	25000	2022-01-12	548	FR0000548	1
1410	SALAIRE HEBDOMADAIRE MILOUD 5000/6550	5000	2022-01-13	549	FR0000549	1
1411	FACTURE ACHAT N° : AC21014087	20000	2022-01-13	550	FR0000550	1
1412	ACHAT QUINCAILLERIE GENERAL	1140	2022-01-11	551	FR0000551	1
1413	PRIME BOUABDELLAH	6000	2022-01-16	552	FR0000552	1
1414	CHAUX 20 SACS	7000	2022-01-16	553	FR0000553	1
1415	ACHA ELECTROVANNE POUR CHARNEUSE PH	32000	2022-01-17	554	FR0000554	1
1416	VERSEMENT WALID	6000	2022-01-18	555	FR0000555	1
1417	BP	1000	2022-01-17	556	FR0000556	1
1418	ACOMPTE BOUABDELLAH	10000	2022-01-17	557	FR0000557	1
1419	FD	5000	2022-01-18	558	FR0000558	1
1420	FACTURE ACHAT N° : AC21014088	13280	2022-01-24	559	FR0000559	1
1421	FACTURE ACHAT N° : AC21015087	24000	2022-01-24	560	FR0000560	1
1422	FACTURE ACHAT N° : AC21015088	16000	2022-01-24	561	FR0000561	1
1423	ACHAT SEL	23000	2022-01-19	562	FR0000562	1
1424	FACTURE ACHAT N° : AC21015089	20160	2022-01-24	563	FR0000563	1
1425	ACOMPTE HASNI	2000	2022-01-19	564	FR0000564	1
1426	ACOMPTE MILOUD	400	2022-01-19	565	FR0000565	1
1427	FACTURE ACHAT N° : AC21015090	11680	2022-01-24	566	FR0000566	1
1428	ACHAT BOURSE	1200	2022-01-20	567	FR0000567	1
1429	POUBELLE	3000	2022-01-20	568	FR0000568	1
1430	SALAIRE HEBDOMADAIRE HASNI	3750	2022-01-20	569	FR0000569	1
1431	SALAIRE HEBDOMADAIRE MILOUD	6400	2022-01-20	570	FR0000570	1
1432	ACHAT MAZOT	5500	2022-01-23	571	FR0000571	1
1433	FACTURE ACHAT N° : AC21015091	134280	2022-01-24	572	FR0000572	1
1434	FACTURE ACHAT N° : AC21015092	21280	2022-01-24	573	FR0000573	1
1435	FACTURE ACHAT N° : AC21015093	14110	2022-01-26	574	FR0000574	1
1436	FACTURE ACHAT N° : AC21016092	162200	2022-01-26	575	FR0000575	1
1437	ACOMPTE HICHEM	1000	2022-01-25	576	FR0000576	1
1438	ACOMPTE ABDELKAREEM	1000	2022-01-25	577	FR0000577	1
1439	ACHAT GANT DE TRAVAIL	150	2022-01-16	578	FR0000578	1
1440	ACOMPTE MILOUD	1000	2022-01-16	579	FR0000579	1
1441	ACHAT 05 GANTS MAPPA	1400	2022-01-25	580	FR0000580	1
1442	MAINTENANCE SOUDEUR	1000	2022-01-25	581	FR0000581	1
1443	STC 02 EMPLOYES	2400	2022-01-25	582	FR0000582	1
1444	SALAIRE HEBDO KAMEL	4000	2022-01-26	583	FR0000583	1
1445	SALAIRE HEBDO HASNI	6200	2022-01-29	584	FR0000584	1
1446	SALAIRE HEBDO AHMED	2000	2022-01-27	585	FR0000585	1
1447	SALAIRE HEBDO MILOUD	7000	2022-01-27	586	FR0000586	1
1448	ACOMPTE BOUEBDELLAH	2000	2022-01-27	587	FR0000587	1
1449	SALAIRE HICHEM + ABDELKARIM	5500	2022-01-27	588	FR0000588	1
1450	MAINTENANCE HYDRAULIQUE AMINE	4000	2022-01-30	589	FR0000589	1
1451	VIDAGE HADJ	7000	2022-01-30	590	FR0000590	1
1452	YAHIA OVERTIME	1000	2022-01-31	591	FR0000591	1
1453	FACTURE ACHAT N° : AC21016093	23290	2022-01-30	592	FR0000592	1
1454	FACTURE ACHAT N° : AC21017092	9520	2022-01-29	593	FR0000593	1
1455	FACTURE ACHAT N° : AC21017093	48240	2022-01-29	594	FR0000594	1
1456	FACTURE ACHAT N° : AC21017094	26350	2022-02-03	595	FR0000595	1
1457	SALAIRE GERANT	150000	2022-02-03	596	FR0000596	1
1458	SALAIRE YAZID	70000	2022-02-03	597	FR0000597	1
1459	SALAIRE COMPTABLE	5000	2022-02-03	598	FR0000598	1
1460	FACTURE ACHAT N° : AC21017095	36000	2022-02-03	599	FR0000599	1
1461	QUINCAILLERIE GENERAL	4500	2022-02-01	600	FR0000600	1
1462	ACHAT CHAUX 30 SACS	9900	2022-02-02	601	FR0000601	1
1463	FRAIS DIVER MENZAH	325	2022-01-30	602	FR0000602	1
1464	FRAIS DIVERS ALIMENTAION	260	2022-01-30	603	FR0000603	1
1465	ACOMPTE ABDELKARIM	1000	2022-01-30	604	FR0000604	1
1466	ACOMPTE HICHEM	2000	2022-01-30	605	FR0000605	1
1467	ACHAT 05 COUTEAUX	2500	2022-02-02	606	FR0000606	1
1468	SALAIRE DJAMILA	2500	2022-02-03	607	FR0000607	1
1469	ACHAT QUINCAILLERIE GENERAL	3730	2022-02-03	608	FR0000608	1
1471	FACTURE ACHAT N° : AC21017096	18700	2022-02-06	610	FR0000610	1
1472	FACTURE ACHAT N° : AC21018092	11900	2022-02-10	611	FR0000611	1
1473	SALAIRE YAHIA	33100	2022-02-02	612	FR0000612	1
1474	SALAIRE BOUABDELLAH + PRIME DE 2000 	1500	2022-02-02	613	FR0000613	1
1475	YAHIA HEURE SUPP	1000	2022-02-02	614	FR0000614	1
1476	SALAIRE HEBDO DJAMILA	2500	2022-02-02	615	FR0000615	1
1477	SALAIRE HEBDO FATIMA	5000	2022-02-02	616	FR0000616	1
1478	SALAIRE HEBDO KAMEL	4750	2022-02-02	617	FR0000617	1
1479	SALAIRE HEBDO AHMED	6750	2022-02-02	618	FR0000618	1
1480	SALAIRE HEBDO MILOUD	7250	2022-02-02	619	FR0000619	1
1481	SALAIRE HASNI	2500	2022-02-02	620	FR0000620	1
1482	VIDANDE HADJ	7000	2022-02-02	621	FR0000621	1
1483	ACHAT BOURSSE	1500	2022-02-02	622	FR0000622	1
1484	ACHAT 10 PALETTES	6000	2022-02-02	623	FR0000623	1
1485	ACHAT CHENIOLE	3400	2022-02-02	624	FR0000624	1
1486	REGLEMEMNT HADJ BERRACHED ANCIEN DETTES	110000	2022-02-02	625	FR0000625	1
1487	ACHAT QUINCAILLERIE GENERAL	3730	2022-02-03	626	FR0000626	1
1488	FACTURE ACHAT N° : AC21018093	11900	2022-02-03	627	FR0000627	1
1489	FACTURE ACHAT N° : AC21018094	13430	2022-02-03	628	FR0000628	1
1490	FACTURE ACHAT N° : AC21018095	179000	2022-02-03	629	FR0000629	1
1491	ACOMPTE KAMEL	1000	2022-02-05	630	FR0000630	1
1492	ACOMPTE AHMED	1000	2022-02-05	631	FR0000631	1
1493	FACTURE ACHAT N° : AC21018096	26100	2022-02-03	632	FR0000632	1
1494	FRAIS DIVERS	8000	2022-02-06	633	FR0000633	1
1495	ACOMPTE HASNI	1000	2022-02-08	634	FR0000634	1
1496	ACOMPTE YOUCEF	500	2022-02-08	635	FR0000635	1
1497	ACOMPTE ABDELKARIM	1000	2022-02-08	636	FR0000636	1
1498	ACOMPTE HICHEM	1500	2022-02-08	637	FR0000637	1
1499	ACHAT QUINCAILLERIE GENERAL	800	2022-02-09	638	FR0000638	1
1500	FRAIS DIVERS	1000	2022-02-09	639	FR0000639	1
1501	ACHAT POSTE A SOUDURE	18800	2022-02-09	640	FR0000640	1
1502	BOBINAGE POMPE A BOUE	20000	2022-02-09	641	FR0000641	1
1503	ACHAT BOURSSE	1500	2022-02-09	642	FR0000642	1
1504	ACOMPTE KAMEL	250	2022-02-09	643	FR0000643	1
1505	STC ABDELKARIM	2500	2022-02-09	644	FR0000644	1
1506	STC ABDERRAHMANE	2750	2022-02-09	645	FR0000645	1
1507	FACTURE ACHAT N° : AC21018097	19380	2022-02-10	646	FR0000646	1
1508	FACTURE ACHAT N° : AC21018098	13320	2022-02-10	647	FR0000647	1
1509	STC FATIMA + DJAMILA	11400	2022-02-10	648	FR0000648	1
1510	SALAIRE HEBDOMADAIRE EMPLOYES	17550	2022-02-10	649	FR0000649	1
1511	ACHAT POTAUX 	9300	2022-02-10	650	FR0000650	1
1512	TRANSPORT	3000	2022-02-10	651	FR0000651	1
1513	ACHAT TUBE	13500	2022-02-10	652	FR0000652	1
1514	CIMENT	800	2022-02-10	653	FR0000653	1
1515	VERSEMENT SUR TOLLE	10000	2022-02-10	654	FR0000654	1
1516	FACTURE ACHAT N° : AC21018099	24840	2022-02-12	655	FR0000655	1
1517	ACOMPTE YOUCEF	1500	2022-02-12	656	FR0000656	1
1518	VIDANGE	400	2022-02-13	657	FR0000657	1
1519	VIDANGE HADJ	7000	2022-02-12	658	FR0000658	1
1520	ACOMPTE KAMEL	1000	2022-02-13	659	FR0000659	1
1521	ACOMPTE HASNI	1000	2022-02-13	660	FR0000660	1
1522	FACTURE ACHAT N° : AC21018100	23900	2022-02-13	661	FR0000661	1
1523	ACOMPTE HOUCINE	1000	2022-02-14	662	FR0000662	1
1524	FRAIS DIVERS PERE (RELIZANE)	17000	2022-02-14	663	FR0000663	1
1525	ACHAT ROULEMENT + GRAISSE	1600	2022-02-14	664	FR0000664	1
1526	TRANSPORT CYLINDRE	2000	2022-02-13	665	FR0000665	1
1527	PAYEMENT CLASSEUR SLIMANE	5000	2022-02-12	666	FR0000666	1
1528	ACHAT QUINACAILLERIE GENERAL	1250	2022-02-16	667	FR0000667	1
1529	ACHAT 12 PALETTE	6800	2022-02-16	668	FR0000668	1
1530	ACHAT BOURSES	250	2022-02-16	669	FR0000669	1
1531	FACTURE ACHAT N° : AC21018101	18870	2022-02-16	670	FR0000670	1
1532	FACTURE ACHAT N° : AC21018102	17100	2022-02-16	671	FR0000671	1
1533	FACTURE ACHAT N° : AC21018103	24300	2022-02-16	672	FR0000672	1
1534	FACTURE ACHAT N° : AC21018104	14960	2022-02-17	673	FR0000673	1
1535	SALAIRE HEBDOMADAIRE	26250	2022-02-17	674	FR0000674	1
1536	ACOMPTE BOUABDELLAH	10000	2022-02-17	675	FR0000675	1
1537	VIDANGE HADJ	7000	2022-02-17	676	FR0000676	1
1538	FRAIS DIVERS	7000	2022-02-18	677	FR0000677	1
1539	ACHAT JOINT DE PRESSION	2100	2022-02-19	678	FR0000678	1
1540	G50	22965	2022-02-20	679	FR0000679	1
1541	ACHAT QUINCAILLERIE GENERAL	80	2022-02-20	680	FR0000680	1
1542	ACOMPTE HOUCINE	500	2022-02-20	681	FR0000681	1
1543	ACOMPTE LAHCEN	1000	2022-02-20	682	FR0000682	1
1544	FACTURE ACHAT N° : AC21018105	23120	2022-02-20	683	FR0000683	1
1545	FACTURE ACHAT N° : AC21018106	6000	2022-02-20	684	FR0000684	1
1546	FRAIS DIVERS	1500	2022-02-19	685	FR0000685	1
1547	ACOMPTE KAMEL	1000	2022-02-21	686	FR0000686	1
1548	ACHAT QUINCAILLERIE GENERAL	1900	2022-02-21	687	FR0000687	1
1549	ACHAT 100 SACS DE SEL 	23000	2022-02-22	688	FR0000688	1
1550	FACTURE ACHAT N° : AC21018107	15300	2022-02-22	689	FR0000689	1
1551	VERSEMENT WALID	2000	2022-02-22	690	FR0000690	1
1552	LOCATION CLARCK	5000	2022-02-22	691	FR0000691	1
1553	FRAIS DIVERS	1200	2022-02-22	692	FR0000692	1
1554	ACOMPTE LAHCEN	1000	2022-02-23	693	FR0000693	1
1555	FACTURE ACHAT N° : AC21018108	10080	2022-02-23	694	FR0000694	1
1556	FACTURE ACHAT N° : AC21018109	5220	2022-02-23	695	FR0000695	1
1557	ACHAT QUINCAILLERIE GENERAL	580	2022-02-23	696	FR0000696	1
1558	TRANSPORT CYLINDRE	1700	2022-02-21	697	FR0000697	1
1559	TOURNEUR	2800	2022-02-21	698	FR0000698	1
1560	FRAIS DIVERS	1900	2022-02-21	699	FR0000699	1
1561	VERSEMENT WALID	1000	2022-02-21	700	FR0000700	1
1562	VERSEMENT WALID	2000	2022-02-21	701	FR0000701	1
1563	TOURNEUR	22000	2022-02-21	702	FR0000702	1
1564	ACHAT QUINCAILLERIE GENERAL	400	2022-02-24	703	FR0000703	1
1565	POUBELLE	3000	2022-02-24	704	FR0000704	1
1566	HADJ VIDANGE	7000	2022-02-24	705	FR0000705	1
1567	ACHAT 50 BRIQUE + 1 CIMENT	1450	2022-02-24	706	FR0000706	1
1568	FACTURE ACHAT N° : AC21018110	23120	2022-02-24	707	FR0000707	1
1569	FACTURE ACHAT N° : AC21018111	36180	2022-02-24	708	FR0000708	1
1570	SALAIRE HEBDOMADAIRE EMPLOYES	23750	2022-02-24	709	FR0000709	1
1571	ACHAT QUINCAILLERIE GENERAL	1040	2022-02-24	710	FR0000710	1
1572	FACTURE ACHAT N° : AC21018112	44640	2022-03-02	711	FR0000711	1
1573	FACTURE ACHAT N° : AC21018113	24650	2022-03-02	712	FR0000712	1
1574	VERSEMENT WALID 	2000	2022-02-26	713	FR0000713	1
1575	YAHIA HEURE SUPPLEMENTAIRE	1000	2022-02-26	714	FR0000714	1
1576	VERSEMENT BENOUDA	1000	2022-02-26	715	FR0000715	1
1577	TRANSPORT 	2000	2022-02-26	716	FR0000716	1
1578	ACOMPTE KAMEL	1000	2022-02-26	717	FR0000717	1
1579	FACTURE D_ACHAT	20000	2022-03-02	718	FR0000718	1
1580	TOURNEUR	60000	2022-03-02	719	FR0000719	1
1581	FACTURE ACHAT N° : AC21018114	5800	2022-03-02	720	FR0000720	1
1582	ACHAT QUINCAILLERIE GENERAL	1580	2022-03-02	721	FR0000721	1
1583	TRANSPORT	2000	2022-03-02	722	FR0000722	1
1584	FACTURE ACHAT N° : AC21018115	17000	2022-03-02	723	FR0000723	1
1585	FACTURE ACHAT N° : AC21018116	39000	2022-03-03	724	FR0000724	1
1586	VERSEMENT BENOUDA	1000	2022-03-03	725	FR0000725	1
1587	FRAIS DIVERS 	7300	2022-03-03	726	FR0000726	1
1588	SALAIRE YAZID	70000	2022-03-03	727	FR0000727	1
1589	SALAIRE GERANT	150000	2022-03-03	728	FR0000728	1
1590	SALAIRE COMPTABLE	5000	2022-03-03	729	FR0000729	1
1591	ELECTRICITE	16000	2022-03-03	730	FR0000730	1
1592	SALAIRE MILOUD	3250	2022-03-03	731	FR0000731	1
1593	SALAIRE KAMEL	2750	2022-03-03	732	FR0000732	1
1594	SALAIRE YOUCEF	2500	2022-03-03	733	FR0000733	1
1595	SALAIRE HOUCINE	5000	2022-03-03	734	FR0000734	1
1596	SALAIRE BOUABDELLAH	22500	2022-03-03	735	FR0000735	1
1597	SALAIRE YAHIA + HEURE SUPP	35200	2022-03-03	736	FR0000736	1
1598	FACTURE ACHAT N° : AC21018117	25400	2022-03-07	737	FR0000737	1
1599	ALIMENTATION	1610	2022-03-07	738	FR0000738	1
1600	ACHAT PIED A COULISSE	2500	2022-03-07	739	FR0000739	1
1601	REPARATION VOITURE LEON	7000	2022-03-07	740	FR0000740	1
1602	TRANSPORT 	3000	2022-03-07	741	FR0000741	1
1603	VERSEMENT WALID	2000	2022-03-07	742	FR0000742	1
1604	REPARATION TOURNEUR	1000	2022-03-07	743	FR0000743	1
1605	FACTURE ACHAT N° : AC21018118	9600	2022-03-07	744	FR0000744	1
1606	CHAMBRE DE COMMERCE	34000	2022-03-08	745	FR0000745	1
1607	FACTURE ACHAT N° : AC21018119	15400	2022-03-08	746	FR0000746	1
1608	FACTURE ACHAT N° : AC21018120	24000	2022-03-11	747	FR0000747	1
1609	ACHAT BOULON	500	2022-03-09	748	FR0000748	1
1610	ACOMPTE YOUCEF	2000	2022-03-09	749	FR0000749	1
1611	TRANSPORT	2300	2022-03-09	750	FR0000750	1
1612	ACHAT COMPRESSEUR	80000	2022-03-09	751	FR0000751	1
1613	FACTURE ACHAT N° : AC21019120	19600	2022-03-11	752	FR0000752	1
1614	SALAIRE HEBDOMADAIRE EMPLOYES	7500	2022-03-11	753	FR0000753	1
1615	VERSEMENT BENOUDA	2000	2022-03-11	754	FR0000754	1
1616	TOURNEUR 	1000	2022-03-11	755	FR0000755	1
1617	ACHAT QUINCAILLERIE GENERAL	2390	2022-03-11	756	FR0000756	1
1618	TOURNEUR	3000	2022-03-12	757	FR0000757	1
1619	BOULON + GRAISSE	1000	2022-03-12	758	FR0000758	1
1620	ACHAT QUINCAILLERIE GENERAL	3600	2022-03-13	759	FR0000759	1
1621	ACHAT QUINCAILLERIE GENERAL	15150	2022-03-13	760	FR0000760	1
1622	CONTACTEUR	1200	2022-03-13	761	FR0000761	1
1623	ACHAT QUINCAILLERIE GENERAL	1100	2022-03-13	762	FR0000762	1
1624	FRAIS DIVERS	650	2022-03-15	763	FR0000763	1
1625	ACHAT QUINCAILLERIE GENERAL	1000	2022-03-15	764	FR0000764	1
1626	POUBELLE	3000	2022-03-15	765	FR0000765	1
1627	ACHAT DEGRIPPANT	340	2022-03-15	766	FR0000766	1
1628	ACOMPTE HOUCINE	500	2022-03-15	767	FR0000767	1
1629	FACTURE ACHAT N° : AC21019121	25600	2022-03-18	768	FR0000768	1
1630	FACTURE ACHAT N° : AC21019122	57000	2022-03-18	769	FR0000769	1
1631	FACTURE ACHAT N° : AC21019123	20400	2022-03-18	770	FR0000770	1
1632	SALAIRE KAMEL	2500	2022-03-16	771	FR0000771	1
1633	SALAIRE HOUCINE	2500	2022-03-16	772	FR0000772	1
1634	ACHAT MAZOT	400	2022-03-18	773	FR0000773	1
1635	SOUDEUR	2500	2022-03-16	774	FR0000774	1
1636	SALAIRE BOUABDELLAH	7500	2022-03-18	775	FR0000775	1
1637	FRAIS EXPORT	4000	2022-03-18	776	FR0000776	1
1638	CHAMBRE DE COMMERCE	3400	2022-03-18	777	FR0000777	1
1639	CASORAN T4	150000	2022-03-18	778	FR0000778	1
1640	FACTURE ACHAT N° : AC21019124	17200	2022-03-20	779	FR0000779	1
1641	MAINTENANCE HYDRAULIQUE CHARNEUSE	18000	2022-03-20	780	FR0000780	1
1642	G 50 FEVRIER 2022	25479	2022-03-20	781	FR0000781	1
1643	TOURNEUR	3000	2022-03-20	782	FR0000782	1
1644	FRAIS DIVERS	7500	2022-03-21	783	FR0000783	1
1645	ACHAT QUINCAILLERIE GENERAL	400	2022-03-20	784	FR0000784	1
1646	VINIETTE POUR LEON ET PARTNER	2500	2022-03-20	785	FR0000785	1
1647	MARTEAU	500	2022-03-21	786	FR0000786	1
1648	TOURNEUR	6000	2022-03-21	787	FR0000787	1
1649	ACHAT CONTACTEUR	3500	2022-03-21	788	FR0000788	1
1650	ELECTRICIEN	2000	2022-03-21	789	FR0000789	1
1651	SALAIRE MILOUD	6250	2022-03-21	790	FR0000790	1
1652	ACHAT BOTTE	900	2022-03-22	791	FR0000791	1
1653	SOUDEUR	2000	2022-03-22	792	FR0000792	1
1654	FACTURE ACHAT N° : AC21019125	11600	2022-03-25	793	FR0000793	1
1655	ACHAT PALETTE	6000	2022-03-23	794	FR0000794	1
1656	ACHA MAZOT	3900	2022-03-23	795	FR0000795	1
1657	SALAIRE EMPLOYES	17500	2022-03-24	796	FR0000796	1
1658	FACTURE ACHAT N° : AC21019126	20600	2022-03-25	797	FR0000797	1
1659	FACTURE ACHAT N° : AC21019127	11600	2022-03-25	798	FR0000798	1
1660	ARTICLE BUREAUTIQUE	465	2022-03-27	799	FR0000799	1
1661	ACHAT 30 SACS CHAUX	9900	2022-03-27	800	FR0000800	1
1662	FRAIS DIVERS	1500	2022-03-27	801	FR0000801	1
1663	ACHAT QUINCAILLERIE GENERAL	1590	2022-03-27	802	FR0000802	1
1664	VERSEMENT BENOUDA	10525	2022-03-27	803	FR0000803	1
1665	FACTURE ACHAT N° : AC21019128	24600	2022-03-28	804	FR0000804	1
1666	ACOMPTE KAMEL	1000	2022-03-28	805	FR0000805	1
1667	SOUDEUR	700	2022-03-28	806	FR0000806	1
1668	TRANSPORT	1000	2022-03-28	807	FR0000807	1
1669	FRAIS DIVERS	400	2022-03-29	808	FR0000808	1
1670	FACTURE ACHAT N° : AC21020126	18000	2022-04-04	809	FR0000809	1
1671	ARTICLE PLOMBRIE	300	2022-03-29	810	FR0000810	1
1672	ACHAT BOULAN	3000	2022-03-30	811	FR0000811	1
1673	ACHAT BOTTE	1000	2022-03-30	812	FR0000812	1
1674	FACTURE ACHAT N° : AC21020127	11000	2022-04-04	813	FR0000813	1
1675	FACTURE ACHAT N° : AC21020128	13000	2022-04-04	814	FR0000814	1
1676	SEL	23000	2022-03-30	815	FR0000815	1
1677	SALAIRE HEBDOMADAIRE EMPLOYES	37800	2022-03-30	816	FR0000816	1
1678	HADJ VIDANGE	7000	2022-03-30	817	FR0000817	1
1679	ACHAT CIMENT	1500	2022-03-30	818	FR0000818	1
1680	FROTOIRE + CHIFAN	930	2022-03-30	819	FR0000819	1
1681	FACTURE ACHAT N° : AC21020129	17000	2022-04-01	820	FR0000820	1
1682	FACTURE ACHAT N° : AC21020130	18200	2022-04-01	821	FR0000821	1
1683	FRAIS EXPORT	6000	2022-04-04	822	FR0000822	1
1684	SALAIRE YAHIYA	32000	2022-04-04	823	FR0000823	1
1685	CLASSEMENT BENOUDA	15880	2022-04-04	824	FR0000824	1
1686	ACHAT QUINCAILLERIE GENERALE	1230	2022-04-04	825	FR0000825	1
1687	TRANSPORT PERSONNEL	7200	2022-04-04	826	FR0000826	1
1688	SALAIRE YAZID	70000	2022-04-04	827	FR0000827	1
1689	SALAIRE GERANT	150000	2022-04-04	828	FR0000828	1
1690	PAYEMENT ELECTRICITE	16000	2022-04-05	829	FR0000829	1
1691	COMPTABLE	5000	2022-04-05	830	FR0000830	1
1692	ACHAT QUINCAILLERIE GENERAL	400	2022-04-05	831	FR0000831	1
1693	FACTURE ACHAT N° : AC21020131	20600	2022-04-11	832	FR0000832	1
1694	ACOMPTE KAMEL	3500	2022-04-05	833	FR0000833	1
1695	CAVNOS	60000	2022-04-06	834	FR0000834	1
1696	BILAN	10000	2022-04-06	835	FR0000835	1
1697	ACHAT QUINCAILLERIE GENERAL	1600	2022-04-06	836	FR0000836	1
1698	ACHAT BOULANS	2500	2022-04-06	837	FR0000837	1
1699	ACHAT QUINCAILLERIE GENERAL	200	2022-04-07	838	FR0000838	1
1700	SALAIRE HEBDOMADAIRE EMPLOYES	31250	2022-04-11	839	FR0000839	1
1701	ACHAT BOULANS	1150	2022-04-09	840	FR0000840	1
1702	FACTURE ACHAT N° : AC21020132	13400	2022-04-11	841	FR0000841	1
1703	CONTACTEUR	1400	2022-04-10	842	FR0000842	1
1704	LOCATION CASE	6000	2022-04-11	843	FR0000843	1
1705	REPARATION HYDRAULIQUE CHARNEUSE	10000	2022-04-10	844	FR0000844	1
1706	ACHAT GANTS	1100	2022-04-12	845	FR0000845	1
1707	LOCATION CLARCK	5500	2022-04-12	846	FR0000846	1
1708	FACTURE ACHAT N° : AC21020133	13600	2022-04-14	847	FR0000847	1
1709	ACHAT GANTS MAPPA 	900	2022-04-14	848	FR0000848	1
1710	CLARCK + 	500	2022-04-14	849	FR0000849	1
1711	SALAIRE HEBDOMADAIRE	31450	2022-04-14	850	FR0000850	1
1712	TRANSITAIRE	350000	2022-04-16	851	FR0000851	1
1713	CHAINE POUR CHARNEUSE	5200	2022-04-16	852	FR0000852	1
1714	COMPTABLE FRAIS FRANCHISE	10000	2022-04-16	853	FR0000853	1
1715	CILOPHANE	2800	2022-04-16	854	FR0000854	1
1716	WALID PRIME	1000	2022-04-16	855	FR0000855	1
1717	FACTURE ACHAT N° : AC21021132	21800	2022-04-16	856	FR0000856	1
1718	POUBELLE 	3000	2022-04-17	857	FR0000857	1
1719	SALAIRE KAMEL	1250	2022-04-18	858	FR0000858	1
1720	G50 MOIS : MARS 2022	27993	2022-04-18	859	FR0000859	1
1721	BROSSE METALLIQUE	200	2022-04-18	860	FR0000860	1
1722	CIMENT + SABLE	1300	2022-04-18	861	FR0000861	1
1723	DISJONCTEUR BIPOLAIRE	450	2022-04-18	862	FR0000862	1
1724	CNAS	160578	2022-04-18	863	FR0000863	1
1725	FACTURE ACHAT N° : AC21021133	22200	2022-04-18	864	FR0000864	1
1726	VIDANGE	4000	2022-04-19	865	FR0000865	1
1727	POUBELLE	3000	2022-04-20	866	FR0000866	1
1728	CIMENT + SABLE	1250	2022-04-20	867	FR0000867	1
1729	ELECTRICIEN	5000	2022-04-20	868	FR0000868	1
1730	LAMPE	400	2022-04-20	869	FR0000869	1
1731	ACHAT PEAUX MOKHTAR EN GROS	34000	2022-04-20	870	FR0000870	1
1732	FACTURE ACHAT N° : AC21022133	159000	2022-04-18	871	FR0000871	1
1733	10 SAC CHAUX	3300	2022-04-21	872	FR0000872	1
1734	GANTS POUR YAZID	120	2022-04-21	873	FR0000873	1
1735	ABOUDA MOHAMED	8000	2022-04-27	874	FR0000874	1
1736	FACTURE ACHAT N° : AC21022134	27650	2022-04-18	875	FR0000875	1
1737	VIDANGE	4500	2022-04-22	876	FR0000876	1
1738	ACOMPTE HASNI	1000	2022-04-23	877	FR0000877	1
1739	FICHE BNC + ALIMENTATION	1000	2022-04-23	878	FR0000878	1
1740	ACHAT BOITE DE DERIVATION	1080	2022-04-23	879	FR0000879	1
1741	FACTURE ACHAT N° : AC21022135	15200	2022-04-18	880	FR0000880	1
1742	FACTURE ACHAT N° : AC21022136	10600	2022-04-18	881	FR0000881	1
1743	FACTURE ACHAT N° : AC21022137	27250	2022-04-18	882	FR0000882	1
1744	TRANSPORT PRODUIT CHIMIQUE	13000	2022-04-26	883	FR0000883	1
1745	PH + BAUME	7800	2022-04-26	884	FR0000884	1
1746	ACHAT CHROME + MIMOSA	417500	2022-04-26	885	FR0000885	1
1747	10 SACS CHAUX	3300	2022-04-26	886	FR0000886	1
1748	TUYAU GAS DE VILLE	400	2022-04-27	887	FR0000887	1
1749	ALIMENTATION	230	2022-04-27	888	FR0000888	1
1750	SALAIRE EMPLOYES	21550	2022-04-21	889	FR0000889	1
1751	FACTURE ACHAT N° : AC21022138	18240	2022-05-07	890	FR0000890	1
1752	FACTURE ACHAT N° : AC21022139	10400	2022-05-07	891	FR0000891	1
1753	FACTURE ACHAT N° : AC21022140	30000	2022-05-07	892	FR0000892	1
1754	CLASSEMENT BENOUDA	10620	2022-04-28	893	FR0000893	1
1755	SALAIRE EMPLOYES	34100	2022-04-28	894	FR0000894	1
1756	HADJ VIDANGE	7000	2022-04-30	895	FR0000895	1
1757	FACTURE ACHAT N° : AC21022141	28400	2022-05-07	896	FR0000896	1
1758	SALAIRE YAHIA + TRANSPORT PERSONNEL	37100	2022-05-07	897	FR0000897	1
1759	FACTURE ACHAT N° : AC21022142	126000	2022-05-07	898	FR0000898	1
1760	FACTURE ACHAT N° : AC21022143	26550	2022-05-08	899	FR0000899	1
1761	FACTURE ACHAT N° : AC21023139	14700	2022-05-08	900	FR0000900	1
1762	ETEAU	16500	2022-05-07	901	FR0000901	1
1763	ELECTRICITE	16000	2022-05-07	902	FR0000902	1
1764	LAMPES	1200	2022-05-07	903	FR0000903	1
1765	CHAUX 10 SACS	3300	2022-05-07	904	FR0000904	1
1766	FACTURE ACHAT N° : AC21023140	29600	2022-05-09	905	FR0000905	1
1767	FACTURE ACHAT N° : AC21023141	45580	2022-05-09	906	FR0000906	1
1768	FACTURE ACHAT N° : AC21023142	23520	2022-05-09	907	FR0000907	1
1769	FRAIS DIVERS	2000	2022-05-08	908	FR0000908	1
1770	ACHAT ARTICLES MAINTENANCE CAMERAS	4200	2022-05-09	909	FR0000909	1
1771	ARTICLES QUINCAILLERIE GENERAL	780	2022-05-09	910	FR0000910	1
1772	FICHE BNC + FICHE ALIMENTATION	1000	2022-05-09	911	FR0000911	1
1773	ACHAT 02 SACS DE CHAUX	800	2022-05-09	912	FR0000912	1
1774	ACHAT QUINCAILLERIE GENERAL	590	2022-05-09	913	FR0000913	1
1775	ACHAT QUINCAILLERIE GENERAL	1700	2022-05-10	914	FR0000914	1
1776	ACHAT 10 SACS DE CHAUX	3300	2022-05-10	915	FR0000915	1
1777	FACTURE ACHAT N° : AC21023143	10650	2022-05-11	916	FR0000916	1
1778	ACHAT SAVON LIQUID POUR EMPLOYES	280	2022-05-10	917	FR0000917	1
1779	FACTURE ACHAT N° : AC21023144	16720	2022-05-12	918	FR0000918	1
1780	FACTURE ACHAT N° : AC21024144	10200	2022-05-12	919	FR0000919	1
1781	ACHAT QUINCAILLERIE GENERAL	3400	2022-05-11	920	FR0000920	1
1782	ACHAT CHAINE POUR COUDREUSE	12810	2022-05-11	921	FR0000921	1
1783	HADJ FIRMA VIDANGE	7000	2022-05-12	922	FR0000922	1
1784	SALAIRE EMPLOYES	31250	2022-05-12	923	FR0000923	1
1785	ACOMPTE AYMEN	1000	2022-05-12	924	FR0000924	1
1786	VERSEMENT BENOUDA	10000	2022-05-12	925	FR0000925	1
1787	ACHAT GANTS LATEX 12 PAIRS	2160	2022-05-12	926	FR0000926	1
1788	FACTURE ACHAT N° : AC21024145	13200	2022-05-16	927	FR0000927	1
1789	FACTURE ACHAT N° : AC21024146	34600	2022-05-14	928	FR0000928	1
1790	FACTURE ACHAT N° : AC21024147	16000	2022-05-14	929	FR0000929	1
1791	FACTURE ACHAT N° : AC21024149	22000	2022-05-14	930	FR0000930	1
1792	FACTURE ACHAT N° : AC21024150	13870	2022-05-14	931	FR0000931	1
1793	G50 AVRIL 2022	36400	2022-05-17	932	FR0000932	1
1794	ARTICLES QUINCAILLERIE GENERAL	2780	2022-05-17	933	FR0000933	1
1795	FACTURE ACHAT N° : AC21024151	34800	2022-05-19	934	FR0000934	1
1796	FACTURE ACHAT N° : AC21024152	20900	2022-05-19	935	FR0000935	1
1797	MILOUD 02 SALAIRE	5000	2022-05-18	936	FR0000936	1
1798	FRAIS DIVERS	100	2022-05-19	937	FR0000937	1
1799	ALIMENTATION	520	2022-05-19	938	FR0000938	1
1800	FACTURE ACHAT N° : AC21024153	20000	2022-05-23	939	FR0000939	1
1801	FACTURE ACHAT N° : AC21025152	22800	2022-05-23	940	FR0000940	1
1802	ACHAT 10 PALETTE	6000	2022-05-22	941	FR0000941	1
1803	HADJ VIDANGE 	7000	2022-05-22	942	FR0000942	1
1804	FACTURE ACHAT N° : AC21025153	12600	2022-05-24	943	FR0000943	1
1805	SALAIRE GERANT	150000	2022-05-01	944	FR0000944	1
1806	SALAIRE YAZID 	83000	2022-05-01	945	FR0000945	1
1807	SALAIRE COMPTABLE	5000	2022-05-01	946	FR0000946	1
1808	ACHAT TRANSPALETTE	52000	2022-05-27	947	FR0000947	1
1809	POUBELLE	3000	2022-05-27	948	FR0000948	1
1810	SALAIRE EMPLOYES	26800	2022-05-27	949	FR0000949	1
1811	ACHAT 10 PALETTE	6000	2022-05-27	950	FR0000950	1
1812	HADJ VIDANGE	7000	2022-05-27	951	FR0000951	1
1813	FACTURE ACHAT N° : AC21026152	12600	2022-05-27	952	FR0000952	1
1814	FACTURE ACHAT N° : AC21026153	12800	2022-05-27	953	FR0000953	1
1815	FACTURE ACHAT N° : AC21026154	14200	2022-06-02	954	FR0000954	1
1816	FACTURE ACHAT N° : AC21026155	19000	2022-06-02	955	FR0000955	1
1817	HADJ VIDANGE	6000	2022-05-29	956	FR0000956	1
1818	ACHAT CABLE ELECTRIQUE 16 METRE	2600	2022-05-29	957	FR0000957	1
1819	ASSURANCE USINE	9000	2022-05-31	958	FR0000958	1
1820	CONRAT LOCALTION	17000	2022-05-31	959	FR0000959	1
1821	FACTURE ACHAT N° : AC21026156	17400	2022-06-02	960	FR0000960	1
1822	FACTURE ACHAT N° : AC21026157	18000	2022-06-02	961	FR0000961	1
1823	VERSEMENT BENOUDA	1000	2022-06-01	962	FR0000962	1
1824	FACTURE ACHAT N° : AC21026158	15200	2022-06-03	963	FR0000963	1
1825	SALAIRE EMPLOYES	27925	2022-06-02	964	FR0000964	1
1826	HADJ VIDANGE	8000	2022-06-02	965	FR0000965	1
1827	FACTURE ACHAT N° : AC21026159	16500	2022-06-05	966	FR0000966	1
1828	FACTURE ACHAT N° : AC21026160	15000	2022-06-05	967	FR0000967	1
1829	POUBELLE	3000	2022-06-04	968	FR0000968	1
1830	ACHAT CIMENT + SABLE + 2KG DE PLATRE	590	2022-06-05	969	FR0000969	1
1831	ACHAT QUINCAILLERIE GENERAL	3450	2022-06-05	970	FR0000970	1
1832	SALAIRE YAHIA	32000	2022-06-05	971	FR0000971	1
1833	TRANSPORT PERSONNEL	7500	2022-06-05	972	FR0000972	1
1834	ACOMPTE HASNI	1000	2022-06-07	973	FR0000973	1
1835	ACHAT CIMENT 	450	2022-06-08	974	FR0000974	1
1836	VIDANGE	6000	2022-06-08	975	FR0000975	1
1837	CLASSEMENT BENOUDA WET BLUE	26000	2022-06-09	976	FR0000976	1
1838	SALAIRE HOUCINE HEBDOMADAIRE	6750	2022-06-08	977	FR0000977	1
1839	ACHAT ANTIROUEILLE + 06 FLACONS ESSENCE	6800	2022-06-09	978	FR0000978	1
1840	FACTURE ACHAT N° : AC21026161	20550	2022-06-09	979	FR0000979	1
1841	FACTURE ACHAT N° : AC21026162	20000	2022-06-09	980	FR0000980	1
1842	FACTURE ACHAT N° : AC21026163	13600	2022-06-11	981	FR0000981	1
1843	SALAIRE EMPLOYES HEBDOMADAIRE	21300	2022-06-09	982	FR0000982	1
1844	FACTURE ACHAT N° : AC21027162	12200	2022-06-12	983	FR0000983	1
1845	FACTURE ACHAT N° : AC21028162	19300	2022-06-12	984	FR0000984	1
1846	FACTURE ACHAT N° : AC21028163	58600	2022-06-13	985	FR0000985	1
1847	VIDANGE	6000	2022-06-13	986	FR0000986	1
1848	ACHAT QUINCAILLERIE GENERAL	140	2022-06-14	987	FR0000987	1
1849	ALIMENTATION	400	2022-06-14	988	FR0000988	1
1850	ACOMPTE MILOUD	400	2022-06-14	989	FR0000989	1
1851	ACHAT 03 SACS DE CHAUX	1350	2022-06-15	990	FR0000990	1
1852	ACHAT BOBINE POUR CLIMATISEUR	400	2022-06-15	991	FR0000991	1
1853	ACHAT QUINCAILLERIE GENERAL	160	2022-06-16	992	FR0000992	1
1854	ACHAT ELECTROVANNE	57000	2022-06-15	993	FR0000993	1
1855	AVOCAT	35000	2022-06-15	994	FR0000994	1
1856	IMPOT	200000	2022-06-15	995	FR0000995	1
1857	MAINTENANCE CHARNEUSE	25000	2022-06-15	996	FR0000996	1
1858	FACTURE ACHAT N° : AC21028164	20000	2022-06-16	997	FR0000997	1
1859	FACTURE ACHAT N° : AC21028165	15400	2022-06-16	998	FR0000998	1
1860	FACTURE ACHAT N° : AC21028166	7200	2022-06-18	999	FR0000999	1
1861	POUBELLE	3000	2022-06-16	1000	FR0001000	1
1862	SALAIRE EMPLOYES HEBDOMADAIRE	23750	2022-06-16	1001	FR0001001	1
1863	ACOMPTE HOUCINE	4000	2022-06-16	1002	FR0001002	1
1864	ACHAT CHAUX	4000	2022-06-18	1003	FR0001003	1
1865	FACTURE ACHAT N° : AC21028167	18250	2022-06-23	1004	FR0001004	1
1866	FACTURE ACHAT N° : AC21028168	20200	2022-06-23	1005	FR0001005	1
1867	FRAIS DIVERS	435	2022-06-19	1006	FR0001006	1
1868	FRAIS DIVERS	390	2022-06-19	1007	FR0001007	1
1869	ACHAT QUINCAILLERIE GENERAL	3660	2022-06-23	1008	FR0001008	1
1870	FACTURE ACHAT N° : AC21028169	16400	2022-06-23	1009	FR0001009	1
1871	REGLEMENT PAR CHEQUE HADJ	223600	2022-06-23	1010	FR0001010	1
1872	FACTURE ACHAT N° : AC21028170	45000	2022-06-23	1011	FR0001011	1
1873	SALAIRE HEBDOMADAIRE EMPLOYES	21000	2022-06-23	1012	FR0001012	1
1874	PRET BOUABDELLAH	15000	2022-06-23	1013	FR0001013	1
1875	PRET HOUCINE	15000	2022-06-23	1014	FR0001014	1
1876	PRET HASNI	8000	2022-06-23	1015	FR0001015	1
1877	DON EMPLOYES 4*5000	20000	2022-06-23	1016	FR0001016	1
1878	FACTURE ACHAT N° : AC21028171	23200	2022-06-26	1017	FR0001017	1
1879	FACTURE ACHAT N° : AC21028172	14600	2022-06-26	1018	FR0001018	1
1880	REGLEMENT HOUARI NEGRO PAR CHEQUE	25000	2022-06-25	1019	FR0001019	1
1881	ACHAT QUINCAILLERIE GENERAL	780	2022-06-27	1020	FR0001020	1
1882	ACHAT QUINCAILLERIE GENERAL	2400	2022-06-28	1021	FR0001021	1
1883	ACOMPTE ABDELKADER	500	2022-06-28	1022	FR0001022	1
1884	ESSENCE 	2000	2022-06-28	1023	FR0001023	1
1885	HADJ VIDANGE	7000	2022-06-29	1024	FR0001024	1
1886	FACTURE ACHAT N° : AC21028173	10000	2022-06-30	1025	FR0001025	1
1887	ACHAT PELLE + BEROUITA	6700	2022-06-30	1026	FR0001026	1
1888	SALAIRE ABDELKADER GARDIEN	13500	2022-06-30	1027	FR0001027	1
1889	SALAIRE EMPLOYES	37050	2022-06-30	1028	FR0001028	1
1890	SALAIRE YAZID	83000	2022-06-30	1029	FR0001029	1
1891	DEJEUNER EMPLOYES	2150	2022-07-02	1030	FR0001030	1
1892	FACTURE ACHAT N° : AC21028174	20200	2022-07-02	1031	FR0001031	1
1893	GRAIN + CIMENT + SABLE 	29350	2022-07-03	1032	FR0001032	1
1894	FACTURE ACHAT N° : AC21028175	18400	2022-07-05	1033	FR0001033	1
1895	ACHAT SABLE + GRAIN	10000	2022-07-04	1034	FR0001034	1
1896	ACHAT 100 SACS SEL	23000	2022-07-04	1035	FR0001035	1
1897	ACHAT CIEMENT	9050	2022-07-06	1036	FR0001036	1
1898	ACHAT 08 SACS DE GRAIN	800	2022-07-06	1037	FR0001037	1
1899	ACHAT GRAIN + SABLE + CIMENT 	2550	2022-07-06	1038	FR0001038	1
1900	ACOMPTE ABELKADER	8000	2022-07-06	1039	FR0001039	1
1901	SALAIRE EMPLOYES	28450	2022-07-07	1040	FR0001040	1
1902	FACTURE ACHAT N° : AC21028176	50800	2022-07-07	1041	FR0001041	1
1903	FACTURE ACHAT N° : AC21028177	5800	2022-07-07	1042	FR0001042	1
1904	FACTURE ACHAT N° : AC21028178	10600	2022-07-07	1043	FR0001043	1
1905	PISCINE MOSTAGANEM	2000	2022-07-13	1044	FR0001044	1
1906	ALIMENTATION GENERAL	630	2022-07-13	1045	FR0001045	1
1907	ACHAT 10 SACS DE CHAUX	3500	2022-07-14	1046	FR0001046	1
1908	MAINTENANCE TRANSPALETTE	3000	2022-07-14	1047	FR0001047	1
1909	FACTURE ACHAT N° : AC21028179	47000	2022-07-14	1048	FR0001048	1
1910	FACTURE ACHAT N° : AC21028180	14200	2022-07-14	1049	FR0001049	1
1911	FRAIS DIVERS	1500	2022-07-14	1050	FR0001050	1
1912	FACTURE ACHAT N° : AC21028181	109900	2022-07-17	1051	FR0001051	1
1913	ACOMPTE HOUCINE	2000	2022-07-17	1052	FR0001052	1
1914	ACHAT TAPIS ET FOULARS	6280	2022-07-17	1053	FR0001053	1
1915	FRAIS RECEPTION	4085	2022-07-17	1054	FR0001054	1
1916	ACHAT QUINCAILLERIE GENERAL	250	2022-07-17	1055	FR0001055	1
1917	DINNER BAC IKRAM	10000	2022-07-17	1056	FR0001056	1
1918	ELECTRICITE 	16000	2022-07-19	1057	FR0001057	1
1919	DINNER IKRAM	10000	2022-07-18	1058	FR0001058	1
1920	ACHAT EAUX + COCA	6800	2022-07-20	1059	FR0001059	1
1921	ACHAT 7 KG POIVRON	420	2022-07-26	1060	FR0001060	1
1922	RECEPTION 1ER JOURS	9965	2022-07-26	1061	FR0001061	1
1923	FRAIS DIVERS	1455	2022-07-21	1062	FR0001062	1
1924	SALAIRE ABDELKADER	16000	2022-07-21	1063	FR0001063	1
1925	SALAIRE EMPLOYES	22725	2022-07-21	1064	FR0001064	1
1926	ACHAT VENTILATEUR	4300	2022-07-24	1065	FR0001065	1
1927	ACHAT CARTON	1500	2022-07-24	1066	FR0001066	1
1928	ACHAT 10 SACS DE CHAUX	3500	2022-07-24	1067	FR0001067	1
1929	FRAIS DIVERS	1000	2022-07-24	1068	FR0001068	1
1930	ACOMPTE MILOUD	1000	2022-07-26	1069	FR0001069	1
1931	RECEPTION 2EME JOUR	33100	2022-07-26	1070	FR0001070	1
1932	FRAIS DIVERS	1750	2022-07-31	1071	FR0001071	1
1933	ACHAT CHAUX	2000	2022-08-01	1072	FR0001072	1
1934	ACOMPTE HASNI	1000	2022-08-01	1073	FR0001073	1
1935	SAC POUBELLE	1200	2022-08-04	1074	FR0001074	1
1936	SALAIRE EMPLOYES	26100	2022-08-04	1075	FR0001075	1
1937	ACOMPTE BOUABDELLAH	4000	2022-08-04	1076	FR0001076	1
1938	ACOMPTE HOUCINE	3000	2022-08-04	1077	FR0001077	1
1939	ACOMPTE MILOUD	4000	2022-08-04	1078	FR0001078	1
1940	ACOMPTE ABDELKADER	4000	2022-08-04	1079	FR0001079	1
1941	ACOMPTE ABDELKADER	14000	2022-08-06	1080	FR0001080	1
1942	ACOMPTE ABDELKADER	1000	2022-08-05	1081	FR0001081	1
1943	VIDANGE	6000	2022-08-06	1082	FR0001082	1
1944	SALAIRE HOUCINE	4000	2022-08-18	1083	FR0001083	1
1945	CLASSEMENT WETBLUE SLIMANE + MOHAMED	22460	2022-08-18	1084	FR0001084	1
1946	VIDANGE	7500	2022-08-23	1085	FR0001085	1
1956	ACHAT PALIERS POUR FOULAN	48000	2022-09-05	1095	FR0001095	1
1966	SALAIRE HOUCINE	6000	2022-09-08	1105	FR0001105	3
1990	ACHAT CARLAGE	22500	2022-09-28	1129	FR0001129	1
2001	ACHAT CARLAGE	40000	2022-10-03	1140	FR0001140	1
2026	G50 + PENALITE	34700	2022-12-28	1165	FR0001165	7
2039	SALAIRE MILOUD	4500	2023-01-09	1175	FR230001175	3
2049	BOUTEILLE DE GAZ	200	2023-01-18	1185	FR230001185	1
2061	CNAS BERRACHED SIDI MOHAMED	108000	2023-01-29	1196	FR230001196	7
\.


--
-- TOC entry 3082 (class 0 OID 16602)
-- Dependencies: 223
-- Data for Name: main_typefrais; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_typefrais ("FRT_ID", "FRT_NAME") FROM stdin;
2	ACOMPTE
3	SALAIRE
1	BON ACHAT
4	FACTURE ACHAT
5	BON ACHAT GANTS
6	BON ACHAT SEMELLE
7	AUTRES
8	MAINTENANCE
\.


--
-- TOC entry 3095 (class 0 OID 17048)
-- Dependencies: 236
-- Data for Name: main_venteentete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_venteentete ("VNTENT_ID", "VNTENT_DOC", "VNTENT_DATE", "VNTENT_CODE", "VNTENT_ID_CLIENT_id") FROM stdin;
1	FV23000001	1900-01-18	1	1
\.


--
-- TOC entry 3093 (class 0 OID 17040)
-- Dependencies: 234
-- Data for Name: main_venteligne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_venteligne ("VNTLIG_ID", "VNTLIG_ID_VNTENT", "VNTLIG_QTY", "VNTLIG_PU", "VNTLIG_REM", "VNTLIG_ID_ART_id") FROM stdin;
\.


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 51, true);


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 228
-- Name: main_achatentete_ACHENT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_achatentete_ACHENT_ID_seq"', 7, true);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 226
-- Name: main_achatligne_ACHLIG_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_achatligne_ACHLIG_ID_seq"', 13, true);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 214
-- Name: main_article_AR_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_article_AR_ID_seq"', 11, true);


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 216
-- Name: main_client_CL_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_client_CL_ID_seq"', 2, true);


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 231
-- Name: main_famille_FAM_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_famille_FAM_ID_seq"', 4, true);


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 218
-- Name: main_fichecode_FIC_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_fichecode_FIC_ID_seq"', 3, true);


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 220
-- Name: main_fournisseur_FO_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_fournisseur_FO_ID_seq"', 3, true);


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 224
-- Name: main_frais_FR_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_frais_FR_ID_seq"', 2077, true);


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 222
-- Name: main_typefrais_FRT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_typefrais_FRT_ID_seq"', 8, true);


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 235
-- Name: main_venteentete_VNTENT_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_venteentete_VNTENT_ID_seq"', 1, true);


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 233
-- Name: main_venteligne_VNTLIG_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."main_venteligne_VNTLIG_ID_seq"', 1, false);


--
-- TOC entry 2829 (class 2606 OID 16550)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2834 (class 2606 OID 16477)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2837 (class 2606 OID 16440)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 16430)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 16468)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2826 (class 2606 OID 16422)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 16458)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 16492)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2839 (class 2606 OID 16448)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 16466)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 16506)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2842 (class 2606 OID 16544)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2857 (class 2606 OID 16530)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 16414)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2821 (class 2606 OID 16412)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 16404)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 16674)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2898 (class 2606 OID 17196)
-- Name: main_achatentete main_achatentete_ACHENT_DOC_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_achatentete
    ADD CONSTRAINT "main_achatentete_ACHENT_DOC_key" UNIQUE ("ACHENT_DOC");


--
-- TOC entry 2901 (class 2606 OID 16638)
-- Name: main_achatentete main_achatentete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_achatentete
    ADD CONSTRAINT main_achatentete_pkey PRIMARY KEY ("ACHENT_ID");


--
-- TOC entry 2895 (class 2606 OID 16630)
-- Name: main_achatligne main_achatligne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_achatligne
    ADD CONSTRAINT main_achatligne_pkey PRIMARY KEY ("ACHLIG_ID");


--
-- TOC entry 2861 (class 2606 OID 16561)
-- Name: main_article main_article_AR_DESIGNATION_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_article
    ADD CONSTRAINT "main_article_AR_DESIGNATION_key" UNIQUE ("AR_DESIGNATION");


--
-- TOC entry 2863 (class 2606 OID 16559)
-- Name: main_article main_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_article
    ADD CONSTRAINT main_article_pkey PRIMARY KEY ("AR_ID");


--
-- TOC entry 2866 (class 2606 OID 16574)
-- Name: main_client main_client_CL_NOM_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_client
    ADD CONSTRAINT "main_client_CL_NOM_key" UNIQUE ("CL_NOM");


--
-- TOC entry 2868 (class 2606 OID 16572)
-- Name: main_client main_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_client
    ADD CONSTRAINT main_client_pkey PRIMARY KEY ("CL_ID");


--
-- TOC entry 2908 (class 2606 OID 17037)
-- Name: main_famille main_famille_FAM_DES_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_famille
    ADD CONSTRAINT "main_famille_FAM_DES_key" UNIQUE ("FAM_DES");


--
-- TOC entry 2910 (class 2606 OID 17035)
-- Name: main_famille main_famille_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_famille
    ADD CONSTRAINT main_famille_pkey PRIMARY KEY ("FAM_ID");


--
-- TOC entry 2871 (class 2606 OID 16586)
-- Name: main_fichecode main_fichecode_FIC_CODE_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_fichecode
    ADD CONSTRAINT "main_fichecode_FIC_CODE_key" UNIQUE ("FIC_CODE");


--
-- TOC entry 2874 (class 2606 OID 16584)
-- Name: main_fichecode main_fichecode_FIC_DESIGNATION_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_fichecode
    ADD CONSTRAINT "main_fichecode_FIC_DESIGNATION_key" UNIQUE ("FIC_DESIGNATION");


--
-- TOC entry 2876 (class 2606 OID 16582)
-- Name: main_fichecode main_fichecode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_fichecode
    ADD CONSTRAINT main_fichecode_pkey PRIMARY KEY ("FIC_ID");


--
-- TOC entry 2879 (class 2606 OID 16599)
-- Name: main_fournisseur main_fournisseur_FO_NOM_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_fournisseur
    ADD CONSTRAINT "main_fournisseur_FO_NOM_key" UNIQUE ("FO_NOM");


--
-- TOC entry 2881 (class 2606 OID 16597)
-- Name: main_fournisseur main_fournisseur_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_fournisseur
    ADD CONSTRAINT main_fournisseur_pkey PRIMARY KEY ("FO_ID");


--
-- TOC entry 2889 (class 2606 OID 16622)
-- Name: main_frais main_frais_FR_CODE_REF_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_frais
    ADD CONSTRAINT "main_frais_FR_CODE_REF_key" UNIQUE ("FR_CODE_REF");


--
-- TOC entry 2892 (class 2606 OID 16620)
-- Name: main_frais main_frais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_frais
    ADD CONSTRAINT main_frais_pkey PRIMARY KEY ("FR_ID");


--
-- TOC entry 2884 (class 2606 OID 16609)
-- Name: main_typefrais main_typefrais_FRT_NAME_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_typefrais
    ADD CONSTRAINT "main_typefrais_FRT_NAME_key" UNIQUE ("FRT_NAME");


--
-- TOC entry 2886 (class 2606 OID 16607)
-- Name: main_typefrais main_typefrais_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_typefrais
    ADD CONSTRAINT main_typefrais_pkey PRIMARY KEY ("FRT_ID");


--
-- TOC entry 2916 (class 2606 OID 17206)
-- Name: main_venteentete main_venteentete_VNTENT_DOC_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_venteentete
    ADD CONSTRAINT "main_venteentete_VNTENT_DOC_key" UNIQUE ("VNTENT_DOC");


--
-- TOC entry 2919 (class 2606 OID 17053)
-- Name: main_venteentete main_venteentete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_venteentete
    ADD CONSTRAINT main_venteentete_pkey PRIMARY KEY ("VNTENT_ID");


--
-- TOC entry 2913 (class 2606 OID 17045)
-- Name: main_venteligne main_venteligne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_venteligne
    ADD CONSTRAINT main_venteligne_pkey PRIMARY KEY ("VNTLIG_ID");


--
-- TOC entry 2827 (class 1259 OID 16551)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2832 (class 1259 OID 16488)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2835 (class 1259 OID 16489)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2822 (class 1259 OID 16474)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2843 (class 1259 OID 16504)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2846 (class 1259 OID 16503)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2849 (class 1259 OID 16518)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2852 (class 1259 OID 16517)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2840 (class 1259 OID 16545)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2855 (class 1259 OID 16541)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2858 (class 1259 OID 16542)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2902 (class 1259 OID 16676)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2905 (class 1259 OID 16675)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2896 (class 1259 OID 17197)
-- Name: main_achatentete_ACHENT_DOC_3046ac38_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_achatentete_ACHENT_DOC_3046ac38_like" ON public.main_achatentete USING btree ("ACHENT_DOC" varchar_pattern_ops);


--
-- TOC entry 2899 (class 1259 OID 16666)
-- Name: main_achatentete_ACHENT_ID_FOURN_id_f6dad8fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_achatentete_ACHENT_ID_FOURN_id_f6dad8fe" ON public.main_achatentete USING btree ("ACHENT_ID_FOURN_id");


--
-- TOC entry 2893 (class 1259 OID 16659)
-- Name: main_achatligne_ACHLIG_ID_ART_id_f0e5b2ff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_achatligne_ACHLIG_ID_ART_id_f0e5b2ff" ON public.main_achatligne USING btree ("ACHLIG_ID_ART_id");


--
-- TOC entry 2859 (class 1259 OID 16641)
-- Name: main_article_AR_DESIGNATION_2b35db32_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_article_AR_DESIGNATION_2b35db32_like" ON public.main_article USING btree ("AR_DESIGNATION" varchar_pattern_ops);


--
-- TOC entry 2864 (class 1259 OID 16642)
-- Name: main_client_CL_NOM_db5ac5be_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_client_CL_NOM_db5ac5be_like" ON public.main_client USING btree ("CL_NOM" varchar_pattern_ops);


--
-- TOC entry 2906 (class 1259 OID 17056)
-- Name: main_famille_FAM_DES_295eeceb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_famille_FAM_DES_295eeceb_like" ON public.main_famille USING btree ("FAM_DES" varchar_pattern_ops);


--
-- TOC entry 2869 (class 1259 OID 16644)
-- Name: main_fichecode_FIC_CODE_5600dc5f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_fichecode_FIC_CODE_5600dc5f_like" ON public.main_fichecode USING btree ("FIC_CODE" varchar_pattern_ops);


--
-- TOC entry 2872 (class 1259 OID 16643)
-- Name: main_fichecode_FIC_DESIGNATION_7e7a0810_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_fichecode_FIC_DESIGNATION_7e7a0810_like" ON public.main_fichecode USING btree ("FIC_DESIGNATION" varchar_pattern_ops);


--
-- TOC entry 2877 (class 1259 OID 16645)
-- Name: main_fournisseur_FO_NOM_80774086_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_fournisseur_FO_NOM_80774086_like" ON public.main_fournisseur USING btree ("FO_NOM" varchar_pattern_ops);


--
-- TOC entry 2887 (class 1259 OID 16652)
-- Name: main_frais_FR_CODE_REF_6562e13b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_frais_FR_CODE_REF_6562e13b_like" ON public.main_frais USING btree ("FR_CODE_REF" text_pattern_ops);


--
-- TOC entry 2890 (class 1259 OID 16653)
-- Name: main_frais_FR_TYPE_id_6152348d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_frais_FR_TYPE_id_6152348d" ON public.main_frais USING btree ("FR_TYPE_id");


--
-- TOC entry 2882 (class 1259 OID 16646)
-- Name: main_typefrais_FRT_NAME_82f1b9b0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_typefrais_FRT_NAME_82f1b9b0_like" ON public.main_typefrais USING btree ("FRT_NAME" varchar_pattern_ops);


--
-- TOC entry 2914 (class 1259 OID 17207)
-- Name: main_venteentete_VNTENT_DOC_38119f3c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_venteentete_VNTENT_DOC_38119f3c_like" ON public.main_venteentete USING btree ("VNTENT_DOC" varchar_pattern_ops);


--
-- TOC entry 2917 (class 1259 OID 17069)
-- Name: main_venteentete_VNTENT_ID_CLIENT_id_0cfe1119; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_venteentete_VNTENT_ID_CLIENT_id_0cfe1119" ON public.main_venteentete USING btree ("VNTENT_ID_CLIENT_id");


--
-- TOC entry 2911 (class 1259 OID 17062)
-- Name: main_venteligne_VNTLIG_ID_ART_id_3ac7bd9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "main_venteligne_VNTLIG_ID_ART_id_3ac7bd9c" ON public.main_venteligne USING btree ("VNTLIG_ID_ART_id");


--
-- TOC entry 2922 (class 2606 OID 16483)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2921 (class 2606 OID 16478)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2920 (class 2606 OID 16469)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2924 (class 2606 OID 16498)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2923 (class 2606 OID 16493)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2926 (class 2606 OID 16512)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2925 (class 2606 OID 16507)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2927 (class 2606 OID 16531)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2928 (class 2606 OID 16536)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2931 (class 2606 OID 16660)
-- Name: main_achatentete main_achatentete_ACHENT_ID_FOURN_id_f6dad8fe_fk_main_four; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_achatentete
    ADD CONSTRAINT "main_achatentete_ACHENT_ID_FOURN_id_f6dad8fe_fk_main_four" FOREIGN KEY ("ACHENT_ID_FOURN_id") REFERENCES public.main_fournisseur("FO_ID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2930 (class 2606 OID 16654)
-- Name: main_achatligne main_achatligne_ACHLIG_ID_ART_id_f0e5b2ff_fk_main_article_AR_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_achatligne
    ADD CONSTRAINT "main_achatligne_ACHLIG_ID_ART_id_f0e5b2ff_fk_main_article_AR_ID" FOREIGN KEY ("ACHLIG_ID_ART_id") REFERENCES public.main_article("AR_ID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2929 (class 2606 OID 16647)
-- Name: main_frais main_frais_FR_TYPE_id_6152348d_fk_main_typefrais_FRT_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_frais
    ADD CONSTRAINT "main_frais_FR_TYPE_id_6152348d_fk_main_typefrais_FRT_ID" FOREIGN KEY ("FR_TYPE_id") REFERENCES public.main_typefrais("FRT_ID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2933 (class 2606 OID 17063)
-- Name: main_venteentete main_venteentete_VNTENT_ID_CLIENT_id_0cfe1119_fk_main_clie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_venteentete
    ADD CONSTRAINT "main_venteentete_VNTENT_ID_CLIENT_id_0cfe1119_fk_main_clie" FOREIGN KEY ("VNTENT_ID_CLIENT_id") REFERENCES public.main_client("CL_ID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2932 (class 2606 OID 17057)
-- Name: main_venteligne main_venteligne_VNTLIG_ID_ART_id_3ac7bd9c_fk_main_article_AR_ID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_venteligne
    ADD CONSTRAINT "main_venteligne_VNTLIG_ID_ART_id_3ac7bd9c_fk_main_article_AR_ID" FOREIGN KEY ("VNTLIG_ID_ART_id") REFERENCES public.main_article("AR_ID") DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2023-02-03 14:26:14

--
-- PostgreSQL database dump complete
--

