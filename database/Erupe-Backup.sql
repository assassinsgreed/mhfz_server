--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-25 14:01:44 UTC

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
-- TOC entry 869 (class 1247 OID 24578)
-- Name: festival_colour; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.festival_colour AS ENUM (
    'none',
    'red',
    'blue'
);


ALTER TYPE public.festival_colour OWNER TO postgres;

--
-- TOC entry 872 (class 1247 OID 24586)
-- Name: guild_application_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.guild_application_type AS ENUM (
    'applied',
    'invited'
);


ALTER TYPE public.guild_application_type OWNER TO postgres;

--
-- TOC entry 875 (class 1247 OID 24592)
-- Name: uint16; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.uint16 AS integer
	CONSTRAINT uint16_check CHECK (((VALUE >= 0) AND (VALUE <= 65536)));


ALTER DOMAIN public.uint16 OWNER TO postgres;

--
-- TOC entry 879 (class 1247 OID 24595)
-- Name: uint8; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.uint8 AS smallint
	CONSTRAINT uint8_check CHECK (((VALUE >= 0) AND (VALUE <= 255)));


ALTER DOMAIN public.uint8 OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 24597)
-- Name: raviinit(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.raviinit()
    LANGUAGE plpgsql
    AS $$
BEGIN
 
INSERT INTO public.raviregister(
	refid, nextravi, ravistarted, raviposttime, ravitype, maxplayers, ravikilled, carvequest, register1, register2, register3, register4, register5)
	VALUES (12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	
INSERT INTO public.ravistate(
	refid, phase1hp, phase2hp, phase3hp, phase4hp, phase5hp, phase6hp, phase7hp, phase8hp, phase9hp, unknown1, unknown2, unknown3, unknown4, unknown5, unknown6, unknown7, unknown8, unknown9, unknown10, unknown11, unknown12, unknown13, unknown14, unknown15, unknown16, unknown17, unknown18, unknown19, unknown20, damagemultiplier)
	VALUES (29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);
	
INSERT INTO public.ravisupport(
	refid, support1, support2, support3, support4, support5, support6, support7, support8, support9, support10, support11, support12, support13, support14, support15, support16, support17, support18, support19, support20, support21, support22, support23, support24, support25)
	VALUES (25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    COMMIT;
END;
$$;


ALTER PROCEDURE public.raviinit() OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 24598)
-- Name: ravireset(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.ravireset(IN zeroed integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
 
UPDATE public.ravistate
	SET refid=29, phase1hp=zeroed, phase2hp=zeroed, phase3hp=zeroed, phase4hp=zeroed, phase5hp=zeroed, phase6hp=zeroed, phase7hp=zeroed, phase8hp=zeroed, phase9hp=zeroed, unknown1=zeroed, unknown2=zeroed, unknown3=zeroed, unknown4=zeroed, unknown5=zeroed, unknown6=zeroed, unknown7=zeroed, unknown8=zeroed, unknown9=zeroed, unknown10=zeroed, unknown11=zeroed, unknown12=zeroed, unknown13=zeroed, unknown14=zeroed, unknown15=zeroed, unknown16=zeroed, unknown17=zeroed, unknown18=zeroed, unknown19=zeroed, unknown20=zeroed, damagemultiplier=1
	WHERE refid = 29;

UPDATE public.raviregister
	SET refid=12, nextravi=zeroed, ravistarted=zeroed, raviposttime=zeroed, ravitype=zeroed, maxplayers=zeroed, ravikilled=zeroed, carvequest=zeroed, register1=zeroed, register2=zeroed, register3=zeroed, register4=zeroed, register5=zeroed
	WHERE refid = 12;

UPDATE public.ravisupport
	SET refid=25, support1=zeroed, support2=zeroed, support3=zeroed, support4=zeroed, support5=zeroed, support6=zeroed, support7=zeroed, support8=zeroed, support9=zeroed, support10=zeroed, support11=zeroed, support12=zeroed, support13=zeroed, support14=zeroed, support15=zeroed, support16=zeroed, support17=zeroed, support18=zeroed, support19=zeroed, support20=zeroed, support21=zeroed, support22=zeroed, support23=zeroed, support24=zeroed, support25=zeroed
	WHERE refid = 25;

    COMMIT;
END;
$$;


ALTER PROCEDURE public.ravireset(IN zeroed integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 24599)
-- Name: account_sub; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_sub (
    id integer NOT NULL,
    discord_id text,
    erupe_account text,
    erupe_password text,
    date_inscription date,
    country text,
    presentation text
);


ALTER TABLE public.account_sub OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 24604)
-- Name: account_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_sub ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 24605)
-- Name: account_ban; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_ban (
    user_id integer NOT NULL,
    title text,
    reason text,
    date text,
    pass_origin text,
    pass_block text
);


ALTER TABLE public.account_ban OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24610)
-- Name: account_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_history (
    report_id integer NOT NULL,
    user_id integer,
    title text,
    reason text,
    date date
);


ALTER TABLE public.account_history OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 24615)
-- Name: account_history_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_history ALTER COLUMN report_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_history_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 24616)
-- Name: account_moderation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_moderation (
    id integer NOT NULL,
    username text,
    password text,
    type text
);


ALTER TABLE public.account_moderation OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24621)
-- Name: account_moderation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.account_moderation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.account_moderation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 24622)
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    user_id bigint,
    is_female boolean,
    is_new_character boolean,
    name character varying(15),
    unk_desc_string character varying(31),
    gr public.uint16,
    hrp public.uint16,
    weapon_type public.uint16,
    last_login integer,
    savedata bytea,
    decomyset bytea,
    hunternavi bytea,
    otomoairou bytea,
    partner bytea,
    platebox bytea,
    platedata bytea,
    platemyset bytea,
    rengokudata bytea,
    savemercenary bytea,
    restrict_guild_scout boolean DEFAULT false NOT NULL,
    minidata bytea,
    gacha_trial integer,
    gacha_prem integer,
    gacha_items bytea,
    daily_time timestamp without time zone,
    frontier_points integer,
    netcafe_points integer,
    house_info bytea,
    login_boost bytea,
    skin_hist bytea,
    kouryou_point integer,
    gcp integer,
    trophy bytea,
    guild_post_checked timestamp without time zone DEFAULT now() NOT NULL,
    time_played integer DEFAULT 0 NOT NULL,
    weapon_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24631)
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_id_seq OWNER TO postgres;

--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 217
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- TOC entry 218 (class 1259 OID 24632)
-- Name: event_week; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_week (
    id integer NOT NULL,
    event_id integer NOT NULL,
    date_expiration integer NOT NULL
);


ALTER TABLE public.event_week OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24635)
-- Name: fpoint_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fpoint_items (
    hash integer,
    itemtype public.uint8,
    itemid public.uint16,
    quant public.uint16,
    itemvalue public.uint16,
    tradetype public.uint8
);


ALTER TABLE public.fpoint_items OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24638)
-- Name: gacha_shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gacha_shop (
    hash bigint NOT NULL,
    reqgr integer NOT NULL,
    reqhr integer NOT NULL,
    gachaname character varying(255) NOT NULL,
    gachalink0 character varying(255) NOT NULL,
    gachalink1 character varying(255) NOT NULL,
    gachalink2 character varying(255) NOT NULL,
    extraicon integer NOT NULL,
    gachatype integer NOT NULL,
    hideflag boolean NOT NULL
);


ALTER TABLE public.gacha_shop OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24643)
-- Name: gacha_shop_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gacha_shop_items (
    shophash integer,
    entrytype public.uint8,
    itemhash integer NOT NULL,
    currtype public.uint8,
    currnumber public.uint16,
    currquant public.uint16,
    percentage public.uint16,
    rarityicon public.uint8,
    rollscount public.uint8,
    itemcount public.uint8,
    dailylimit public.uint8,
    itemtype integer[],
    itemid integer[],
    quantity integer[]
);


ALTER TABLE public.gacha_shop_items OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24648)
-- Name: gook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gook (
    id integer NOT NULL,
    gook0 bytea,
    gook1 bytea,
    gook2 bytea,
    gook3 bytea,
    gook4 bytea,
    gook5 bytea,
    gook0status boolean,
    gook1status boolean,
    gook2status boolean,
    gook3status boolean,
    gook4status boolean,
    gook5status boolean
);


ALTER TABLE public.gook OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24653)
-- Name: gook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gook_id_seq OWNER TO postgres;

--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 223
-- Name: gook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gook_id_seq OWNED BY public.gook.id;


--
-- TOC entry 224 (class 1259 OID 24654)
-- Name: guild_applications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_applications (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    character_id integer NOT NULL,
    actor_id integer NOT NULL,
    application_type public.guild_application_type NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.guild_applications OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24658)
-- Name: guild_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_applications_id_seq OWNER TO postgres;

--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 225
-- Name: guild_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_applications_id_seq OWNED BY public.guild_applications.id;


--
-- TOC entry 226 (class 1259 OID 24659)
-- Name: guild_characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_characters (
    id integer NOT NULL,
    guild_id bigint,
    character_id bigint,
    joined_at timestamp without time zone DEFAULT now(),
    avoid_leadership boolean DEFAULT false NOT NULL,
    order_index integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.guild_characters OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24665)
-- Name: guild_characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_characters_id_seq OWNER TO postgres;

--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 227
-- Name: guild_characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_characters_id_seq OWNED BY public.guild_characters.id;


--
-- TOC entry 228 (class 1259 OID 24666)
-- Name: guild_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guild_posts (
    id integer NOT NULL,
    guild_id integer NOT NULL,
    author_id integer NOT NULL,
    post_type integer NOT NULL,
    stamp_id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    liked_by text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.guild_posts OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24673)
-- Name: guild_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guild_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guild_posts_id_seq OWNER TO postgres;

--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 229
-- Name: guild_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guild_posts_id_seq OWNED BY public.guild_posts.id;


--
-- TOC entry 230 (class 1259 OID 24674)
-- Name: guilds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guilds (
    id integer NOT NULL,
    name character varying(24),
    created_at timestamp without time zone DEFAULT now(),
    leader_id integer NOT NULL,
    main_motto integer DEFAULT 0,
    rank_rp integer DEFAULT 0 NOT NULL,
    comment character varying(255) DEFAULT ''::character varying NOT NULL,
    festival_colour public.festival_colour DEFAULT 'none'::public.festival_colour,
    icon bytea,
    sub_motto integer DEFAULT 0,
    item_box bytea,
    event_rp integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.guilds OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24686)
-- Name: guilds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guilds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guilds_id_seq OWNER TO postgres;

--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 231
-- Name: guilds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guilds_id_seq OWNED BY public.guilds.id;


--
-- TOC entry 232 (class 1259 OID 24687)
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    user_id integer,
    admin_id integer,
    report_id integer NOT NULL,
    title text,
    reason text
);


ALTER TABLE public.history OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24692)
-- Name: login_boost_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_boost_state (
    char_id bigint,
    week_req public.uint8,
    week_count public.uint8,
    available boolean,
    end_time integer,
    "ID" integer NOT NULL
);


ALTER TABLE public.login_boost_state OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24695)
-- Name: login_boost_state_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.login_boost_state ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."login_boost_state_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 24696)
-- Name: lucky_box_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lucky_box_state (
    char_id bigint,
    shophash integer NOT NULL,
    used_itemhash integer[]
);


ALTER TABLE public.lucky_box_state OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 24701)
-- Name: mail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    body character varying DEFAULT ''::character varying NOT NULL,
    read boolean DEFAULT false NOT NULL,
    attached_item_received boolean DEFAULT false NOT NULL,
    attached_item integer,
    attached_item_amount integer DEFAULT 1 NOT NULL,
    is_guild_invite boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.mail OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 24714)
-- Name: mail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mail_id_seq OWNER TO postgres;

--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 237
-- Name: mail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mail_id_seq OWNED BY public.mail.id;


--
-- TOC entry 238 (class 1259 OID 24715)
-- Name: normal_shop_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.normal_shop_items (
    shoptype integer,
    shopid integer,
    itemhash integer NOT NULL,
    itemid public.uint16,
    points public.uint16,
    tradequantity public.uint16,
    rankreqlow public.uint16,
    rankreqhigh public.uint16,
    rankreqg public.uint16,
    storelevelreq public.uint16,
    maximumquantity public.uint16,
    boughtquantity public.uint16,
    roadfloorsrequired public.uint16,
    weeklyfataliskills public.uint16
);


ALTER TABLE public.normal_shop_items OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 24718)
-- Name: questlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questlists (
    ind integer NOT NULL,
    questlist bytea
);


ALTER TABLE public.questlists OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 24723)
-- Name: raviregister; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raviregister (
    id integer NOT NULL,
    refid integer NOT NULL,
    nextravi integer NOT NULL,
    ravistarted integer,
    raviposttime integer,
    ravitype integer,
    maxplayers integer,
    ravikilled integer,
    carvequest integer,
    register1 integer,
    register2 integer,
    register3 integer,
    register4 integer,
    register5 integer
);


ALTER TABLE public.raviregister OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 24726)
-- Name: raviregister_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.raviregister_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.raviregister_id_seq OWNER TO postgres;

--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 241
-- Name: raviregister_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.raviregister_id_seq OWNED BY public.raviregister.id;


--
-- TOC entry 242 (class 1259 OID 24727)
-- Name: ravistate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ravistate (
    id integer NOT NULL,
    refid integer NOT NULL,
    phase1hp integer NOT NULL,
    phase2hp integer,
    phase3hp integer,
    phase4hp integer,
    phase5hp integer,
    phase6hp integer,
    phase7hp integer,
    phase8hp integer,
    phase9hp integer,
    unknown1 integer,
    unknown2 integer,
    unknown3 integer,
    unknown4 integer,
    unknown5 integer,
    unknown6 integer,
    unknown7 integer,
    unknown8 integer,
    unknown9 integer,
    unknown10 integer,
    unknown11 integer,
    unknown12 integer,
    unknown13 integer,
    unknown14 integer,
    unknown15 integer,
    unknown16 integer,
    unknown17 integer,
    unknown18 integer,
    unknown19 integer,
    unknown20 integer,
    damagemultiplier integer
);


ALTER TABLE public.ravistate OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 24730)
-- Name: ravistate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ravistate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ravistate_id_seq OWNER TO postgres;

--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 243
-- Name: ravistate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ravistate_id_seq OWNED BY public.ravistate.id;


--
-- TOC entry 244 (class 1259 OID 24731)
-- Name: ravisupport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ravisupport (
    id integer NOT NULL,
    refid integer NOT NULL,
    support1 integer NOT NULL,
    support2 integer,
    support3 integer,
    support4 integer,
    support5 integer,
    support6 integer,
    support7 integer,
    support8 integer,
    support9 integer,
    support10 integer,
    support11 integer,
    support12 integer,
    support13 integer,
    support14 integer,
    support15 integer,
    support16 integer,
    support17 integer,
    support18 integer,
    support19 integer,
    support20 integer,
    support21 integer,
    support22 integer,
    support23 integer,
    support24 integer,
    support25 integer
);


ALTER TABLE public.ravisupport OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 24734)
-- Name: ravisupport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ravisupport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ravisupport_id_seq OWNER TO postgres;

--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 245
-- Name: ravisupport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ravisupport_id_seq OWNED BY public.ravisupport.id;


--
-- TOC entry 246 (class 1259 OID 24735)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    dirty boolean NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 24738)
-- Name: servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servers (
    server_id integer NOT NULL,
    server_name text,
    season integer,
    current_players integer,
    event_id integer,
    event_expiration integer
);


ALTER TABLE public.servers OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 24743)
-- Name: servers_server_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.servers ALTER COLUMN server_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.servers_server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 249 (class 1259 OID 24744)
-- Name: shop_item_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_item_state (
    char_id bigint,
    itemhash integer NOT NULL,
    usedquantity integer
);


ALTER TABLE public.shop_item_state OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 24747)
-- Name: sign_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sign_sessions (
    id integer NOT NULL,
    user_id bigint,
    auth_token_num bigint,
    auth_token_str text
);


ALTER TABLE public.sign_sessions OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 24752)
-- Name: sign_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sign_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sign_sessions_id_seq OWNER TO postgres;

--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 251
-- Name: sign_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sign_sessions_id_seq OWNED BY public.sign_sessions.id;


--
-- TOC entry 252 (class 1259 OID 24753)
-- Name: stepup_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stepup_state (
    char_id bigint,
    shophash integer NOT NULL,
    step_progression integer,
    step_time timestamp without time zone
);


ALTER TABLE public.stepup_state OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 24756)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    item_box bytea,
    rights integer DEFAULT 14 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 24762)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 254
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3315 (class 2604 OID 24763)
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 24764)
-- Name: gook id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gook ALTER COLUMN id SET DEFAULT nextval('public.gook_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 24765)
-- Name: guild_applications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications ALTER COLUMN id SET DEFAULT nextval('public.guild_applications_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 24766)
-- Name: guild_characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters ALTER COLUMN id SET DEFAULT nextval('public.guild_characters_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 24767)
-- Name: guild_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_posts ALTER COLUMN id SET DEFAULT nextval('public.guild_posts_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 24768)
-- Name: guilds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guilds ALTER COLUMN id SET DEFAULT nextval('public.guilds_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 24769)
-- Name: mail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail ALTER COLUMN id SET DEFAULT nextval('public.mail_id_seq'::regclass);


--
-- TOC entry 3343 (class 2604 OID 24770)
-- Name: raviregister id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raviregister ALTER COLUMN id SET DEFAULT nextval('public.raviregister_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 24771)
-- Name: ravistate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravistate ALTER COLUMN id SET DEFAULT nextval('public.ravistate_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 24772)
-- Name: ravisupport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravisupport ALTER COLUMN id SET DEFAULT nextval('public.ravisupport_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 24773)
-- Name: sign_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sign_sessions ALTER COLUMN id SET DEFAULT nextval('public.sign_sessions_id_seq'::regclass);


--
-- TOC entry 3348 (class 2604 OID 24774)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3570 (class 0 OID 24605)
-- Dependencies: 211
-- Data for Name: account_ban; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_ban (user_id, title, reason, date, pass_origin, pass_block) FROM stdin;
\.


--
-- TOC entry 3571 (class 0 OID 24610)
-- Dependencies: 212
-- Data for Name: account_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_history (report_id, user_id, title, reason, date) FROM stdin;
\.


--
-- TOC entry 3573 (class 0 OID 24616)
-- Dependencies: 214
-- Data for Name: account_moderation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_moderation (id, username, password, type) FROM stdin;
\.


--
-- TOC entry 3568 (class 0 OID 24599)
-- Dependencies: 209
-- Data for Name: account_sub; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_sub (id, discord_id, erupe_account, erupe_password, date_inscription, country, presentation) FROM stdin;
\.


--
-- TOC entry 3575 (class 0 OID 24622)
-- Dependencies: 216
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (id, user_id, is_female, is_new_character, name, unk_desc_string, gr, hrp, weapon_type, last_login, savedata, decomyset, hunternavi, otomoairou, partner, platebox, platedata, platemyset, rengokudata, savemercenary, restrict_guild_scout, minidata, gacha_trial, gacha_prem, gacha_items, daily_time, frontier_points, netcafe_points, house_info, login_boost, skin_hist, kouryou_point, gcp, trophy, guild_post_checked, time_played, weapon_id) FROM stdin;
\.


--
-- TOC entry 3577 (class 0 OID 24632)
-- Dependencies: 218
-- Data for Name: event_week; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_week (id, event_id, date_expiration) FROM stdin;
\.


--
-- TOC entry 3578 (class 0 OID 24635)
-- Dependencies: 219
-- Data for Name: fpoint_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fpoint_items (hash, itemtype, itemid, quant, itemvalue, tradetype) FROM stdin;
\.


--
-- TOC entry 3579 (class 0 OID 24638)
-- Dependencies: 220
-- Data for Name: gacha_shop; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gacha_shop (hash, reqgr, reqhr, gachaname, gachalink0, gachalink1, gachalink2, extraicon, gachatype, hideflag) FROM stdin;
\.


--
-- TOC entry 3580 (class 0 OID 24643)
-- Dependencies: 221
-- Data for Name: gacha_shop_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gacha_shop_items (shophash, entrytype, itemhash, currtype, currnumber, currquant, percentage, rarityicon, rollscount, itemcount, dailylimit, itemtype, itemid, quantity) FROM stdin;
\.


--
-- TOC entry 3581 (class 0 OID 24648)
-- Dependencies: 222
-- Data for Name: gook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gook (id, gook0, gook1, gook2, gook3, gook4, gook5, gook0status, gook1status, gook2status, gook3status, gook4status, gook5status) FROM stdin;
\.


--
-- TOC entry 3583 (class 0 OID 24654)
-- Dependencies: 224
-- Data for Name: guild_applications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guild_applications (id, guild_id, character_id, actor_id, application_type, created_at) FROM stdin;
\.


--
-- TOC entry 3585 (class 0 OID 24659)
-- Dependencies: 226
-- Data for Name: guild_characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guild_characters (id, guild_id, character_id, joined_at, avoid_leadership, order_index) FROM stdin;
\.


--
-- TOC entry 3587 (class 0 OID 24666)
-- Dependencies: 228
-- Data for Name: guild_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guild_posts (id, guild_id, author_id, post_type, stamp_id, title, body, created_at, liked_by) FROM stdin;
\.


--
-- TOC entry 3589 (class 0 OID 24674)
-- Dependencies: 230
-- Data for Name: guilds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guilds (id, name, created_at, leader_id, main_motto, rank_rp, comment, festival_colour, icon, sub_motto, item_box, event_rp) FROM stdin;
\.


--
-- TOC entry 3591 (class 0 OID 24687)
-- Dependencies: 232
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (user_id, admin_id, report_id, title, reason) FROM stdin;
\.


--
-- TOC entry 3592 (class 0 OID 24692)
-- Dependencies: 233
-- Data for Name: login_boost_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.login_boost_state (char_id, week_req, week_count, available, end_time, "ID") FROM stdin;
\.


--
-- TOC entry 3594 (class 0 OID 24696)
-- Dependencies: 235
-- Data for Name: lucky_box_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lucky_box_state (char_id, shophash, used_itemhash) FROM stdin;
\.


--
-- TOC entry 3595 (class 0 OID 24701)
-- Dependencies: 236
-- Data for Name: mail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mail (id, sender_id, recipient_id, subject, body, read, attached_item_received, attached_item, attached_item_amount, is_guild_invite, created_at, deleted) FROM stdin;
\.


--
-- TOC entry 3597 (class 0 OID 24715)
-- Dependencies: 238
-- Data for Name: normal_shop_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.normal_shop_items (shoptype, shopid, itemhash, itemid, points, tradequantity, rankreqlow, rankreqhigh, rankreqg, storelevelreq, maximumquantity, boughtquantity, roadfloorsrequired, weeklyfataliskills) FROM stdin;
\.


--
-- TOC entry 3598 (class 0 OID 24718)
-- Dependencies: 239
-- Data for Name: questlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questlists (ind, questlist) FROM stdin;
\.


--
-- TOC entry 3599 (class 0 OID 24723)
-- Dependencies: 240
-- Data for Name: raviregister; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raviregister (id, refid, nextravi, ravistarted, raviposttime, ravitype, maxplayers, ravikilled, carvequest, register1, register2, register3, register4, register5) FROM stdin;
\.


--
-- TOC entry 3601 (class 0 OID 24727)
-- Dependencies: 242
-- Data for Name: ravistate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ravistate (id, refid, phase1hp, phase2hp, phase3hp, phase4hp, phase5hp, phase6hp, phase7hp, phase8hp, phase9hp, unknown1, unknown2, unknown3, unknown4, unknown5, unknown6, unknown7, unknown8, unknown9, unknown10, unknown11, unknown12, unknown13, unknown14, unknown15, unknown16, unknown17, unknown18, unknown19, unknown20, damagemultiplier) FROM stdin;
\.


--
-- TOC entry 3603 (class 0 OID 24731)
-- Dependencies: 244
-- Data for Name: ravisupport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ravisupport (id, refid, support1, support2, support3, support4, support5, support6, support7, support8, support9, support10, support11, support12, support13, support14, support15, support16, support17, support18, support19, support20, support21, support22, support23, support24, support25) FROM stdin;
\.


--
-- TOC entry 3605 (class 0 OID 24735)
-- Dependencies: 246
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version, dirty) FROM stdin;
\.


--
-- TOC entry 3606 (class 0 OID 24738)
-- Dependencies: 247
-- Data for Name: servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servers (server_id, server_name, season, current_players, event_id, event_expiration) FROM stdin;
\.


--
-- TOC entry 3608 (class 0 OID 24744)
-- Dependencies: 249
-- Data for Name: shop_item_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_item_state (char_id, itemhash, usedquantity) FROM stdin;
\.


--
-- TOC entry 3609 (class 0 OID 24747)
-- Dependencies: 250
-- Data for Name: sign_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sign_sessions (id, user_id, auth_token_num, auth_token_str) FROM stdin;
\.


--
-- TOC entry 3611 (class 0 OID 24753)
-- Dependencies: 252
-- Data for Name: stepup_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stepup_state (char_id, shophash, step_progression, step_time) FROM stdin;
\.


--
-- TOC entry 3612 (class 0 OID 24756)
-- Dependencies: 253
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, item_box, rights) FROM stdin;
\.


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 210
-- Name: account_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_auth_id_seq', 1, false);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 213
-- Name: account_history_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_history_report_id_seq', 1, false);


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 215
-- Name: account_moderation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_moderation_id_seq', 1, false);


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 217
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_id_seq', 1, false);


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 223
-- Name: gook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gook_id_seq', 1, false);


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 225
-- Name: guild_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guild_applications_id_seq', 1, false);


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 227
-- Name: guild_characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guild_characters_id_seq', 1, false);


--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 229
-- Name: guild_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guild_posts_id_seq', 1, false);


--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 231
-- Name: guilds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guilds_id_seq', 1, false);


--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 234
-- Name: login_boost_state_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."login_boost_state_ID_seq"', 1, false);


--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 237
-- Name: mail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mail_id_seq', 1, false);


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 241
-- Name: raviregister_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.raviregister_id_seq', 1, false);


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 243
-- Name: ravistate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ravistate_id_seq', 1, false);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 245
-- Name: ravisupport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ravisupport_id_seq', 1, false);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 248
-- Name: servers_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servers_server_id_seq', 1, false);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 251
-- Name: sign_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sign_sessions_id_seq', 1, false);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 254
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3350 (class 2606 OID 24776)
-- Name: account_sub account_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_sub
    ADD CONSTRAINT account_auth_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 24778)
-- Name: account_history account_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_history
    ADD CONSTRAINT account_history_pkey PRIMARY KEY (report_id);


--
-- TOC entry 3356 (class 2606 OID 24780)
-- Name: account_moderation account_moderation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_moderation
    ADD CONSTRAINT account_moderation_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 24782)
-- Name: account_ban ban_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_ban
    ADD CONSTRAINT ban_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3358 (class 2606 OID 24784)
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 24786)
-- Name: event_week event_week_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_week
    ADD CONSTRAINT event_week_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 24788)
-- Name: gacha_shop_items gacha_shop_items_itemhash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gacha_shop_items
    ADD CONSTRAINT gacha_shop_items_itemhash_key UNIQUE (itemhash);


--
-- TOC entry 3362 (class 2606 OID 24790)
-- Name: gacha_shop gacha_shop_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gacha_shop
    ADD CONSTRAINT gacha_shop_pkey PRIMARY KEY (hash, reqgr, reqhr, gachaname, gachalink0, gachalink1, gachalink2, extraicon, gachatype, hideflag);


--
-- TOC entry 3366 (class 2606 OID 24792)
-- Name: gook gook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gook
    ADD CONSTRAINT gook_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 24794)
-- Name: guild_applications guild_application_character_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_application_character_id UNIQUE (guild_id, character_id);


--
-- TOC entry 3371 (class 2606 OID 24796)
-- Name: guild_applications guild_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 24798)
-- Name: guild_characters guild_characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 24800)
-- Name: guild_posts guild_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_posts
    ADD CONSTRAINT guild_posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 24802)
-- Name: guilds guilds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guilds
    ADD CONSTRAINT guilds_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 24804)
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (report_id);


--
-- TOC entry 3382 (class 2606 OID 24806)
-- Name: login_boost_state id_week; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT id_week UNIQUE (char_id, week_req);


--
-- TOC entry 3384 (class 2606 OID 24808)
-- Name: login_boost_state login_boost_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT login_boost_state_pkey PRIMARY KEY ("ID");


--
-- TOC entry 3386 (class 2606 OID 24810)
-- Name: lucky_box_state lucky_box_state_id_shophash; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lucky_box_state
    ADD CONSTRAINT lucky_box_state_id_shophash UNIQUE (char_id, shophash);


--
-- TOC entry 3388 (class 2606 OID 24812)
-- Name: mail mail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_pkey PRIMARY KEY (id);


--
-- TOC entry 3391 (class 2606 OID 24814)
-- Name: normal_shop_items normal_shop_items_itemhash_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.normal_shop_items
    ADD CONSTRAINT normal_shop_items_itemhash_key UNIQUE (itemhash);


--
-- TOC entry 3393 (class 2606 OID 24816)
-- Name: normal_shop_items normal_shop_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.normal_shop_items
    ADD CONSTRAINT normal_shop_items_pkey PRIMARY KEY (itemhash);


--
-- TOC entry 3395 (class 2606 OID 24818)
-- Name: questlists questlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questlists
    ADD CONSTRAINT questlists_pkey PRIMARY KEY (ind);


--
-- TOC entry 3397 (class 2606 OID 24820)
-- Name: raviregister raviregister_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raviregister
    ADD CONSTRAINT raviregister_pkey PRIMARY KEY (id);


--
-- TOC entry 3399 (class 2606 OID 24822)
-- Name: ravistate ravistate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravistate
    ADD CONSTRAINT ravistate_pkey PRIMARY KEY (id);


--
-- TOC entry 3401 (class 2606 OID 24824)
-- Name: ravisupport ravisupport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ravisupport
    ADD CONSTRAINT ravisupport_pkey PRIMARY KEY (id);


--
-- TOC entry 3403 (class 2606 OID 24826)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 3405 (class 2606 OID 24828)
-- Name: servers servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servers
    ADD CONSTRAINT servers_pkey PRIMARY KEY (server_id);


--
-- TOC entry 3407 (class 2606 OID 24830)
-- Name: shop_item_state shop_item_state_id_itemhash; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_item_state
    ADD CONSTRAINT shop_item_state_id_itemhash UNIQUE (char_id, itemhash);


--
-- TOC entry 3409 (class 2606 OID 24832)
-- Name: sign_sessions sign_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sign_sessions
    ADD CONSTRAINT sign_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3411 (class 2606 OID 24834)
-- Name: stepup_state stepup_state_id_shophash; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stepup_state
    ADD CONSTRAINT stepup_state_id_shophash UNIQUE (char_id, shophash);


--
-- TOC entry 3413 (class 2606 OID 24836)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3415 (class 2606 OID 24838)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3369 (class 1259 OID 24839)
-- Name: guild_application_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guild_application_type_index ON public.guild_applications USING btree (application_type);


--
-- TOC entry 3372 (class 1259 OID 24840)
-- Name: guild_character_unique_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX guild_character_unique_index ON public.guild_characters USING btree (character_id);


--
-- TOC entry 3389 (class 1259 OID 24841)
-- Name: mail_recipient_deleted_created_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mail_recipient_deleted_created_id_index ON public.mail USING btree (recipient_id, deleted, created_at DESC, id DESC);


--
-- TOC entry 3416 (class 2606 OID 24842)
-- Name: characters characters_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3417 (class 2606 OID 24847)
-- Name: guild_applications guild_applications_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.characters(id);


--
-- TOC entry 3418 (class 2606 OID 24852)
-- Name: guild_applications guild_applications_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id);


--
-- TOC entry 3419 (class 2606 OID 24857)
-- Name: guild_applications guild_applications_guild_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_applications
    ADD CONSTRAINT guild_applications_guild_id_fkey FOREIGN KEY (guild_id) REFERENCES public.guilds(id);


--
-- TOC entry 3420 (class 2606 OID 24862)
-- Name: guild_characters guild_characters_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id);


--
-- TOC entry 3421 (class 2606 OID 24867)
-- Name: guild_characters guild_characters_guild_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guild_characters
    ADD CONSTRAINT guild_characters_guild_id_fkey FOREIGN KEY (guild_id) REFERENCES public.guilds(id);


--
-- TOC entry 3422 (class 2606 OID 24872)
-- Name: login_boost_state login_boost_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_boost_state
    ADD CONSTRAINT login_boost_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


--
-- TOC entry 3423 (class 2606 OID 24877)
-- Name: lucky_box_state lucky_box_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lucky_box_state
    ADD CONSTRAINT lucky_box_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


--
-- TOC entry 3424 (class 2606 OID 24882)
-- Name: mail mail_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.characters(id);


--
-- TOC entry 3425 (class 2606 OID 24887)
-- Name: mail mail_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail
    ADD CONSTRAINT mail_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.characters(id);


--
-- TOC entry 3426 (class 2606 OID 24892)
-- Name: shop_item_state shop_item_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_item_state
    ADD CONSTRAINT shop_item_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


--
-- TOC entry 3427 (class 2606 OID 24897)
-- Name: sign_sessions sign_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sign_sessions
    ADD CONSTRAINT sign_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3428 (class 2606 OID 24902)
-- Name: stepup_state stepup_state_char_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stepup_state
    ADD CONSTRAINT stepup_state_char_id_fkey FOREIGN KEY (char_id) REFERENCES public.characters(id);


-- Completed on 2022-07-25 14:01:44 UTC

--
-- PostgreSQL database dump complete
--

