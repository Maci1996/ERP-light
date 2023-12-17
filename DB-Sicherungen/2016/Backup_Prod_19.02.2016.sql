--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.4.4
-- Started on 2016-02-19 10:51:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.telephone DROP CONSTRAINT fk_telephon_relteleph_type;
ALTER TABLE ONLY public.telephone DROP CONSTRAINT fk_telephon_relperson_person;
ALTER TABLE ONLY public.relpersontype DROP CONSTRAINT fk_relperso_relperson_type;
ALTER TABLE ONLY public.relpersontype DROP CONSTRAINT fk_relperso_relperson_person;
ALTER TABLE ONLY public.relorgtype DROP CONSTRAINT fk_relorgty_relorgtyp_type;
ALTER TABLE ONLY public.relorgtype DROP CONSTRAINT fk_relorgty_relorgtyp_organisa;
ALTER TABLE ONLY public.relorgcat DROP CONSTRAINT fk_relorgca_relorgcat_organisa;
ALTER TABLE ONLY public.relorgcat DROP CONSTRAINT fk_relorgca_relorgcat_category;
ALTER TABLE ONLY public.platformuser DROP CONSTRAINT fk_platform_relperson_person;
ALTER TABLE ONLY public.platformuser DROP CONSTRAINT fk_platform_platformu_permissi;
ALTER TABLE ONLY public.person DROP CONSTRAINT fk_person_relperson_person;
ALTER TABLE ONLY public.person DROP CONSTRAINT fk_person_relperson_address;
ALTER TABLE ONLY public.person DROP CONSTRAINT fk_person_person_co_country;
ALTER TABLE ONLY public.person DROP CONSTRAINT fk_person_person_ci_city;
ALTER TABLE ONLY public.outgoing_delivery DROP CONSTRAINT fk_outgoing_updatesou_person;
ALTER TABLE ONLY public.outgoing_delivery DROP CONSTRAINT fk_outgoing_receives__organisa;
ALTER TABLE ONLY public.outgoing_article DROP CONSTRAINT fk_outgoing_outgoinga_article;
ALTER TABLE ONLY public.outgoing_delivery DROP CONSTRAINT fk_outgoing_outdelive_delivery;
ALTER TABLE ONLY public.outgoing_article DROP CONSTRAINT fk_outgoing_outarticl_outgoing;
ALTER TABLE ONLY public.orgcontactperson DROP CONSTRAINT fk_orgconta_orgcontac_person;
ALTER TABLE ONLY public.orgcontactperson DROP CONSTRAINT fk_orgconta_orgcontac_organisa;
ALTER TABLE ONLY public.organisation DROP CONSTRAINT fk_organisa_updated_o_person;
ALTER TABLE ONLY public.organisation DROP CONSTRAINT fk_organisa_relorgcou_country;
ALTER TABLE ONLY public.organisation DROP CONSTRAINT fk_organisa_relorgcit_city;
ALTER TABLE ONLY public.organisation DROP CONSTRAINT fk_organisa_relorgadd_address;
ALTER TABLE ONLY public.incoming_delivery DROP CONSTRAINT fk_incoming_updates_i_person;
ALTER TABLE ONLY public.incoming_article DROP CONSTRAINT fk_incoming_incominga_article;
ALTER TABLE ONLY public.incoming_article DROP CONSTRAINT fk_incoming_inarticle_incoming;
ALTER TABLE ONLY public.incoming_delivery DROP CONSTRAINT fk_incoming_delivers_organisa;
ALTER TABLE ONLY public.email DROP CONSTRAINT fk_email_relperson_person;
ALTER TABLE ONLY public.email DROP CONSTRAINT fk_email_relemailt_type;
ALTER TABLE ONLY public.delivery_list DROP CONSTRAINT fk_delivery_updates_d_person;
DROP INDEX public.updatesoutgoingdelivery_fk;
DROP INDEX public.updates_incoming_delivery_fk;
DROP INDEX public.updates_deliverylist_fk;
DROP INDEX public.updated_organisation_fk;
DROP INDEX public.type_pk;
DROP INDEX public.telephone_pk;
DROP INDEX public.reporting_pk;
DROP INDEX public.reltelephonetype_fk;
DROP INDEX public.relpersonupdateperson_fk;
DROP INDEX public.relpersontype_pk;
DROP INDEX public.relpersontype_fk;
DROP INDEX public.relpersontype2_fk;
DROP INDEX public.relpersontelephone_fk;
DROP INDEX public.relpersonemail_fk;
DROP INDEX public.relpersonaddress_fk;
DROP INDEX public.relorgtype_pk;
DROP INDEX public.relorgtype_fk;
DROP INDEX public.relorgtype2_fk;
DROP INDEX public.relorgcountry_fk;
DROP INDEX public.relorgcity_fk;
DROP INDEX public.relorgcat_pk;
DROP INDEX public.relorgcat_fk;
DROP INDEX public.relorgcat2_fk;
DROP INDEX public.relorgaddress_fk;
DROP INDEX public.relemailtype_fk;
DROP INDEX public.receives_delivery_fk;
DROP INDEX public.platformuser_pk;
DROP INDEX public.platformuser_permission_fk;
DROP INDEX public.person_pk;
DROP INDEX public.person_country_fk;
DROP INDEX public.person_city_fk;
DROP INDEX public.permission_pk;
DROP INDEX public.outgoingarticle_article_fk;
DROP INDEX public.outgoing_delivery_pk;
DROP INDEX public.outgoing_article_pk;
DROP INDEX public.outdelivery_deliverylist_fk;
DROP INDEX public.outarticle_outdelivery_fk;
DROP INDEX public.orgcontactperson_pk;
DROP INDEX public.orgcontactperson_fk;
DROP INDEX public.orgcontactperson2_fk;
DROP INDEX public.organisation_pk;
DROP INDEX public.logging_pk;
DROP INDEX public.incomingarticle_article_fk;
DROP INDEX public.incoming_delivery_pk;
DROP INDEX public.incoming_article_pk;
DROP INDEX public.inarticle_indelivery_fk;
DROP INDEX public.email_pk;
DROP INDEX public.delivery_list_pk;
DROP INDEX public.delivers_fk;
DROP INDEX public.country_pk;
DROP INDEX public.city_pk;
DROP INDEX public.category_pk;
DROP INDEX public.article_pk;
DROP INDEX public.address_pk;
ALTER TABLE ONLY public.address DROP CONSTRAINT unique_constraint_address;
ALTER TABLE ONLY public.type DROP CONSTRAINT pk_type;
ALTER TABLE ONLY public.telephone DROP CONSTRAINT pk_telephone;
ALTER TABLE ONLY public.reporting DROP CONSTRAINT pk_reporting;
ALTER TABLE ONLY public.relpersontype DROP CONSTRAINT pk_relpersontype;
ALTER TABLE ONLY public.relorgtype DROP CONSTRAINT pk_relorgtype;
ALTER TABLE ONLY public.relorgcat DROP CONSTRAINT pk_relorgcat;
ALTER TABLE ONLY public.platformuser DROP CONSTRAINT pk_platformuser;
ALTER TABLE ONLY public.person DROP CONSTRAINT pk_person;
ALTER TABLE ONLY public.permission DROP CONSTRAINT pk_permission;
ALTER TABLE ONLY public.outgoing_delivery DROP CONSTRAINT pk_outgoing_delivery;
ALTER TABLE ONLY public.outgoing_article DROP CONSTRAINT pk_outgoing_article;
ALTER TABLE ONLY public.orgcontactperson DROP CONSTRAINT pk_orgcontactperson;
ALTER TABLE ONLY public.organisation DROP CONSTRAINT pk_organisation;
ALTER TABLE ONLY public.logging DROP CONSTRAINT pk_logging;
ALTER TABLE ONLY public.incoming_delivery DROP CONSTRAINT pk_incoming_delivery;
ALTER TABLE ONLY public.incoming_article DROP CONSTRAINT pk_incoming_article;
ALTER TABLE ONLY public.email DROP CONSTRAINT pk_email;
ALTER TABLE ONLY public.delivery_list DROP CONSTRAINT pk_delivery_list;
ALTER TABLE ONLY public.country DROP CONSTRAINT pk_country;
ALTER TABLE ONLY public.city DROP CONSTRAINT pk_city;
ALTER TABLE ONLY public.category DROP CONSTRAINT pk_category;
ALTER TABLE ONLY public.article DROP CONSTRAINT pk_article;
ALTER TABLE ONLY public.address DROP CONSTRAINT pk_address;
ALTER TABLE public.type ALTER COLUMN type_id DROP DEFAULT;
ALTER TABLE public.telephone ALTER COLUMN telephone_id DROP DEFAULT;
ALTER TABLE public.reporting ALTER COLUMN report_id DROP DEFAULT;
ALTER TABLE public.person ALTER COLUMN person_id DROP DEFAULT;
ALTER TABLE public.permission ALTER COLUMN permission_id DROP DEFAULT;
ALTER TABLE public.outgoing_delivery ALTER COLUMN outgoing_delivery_id DROP DEFAULT;
ALTER TABLE public.outgoing_article ALTER COLUMN outgoing_article_id DROP DEFAULT;
ALTER TABLE public.organisation ALTER COLUMN organisation_id DROP DEFAULT;
ALTER TABLE public.logging ALTER COLUMN logging_id DROP DEFAULT;
ALTER TABLE public.incoming_delivery ALTER COLUMN incoming_delivery_id DROP DEFAULT;
ALTER TABLE public.incoming_article ALTER COLUMN incoming_article_id DROP DEFAULT;
ALTER TABLE public.email ALTER COLUMN email_id DROP DEFAULT;
ALTER TABLE public.delivery_list ALTER COLUMN delivery_list_id DROP DEFAULT;
ALTER TABLE public.country ALTER COLUMN country_id DROP DEFAULT;
ALTER TABLE public.city ALTER COLUMN city_id DROP DEFAULT;
ALTER TABLE public.category ALTER COLUMN category_id DROP DEFAULT;
ALTER TABLE public.article ALTER COLUMN article_id DROP DEFAULT;
ALTER TABLE public.address ALTER COLUMN address_id DROP DEFAULT;
DROP SEQUENCE public.type_type_id_seq;
DROP SEQUENCE public.telephone_telephone_id_seq;
DROP TABLE public.telephone;
DROP SEQUENCE public.reporting_report_id_seq;
DROP TABLE public.reporting;
DROP TABLE public.relorgcat;
DROP TABLE public.platformuser;
DROP VIEW public.personemailreportview;
DROP VIEW public.personaddressreportview;
DROP TABLE public.type;
DROP TABLE public.relpersontype;
DROP TABLE public.relorgtype;
DROP SEQUENCE public.person_person_id_seq;
DROP TABLE public.person;
DROP SEQUENCE public.permission_permission_id_seq;
DROP TABLE public.permission;
DROP SEQUENCE public.outgoing_delivery_outgoing_delivery_id_seq;
DROP TABLE public.outgoing_delivery;
DROP SEQUENCE public.outgoing_article_outgoing_article_id_seq;
DROP TABLE public.orgcontactperson;
DROP SEQUENCE public.organisation_organisation_id_seq;
DROP TABLE public.organisation;
DROP SEQUENCE public.logging_logging_id_seq;
DROP TABLE public.logging;
DROP SEQUENCE public.incoming_delivery_incoming_delivery_id_seq;
DROP TABLE public.incoming_delivery;
DROP SEQUENCE public.incoming_article_incoming_article_id_seq;
DROP SEQUENCE public.email_email_id_seq;
DROP TABLE public.email;
DROP SEQUENCE public.delivery_list_delivery_list_id_seq;
DROP TABLE public.delivery_list;
DROP SEQUENCE public.country_country_id_seq;
DROP TABLE public.country;
DROP SEQUENCE public.city_city_id_seq;
DROP TABLE public.city;
DROP SEQUENCE public.category_category_id_seq;
DROP TABLE public.category;
DROP VIEW public.availarticleindepot;
DROP VIEW public.totalnumberpuofalloutgoingarticles;
DROP VIEW public.totalnumberpuofallincomingarticles;
DROP TABLE public.outgoing_article;
DROP TABLE public.incoming_article;
DROP SEQUENCE public.article_article_id_seq;
DROP TABLE public.article;
DROP SEQUENCE public.address_address_id_seq;
DROP TABLE public.address;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 175 (class 1259 OID 420528)
-- Name: address; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address (
    address_id integer NOT NULL,
    address character varying(100) NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 420531)
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 176
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE address_address_id_seq OWNED BY address.address_id;


--
-- TOC entry 177 (class 1259 OID 420533)
-- Name: article; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE article (
    article_id integer NOT NULL,
    description character varying(1024) NOT NULL,
    packaging_unit character varying(100) NOT NULL,
    weightpu double precision NOT NULL,
    mdd date,
    pricepu numeric(15,2) NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 420539)
-- Name: article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 178
-- Name: article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_article_id_seq OWNED BY article.article_id;


--
-- TOC entry 179 (class 1259 OID 420541)
-- Name: incoming_article; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE incoming_article (
    incoming_article_id integer NOT NULL,
    incoming_delivery_id integer NOT NULL,
    article_id integer NOT NULL,
    article_nr integer,
    numberpu integer NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 420544)
-- Name: outgoing_article; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE outgoing_article (
    outgoing_article_id integer NOT NULL,
    outgoing_delivery_id integer NOT NULL,
    article_id integer NOT NULL,
    article_nr integer,
    numberpu integer NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 420547)
-- Name: totalnumberpuofallincomingarticles; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW totalnumberpuofallincomingarticles AS
 SELECT incoming_article.article_id,
    sum(incoming_article.numberpu) AS totalnumberofpus
   FROM incoming_article
  GROUP BY incoming_article.article_id;


--
-- TOC entry 182 (class 1259 OID 420551)
-- Name: totalnumberpuofalloutgoingarticles; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW totalnumberpuofalloutgoingarticles AS
 SELECT outgoing_article.article_id,
    sum(outgoing_article.numberpu) AS totalnumberofpus
   FROM outgoing_article
  GROUP BY outgoing_article.article_id;


--
-- TOC entry 183 (class 1259 OID 420555)
-- Name: availarticleindepot; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW availarticleindepot AS
 SELECT article_id,
    (COALESCE(inarticle.totalnumberofpus, (0)::bigint) - COALESCE(outarticle.totalnumberofpus, (0)::bigint)) AS availnumberofpus
   FROM (totalnumberpuofallincomingarticles inarticle
     FULL JOIN totalnumberpuofalloutgoingarticles outarticle USING (article_id));


--
-- TOC entry 184 (class 1259 OID 420559)
-- Name: category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE category (
    category_id integer NOT NULL,
    category character varying(100) NOT NULL,
    description character varying(1024)
);


--
-- TOC entry 185 (class 1259 OID 420565)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 185
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE category_category_id_seq OWNED BY category.category_id;


--
-- TOC entry 186 (class 1259 OID 420567)
-- Name: city; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE city (
    city_id integer NOT NULL,
    zip character varying(5) NOT NULL,
    city character varying(100) NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 420570)
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 187
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE city_city_id_seq OWNED BY city.city_id;


--
-- TOC entry 188 (class 1259 OID 420572)
-- Name: country; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE country (
    country_id integer NOT NULL,
    country character varying(50) NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 420575)
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 189
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE country_country_id_seq OWNED BY country.country_id;


--
-- TOC entry 190 (class 1259 OID 420577)
-- Name: delivery_list; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE delivery_list (
    delivery_list_id integer NOT NULL,
    person_id integer NOT NULL,
    name character varying(100) NOT NULL,
    date date NOT NULL,
    comment character varying(1000) NOT NULL,
    driver character varying(100) NOT NULL,
    passenger character varying(100) NOT NULL,
    update_timestamp date DEFAULT now() NOT NULL,
    archived integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 420585)
-- Name: delivery_list_delivery_list_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE delivery_list_delivery_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 191
-- Name: delivery_list_delivery_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE delivery_list_delivery_list_id_seq OWNED BY delivery_list.delivery_list_id;


--
-- TOC entry 192 (class 1259 OID 420587)
-- Name: email; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE email (
    email_id integer NOT NULL,
    person_id integer,
    type_id integer NOT NULL,
    email character varying(50) NOT NULL
);


--
-- TOC entry 193 (class 1259 OID 420590)
-- Name: email_email_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE email_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 193
-- Name: email_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE email_email_id_seq OWNED BY email.email_id;


--
-- TOC entry 194 (class 1259 OID 420592)
-- Name: incoming_article_incoming_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE incoming_article_incoming_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 194
-- Name: incoming_article_incoming_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE incoming_article_incoming_article_id_seq OWNED BY incoming_article.incoming_article_id;


--
-- TOC entry 195 (class 1259 OID 420594)
-- Name: incoming_delivery; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE incoming_delivery (
    incoming_delivery_id integer NOT NULL,
    organisation_id integer NOT NULL,
    person_id integer NOT NULL,
    delivery_nr integer,
    date date NOT NULL,
    comment character varying(1000) NOT NULL,
    update_timestamp date DEFAULT now() NOT NULL,
    archived integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 420602)
-- Name: incoming_delivery_incoming_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE incoming_delivery_incoming_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 196
-- Name: incoming_delivery_incoming_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE incoming_delivery_incoming_delivery_id_seq OWNED BY incoming_delivery.incoming_delivery_id;


--
-- TOC entry 197 (class 1259 OID 420604)
-- Name: logging; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logging (
    logging_id integer NOT NULL,
    loggingtext character varying(1000) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    person_id integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 420610)
-- Name: logging_logging_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logging_logging_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 198
-- Name: logging_logging_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logging_logging_id_seq OWNED BY logging.logging_id;


--
-- TOC entry 199 (class 1259 OID 420612)
-- Name: organisation; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organisation (
    organisation_id integer NOT NULL,
    address_id integer,
    city_id integer,
    country_id integer,
    person_id integer,
    name character varying(100) NOT NULL,
    comment character varying(1000) NOT NULL,
    update_timestamp date DEFAULT now() NOT NULL,
    active integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 420620)
-- Name: organisation_organisation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organisation_organisation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 200
-- Name: organisation_organisation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organisation_organisation_id_seq OWNED BY organisation.organisation_id;


--
-- TOC entry 201 (class 1259 OID 420622)
-- Name: orgcontactperson; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgcontactperson (
    person_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 420625)
-- Name: outgoing_article_outgoing_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outgoing_article_outgoing_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 202
-- Name: outgoing_article_outgoing_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE outgoing_article_outgoing_article_id_seq OWNED BY outgoing_article.outgoing_article_id;


--
-- TOC entry 203 (class 1259 OID 420627)
-- Name: outgoing_delivery; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE outgoing_delivery (
    outgoing_delivery_id integer NOT NULL,
    organisation_id integer NOT NULL,
    person_id integer NOT NULL,
    delivery_list_id integer,
    delivery_nr integer,
    date date NOT NULL,
    comment character varying(1000) NOT NULL,
    update_timestamp date DEFAULT now() NOT NULL,
    archived integer DEFAULT 0 NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 420635)
-- Name: outgoing_delivery_outgoing_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outgoing_delivery_outgoing_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 204
-- Name: outgoing_delivery_outgoing_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE outgoing_delivery_outgoing_delivery_id_seq OWNED BY outgoing_delivery.outgoing_delivery_id;


--
-- TOC entry 205 (class 1259 OID 420637)
-- Name: permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permission (
    permission_id integer NOT NULL,
    description character varying(1024),
    permission character varying(20) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 420643)
-- Name: permission_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permission_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 206
-- Name: permission_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE permission_permission_id_seq OWNED BY permission.permission_id;


--
-- TOC entry 207 (class 1259 OID 420645)
-- Name: person; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE person (
    person_id integer NOT NULL,
    country_id integer,
    city_id integer,
    address_id integer,
    per_person_id integer,
    salutation character varying(20) NOT NULL,
    title character varying(20) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    comment character varying(1000) NOT NULL,
    update_timestamp date DEFAULT now() NOT NULL,
    active integer DEFAULT 1 NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 420653)
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 208
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE person_person_id_seq OWNED BY person.person_id;


--
-- TOC entry 209 (class 1259 OID 420655)
-- Name: relorgtype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relorgtype (
    type_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 420658)
-- Name: relpersontype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relpersontype (
    type_id integer NOT NULL,
    person_id integer NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 420661)
-- Name: type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE type (
    type_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 420664)
-- Name: personaddressreportview; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW personaddressreportview AS
 SELECT p.salutation,
    p.title,
    p.first_name AS "firstName",
    p.last_name AS "lastName",
    string_agg((pt.name)::text, ', '::text) AS "persType",
    pa.address AS "privateAddress",
    pc.zip AS "privateZip",
    pc.city AS "privateCity",
    pcountry.country AS "privateCountry",
    o.name AS "orgName",
    string_agg((ot.name)::text, ', '::text) AS "orgType",
    oa.address AS "orgAddress",
    oc.zip AS "orgZip",
    oc.city AS "orgCity",
    ocountry.country AS "orgCountry"
   FROM ((((((((((((person p
     LEFT JOIN orgcontactperson USING (person_id))
     FULL JOIN organisation o ON (((orgcontactperson.organisation_id = o.organisation_id) AND (o.active = 1))))
     LEFT JOIN relorgtype relorgtype(type_id, organisation_id_1) ON ((relorgtype.organisation_id_1 = o.organisation_id)))
     LEFT JOIN type ot ON ((ot.type_id = relorgtype.type_id)))
     LEFT JOIN relpersontype ON ((p.person_id = relpersontype.person_id)))
     LEFT JOIN type pt ON ((pt.type_id = relpersontype.type_id)))
     LEFT JOIN address pa ON ((p.address_id = pa.address_id)))
     LEFT JOIN address oa ON ((o.address_id = oa.address_id)))
     LEFT JOIN city pc ON ((p.city_id = pc.city_id)))
     LEFT JOIN city oc ON ((o.city_id = oc.city_id)))
     LEFT JOIN country pcountry ON ((p.country_id = pcountry.country_id)))
     LEFT JOIN country ocountry ON ((o.country_id = ocountry.country_id)))
  WHERE ((COALESCE(p.active, 1) = 1) AND (COALESCE(o.active, 1) = 1))
  GROUP BY p.salutation, p.title, p.first_name, p.last_name, pa.address, pc.zip, pc.city, pcountry.country, o.name, oa.address, oc.zip, oc.city, ocountry.country
  ORDER BY p.last_name;


--
-- TOC entry 213 (class 1259 OID 420669)
-- Name: personemailreportview; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW personemailreportview AS
 SELECT p.person_id AS personid,
    p.salutation,
    p.title,
    p.last_name AS lastname,
    p.first_name AS firstname,
    p.comment,
    string_agg((pt.name)::text, ', '::text) AS perstype,
    email.email,
    t.name AS emailtype,
    o.name AS organisationname
   FROM ((((((person p
     LEFT JOIN relpersontype USING (person_id))
     LEFT JOIN type pt ON ((relpersontype.type_id = pt.type_id)))
     LEFT JOIN email USING (person_id))
     LEFT JOIN type t ON ((email.type_id = t.type_id)))
     LEFT JOIN orgcontactperson USING (person_id))
     LEFT JOIN organisation o USING (organisation_id))
  WHERE (p.active = 1)
  GROUP BY p.person_id, p.salutation, p.title, p.last_name, p.first_name, p.comment, email.email, t.name, o.name
  ORDER BY p.last_name;


--
-- TOC entry 214 (class 1259 OID 420674)
-- Name: platformuser; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE platformuser (
    person_id integer NOT NULL,
    permission_id integer NOT NULL,
    password character varying(200) NOT NULL,
    login_email character varying(50) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 420677)
-- Name: relorgcat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relorgcat (
    organisation_id integer NOT NULL,
    category_id integer NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 420680)
-- Name: reporting; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporting (
    report_id integer NOT NULL,
    date date NOT NULL,
    description character varying(1024),
    report_file character(1)
);


--
-- TOC entry 217 (class 1259 OID 420686)
-- Name: reporting_report_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reporting_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 217
-- Name: reporting_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reporting_report_id_seq OWNED BY reporting.report_id;


--
-- TOC entry 218 (class 1259 OID 420688)
-- Name: telephone; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE telephone (
    telephone_id integer NOT NULL,
    person_id integer,
    type_id integer NOT NULL,
    telephone character varying(20) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 420691)
-- Name: telephone_telephone_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE telephone_telephone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 219
-- Name: telephone_telephone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE telephone_telephone_id_seq OWNED BY telephone.telephone_id;


--
-- TOC entry 220 (class 1259 OID 420693)
-- Name: type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 220
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE type_type_id_seq OWNED BY type.type_id;


--
-- TOC entry 2953 (class 2604 OID 420695)
-- Name: address_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY address ALTER COLUMN address_id SET DEFAULT nextval('address_address_id_seq'::regclass);


--
-- TOC entry 2954 (class 2604 OID 420696)
-- Name: article_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article ALTER COLUMN article_id SET DEFAULT nextval('article_article_id_seq'::regclass);


--
-- TOC entry 2957 (class 2604 OID 420697)
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY category ALTER COLUMN category_id SET DEFAULT nextval('category_category_id_seq'::regclass);


--
-- TOC entry 2958 (class 2604 OID 420698)
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY city ALTER COLUMN city_id SET DEFAULT nextval('city_city_id_seq'::regclass);


--
-- TOC entry 2959 (class 2604 OID 420699)
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY country ALTER COLUMN country_id SET DEFAULT nextval('country_country_id_seq'::regclass);


--
-- TOC entry 2962 (class 2604 OID 420700)
-- Name: delivery_list_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_list ALTER COLUMN delivery_list_id SET DEFAULT nextval('delivery_list_delivery_list_id_seq'::regclass);


--
-- TOC entry 2963 (class 2604 OID 420701)
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY email ALTER COLUMN email_id SET DEFAULT nextval('email_email_id_seq'::regclass);


--
-- TOC entry 2955 (class 2604 OID 420702)
-- Name: incoming_article_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_article ALTER COLUMN incoming_article_id SET DEFAULT nextval('incoming_article_incoming_article_id_seq'::regclass);


--
-- TOC entry 2966 (class 2604 OID 420703)
-- Name: incoming_delivery_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_delivery ALTER COLUMN incoming_delivery_id SET DEFAULT nextval('incoming_delivery_incoming_delivery_id_seq'::regclass);


--
-- TOC entry 2967 (class 2604 OID 420704)
-- Name: logging_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logging ALTER COLUMN logging_id SET DEFAULT nextval('logging_logging_id_seq'::regclass);


--
-- TOC entry 2970 (class 2604 OID 420705)
-- Name: organisation_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation ALTER COLUMN organisation_id SET DEFAULT nextval('organisation_organisation_id_seq'::regclass);


--
-- TOC entry 2956 (class 2604 OID 420706)
-- Name: outgoing_article_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_article ALTER COLUMN outgoing_article_id SET DEFAULT nextval('outgoing_article_outgoing_article_id_seq'::regclass);


--
-- TOC entry 2973 (class 2604 OID 420707)
-- Name: outgoing_delivery_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery ALTER COLUMN outgoing_delivery_id SET DEFAULT nextval('outgoing_delivery_outgoing_delivery_id_seq'::regclass);


--
-- TOC entry 2974 (class 2604 OID 420708)
-- Name: permission_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission ALTER COLUMN permission_id SET DEFAULT nextval('permission_permission_id_seq'::regclass);


--
-- TOC entry 2977 (class 2604 OID 420709)
-- Name: person_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY person ALTER COLUMN person_id SET DEFAULT nextval('person_person_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 420710)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporting ALTER COLUMN report_id SET DEFAULT nextval('reporting_report_id_seq'::regclass);


--
-- TOC entry 2980 (class 2604 OID 420711)
-- Name: telephone_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY telephone ALTER COLUMN telephone_id SET DEFAULT nextval('telephone_telephone_id_seq'::regclass);


--
-- TOC entry 2978 (class 2604 OID 420712)
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY type ALTER COLUMN type_id SET DEFAULT nextval('type_type_id_seq'::regclass);


--
-- TOC entry 3228 (class 0 OID 420528)
-- Dependencies: 175
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY address (address_id, address) FROM stdin;
563	Neutorstrasse 33
76	Stiftsgasse 1
77	Schillerstraße 22
564	Franz-Josef-Straße 13 / I
79	Lamprechtshausener-Straße 38
565	Herrengasse 13
81	Guggenbichler-Straße 26
578	Metzgerweg 10 
84	Kleßheimer Allee 27B/23
85	Neue Heimat Straße 13/4
579	Höllbacherweg 3
87	Dorfstraße 35
88	Rott Au 20
89	Pfeifergasse 9
90	Leonorenweg 10
91	Hildebrandt-Gasse 19
92	Hildebrandtgasse 16
580	Mattseer Landesstrasse 1
94	Schalkham 94
95	Morzgerstraße 14
96	Gottsreithweg 10
581	Wilhelm-von-Exner-Straße 32
583	Glaserstraße 11
99	Ursulinenweg 4
584	Paumannstr. 6/56
101	Seitenbachweg 14
102	Dr. Richard Hartmann Straße 1
103	Am Hainbach 7
587	xy str. 11
588	Kandlgasse 40/1
107	Gemeindeweg 4
108	Abfalterhofweg 12
109	Farchen 24
110	Michael-Rottmayer-Straße 9
111	Lofer Nr. 206
112	Linke Glanzeile 23
114	Forellenweg 20
117	Liechtensteinstraße  11
118	Am Pfaffenbühel 11
119	Mitterweg 14
122	Schloß Aigen
124	Slavi-Soucek-Straße 28/2
127	Wäschergasse 15/2/7
128	Obere Gasse 4
129	Am Alterbach 6
130	Nikolaus Lenaugasse 5
131	Kräuterhofweg 7
132	Nonntaler Hauptraße 21
133	Rottweg 47
135	Nr. 35
137	Franz-Josef-Straße 22
138	Urstein Süd 1, Raum 321
139	Salzachgäßchen 3
141	Seeparksiedlung 12
146	Kleßheimer Allee 45
147	Stegerstraße 9
148	Wegscheid 17
150	Postfach 12
151	Johnweg 16
152	Gartenstraße 31
154	Matthias-Bayrhamer-Str 5
155	Wäschergasse 15
156	Alpenstraße 54
158	Struberg. 13
159	St.-Barbara-Straße 2 A
160	Störweg 5
161	Sternhofweg 50
162	Herraugasse 16
163	Forellenweg 9
164	Heuberg 2A
165	Konrad-Laib-Straße 10/122
166	Versorgungshausstraße  14
170	Mühlbachweg 25
172	Moserstraße 5 A
175	Pidingweg 10
176	Herbert-v-Karajan-Straße 9
177	Leopoldskronstrasse 13 b
179	Kothgumprechting 31
181	Nr. 41
182	Henri-Dunant-Straße 42
183	Fillgradergasse 6/2
184	Franz-Josef-Straße 15
185	Am Gaisberg 24
186	Arthur Schnitzler-Straße10/11
188	Imbergstraße 16
190	Asperg. 23
191	Ignaz-Harrer-Straße 110
194	Kahlspergweg 6
195	Pfadfinderweg 10
197	Kaigasse  39/2/7
198	Rainerstraße 27/1. Stock
200	Maria Pertl-Gasse 8
202	Laubichl 4
203	Haidach 4
204	Panoramaweg 367
209	Wehrgasse 11
210	Oberdorfer Straße 50
211	Buchenweg 1
212	Taxach , Rifer Hauptstr 72
213	Sonnbergstraße 3
215	Linzergasse 50
217	Lindenweg 2
218	Seb.-Stief-Straße 20
219	Slavi Soucek-Straße 32/55
221	Sikorastraße  10
223	Erzabt-Klotz-Straße 25
226	Sighartstein 4
227	Uferstraße  41
566	Rosa-Hofmann-Straße 33
567	Untersbergstraße 40
230	Reschbergerweg 17
231	Otto-Pflanzl-Straße 9
232	Stephan-Ludwig-Roth-Straße 14
233	Julius-Welser-Straße 16/1
234	Salzweg 1
568	Mirabellplatz 4
569	Rainerstraße 27 / 1. Stock
237	Hofhaymer Allee 19/23
570	Neualmerstraße 13
239	Nr. 152
240	Schwarzstraße 19
241	Eugen-Müller-Straße 65
242	Aignerstraße 55A
243	Siebenstädterstraße 8
244	Sommeregg 12
245	Franz-Hinterholzer-Kai 12/6
246	Baumgartenweg 2
247	Auerspergstraße 10/5
571	Wiedner Hauptstraße 63
249	Hartlebeng. 3a
250	Drei Linden 639
582	Gutratbergweg 3
585	Plainstr. 83
586	Auschneiderweg 15
254	Olching 1
257	Schiffmanngasse 18
258	Ginzkeyplatz 10/III/1
259	Stella-Klein-Löw-Weg 13
260	Paracelsusstraße 51
261	Moserstraße 33
262	Salzburger Strasse 10
264	Franziskanergasse 5
265	Mühlbachstraße 31
267	Julius-Raab-Platz 1
270	Kaigasse 8
272	Rainerstraße 2
273	Crailsheimstraße 8a
275	Handelszentrum 5
276	Matthäus-Wieder-Str 1
279	Hellbrunner Straße 13 B
281	Bachstraße 64
285	Sparkassenstraße 11
286	Schopperstraße 17
287	Schwanthalerstraße 43a
288	Alpenstraße 54 oder Nonntaler Hauptstraße 21?
289	Egglriedlweg. 1
291	Hellbrunner Straße 28
292	Bayernstraße 31
294	Oberfeldstraße 11
295	Gourmetstraße 1-3
297	Schillinghofstraße 9
298	Ursprungstraße 4
299	Müllner Hauptstraße 6
300	Schwarzstraße 35
302	Rechtes Salzachufer 30
303	Ziegeleistr 18
306	Karolingerstraße 40
307	Julius Raab Platz 2
308	Reichenhaller Straße 75
309	Franz-Hinterholzer-Kai 8
310	Gnigler Straße 5 – 7
311	Perfalleckstraße 26
313	Bogenmühlstraße 7
314	Innsbrucker Bundesstraße 37
315	Julius-Fritsche-Gasse 44
317	Mauthauser Straße 1-5
318	Pillweinstraße 16
319	Schwarzstraße 13 – 15
320	Messenbachgasse 1
321	Dr. Fritz Rihl Weg 2
322	Hellbrunner Straße 13
323	Kreuzbergpromenade 13A
324	Hauptstraße 14
325	Karl-Zillner-Platz 16
326	Römerstrasse 8
327	Unken 8
328	Salzachtalstraße 58
329	Glockengasse 10
330	Franz-Peyerl-Straße 11
335	Hockerfeld 5-8
336	Laufenstraße 55
338	Ernst-Grein-Straße 5
339	Handelszentrum 3
340	Alte Bundesstrasse 12
341	Zollhausweg 3
343	Ziegelei 17
346	Hellbrunner Allee 52
347	Spannbruckerplatz 6
348	Moosstrasse 197
352	Tirolerstraße 17
353	Gewerbegebiet Aupoint\nGottfried-Schenker-Straße 2
355	Bäckerweg 9
357	Davidstraße 7
358	Sonnenweg 9
359	Weixlerstraße 16
361	Fürstenallee 25
363	Kapitelplatz 6
364	Nonntaler Hauptstraße 55
365	Franz-Gruber-Straße 24a
366	Hirschloh 1-3
368	Kleßheim 11
370	Hauptstrasse 168
371	Franz-Wolfram-Scherer-Straße 24
372	Weisslhofweg 7
373	Fasaneriestraße 35
374	Hellbrunner Straße 14
375	Haunspergstrasse 32-34
572	Hallwanger Landesstraße 2
377	Simmeringer Hauptstrasse 397
378	Ludwig-Bieringer-Platz 1
383	Hauptstraße 1
384	Gmundnerstraße 27
385	Michaelbeuern 1
573	Dietrichstenstraße 8
387	Paris-Lodron-Straße 2
574	Föhrenweg 10
389	Maximiliangasse
390	Hallwanger Landesstrasse 3
391	Marktplatz 1
575	Wiesersberg 68
393	Geissmayerstraße 6
394	Robinigstraße 57, Postfach 159
576	Am See 79
396	Kleßheim 9
397	Richtistrasse 5
398	Markt 25
399	Franz-Josef-Kai 7
400	Ziegeleistraße 34
401	Mondseerstraße 16
402	Kasernenstraße 1
403	Samergasse 25a
577	Wagingerstraße 20
405	Moosstraße 52
406	Gewerbestrasse 7
407	Aiglhofstraße 20a
408	Schloss Mirabell
409	Gewerbestraße 13
410	Halleiner Landesstraße 3
411	Lueger-Waldweg 1
412	Christian-Doppler-Straße 3a
413	Meierhofweg 24
414	Davisstraße 11 C
415	Handelsstraße 10
416	Nonnberggasse 2
417	Nonntaler Hauptraße 79
418	Gangsteig 112
419	Brunnfeldstraße 1
420	Kapitelplatz 8
421	Karl-Schweighofer-Gasse 12/6
422	Mondseer Straße 16
425	Kräutlerweg 42
426	Fürnbuch 8
427	Gewerbehofstraße 375
428	Lettlweg 5
430	Oberfeldstraße 7 – 11
431	Kaigasse 14
432	Plainstraße 83
433	Gewerbegebiet Süd 6
434	Untersbergstraße 378
436	Muthgasse 107
437	Goldensteinstraße 2
438	Gewerbestraße 2
440	Gaisbergstraße 7
444	Leonfeldner Straße 328
445	Kendlerstraße 1
446	Winkl 12
450	Flotzingerplatz 6
451	Jakob-Lechner-Weg 442
452	Leopold Pöschl Gasse. 24
453	St. Peter Bezirk 1
454	Sterneckstraße 55/5
455	Wilhelmsederstraße 3
457	Hubert-Sattler-Gasse 7a
458	Döttlstraße 18
460	Test-Straße 00-0
461	Hochfeld 233
463	Römergasse 20
464	Lamprechtshausener Bundesstraße 6
465	Anton-Adner-Straße 1
466	Saalachstraße 51
467	Friedensstraße 11
468	Churfürststraße 1
469	Ferchlstraße 26
470	Innsbrucker Bundesstraße 111
471	Egglriedlweg 1
472	Itzlinger Hauptstraße 13
473	Theresienthalstraße 68
474	Maria-Cebotari-Straße 1 - 7
475	Franz-Josef-Straße 13
476	Neutorstraße 33
477	Birkenstraße 2
478	Straniakstraße 4
479	Adolf-Kolping-Straße 10
480	Konrad-Seyde-Straße 12
481	Metzgerstraße 81
482	Schulstraße 5
483	Mattigtalstraße 8
484	Plainbachstraße 5
485	Paris-Lodron-Straße 6
486	Vogelweiderstraße 107
487	Lieferinger Hauptstraße 30
488	Simmeringer Hauptstraße 397
489	Großmarktstraße 1
490	Mielestraße 1
491	Schönleitenstraße 1
492	Münchner Bundesstraße 121
493	Gewerbestraße 7
494	Schallmooser Hauptstraße 38
495	Alpenstraße 102-104
496	Nonntaler Hauptstraße 49 d
497	Merianstraße 13
498	Triebenbachstraße 26
499	Sterneckstraße 51
500	Dr-Hans-Lechner-Straße 16
501	Richtistraße 5
502	Römerstraße 4
503	Bayerhamerstraße 16
504	Imbergstraße 2
505	Milchstraße 1
506	Otto-von-Lilienthal-Straße 7
507	Matthäus-Wieder-Straße 1
508	Furtmühlstraße 2
509	Vogelweiderstraße 44 a
510	Irrsdorferstraße 30
511	Hermann-Gmeiner-Straße 29
512	Gänsbichlstraße 8
513	Europastraße 3
514	Münchner Bundesstraße 120
515	Alte Reichenhaller Straße 3
516	Auerspergstraße 9
517	Elisabethstraße 2/5
518	Riedenburgerstraße 8
519	Ignaz-Harrer-Straße 83 A
520	Adolf-Schemel-Straße 9
521	Stainachstraße 1
75	Perneggerstraße 11
78	Hauptstraße 22E12
3	Scheierlweg 18
5	Sonnberg 172
7	Augustinerg. 26A
8	Hauptstraße 4
9	Hellbrunner Allee 59B
10	Brunnbachweg 21
11	Obertrum am See 1
13	Nesselthalergasse 32
14	Weinbachgasse 9
16	Keltenweg 20
17	Hellbrunner Straße 9A
19	Kreuzbrücklweg 5
21	Jägerwirtstrasse 131
22	Rohrerweg 18
25	Schrannengasse 2/II/6
27	Eugen-Müller-Straße 99
28	Bernardigasse  3
29	Gessenbergstrasse 5
31	Hofhaymer Allee 20
32	Kleßheimer Straße 14
33	Schulstraße 7b
34	Michaelbeuern 45
36	Hauptstraße 30
37	Hofmark 92
39	Rupertigasse 22
40	Carl-Maager-Straße 18a
41	Mayburgerplatz 1
42	Maierwiesweg 30E
43	Glanfeldbachweg 14
46	Hans Weigel Str 7
48	Pfadfinderweg 8
50	Josef Preis Allee 18
52	Georg-Nikolaus-von-Nissen-Straße 34
53	Steirerstraße 5
56	Aspergasse 24
58	Prinzinger-Straße 5
59	Brachsenweg 10
60	Jadorf 47
61	Wartbergweg 21
62	Julius Fritsche-G. 38
63	Slavi-Soucek-Straße 28/6
65	Einleitenweg 54
68	Ölling 2
69	Birnhamweg 26
80	Membergerstraße 1b
82	Michael Beuernstraße 5a
86	Grillparzerstraße 9
93	Wildentenstraße 27
97	Kahlspergstraße 48/9
100	Carola-Blomestraße 7
71	Gewerbepark Süd 6
72	Apostelgasse 2-14/8/58
73	Baderluck 33
74	Weiler 8
104	Borromäumstraße 12
106	Glanfeldstraße 40
113	Maxglaner Hauptstraße 63
115	Itzlinger Hauptstraße 17
116	Revierstraße 4
120	Röcklbrunnstraße 18
121	Kühbergstraße 40/3
123	Vollererhofstraße 393
125	Tannenbergstraße 55
126	Neutorstraße 38
134	Aufeldstraße 17 – 23
136	Halleiner Landesstraße 6c
140	Schoarerbergstraße 28
142	Münsterholzstraße 45
144	Reimsstraße 10
145	Berchtesgadnerstraße 11
149	Joh. Filzerstraße 6
153	Nonntaler Hauptstraße 110
157	Fischachstraße 22
167	Schmiedingerstraße 69 a
168	Ziegeleistraße12
169	Beethovenstraße 40
171	Schneibsteinstraße 10a
173	Prötschhofstraße 12
174	Nonntaler Hauptstraße 1
178	Watzmannstraße 45
180	Zanderstraße 8
187	Hauptstraße 17
189	Lasserstraße11
192	Wiener Bundesstraße 63
193	Sinnhubstraße 30
196	Schießstattstraße 27
201	Hechtstraße 9 A
205	Wasserfeldstraße 8
206	Salzachseestraße 11
207	Nonntaler Hauptstraße 43
214	Franz-Stelzhamerstraße 2
216	Johannes-Filzerstraße 24
220	Goethestraße 21-2-16
222	Wiednerhauptstraße 39/58
224	Mühlbachstraße 557
225	Gaisbergstraße 44 T
228	Moosfeldstraße 5
229	Tuvalstraße 6
235	Vogelsangstraße 15 c
236	Mohrstraße 13
238	Siezenheimerstraße 35
248	Reichenhallerstraße 9
251	Firmianstraße 10 A
252	Zillertalstraße 26
253	Alte Landstraße 12a/5
255	Diabellistraße 11
256	Neualmerstraße 26
282	Gewerbestraße 1
290	Alpenstraße 115 - 117
293	Radingerstraße 16
305	Rainerstraße 29
350	Schönleitenstraße1
362	Siezenheimerstraße 7
439	Schießstandstraße 45
462	Ganghoferstraße 35
2	Vierthalerstraße 16B
4	Süßmayerstraße 6
6	Schneibsteinstraße 5
12	General Arnoldstraße 5
15	Traunstraße 16A
18	Weinheberstraße 6
20	Poststraße 62
23	E.Schikanederstraße 20
24	Pflegerstraße 20a
26	Luitholdstraße 1 A
30	Elisabethstraße 53
35	Auerspergstraße 25
38	Uferstraße 15 A
44	Rennbahnstraße 13 a
47	S. Julienstraße 4a
49	Dr. Sylvesterstraße 22
51	Lidaunstraße 26
54	H. Puthonstraße 4
55	Schneibsteinstraße 1
57	Diabellistraße 21
64	Reichenhallerstraße 22
66	Uferstraße 32 A
67	Alpenstraße 102
70	Vollererhofstraße 533
543	Rennbahnstraße 13a
544	Doktor-Sylvester-Straße 22
545	Anton-Wildgans-Straße 14
546	Hechtstraße 9A
547	Lasserstraße 11
548	Augustinergasse 26A
549	Aspergasse 23
550	Tassiloweg 9
551	Schmiedingerstraße 69a
83	Dorf 3
522	Matthias-Bayrhamer-Straße 5
552	Wiestalstr 57
553	Am Heilbrunnen 136/138
554	Hardefuststraße 1
555	Josef-Mayburger-Kai 114
556	Aigner Straße 35a
557	Urstein Süd 1
558	Robinigstraße 57
559	Obere Donaustraße 95
560	Innsbrucker Bundesstraße 126
561	Bayerhamerstraße 18
562	Merianstrasse 13
523	Eichetstraße 3
524	Würzenberg Nr. 35
525	General-Arnold-Straße 5
526	Herbert-von-Karajan-Straße 9
527	Scheibenweg 18
528	Arthur Schnitzler-Straße 10/11
529	Julius Fritsche-Gasse 38
530	Heinrich-Puthon-Straße 4
531	Leopoldskronstraße 13 b
532	Hartlebengasse 3a
533	Kühbergstraße 20a
534	Ziegeleistraße 12
535	Hildebrandtgasse 19
536	Hildebrandtgasse 16a
537	Strubergasse 13
538	Sankt-Barbara-Straße 2A
539	Carl-Orff-Straße 7
540	Geyereckstraße 13
541	Hans Weigel Straße 7
542	Sankt-Julien-Straße 4a
379	Kendlerstraße 2
381	Mondseer Straße 14
589	Steinweg 14
590	Franz Josef-Kai 33
591	Gutrathbergweg 8
592	Schlossstraße 12
593	Neualmerstraße 37
594	Pfarrhofstr. 
595	Hirschbergstraße 3
596	Erzabt Klotz Straße 1
597	Austraße 4
598	Zeisigstraße 33
599	Wilhelm-Spazier-Straße 7a
600	Salzburger Str. 29
601	Schäfferhofstraße 14
\.


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 176
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('address_address_id_seq', 601, true);


--
-- TOC entry 3230 (class 0 OID 420533)
-- Dependencies: 177
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: -
--

COPY article (article_id, description, packaging_unit, weightpu, mdd, pricepu) FROM stdin;
21	Brot	kg	1	2015-05-18	3.20
23	Brot	kg	1	2015-05-18	3.20
26	Brot	kg	1	2015-05-18	3.20
29	Brot	kg	1	2015-05-18	3.20
31	Brot	kg	1	2015-05-18	3.20
36	Brot	kg	1	2015-05-18	3.20
37	Wurst gemischt	Karton	15	2015-05-18	150.00
38	Wurst gemischt	Karton	15	2015-05-18	150.00
39	Mineralwasser	Tray	6	2015-05-18	4.00
40	Mineralwasser	Tray	6	2015-05-18	4.00
41	Mineralwasser	Tray	6	2015-05-18	4.00
43	Brot	kg	2	2015-05-20	3.50
44	Brioche	Stk.	0.0800000000000000017	2015-05-20	1.00
45	Brot	kg	2	2015-05-20	3.50
46	Brot	kg	1	2015-05-22	3.50
47	Vintschgerl	Stk.	0.0800000000000000017	2015-05-22	0.90
48	Brioche	Stk.	0.0800000000000000017	2015-05-22	1.00
49	Brot	kg	1	2015-05-22	3.50
50	Vintschgerl	Stk.	0.0800000000000000017	2015-05-22	0.90
51	Brot	kg	1	2015-05-22	3.50
52	Brioche	Stk.	0.0800000000000000017	2015-05-22	1.00
55	Brot / Gebäck	kg	1	2015-05-23	4.00
56	Brot / Gebäck	kg	1	2015-05-23	4.00
57	Mineralwasser ohne Geschmack	Tray a 12 Fl.	6	2015-05-23	5.88
58	Mineralwasser mit Geschmack	Tray a 12 Fl.	9	2015-05-23	14.28
59	Bergader Almkäse	Karton	4.90000000000000036	2015-05-23	34.86
60	Brot / Gebäck	kg	1	2015-05-23	4.00
61	Bergader Almkäse	Karton	4.90000000000000036	2015-05-23	55.86
62	Bergader Almkäse	Karton	3	2015-05-23	31.80
63	Bergader Almkäse	Karton	4.90000000000000036	2015-05-23	55.86
64	Capisan Structure Shampoo	Stk.	1	2015-05-23	39.60
65	Capisan Structure Shampoo	Stk.	0.25	2015-05-23	9.90
66	Capisan Structure Shampoo	Kanister	5	2015-05-23	198.00
53	Kokos Eisknödel	Karton	2.04000000000000004	2015-05-23	17.28
67	Apfel Light Konzentrat	Liter	3	2015-05-06	26.10
68	Eistee Pfirsich Light Konzentrat	Liter	3	2015-05-25	26.10
69	Tomatensuppe	Karton	10	2015-08-20	100.00
70	Birne-Melisse Saft	Liter	10	2015-03-04	130.00
71	Mulitvitamin Light Konzentrat	Liter	3	2015-05-05	26.10
72	Apfel Light Konzentrat	Liter	3	2015-05-06	26.10
73	Eistee Pfirsich Light Konzentrat	Liter	3	2015-05-25	26.10
74	Tomatensuppe	Karton	10	2015-08-20	100.00
75	Birne-Melisse Saft	Liter	10	2015-03-04	130.00
76	Mulitvitamin Light Konzentrat	Liter	3	2015-05-05	26.10
77	Eistee Pfirsich Light Konzentrat	Liter	3	2015-05-25	26.10
78	Birne-Melisse Saft	Kanister	10	2015-03-04	130.00
79	Mulitvitamin Light Konzentrat	Bag-in-Box	3	2015-05-05	26.10
80	Apfel Light Konzentrat	Liter	3	2015-05-06	26.10
81	Tomatensuppe	Karton	10	2015-08-20	100.00
82	Mulitvitamin Light Konzentrat	Bag-in-Box 	3	2015-05-05	26.10
83	Eistee Pfirsich Light Konzentrat	Bag-in-Box	3	2015-05-25	26.10
84	Birne-Melisse Saft	Kanister	10	2015-03-04	130.00
85	Tomatensuppe	Karton	10	2015-08-20	100.00
86	Apfel Light Konzentrat	Bag-in-Box	3	2015-05-06	26.10
87	Tomatensuppe	Karton	10	2015-08-20	100.00
88	Gemüsefond	Flasche	1	2015-03-31	13.90
89	Apfel Light Konzentrat	Bag-in-Box	3	2015-05-06	26.10
90	Mulitvitamin Light Konzentrat	Bag-in-Box 	3	2015-05-05	26.10
91	Eistee Pfirsich Light Konzentrat	Bag-in-Box	3	2015-05-25	26.10
92	Birne-Melisse Saft	Kanister	10	2015-03-04	130.00
93	Brot	kg	1	2015-06-01	3.50
94	Brioche	Stk	0.0800000000000000017	2015-06-01	1.00
95	Brot	kg	1	2015-06-01	3.50
96	Brioche	Stk	0.0800000000000000017	2015-06-01	1.00
97	Milchbrotzöpfe	Stk	0.400000000000000022	2015-06-01	3.90
98	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
100	Brot	kg	1	2015-06-01	3.50
102	Brot	kg	1	2015-06-01	3.50
104	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
105	Brot	kg	1	2015-06-01	3.50
106	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
107	Brot	kg	1	2015-06-01	3.50
109	Milchzopf	Stk.	0.400000000000000022	2015-06-01	3.90
110	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
111	Brot	kg	1	2015-06-01	3.50
112	Gebäck	Karton	3	2015-06-01	12.00
113	Gebäck	kg	1	2015-06-01	4.00
114	Gebäck	kg	1	2015-06-01	4.00
115	Backwaren	kg	1	2015-06-01	4.00
116	Backwaren	kg	1	2015-06-01	4.00
117	Backwaren	kg	1	2015-06-01	4.00
118	Backwaren	kg	1	2015-06-01	4.00
119	Grapefruit Light Konzentrat	Bag-in-Box	3	2015-05-01	26.10
120	Apfel Light Konzentrat	Bag-in-Box	3	2015-05-06	26.10
126	Wurstwaren	kg	1	2015-06-01	40.00
42	Brioche	Stk.	0.0800000000000000017	2015-05-20	1.00
22	Brioche	Stk.	0.0800000000000000017	2015-05-18	1.00
103	Milchzopf	Stk	0.400000000000000022	2015-06-01	3.90
24	Vintschgerl	Stk.	0.0800000000000000017	2015-05-18	0.90
20	Vintschgerl	Stk.	0.0800000000000000017	2015-05-18	0.90
32	Vintschgerl	Stk.	0.0800000000000000017	2015-05-18	0.90
99	Vintschgerl	Stk.	0.0800000000000000017	2015-06-01	0.90
108	Milchzopf	Stk.	0.400000000000000022	2015-06-01	3.90
34	Vintschgerl	Stk.	0.0800000000000000017	2015-05-18	0.90
30	Vintschgerl	Stk.	0.0800000000000000017	2015-05-18	0.90
28	Brioche	Stk.	0.0800000000000000017	2015-05-18	1.00
35	Brioche	Stk.	0.0800000000000000017	2015-05-18	1.00
121	Orange Light Konzentrat	Bag-in-Box	3	2015-05-09	26.10
125	Risotto	Karton	5	2015-02-28	50.00
138	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
139	Brot	kg	1	2015-06-01	3.50
141	Vintschgerl	Stk.	0.0800000000000000017	2015-06-01	0.90
140	Milchzopf	Stk.	0.400000000000000022	2015-06-01	3.90
122	Orange Light Konzentrat	Kanister	3	2015-05-09	26.10
123	Apfel Light Konzentrat	Kanister	3	2015-05-06	26.10
124	Grapefruit Light Konzentrat	Kanister	3	2015-05-01	26.10
131	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
132	Milchzopf	Stk.	0.400000000000000022	2015-06-01	3.90
133	Brot	kg	1	2015-06-01	3.50
134	Vintschgerl	Stk.	0.0800000000000000017	2015-06-01	0.90
135	Backwaren	kg	1	2015-06-01	4.00
136	Backwaren	kg	1	2015-06-01	4.00
143	Brot und Gebäck	kg	1	2015-01-02	4.00
127	Vintschgerl	Stk.	0.0800000000000000017	2015-06-01	0.90
128	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
130	Milchzopf	Stk.	0.400000000000000022	2015-06-01	3.90
137	Backwaren	kg	1	2015-06-01	4.00
142	Backwaren	kg	1	2015-06-01	4.00
144	Brot	kg	1	2015-01-02	3.50
145	Vintschgerl	Stk.	0.0800000000000000017	2015-06-01	0.90
146	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
147	Brot	kg	1	2015-01-09	3.50
148	Rauchkäse	Karton	5.40000000000000036	2015-06-01	37.53
149	Bavaria Blue	Karton	2.5	2015-06-01	22.38
150	Brot und Gebäck	kg	1	2015-06-01	4.00
151	KNORR Rauchwurstknödel	Karton	6	2015-01-31	48.00
152	Salatkräuter	Stk.	0.160000000000000003	2015-02-28	29.90
153	Rinderfond	Flasche	1	2015-02-28	14.90
154	Gewürz Zitrone Pfeffer	Stk.	0.800000000000000044	2015-02-28	12.90
155	Chips	kg	1	2015-06-02	12.00
156	Chips	kg	1	2015-06-02	12.00
157	Brot	kg	1	2015-06-02	4.00
158	Brot	kg	1	2015-06-02	3.50
159	Brioche	Stk.	0.0800000000000000017	2015-06-02	1.00
160	Brot und Gebäck	kg	1	2015-06-02	4.00
161	Gebäck	kg	1	2015-06-02	4.00
162	Brot und Gebäck	Sack	15	2015-06-04	4.00
163	Brot und Gebäck	Karton	15	2015-06-04	20.00
164	Brot und Gebäck	Sack	15	2015-06-04	60.00
165	Brot und Gebäck	Karton	15	2015-06-04	20.00
166	Backwaren	kg	1	2015-06-04	4.00
167	Gebäck	Karton	3	2015-06-04	12.00
168	Brot	kg	1	2015-06-04	4.00
169	Milchbrotzöpfe	Stk	0.400000000000000022	2015-06-04	3.90
170	Brioche	Stk	0.0800000000000000017	2015-06-04	1.00
171	Brioche	Stk.	0.0800000000000000017	2015-06-04	1.00
172	Brot	kg	1	2015-06-04	4.00
173	Milchbrotzöpfe	Stk.	0.400000000000000022	2015-06-04	3.90
174	Vitschgerl	Stk.	0.0800000000000000017	2015-06-04	0.90
175	Brioche	Stk.	0.0800000000000000017	2015-06-04	1.00
176	Brot	kg	1	2015-06-04	3.50
177	Bobby Riegel	Karton	0.959999999999999964	2015-06-04	7.12
178	Bobby Riegel	Karton à 24 Stk.	0.959999999999999964	2015-06-04	7.20
179	Pinz. Bauern-Suppe	Karton	3	2015-06-04	30.00
180	Schoko-Inst. Puddingaufg	Stk.	2.5	2015-06-04	23.25
181	Vanille-Inst. Puddingauf	Stk.	2.5	2015-06-04	23.00
182	Zucchini-Suppe	Karton	3	2015-06-04	30.00
183	Schwarze Johannisbeere Konzentrat	Kanister	10	2015-06-04	128.00
184	BiB Grapefriut Erfrischungsgetränk	Stk.	3	2015-06-04	38.40
185	ACE Mandarin/Karotte	Kanister	10	2015-06-04	120.00
186	Lauch-Creme aufge	Pkg.	3	2015-06-04	29.10
187	Broccoli-Suppe	Karton	34	2015-06-04	340.00
188	Instant-Spargel-Suppe	Karton	2.5	2015-06-04	25.00
189	Knoblauch-Kräuter-Crouton	Stk.	1	2015-06-04	11.50
190	Biarom Paprika Stange	Karton	15.6999999999999993	2015-06-04	202.70
191	Fleischklösschen	Karton	2	2015-06-04	49.78
192	Tee&Frucht Getränkekonzentrat	Stk.	0.5	2015-06-04	6.40
193	PREP PREM Knoblauchöl	Gläser	0.5	2015-06-04	7.89
194	BiB Apfel "Light" Konzentrat	Stk.	3	2015-06-04	26.10
195	Bio Birchermüsli	Karton	6	2015-06-04	41.40
196	Potato Dog	Karton	4.20000000000000018	2015-06-04	23.40
197	Würstl im Röstimantel	Karton	8.09999999999999964	2015-06-04	23.40
198	Caciotta	Karton	5	2015-03-15	34.50
199	Berg-MT RO+HU	Karton	3	2015-03-06	30.00
200	Weichkäse	Karton	3	2015-03-06	31.80
201	Caciotta	Karton	5	2015-03-15	34.50
202	Gemüsewürzer à la minute	Karton	0.599999999999999978	2015-06-04	11.90
203	Fisolensuppe	Karton	3	2015-06-04	36.60
204	BiB Multivitamin "Light" Konzentrat	Stk.	3	2015-06-04	26.10
205	Erdbeer Jogurt-Dessert	Karton	3	2015-06-04	36.60
206	BiB Cranberry Erfrischungsgetränk	Stk.	3	2015-06-04	40.80
207	Multivitamin Erfrischungsgetränk Konzentrat	Kanister	10	2015-06-04	120.00
208	BiB Grapefruit Erfrischungsgetränk	Stk.	3	2015-06-04	38.40
209	Backwaren	kg	1	2015-06-04	4.00
210	Backwaren	kg	1	2015-06-04	4.00
211	Backwaren	kg	1	2015-06-04	4.00
212	Salami / Schinken	kg	1	2015-06-04	40.00
213	Backwaren	kg	1	2015-06-04	4.00
214	Geflügelschinken à 1,5 kg	kg	1	2015-06-04	6.50
215	Diverse Lebensmittel	kg	1	2015-06-10	4.00
216	Capisan Structure Shampoo	Kanister	5	2015-06-10	198.00
217	Mineralwasser ohne Geschmack	Tray a 12 Fl.	6	2015-06-11	5.88
218	Mineralwasser mit Geschmack	Tray a 12 Fl.	9	2015-06-11	14.28
101	Brioche	Stk.	0.0800000000000000017	2015-06-01	1.00
129	Brot	kg	1	2015-06-01	3.50
27	Brioche	Stk.	0.0800000000000000017	2015-05-18	1.00
33	Brioche	Stk.	0.0800000000000000017	2015-05-18	1.00
19	Brioche	Stk.	0.0800000000000000017	2015-05-18	1.00
221	diverse Lebensmittel	kg	1	2015-06-20	4.00
25	Vintschgerl	Stk.	0.0800000000000000017	2015-05-18	0.90
219	Diverse Lebensmittel	kg	1	2015-06-11	4.00
220	Diverse Lebensmittel	kg	1	2015-06-11	4.00
222	Diverse Lebensmittel	kg	1	2015-06-20	4.00
223	Diverse Lebensmittel	kg	1	2015-06-20	4.00
224	Diverse Lebensmittel	kg	1	2015-06-20	4.00
225	Gemüse	kg	1	2015-06-20	2.00
226	Diverse Lebensmittel	kg	1	2015-06-20	4.00
227	Diverse Lebensmittel	kg	1	2015-06-20	4.00
228	Backwaren	kg	0.5	2015-06-20	2.00
229	Brot	kg	1	2015-06-20	3.50
230	Backwaren	kg	1	2015-06-20	4.00
231	Sanitärreiniger	Karton	10	2015-06-20	50.00
232	Schinken	kg	1	2015-06-20	6.50
233	Backwaren	kg	1	2015-06-20	4.00
234	Kirsch Konzentrat	Kanister	10	2015-06-20	120.00
235	Champignon Suppe	kg	3	2015-06-20	30.00
236	Grießflammerie	kg	2.5	2015-06-20	34.75
237	ACE Mandarine Konzentrat	Kanister	10	2015-06-20	120.00
238	Apfel Nektar	Kanister	5	2015-06-20	23.50
239	Grießflammerie	kg	2.5	2015-06-20	34.75
240	Kirsch Konzentrat	Kanister	10	2015-06-20	120.00
241	ACE Mandarine Konzentrat	Kanister	10	2015-06-20	120.00
242	Apfel Nektar	Kanister	5	2015-06-20	23.50
243	Champignon Suppe	kg	1	2015-06-20	10.00
244	Champignon Suppe	kg	1	2015-06-20	10.00
245	Grießflammerie	kg á 2.5	2.5	2015-06-20	34.75
246	ACE Mandarine Konzentrat	Kanister	10	2015-06-20	120.00
247	Kirsch Konzentrat	Kanister	10	2015-06-20	120.00
248	Apfel Nektar	Kanister	5	2015-06-20	23.50
249	ACE Mandarine Konzentrat	Kanister	10	2015-06-20	120.00
250	Kirsch Konzentrat	Kanister	10	2015-06-20	120.00
251	Grießflammerie	Karton	2.5	2015-06-20	34.75
252	Champignon Suppe	kg	1	2015-06-20	10.00
253	Apfel Nektar	Kanister	5	2015-06-20	23.50
254	Gemüse gemischt	kg	1	2015-07-07	2.00
255	Lebensmittel gemischt	kg	1	2015-07-07	4.00
256	Gemüse	kg	1	2015-07-07	2.00
257	Diverse Lebensmittel	kg	1	2015-07-07	4.00
258	Diverse Lebensmittel	kg	1	2015-07-07	4.00
259	Diverse Lebensmittel	kg	1	2015-07-07	4.00
260	Diverse Lebensmittel	kg	1	2015-07-07	4.00
261	Obst und Gemüse	kg	1	2015-07-07	2.00
262	Mineralwasser	Flaschen	1	2015-07-07	0.40
263	Gemüse	kg	1	2015-07-07	2.00
264	Diverse Lebensmittel	kg	1	2015-07-07	4.00
265	Diverse Lebensmittel	kg	1	2015-07-07	4.00
266	Brioche	Stk	0.0800000000000000017	2015-07-15	1.00
267	Vintschgerl	Stk	0.0800000000000000017	2015-07-15	1.00
268	Brot	kg	1	2015-07-15	3.50
269	Knorr Kaiserrösti	Karton	7.20000000000000018	2015-07-24	69.00
270	Knorr Kaiserrösti	Karton	7.20000000000000018	2015-07-24	69.00
271	Knorr Kräuterfrittaten	Karton	3	2015-07-24	18.00
272	Knorr Kaiserrösti	Karton	7.20000000000000018	2015-07-24	69.00
273	Backwaren	kg	1	2015-07-24	4.00
274	Backwaren	kg	1	2015-07-24	4.00
275	Backwaren	kg	1	2015-07-24	4.00
276	Backwaren	kg	1	2015-07-24	4.00
277	Brot	kg	1	2015-07-25	3.50
278	Brioche	Stk	0.0800000000000000017	2015-07-25	1.00
279	Milchzopf	Stk	0.400000000000000022	2015-07-25	3.90
280	Brioche	Stk	0.0800000000000000017	2015-07-25	1.00
281	Milchzopf	Stk	0.400000000000000022	2015-07-25	3.90
282	Brot	kg	1	2015-07-25	3.50
283	Milchzopf	Stk	0.400000000000000022	2015-07-25	3.90
284	Vintschgerl	Stk	0.0800000000000000017	2015-07-25	0.90
285	Brot	kg	1	2015-07-25	3.50
286	Brioche	Stk	0.800000000000000044	2015-07-25	1.00
287	Milchzopf	Stk	0.400000000000000022	2015-07-25	3.90
288	Brot	kg	1	2015-07-25	3.50
289	Milchzopf	Stk	0.400000000000000022	2015-07-25	3.90
290	Brioche	Stk	0.0800000000000000017	2015-07-25	1.00
291	Brot	kg	1	2015-07-25	3.50
292	Brot	kg	1	2015-07-25	3.50
293	Backwaren	kg	1	2015-07-25	4.00
294	Backwaren	kg	1	2015-07-25	4.00
295	Backwaren	kg	1	2015-07-25	4.00
296	Brot	kg	1	2015-07-25	4.00
297	Backwaren	kg	1	2015-07-25	4.00
298	Backwaren	kg	1	2015-07-25	4.00
299	Backwaren	kg	1	2015-07-25	4.00
300	Backwaren	kg	1	2015-07-25	4.00
301	Brot	kg	1	2015-07-30	3.50
302	Brioche	Stk.	0.0800000000000000017	2015-07-30	1.00
303	Brot	kg	1	2015-07-30	3.50
304	Brot	kg	1	2015-07-30	3.50
305	Milchzopf	Stk.	0.400000000000000022	2015-07-30	3.90
306	Brioche	Stk.	0.0800000000000000017	2015-07-30	1.00
307	Brot	kg	1	2015-07-30	3.50
308	Brot und Gebäck	kg	10	2015-07-30	40.00
309	Brot und Gebäck	kg	1	2015-07-30	4.00
310	Brot und Gebäck	kg	1	2015-07-30	4.00
311	Brot und Gebäck	kg	1	2015-07-30	4.00
312	Brioche	Stk.	0.0800000000000000017	2015-07-30	1.00
313	Brot	kg	1	2015-07-30	3.50
314	Vintschgerl	Stk.	0.0800000000000000017	2015-07-30	0.90
315	Milchzöpfe	Stk.	0.400000000000000022	2015-07-30	3.90
316	Brot und Gebäck	kg	1	2015-07-30	4.00
317	Brioche	Stk.	0.0800000000000000017	2015-07-30	1.00
318	Brot	kg	1	2015-07-30	3.50
319	Milchzöpfe	Stk.	0.400000000000000022	2015-07-30	3.90
320	Milchzöpfe	Stk.	0.400000000000000022	2015-07-30	3.90
321	Brioche	Stk.	0.0800000000000000017	2015-07-30	1.00
322	Brot	kg	1	2015-07-30	3.50
323	Backwaren	kg	1	2015-07-30	4.00
324	Brot und Gebäck	kg	1	2015-07-30	4.00
325	Brot und Gebäck	kg	1	2015-07-30	4.00
326	Brot und Gebäck	kg	1	2015-07-30	4.00
327	Wurst in Stangen	kg	1	2015-07-30	10.00
328	Schinken	kg	1	2015-07-30	40.00
329	Tiefkühl-Torten und Eis	kg	1	2015-07-30	10.00
330	Backwaren	kg	1	2015-07-30	4.00
331	Brot und Gebäck	kg	1	2015-07-30	4.00
332	Brot	kg	1	2015-07-30	4.00
333	Tee&Frucht Getränke Konzentrat	Stk.	0.5	2015-09-05	6.40
334	Apfel Erfrischungsgetränk Konzentrat	Kanister	10	2015-09-04	120.00
335	Bio Boillon mit Rindfleisch	Stk.	1	2015-10-27	14.90
336	BIO Holunder-Sirup	BiB	3	2015-09-30	26.25
337	BIO Hühnerboillon	Eimer	4	2015-10-27	59.60
338	Aprikose Joghurt Dessert	Karton	3	2015-10-20	35.70
339	Nektar Johannisbeere	Kanister	5	2015-09-03	28.50
340	Brot	kg	1	2015-08-18	4.00
341	Brot	kg	1	2015-08-18	4.00
342	Brot	kg	1	2015-08-18	4.00
343	Brot	kg	1	2015-08-18	4.00
344	Kartoffelpufferpulver	Säcke	30	2015-08-18	214.80
346	Kartoffelpufferpulver	Säcke	30	2015-08-18	214.80
347	Brot / Gebäck	kg	1	2015-08-18	4.00
348	Backwaren	kg	1	2015-08-18	4.00
349	Milsani Vanille 300g	Karton	3.60000000000000009	2015-09-01	19.00
350	Milsani Classic 300g	Karton	3.60000000000000009	2015-09-01	19.00
351	QimiQ Vanille 250g	Karton	3	2015-09-01	19.00
352	QimiQ Saucenbasis 250g	Karton	3	2015-09-01	19.00
353	QimiQ Classic 250g	Karton	3	2015-09-01	19.00
354	QimiQ Vanille 250g	Karton	3	2015-09-01	19.00
355	QimiQ Classic 250g	Karton	3	2015-09-01	19.00
356	QimiQ Saucenbasis 250g	Karton	3	2015-09-01	19.00
357	Bananen	Karton	25	2015-09-10	25.00
358	Brioche	Stk.	0.0800000000000000017	2015-09-29	1.00
359	Brot	kg	1	2015-09-29	3.50
360	Brot	kg	1	2015-08-25	4.00
361	Backwaren	kg	1	2015-08-27	4.00
362	Brioche	Stk.	0.0800000000000000017	2015-08-28	1.00
363	Brot	kg	1	2015-08-28	3.50
364	Bananenbrei	Karton	5	2015-10-18	29.00
365	BiB Light Konzentrat	Packung	3	2015-10-18	26.10
366	BiB Light Konzentrat	Pkg	3	2015-10-18	26.10
367	Bio Bouillon Rind	Eimer	4	2015-10-21	57.60
368	Bio Saucenbinder hell	Eimer	15	2015-09-01	118.50
369	BiB light Konzentrat	Pkg	3	2015-10-21	26.10
370	Bio Gemüsebrühe	Eimer	4	2015-09-29	55.60
371	Rührei	Dose	0.800000000000000044	2015-10-29	9.52
372	Johannisb Light Konzentrat	Kanister	5	2015-10-09	37.50
373	BiB light Konzentrat	Pkg	3	2015-10-14	26.10
374	Kartoffel-Creme-Suppe	Stk	9	2015-09-19	107.10
375	Bananenbrei	Karton	5	2015-10-18	29.00
376	hallo	kg	1	2015-10-28	0.00
345	Bananenbrei	Pkg.	0.0840000000000000052	2015-08-18	0.60
377	Backwaren	kg	1	\N	4.00
378	Backwaren	kg	1	\N	4.00
379	Backwaren	kg	1	\N	4.00
380	Backwaren	kg	1	\N	4.00
381	Backwaren	kg	1	\N	4.00
382	Backwaren	kg	1	\N	4.00
383	Backwaren	kg	1	\N	4.00
384	Backwaren	kg	1	\N	4.00
385	Backwaren	kg	1	\N	4.00
386	Backwaren	kg	1	\N	4.00
387	Backwaren	kg	1	\N	4.00
388	Gebäck	kg	1	\N	4.00
389	Eisknödel Kokos	Karton	12	\N	17.28
390	diverse Lebensmittel	kg	15	\N	60.00
391	div. Lebensmittel	kg	1	\N	4.00
392	Sport Müsli	Kartons	2.20000000000000018	\N	6.42
393	Weizenkleie	Karton	1.25	\N	7.16
394	Sport Müsli	Kartons	2.20000000000000018	\N	6.42
395	Weizenkleie	Karton	1.25	\N	7.16
396	Brioche	Stk.	0.0800000000000000017	\N	1.00
397	Brot	kg	1	\N	3.50
398	Zopf	Stk.	0.400000000000000022	\N	3.90
399	Brioche	Stk.	0.0800000000000000017	\N	1.00
400	Brot	kg	1	\N	3.50
401	Gebäck	kg	1	\N	4.00
402	Gebäck	kg	1	\N	4.00
403	Gebäck	kg	1	\N	4.00
404	Tiefkühl-Gemüse	kg	1	\N	2.50
405	Sandwiches	Stk.	0.25	\N	3.00
406	Brot	kg	1	\N	3.50
407	Milchzopf	Stk.	0.400000000000000022	\N	3.90
408	Brioche	Stk.	0.0800000000000000017	\N	1.00
409	Brot und Gebäck	kg	1	\N	4.00
410	Brot und Gebäck	kg	1	\N	4.00
411	Milchzöpfe	Stk.	0.400000000000000022	\N	3.90
412	Brot	kg	1	\N	3.50
413	Brioche	Stk.	0.0800000000000000017	\N	1.00
414	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
415	Schokowaffeln	Karton	3.60000000000000009	\N	20.00
416	Vanillewaffeln	Karton	3.60000000000000009	\N	20.00
417	Schokowaffeln	Karton	3.60000000000000009	\N	20.00
418	Vanillewaffeln	Karton	3.60000000000000009	\N	20.00
419	Kartoffelcremesuppe	Pkg.	9	2015-11-26	107.10
420	Kartoffelsuppe	Eimer	2	2015-11-20	37.00
421	Geflügelcremesuppe	Eimer	10	2015-12-17	10.00
422	Birne-Melisse Getränk	Kanister	10	2015-12-16	128.00
423	TP Vanillegeschmack	Eimer	2.29999999999999982	2015-11-25	29.90
424	Puddingcreme	Pkg.	2.5	2016-01-20	22.25
425	Nektar Johannisbeere	Kanister	5	2016-01-29	28.50
426	Nanovo-Eier	Dose	0.5	2016-01-14	0.01
427	Tassenpudding Schoko	Beutel	0.0330000000000000016	2015-12-25	0.59
428	TP Vanillegeschmack	Eimer	2.29999999999999982	2015-11-25	29.90
429	Nanovo-Eier	Dose	0.5	2016-01-14	0.01
430	Kartoffelsuppe	Eimer	2	2015-11-20	37.00
431	Nektar Johannisbeere	Kanister	5	2016-01-29	28.50
432	Kartoffelcremesuppe	Pkg.	9	2015-11-26	107.10
433	Puddingcreme	Pkg.	2.5	2016-01-20	22.25
441	Brioche	Stk.	0.0800000000000000017	\N	1.00
434	Birne-Melisse Getränk	Kanister	10	2015-12-16	128.00
435	Sauce Hollandaise	Beutel	3	2015-12-31	17.70
436	Rindsuppe	Box	25	2016-04-30	316.25
437	Tassenpudding Schoko	Beutel	0.0330000000000000016	2015-12-25	0.59
438	Geflügelcremesuppe	Eimer	10	2015-12-17	10.00
439	Brot	kg	1	\N	4.00
440	Brot	kg	1	\N	4.00
445	Backwaren	kg	1	\N	4.00
446	Brot	kg	1	\N	3.50
447	Brioche	Stk.	0.0800000000000000017	\N	1.00
448	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
442	Zopf	Stk.	0.400000000000000022	\N	3.90
443	Brot	kg	1	\N	3.50
444	Backwaren	kg	1	\N	4.00
449	Sandwiches	Kisten	15	\N	60.00
450	Getränk koffeinfrei IXSO Kids	Dosen	0.25	\N	1.00
451	Getränk koffeinhaltig IXSO	Dosen	0.25	\N	1.00
452	Getränk koffeinhaltig IXSO	Dosen	0.25	\N	1.00
453	Getränk koffeinfrei IXSO Kids	Dosen	0.25	\N	1.00
454	Weizenkleie	Kartons	1.25	\N	9.00
455	Sport Müsli	Kartons	2.25	\N	14.45
456	Almkäse mild	Karton	1	2015-06-25	1.20
457	Backwaren	Karton	3	\N	12.00
458	Brot & Gebäck	kg	1	\N	4.00
459	Brioche	Stk.	0.0800000000000000017	\N	1.00
460	Milchzöpfe	Stk.	0.400000000000000022	\N	3.90
461	Brot	kg	1	\N	3.50
462	Vitschgerl	Stk.	0.0800000000000000017	\N	0.90
463	Brioche	Stk.	0.0800000000000000017	\N	1.00
464	Milchzöpfe	Stk.	0.400000000000000022	\N	3.90
465	Brot	kg	1	\N	3.50
466	TK-Tiramisu	Pkg.	1.10000000000000009	\N	1.20
467	Bio IXSO mit Koffein	Pkg.	6	\N	0.00
468	Bio IXSO Kids ohne Koffein	Pkg.	6	\N	0.00
469	Bio IXSO mit Koffein	Dosen	0.25	\N	1.00
470	Bio IXSO Kids ohne Koffein	Dosen	0.25	\N	1.00
471	Mahlzeiten-Riegel Orange	Karton	1.29000000000000004	\N	0.00
472	Mahlzeiten-Riegel Nougat	Karton	1.29000000000000004	\N	0.00
473	Mahlzeiten-Riegel Orange	Karton	1.29000000000000004	\N	0.00
474	Mahlzeiten-Riegel Nougat	Karton	1.29000000000000004	\N	0.00
475	Mahlzeiten-Riegel Nougat	Karton	1.29000000000000004	\N	0.00
476	Mahlzeiten-Riegel Orange	Karton	1.29000000000000004	\N	0.00
477	Mahlzeiten-Riegel Orange	Karton	1.29000000000000004	\N	0.00
478	Mahlzeiten-Riegel Nougat	Karton	1.29000000000000004	\N	0.00
479	Mahlzeiten-Riegel Nougat	Karton	1.29000000000000004	\N	0.00
480	Mahlzeiten-Riegel Orange	Karton	1.29000000000000004	\N	0.00
481	Mahlzeiten-Riegel Orange	Karton	1.29000000000000004	\N	0.00
482	Mahlzeiten-Riegel Nougat	Karton	1.29000000000000004	\N	0.00
483	Mahlzeiten-Riegel Orange	Karton	1.29000000000000004	\N	37.51
484	Mahlzeiten-Riegel Nougat	Karton	1.29000000000000004	\N	37.51
485	Sauce Hollandaise	Karton	3	2016-01-13	17.70
486	BiB Alpenkräuter Erfrischungsgetränk	Karton	3	2016-01-08	38.40
487	Waldmeister ErfGetr Konzentrat	Karton	0.5	2016-03-10	6.40
488	Pina-Colada Mix	Karton	1	2016-01-01	7.69
489	Apfel ErfGetr Konzentrat	Kanister	10	2016-02-16	120.00
490	Cabanossi	Karton	10	\N	100.00
491	Bavaria Blu	kg	1	\N	6.00
492	Gebäck	kg	1	\N	4.00
493	Gebäck	kg	1	\N	4.00
494	Cabanossi	Karton	1	\N	10.00
495	Cabanossi	Karton	1.19999999999999996	\N	17.99
496	Brot	kg	1	\N	0.00
497	Brot	kg	1	\N	3.50
498	Brot	kg	1	\N	3.50
499	Milchbrotzopf	Stk.	0.400000000000000022	\N	3.90
500	Brot	kg	1	\N	3.50
501	Brioche	Stk.	0.0800000000000000017	\N	1.00
502	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
503	Milchzöpfe	Stk.	0.400000000000000022	\N	3.90
504	Brioche	Stk.	0.0800000000000000017	\N	1.00
505	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
506	Brot	kg	1	\N	3.50
507	Brot	kg	1	\N	3.50
508	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
509	Brioche	Stk.	0.0800000000000000017	\N	1.00
510	Brot & Gebäck	kg	1	\N	4.00
511	Brot & Gebäck	kg	1	\N	4.00
512	Mineralwasser	Tray á 6*0,5l	3	\N	1.80
513	Mineralwasser Apfel	Tray à 6*0,75l	4.5	\N	3.00
514	Mineralwasser Birne	Tray à 6*0,75l	4.5	\N	3.00
515	Speiseeis	kg	1	\N	1.50
516	Brioche	Stk.	0.0800000000000000017	\N	1.00
517	Milchzopf	Stk.	0.400000000000000022	\N	3.90
518	Brot	kg	1	\N	3.50
519	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
520	Toiletteartikel gemischt	Karton	12.5	\N	100.00
521	Brot und Gebäck	Karton	3	\N	10.00
522	Brot und Gebäck	kg	1	\N	4.00
523	Brot	kg	1	\N	3.50
524	Brot	kg	1	\N	3.50
525	Brioche	Stk	0.0800000000000000017	\N	1.00
526	Vintschgerl	Stk	0.0800000000000000017	\N	0.90
527	Brot und Gebäck	kg	1	\N	4.00
528	Brot	kg	1	\N	3.50
529	Wildgewürz	Dosen	0.149999999999999994	\N	6.00
530	Beutelsuppen	Karton	3	\N	30.00
531	Müsli	Karton	6	\N	42.00
532	Klare Steinpilz Gemüsesuppe	Karton	2	2016-01-25	20.00
533	Gemüsemischung Primavera	Karton	2.79999999999999982	2016-01-31	12.00
534	Salafine Cassis Balsamico Dressing	Karton	5	2016-01-25	20.00
535	Geflügel-Currycremesuppe	Dose	1.39999999999999991	2016-01-25	20.00
536	Barbecue Gewürzsalz	Karton	1.19999999999999996	2016-01-25	15.00
537	Schinken	kg	1	\N	10.00
538	Äpfel	kg	1	\N	3.00
539	Molke	kg	0.5	\N	10.00
540	Diverse Lebensmittel (Gemüse, Milch)	kg	1	\N	3.00
541	Brat Grill	Karton	5.23000000000000043	\N	275.62
542	Champion GZ gegrillt	Karton	3.06999999999999984	\N	82.27
543	ZWiebelsauce Pulver	Karton	1.10000000000000009	\N	50.60
544	Brot und Gebäck	kg	1	\N	4.00
545	Milchbrot	Stk	0.400000000000000022	\N	3.90
546	Vintschgerl	Stk	0.0800000000000000017	\N	0.90
547	Brot	kg	1	\N	3.50
548	Brot und Gebäck	kg	1	\N	4.00
\.


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 178
-- Name: article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('article_article_id_seq', 548, true);


--
-- TOC entry 3234 (class 0 OID 420559)
-- Dependencies: 184
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY category (category_id, category, description) FROM stdin;
5	Essensausgabe: Direkt	Organisation verteilt die Produkte wie eingetroffen, ohne weitere Verarbeitung
3	Essensausgabe: Frühstück	Organisation verteilt Frühstück
4	Essensausgabe: Warm	Organisation verteilt warme Speisen
7	Aufbewahrung: Kühlraum	Organisation verfügt über einen oder mehrere Kühlräume
6	Aufbewahrung: Kühlschrank	Organisation verfügt über einen oder mehrere Kühlschränke
8	Aufbewahrung: Tiefkühlgerät	Organisation verfügt über ein oder mehrere Tiefkühlschränke und/oder-truhen gleichwertige Geräte
9	Aufbewahrung: Tiefkühlraum	Organisation verfügt über ein Tiefkühlraum
10	Aufbewahrung: Keller	Organisation verfügt über Kellerräumlichkeiten
\.


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 185
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_category_id_seq', 10, true);


--
-- TOC entry 3236 (class 0 OID 420567)
-- Dependencies: 186
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: -
--

COPY city (city_id, zip, city) FROM stdin;
2	1060	Wien
3	5303	Thalgau
4	5152	Michaelbeuern
5	5112	Lamprechtshausen
6	5084	Großgmain
7	5202	Neumarkt a.W.
8	5424	Bad Vigaun
9	3400	Klosterneuburg
10	5201	Seekirchen
11	5412	Puch
12	1030	Wien
13	5110	Oberndorf
14	4020	Linz
15	5163	Mattsee
16	5141	Moosdorf
17	5202	Neumarkt a. Wallersee
18	5026	Salzburg
19	5700	Zell am See
20	5412	Puch bei Hallein
21	5110	Oberndorf/Salzburg
22	83454	ANGER/AUFHAM
23	5102	Würzenberg
24	83395	FREILASSING
25	5342	Abersee
26	5023	Guggenthal
27	5162	Obertrum am See
28	5023	Salzburg
29	5423	St.Koloman
30	5151	Nußdorf am Haunsberg
31	5400	Hallein
32	5101	Bergheim
33	5771	Leogang
34	5322	Hof b. Sbg.
35	5622	Goldegg
36	1040	Wien
37	5090	Lofer
38	5131	Franking
39	5300	Hallwang
40	83404	AINRING
41	5324	Faistenau
42	5020	Salzburg
43	5531	Eben im Pongau
44	5102	Anthering
45	5412	Puch bei Salzburg
46	5202	Neumarkt am Wallersee
47	5061	Elsbethen
48	5310	Mondsee
49	5072	Siezenheim
50	5025	Salzburg
51	5204	Straßwalchen
52	5111	Bürmoos
53	5071	Wals-Siezenheim
54	5071	Wals
55	5431	Kuchl
56	5082	Grödig
57	5081	Anif
58	5301	Eugendorf
59	5204	Strasswalchen
60	5452	Pfarrwerfen
61	5162	Obertrum
62	5024	Salzburg
63	5201	Seekirchen am Wallersee
64	5302	Henndorf
65	5411	Oberalm
66	4040	Linz
67	5600	St. Johann im Pongau
68	4600	Wels
69	83435	BAD REICHENHALL
70	5441	Abtenau
71	5073	Wals
72	5340	St. Gilgen
73	5111	 Bürmoos
74	83329	Waging am See
75	5071	Wals/Salzburg
76	5121	Ostermiething
77	1070	Wien
78	5203	Köstendorf
79	5073	Wals Himmelreich
80	5142	Eggelsberg
81	83410	LAUFEN
82	5330	Fuschl am See
83	8401	Kalsdorf
84	4810	Gmunden
85	5033	Salzburg
86	83471	SCHÖNAU AM KÖNIGSEE
87	1110	Wien
88	8304	Wallisellen-Zürich
89	83317	TEISENDORF
90	5017	Salzburg
91	5027	Salzburg
92	5161	Elixhausen/Salzburg
93	1190	Wien
94	5028	Salzburg
95	5322	Hof bei Salzburg
96	5022	Salzburg
97	83451	PIDING
98	1023	Wien
99	83278	TRAUNSTEIN
100	4770	Andorf
101	5010	Salzburg
102	5440	Golling
103	83365	AIGING
104	4800	Attnang-Puchheim
105	5091	Unken
106	0000	Test-Ort
107		Linz
108	5721	Piesendorf
109	83451	Pidinf
110	83451	Piding
111	72766	REUTLINGEN
112	50677	KÖLN
113	5412	Puch/Salzburg
114	1020	Wien
115	5020	
116	1010	Wien
117	5083	Grödig
118	1045	Wien
119	5300	Hallwang/Mayrwies
120	5760	Saalfelden
121	5020 	Salzburg
122	5300	Esch
123	5161	Elixhausen
124	5083	Gartenau
125		Sambateni, Arad
126	5300	Hallwang Esch
127	5083	St. Leonhard
128	5151	Nussdorf
129	5110 	Oberndorf bei Salzburg
130	5110	Oberndorf bei Salzburg
131	83435	Bad Reichenhall
132	6971	Hard
\.


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 187
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('city_city_id_seq', 132, true);


--
-- TOC entry 3238 (class 0 OID 420572)
-- Dependencies: 188
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country (country_id, country) FROM stdin;
2	Österreich
3	DEUTSCHLAND
4	SCHWEIZ
5	Test-Land
6	Österrreich
7	Deutschland
8	Salzburg
9	Rumänien
\.


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 189
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_country_id_seq', 9, true);


--
-- TOC entry 3240 (class 0 OID 420577)
-- Dependencies: 190
-- Data for Name: delivery_list; Type: TABLE DATA; Schema: public; Owner: -
--

COPY delivery_list (delivery_list_id, person_id, name, date, comment, driver, passenger, update_timestamp, archived) FROM stdin;
\.


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 191
-- Name: delivery_list_delivery_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('delivery_list_delivery_list_id_seq', 6, true);


--
-- TOC entry 3242 (class 0 OID 420587)
-- Dependencies: 192
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email (email_id, person_id, type_id, email) FROM stdin;
495	6	11	salzburg@franziskaner.at
7	15	11	gemeinde@strasswalchen.at
8	17	10	anna.aminger@gmx.at
10	19	11	info@gartechnik-anner.com
547	617	11	bachleitner@sbg-bauernbund.at
13	24	10	christian.atanassoff@gmx.at
14	27	10	h.badzong@gmx.at
496	641	11	h_oszvald@at.ibm.com
16	30	11	office@bauer-thuerridl.at
17	32	11	heimleitung@Lbsh-walserfeld.at
18	33	11	cc-salzburg@pfeiffer.at
21	35	10	ludwig.bayer@gmx.com
23	39	11	wolfgang.bell@miele.at
24	41	11	stephan.berger@quehenberger.com
25	43	11	kueche@lfs-Klessheim.at
27	46	11	fluechtlingshaus@caritas-salzburg.at
28	47	10	roland.bieber@cebs.at
29	49	11	franz.bliem@landleben.at
30	50	11	rosalinde.bonecker@kps.kirchen.net
31	51	10	brigitte.d@sbg.at
32	53	10	johannes.brandl@sbg.ac.at
33	57	11	ah-kueche@wals-siezenheim.at
35	62	11	brigitte.buchacher@laube.at
36	67	10	vitaveda@t-online.de
38	70	11	daniel.chladek@credit-suisse.com
39	71	11	office@verein-viele.at
40	72	11	bernhard.denk@daimlerchrysler.com
41	73	10	brigitte.derkits@aon.at
42	75	10	g.derler@wasi.tv
43	76	10	K.Descho@gmx.at
44	78	11	daniel.dinter@seekirchen.at
45	80	10	johannes.ditz@wwv.at
46	81	10	ingrid.doblinger@a1.net
47	83	10	arthur.domig@isbb.at
48	84	11	office@salzburg-patisserie.at
49	85	10	cd@dreyer.at
50	86	10	wolfgang.duernberger@lk-salzburg.at
51	87	11	office@swh-strasswalchen.at
53	94	10	johanna.ebner@fcg-buermoos.at
54	96	11	BueroFDHAL@rewe-group.at
55	99	11	seniorenheim@bergheim.at
58	102	11	manfred.ellmer@groedig.at
59	103	11	abtei@abtei-michaelbeuern.at
60	104	10	lucia.erlbacher@gmail.com
61	105	10	erlbacher.lorenz@gmail.com
62	109	11	maria.fally@stiegl.at
63	110	11	verwaltung.haus-maria@gemgilgen.at
64	111	11	heimleitung@Lbsh-obertrum.at
65	112	11	info@feichtinger.com
66	116	11	friederike.flesch@ka.kirchen.net
67	117	10	resi.fletschberger@aon.at
72	126	10	sr.gerlinde@speed.at
73	127	11	doris.fuschlberger@salzburg.gv.at
74	128	11	office@gallbauer.at
75	132	11	gastager@swh-hof.at
76	136	10	thomas@geierspichler.com
77	137	11	annemarie.geierstanger@bergader.de
78	138	11	info@geisslercosmetics.at
79	139	11	ws-steindorf@lebenshilfe-salzburg.at
80	140	10	g.giesswein@a1.net
81	141	11	silvia@gmachl.at
82	143	10	geli.goller@sbg.at
83	144	11	goellner@geislinger.com
85	146	11	antonia.goetzendorfer@salzburg.gv.at
91	150	11	grasser@innovationswerkstatt.at
92	151	11	e.grasshof@salzburger.hilfswerk.at
93	153	11	gemeinde@thalgau.at
94	155	11	johann.griessner@lamprechtshausen.at
95	156	11	wh-gruberstrasse@lebenshilfe-salzburg.at
96	157	10	davidgross84@yahoo.de
97	158	11	groetzinger@evangelischeallianz.at
98	159	11	salzburg@bastians-baecker.at
99	161	10	john.grubinger@sol.at
101	167	11	d.gutschi@salzburger.hilfswerk.at
104	170	11	exit7@caritas-salzburg.at
105	171	11	ah-kueche@wals-siezenheim.at
106	172	11	christine@glaseritalia.com
107	174	11	office@qimiq.com
108	176	11	info@haltrich-immobilien.at
109	177	11	esther.handschin@emk.at
110	178	11	kanzlei@hanifle.at
111	181	11	rudolf.harner@sos-kinderdorf.at
112	183	11	salzburg@schenker.at
570	615	10	togi@gmx.at
115	189	11	office@essen-und-leben.at
116	190	10	reiniphysio@aon.at
117	191	10	tafel.reichenhall@mail-buero.de
118	192	11	Hemetsberger@oevp-sbg.at
119	194	11	kueche@rettet-das-kind-sbg.at
120	195	11	gabriele.hemetsberger@seekirchen.at
121	193	11	gemeinde@groedig.at
123	197	11	office@anderskompetent.at
124	199	11	swh-koestendorf@sbg.at
571	397	10	m.pointner@espara.com
572	430	10	sabrina.reiter@gmx.at
582	246	10	minni.karres@yahoo.com
583	18	10	ruth.amon@gmx.at
584	441	10	beggner@yahoo.com
585	441	11	b.ricciotti@view-salzburg.at
586	44	10	anita.bernhofer@sol.at
587	44	10	anita.bernhofer@sol.at
591	654	10	thomas.klein@wild-sau.com
125	200	10	stefanie-marie.herzog@aon.at
126	202	10	huizei@sbg.at
127	203	10	hinterhauser@dorfbeuern.salzburg.at
128	208	10	hhitsch@gmx.at
129	209	10	fmhofbauer@yahoo.de
130	211	10	hof.cat@utanet.at
131	213	11	hofinger@ora-international.at
132	213	11	ora@ora-international.at
133	214	11	Schwesterrita@Halleiner-Schwestern.net
134	215	10	g.hoelscher@aon.at
135	215	10	ginandtonic@aon.at
136	216	10	g.hoelscher@aon.at
137	216	10	ginandtonic@aon.at
138	219	11	kueche@sz-fre.awo-obb.de
139	222	11	fluechtlingshaus@caritas-salzburg.at
141	223	11	bernd.hoertnagl@sfvertrieb.at
142	225	10	huberjohanna@gmx.net
143	226	10	sv-huber@sbg.at
145	227	11	a.huber@salzburg.gv.at
146	228	10	wolfgang.huebl@aon.at
147	229	10	johannes.hubmann@reflex.at
148	230	11	kueche.sh.golling@salzburg.at
151	235	10	simon.illmer@salzburg.gv.at
154	240	10	jungedwin@fcgoe.at
155	242	10	schafrj@aon.at
156	244	11	Trude.Kaindl-Hoenig@salzburg.com
157	245	11	office@awh-eugendorf.at
502	633	11	beranek@oekosozial.at 
160	251	11	infra.at@poyry.com
164	255	11	martin.kipman@neustart.at
165	257	11	kirchgatterer@swh.kh.abtenau.at
166	258	11	e.kislinger@stahlbau.at
167	260	11	sklabuschnig@winklhof.at
168	261	10	Hannes.Kletzl@gmx.net
169	262	10	w.klima@sbg.at
170	263	11	kindergarten@lebenshilfe-salzburg.at
171	266	10	ikohl@inode.at
172	268	10	helmut@koellensperger.at
174	270	10	reinhold.kolm@gmx.at
175	271	11	brigitte@baeckerei-schmidhuber.at
176	272	10	hermi.koenig@yahoo.de
177	273	11	g.konklewski@salzburger.hilfswerk.at
178	274	11	Alexander.Koppensteiner@reckittbenckiser.com
180	277	11	hausmirjam@aon.at
181	278	11	gemeinde@strasswalchen.at
182	279	11	ulrike.krempler@credit-suisse.com
183	281	11	juergen.kreuzsaler@quehenberger.com
184	282	11	alexander.kribus@at.ibm.com
185	285	11	gertraud.kronberger@laube.at
186	286	11	winter.nost@caritas-salzburg.at
187	287	10	l.laimboeck@sbg.at
189	290	10	petra.landschuetzer@nuernberger.at
190	291	11	a.landsteiner@donauversicherung.at
191	292	10	Erika.Lange@aon.at
192	293	11	ruth.langer@sportimpuls.at
193	295	11	mlaserer@wks.at
194	296	11	lebesmühlbacher@christlichefamilie.at
195	296	11	seelsorge.altenheime@pfarre.kirchen.net
196	297	10	inge.lederer@aon.at
197	300	10	Gertraud.Leimueller@gmx.net
198	301	11	qm@feinkost-leitinger.at
199	302	10	h.leitner@hcm.at
200	303	11	klaus.leitner@metro.at
201	304	11	office@qimiq.com
202	305	11	johannes.brandl@sbg.ac.at
203	306	10	danielalinke@hotmail.com
204	307	10	lixl.hubert@tele2.at
205	309	11	janos.lobos@innocentdrinks.de
207	311	11	office@lorentschitsch.at
208	312	11	bettina.lotterhos@wiberg.eu
209	313	11	office@verein-viele.at
210	315	11	bruno.prantl@zell-net.at
211	316	11	sh-hellbrunn@stadt-salzburg.at
212	317	11	info@wiff-essen.at
213	318	11	buergermeister@wals-siezenheim.at
215	321	11	martin.mallinger@hipp.de
216	322	11	r.maly@panundco.com
217	323	11	office@clearwhite.com
218	324	11	e.mang@salzburg.co.at
219	326	11	Maria.Marx@neustart.at
223	334	11	roland.mayrhofer@biofit.at
224	335	11	seniorenwohnhaus@neumarkt.at
225	335	11	mayrhofer@neumarkt.at
226	336	11	martin.melzer@miele.at
512	549	10	tina.tscherteu@sbg.at
228	339	11	office@salzburg-patisserie.at
229	340	11	herwig.mikutta@salzburgerlandwirtschaft.at
230	341	11	Mitgutsch@oevp-sbg.at
231	343	10	h.moedlhammer@sbg.at
232	344	11	office@drink-green.com
235	346	11	kurt.molterer@nuernberger.at
237	348	11	sr.erika@bhs-sbg.at
238	349	11	johann.moesl@gittis.at
239	350	11	info@ncm.at
240	351	11	alois.navara@zobl-bauer.at
241	352	10	nechys@utanet.at
242	353	10	nechys@utanet.at
243	354	11	stefanie.neubauer@gittis.at
244	356	11	neuhofer@oevp-sbg.at
245	358	10	christl@neurauter.at
247	360	11	haus-maria@salzburg.co.at
248	360	11	verwaltung.haus-maria@gemgilgen.at
249	362	11	neuland.salzburg@promenteplus.at
514	546	10	tomfe54@gmx.at
515	642	10	lisa_traubenek@yahoo.de
516	100	11	oskar.einzinger@view-salzburg.at
588	149	11	christa.graf@view-salzburg.at
589	149	11	christa.graf@leube.at
251	364	11	wh-gruberstrasse@lebenshilfe-salzburg.at
252	365	10	brigitte.nussdorfer@hotmail.com
253	368	10	w.oetzlinger@t-online.de
254	369	11	vs-hallein-burgfried@salzburg.at
256	373	10	wilhelm.ortmayr@aon.at
257	375	10	gudrun@ostermayer.at
258	376	11	rudolf.ott@lbsheim-hallein.salzburg.at
259	379	11	b.pallauf@pms-law.at
260	379	11	brigitta.pallauf@salzburg.gv.at
261	381	11	daniel.paris@spedition-eberl.de
262	383	11	sabine.paulitsch@sos-kinderdorf.at
263	384	11	c.petschl@salzburger.hilfswerk.at
264	385	10	e.petzelsberger@gmx.at
265	389	10	i_pfingstl@hotmail.com
266	390	11	tpichler@lp-logistik.at
267	391	10	pichlmaiers@aon.at
268	392	11	office@pieper-biokosmetik.at
269	393	10	g.pirchner@aon.at
270	395	10	kraller@xp8.de
271	396	11	g.pockenauer@gramiller.at
273	399	10	karin.pokorny@live.at
274	401	11	office@schoko.at
275	402	10	johann.pongruber@sbg.at
276	405	10	bruno.prantl@zell-net.at
277	407	11	susanne.prieth@sos-kinderdorf.at
278	408	10	paluzza@ymail.com
279	409	11	rebecca.promersberger@spitz.at
280	410	11	pruegger@oberndorf.salzburg.at
281	412	10	m.pum@aon.at
282	413	11	h.purgstaller@salzburger.hilfswerk.at
283	414	11	direktion@inselsalzburg.at
285	416	11	b.radwanovsky@salzburger.hilfswerk.at
286	417	11	office@salzburg-patisserie.at
287	419	11	office@verein-viele.at
288	424	10	ra.reichl@inode.at
289	426	11	wolfgang.reiger@ifm.ac
290	427	11	n.reinhardt@gourmet-express.at
291	428	10	reinthalerg@gmx.at
292	429	10	ludwig.reisinger@gmx.at
295	435	10	roswitha.resch@gmx.at
296	437	11	k.resl@donauversicherung.at
297	439	11	gottfried.rettenegger@lk-salzburg.at
298	440	10	revertera@gmx.at
301	442	11	F.Riedl@Wirtschaftsbund-Sbg.at
302	443	11	kueche@rettet-das-kind-sbg.at
303	444	11	riesner@neumarkt.at
306	447	11	office@schoko.at
307	448	11	h.roither@palfinger.com
308	449	10	rcm47@aon.at
309	450	11	madeleine.rosenlechner@qimiq.com
310	453	10	r.sachsenhofer@aon.at
311	458	11	peter.schafleitner@gw-wordl.com
312	459	11	johann@schallmoser-fleisch.at
313	462	10	scheliessnig@gmx.at
314	463	11	michaela.scheliessnig@salzburg.com
315	464	11	claudia.scheucher@stiegl.at
316	466	11	franz.schindecker@zaltech.com
317	467	11	schinwald@poelzleitner.at
318	470	11	Andrea.Schmid@caritas-salzburg.at
319	473	11	kueche@pwlh.de
320	474	10	felicitas.schneider@boku.ac.at
321	478	11	josef.schoechl@salzburg.gv.at
322	480	11	Renate.Schoenmayr@sbg.ac.at
324	483	11	Alexander.Schrank@stadt-salzburg.at
325	484	10	Kaspanien@hotmail.com
326	485	10	elisabeth.schreiner@tele2.at
327	486	11	I.Schulte@iv-net.at
328	487	10	piti.schuster@a1.net
329	490	10	wolfgangschwaiger@gmx.at
330	488	11	buergermeisterin@seekirchen.at
331	489	11	schwaiger@salzburg.gv.at
332	492	11	Guenter.Schwaighofer@oelz.com
333	493	11	schwap.f@milch.com
334	495	11	h.schwarz@gourmet-express.at
335	498	11	clemens.sedmak@sbg.ac.at
336	500	11	g.signitzer@sbw.salzburg.at
337	501	11	terminal@trafico.at
339	503	11	erwin.simmer@stadt-salzburg.at
340	504	10	biggrisi@gmail.com
342	506	10	maria.slowak@sbg.at
343	507	11	manuela.sokolt@unilever.com
344	508	11	heidemarie.spannlang@stadt-salzburg.at
345	510	11	bernhard.spiegel@sos-kinderdorf.at
346	514	11	exit7@caritas-salzburg.at
347	515	11	stampfer@oevp-sbg.at
353	525	10	ek.stoellinger@gmx.at
354	526	10	ek.stoellinger@gmx.at
355	528	11	johann.strasser@gem-eugendorf.at
357	529	10	r.strehl@tele2.at
358	530	11	kindergarten@lebenshilfe-salzburg.at
359	531	11	c.struber@salzburg-wohnbau.at
360	532	11	kueche@kolpinghaus-salzburg.at
361	534	11	clearing-house.salzburg@sos-kinderdorf.at
362	535	11	neuland.salzburg@promenteplus.at
363	536	11	office@swh-strasswalchen.at
364	537	11	immo@immobilien-teichmann.at
365	539	11	gabriele.teufl@salzburg.gv.at
366	540	11	office@frauenhaus-salzburg.at
367	541	10	monika.thonhofer@sbg.at
368	542	11	t.thoeny@salzburger.hilfswerk.at
369	545	11	pv-laufen@erzbistum-muenchen.de
579	93	11	ingrid.ebner@caritas-salzburg.at
371	548	11	c.trausnitz@adhurricane.com
373	550	10	rturbinsky@aon.at
374	551	10	udvarhel@gmail.com
375	552	10	m.ullmann@yahoo.com
376	553	10	alfred.unterberger@salzburg.at
377	554	11	familienbuero@strasswalchen.at
378	554	10	leo.kirchtag@gmx.at
379	557	10	andrea.waldmann@gmail.com
381	560	11	buergermeister@obertrum.at
382	559	11	daniela.wallner@lk-salzburg.at
383	561	10	salzburg@jufa.eu
384	563	11	ch.wawra@adhurricane.com
386	567	10	weber_franz@hotmail.com
387	565	10	weber@weber-weisang.at
388	568	11	seniorenheim@bergheim.at
389	569	11	direktion@inselsalzburg.at
390	570	11	Werner.Weinguny@quehenberger.com
391	572	10	eva.weissenbacher@utanet.at
393	575	10	iwerdenich@gmx.at
394	577	11	adelheid.widmoser@lk-salzburg.at
395	582	10	armin.wieser@sbg.at
397	581	10	david_wieser1@hotmail.com
398	583	11	franz.wieser@salzburg.gv.at
399	584	10	gudrun.wilhelm@gmx.at
400	585	11	office@volkshilfe-salzburg.at
402	589	11	info@wiberg.eu
403	591	10	Elisabeth.Wittich@inode.at
404	592	11	alois.wittinghofer@generali.at
405	594	11	qm@feinkost-leitinger.at
563	221	11	hoerl@grossglockner.at
408	267	10	veronika.kois@hotmail.com
411	604	10	testUser@test.test
413	1	10	mschnoell@gmx.net
414	605	11	test.persona@view-salzburg.at
415	605	10	test.persona@gmail.at
418	248	10	oskar.kaufmann@fcgoe.at
419	606	11	manfred.kiesenhofer@sozialmarkt.at
420	607	10	tina.widmann@gmail.com
421	608	10	wimmer.erika@t-online.de
423	21	10	kraller@xp8.de
422	21	11	teisendorfer-tafel@t-online.de
425	232	10	fr.hurch@aon.at
427	609	11	PE@gittis.at
566	120	10	claudia.frauenschuh@hotmail.com
432	119	10	anna.fratt@aon.at
433	185	11	greta.hauswiesner@view-salzburg.at
434	185	10	grete.hauswiesner@hotmail.com
567	121	10	frauenschuh@hotmail.com
437	611	11	j.weisser@commend.com
438	371	11	presse@dm-drogeriemarkt.at 
439	168	11	gemeinde@lamprechtshausen.at
440	612	10	manuela.spiessberger@heffterhof.at
442	22	10	ilse.asen@sbg.at
443	69	10	v.canaval@aon.at
517	100	10	einzinger.sbg@aon.at
445	145	10	richard.goelzner@aon.at
446	184	10	w.haslauer.priv@hotmail.com
447	196	10	mediaconsulting@a1.net
520	238	10	b.januschewsky@gmx.at
449	224	11	nicole.huber@punktlandung-kommunikation.com
521	238	11	baerbel.januschewsky@view-salzburg.at
451	269	10	reiter.maria@a1.net
452	333	10	sabine@mayrhofer.cc
453	347	11	mooshammer@intercargo.at
454	337	11	eva.mentl@stud.sbg.ac.at
455	359	10	michael.neureiter@salzburg.at
523	616	10	p.nussbaum@aon.at
456	363	10	niese@gmx.at
458	415	11	h.rabl@salzburgfestival.at
459	432	10	reiter.maria@a1.net
460	481	10	eduard.schoepfer@gmx.at
461	502	11	angela.simmel@rvs.at
464	517	10	annamaria.steiner@sol.at
467	580	11	office@absa.at
468	125	11	vfvoffice@web.de
469	11	11	hram@pokrovsbg.ru
471	289	10	luise.petry@freenet.de
472	619	11	sletsch@bonduelle.com
473	620	11	lrepplinger@bonduelle.com
475	621	11	r.schmidpeter@cbs.de
476	622	11	scheliessnig@desktopmedia.at
477	623	10	spitaler@werbenetzwerk.at
478	625	11	sandra.lagler@fh-salzburg.ac.at
479	626	11	roland.lochmann@gw-world.com
480	595	11	kueche@ursprung.lebensministerium.at
481	629	11	a.van-hametner@iv-net.at
482	630	11	m.wautischer@iv-net.at
483	59	11	goldenstein@salzburg.at
484	8	11	goldenstein@salzburg.at
486	632	10	josef.putz@lk-salzburg.at 
489	28	10	baier.elfi@aon.at
490	587	11	elisabethallein@gmx.at
491	637	11	bernadette.hawel@wko.at
492	638	11	DStojakovic@werner-mertz.com
493	640	11	bernd.huber@stadt-salzburg.at
494	233	11	andrea.huttegger@kommunikation.kirchen.net
528	55	10	info@so-phi
529	648	11	kurt.schiechl@lebenshilfe-salzburg.at
531	650	11	Petra.Ummenberger@miele.at
532	169	11	fluechtlingshaus@caritas-salzburg.at
533	445	11	walter.riezinger@view-salzburg.at
554	147	11	stiftsbaeckerei@aon.at
553	147	10	franz.grabmer@aon.at
555	651	10	bernhard.rosegger@aon.at
537	165	10	irmin.gundl@aon.at
557	505	10	srjoanellasix@yahoo.de
558	564	11	wawra@adhurricane.com
544	148	11	marijana.grabovac@stud.sbg.ac.at
545	310	11	bl@lorentschitsch.at
562	652	10	drhleube@gmx.net
594	252	11	doris.kiefel@view-salzburg.at
593	252	11	info@view-salzburg.at
595	649	10	leonhard.schitter@sbg.at
598	88	10	franz.dusch@wasi.tv
599	655	10	rudolf@zrost.eu
600	656	10	safu1608@gmail.com
601	656	10	sabine.fuessl@view-salzburg.at
602	519	10	michael@steingassner.net
603	519	11	michael.steingassner@view-salzburg.at
604	658	11	e.frauscher@gourmet-express.at
605	659	11	unikum@jufa.eu
606	660	11	sabine@mayrhofer.cc
607	446	10	conny_robl@yahoo.de
609	330	10	elke.mayer@newsclub.at
616	661	10	eh.thaler@aon.at
617	558	10	t.wallerstorfer@gmail.com
618	643	10	hugorohner@hotmail.com
619	643	11	Hugo.Rohner@skidata.com
620	602	10	sabine.zoepfl@gmx.at
621	647	11	brigitta.pallauf@salzburg.gv.at
622	36	10	regina.bayer-volkmann@pappas.at
623	36	10	
625	319	11	petra.knoll@kaesehof.at
626	574	10	ulrike.wenzlhuemer@gmx.at
627	574	11	ulrike.wenzlhuemer@view-salzburg.at
629	34	10	wolfbaur@gmx.at
630	34	11	wolf.baur@view-salzburg.at
634	253	10	albert.kiefel@gmail.com
633	253	11	albert.kiefel@view-salzburg.at
636	345	10	moldovandoina@gmail.com
635	345	11	doina.moldovan@view-salzburg.at
638	644	10	alois.schwaiger@aon.at
640	665	10	ebner_mario@hotmail.com
\.


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 193
-- Name: email_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_email_id_seq', 640, true);


--
-- TOC entry 3232 (class 0 OID 420541)
-- Dependencies: 179
-- Data for Name: incoming_article; Type: TABLE DATA; Schema: public; Owner: -
--

COPY incoming_article (incoming_article_id, incoming_delivery_id, article_id, article_nr, numberpu) FROM stdin;
134	47	135	0	6
135	48	136	0	10
136	49	137	0	5
137	50	138	1	32
138	50	139	0	40
139	50	140	2	6
140	50	141	3	50
141	51	142	0	5
142	52	143	0	15
143	53	144	0	22
144	54	145	1	24
145	54	146	2	31
146	54	147	0	22
147	55	148	0	15
148	55	149	1	32
149	56	150	0	10
150	57	151	0	41
151	58	152	1	20
152	58	153	2	92
153	58	154	0	17
155	59	156	0	10
156	60	157	0	6
157	61	158	0	30
158	61	159	1	10
159	62	160	0	15
160	63	161	0	9
37	11	38	0	4
163	64	164	0	1
164	65	165	0	3
165	66	166	0	5
166	67	167	0	2
45	14	46	0	18
46	15	47	2	15
47	15	48	1	20
48	15	49	0	30
49	16	50	2	14
50	16	51	0	30
51	16	52	1	20
52	17	53	0	126
54	19	55	0	15
55	20	56	0	3
56	21	57	1	150
57	21	58	0	180
59	23	60	0	10
60	24	61	0	94
61	25	62	1	73
62	25	63	0	207
63	26	64	1	11
64	26	65	0	60
65	26	66	2	2
170	68	171	2	6
171	68	172	0	30
172	68	173	1	2
173	69	174	2	30
174	69	175	1	20
175	69	176	0	20
177	70	178	0	53
178	71	179	9	1
179	71	180	2	16
180	71	181	3	4
181	71	182	10	1
182	71	183	6	1
183	71	184	4	90
184	71	185	5	1
185	71	186	0	8
186	71	187	7	1
187	71	188	8	1
188	71	189	1	61
87	27	88	5	83
88	27	89	4	4
89	27	90	2	1
90	27	91	3	2
91	27	92	1	1
92	28	93	0	30
93	28	94	1	28
94	29	95	0	21
95	30	96	0	45
96	30	97	1	4
97	31	98	1	31
98	31	99	2	10
99	31	100	0	20
100	32	101	0	46
101	32	102	1	2
102	33	103	2	1
103	33	104	1	35
104	33	105	0	32
105	34	106	1	24
106	34	107	0	40
107	34	108	2	5
108	35	109	2	1
109	35	110	1	8
110	35	111	0	10
111	36	112	0	5
112	37	113	0	8
113	38	114	0	8
114	39	115	0	12
115	40	116	0	9
116	41	117	0	12
117	42	118	0	8
189	72	190	0	70
190	73	191	0	1
191	73	192	1	9
121	43	122	0	40
122	43	123	2	4
123	43	124	1	20
124	44	125	0	162
125	45	126	0	37
192	73	193	2	9
193	73	194	3	7
194	74	195	0	35
195	75	196	1	60
130	46	131	0	27
131	46	132	2	3
132	46	133	3	34
133	46	134	1	32
196	75	197	0	93
199	76	200	1	47
200	76	201	0	7
201	77	202	1	6
202	77	203	0	3
203	77	204	6	11
204	77	205	2	1
205	77	206	4	23
206	77	207	5	2
207	77	208	3	14
209	78	210	0	10
211	80	212	0	39
212	79	213	0	8
213	81	214	0	30
214	82	215	0	50
215	83	216	0	3
216	84	217	1	244
217	84	218	0	443
218	85	219	0	80
219	86	220	0	15
220	87	221	0	25
221	88	222	0	20
222	89	223	0	50
223	90	224	0	30
224	91	225	1	10
225	91	226	0	10
226	92	227	0	12
227	93	228	0	1
228	94	229	0	40
229	95	230	0	20
230	96	231	0	18
231	97	232	0	35
232	98	233	0	8
248	99	249	1	3
249	99	250	0	8
250	99	251	4	5
251	99	252	3	3
252	99	253	2	14
255	100	256	1	10
256	100	257	0	40
257	101	258	0	20
258	102	259	0	20
259	103	260	0	10
260	103	261	1	10
261	103	262	2	12
262	104	263	0	15
263	105	264	0	10
264	106	265	0	16
268	108	269	0	60
270	109	271	1	1
271	109	272	0	170
273	110	274	0	6
274	111	275	0	9
275	112	276	0	9
276	113	277	0	20
277	113	278	1	33
278	113	279	2	3
279	114	280	1	17
280	114	281	2	2
281	114	282	0	30
282	115	283	2	4
283	115	284	3	24
284	115	285	0	30
285	115	286	1	5
286	116	287	1	5
287	116	288	0	20
288	117	289	2	5
289	117	290	1	50
290	117	291	0	20
291	118	292	0	30
292	119	293	0	10
293	120	294	0	5
294	121	295	0	8
295	122	296	0	4
296	123	297	0	3
297	124	298	0	10
298	125	299	0	8
299	126	300	0	12
300	127	301	0	21
301	127	302	1	4
302	128	303	0	50
303	129	304	0	20
304	130	305	2	1
305	130	306	1	8
306	130	307	0	26
308	132	309	0	10
309	131	310	0	10
310	133	311	0	15
311	134	312	1	33
312	134	313	0	31
313	134	314	3	30
314	134	315	2	2
315	135	316	0	10
316	136	317	2	7
317	136	318	0	22
318	136	319	1	14
319	137	320	2	1
320	137	321	1	23
321	137	322	0	20
322	138	323	0	12
323	139	324	0	15
324	140	325	0	10
325	141	326	0	15
326	142	327	1	15
327	142	328	0	30
328	143	329	0	40
329	144	330	0	12
330	145	331	0	10
331	146	332	0	10
332	147	333	3	14
333	147	334	1	2
334	147	335	0	2
335	147	336	5	30
336	147	337	6	1
337	147	338	2	4
338	147	339	4	2
339	148	340	0	10
340	149	341	0	3
341	150	342	0	5
342	151	343	0	11
344	152	345	1	255
345	152	346	0	16
346	153	347	0	20
355	155	356	0	193
356	156	357	0	7
357	157	358	1	24
358	157	359	0	30
359	158	360	0	15
360	159	361	0	50
361	160	362	1	16
362	160	363	0	30
365	162	366	0	22
366	163	367	4	1
367	163	368	7	15
368	163	369	3	40
369	163	370	5	10
370	163	371	0	38
371	163	372	1	2
372	163	373	2	1
373	163	374	6	1
374	161	375	0	67
376	165	377	0	2
377	166	378	0	8
378	167	379	0	5
379	168	380	0	20
380	169	381	0	5
381	170	382	0	10
382	171	383	0	10
383	172	384	0	20
384	173	385	0	15
385	174	386	0	12
386	175	387	0	8
387	176	388	0	5
388	177	389	0	132
389	178	390	0	4
390	179	391	0	30
393	180	394	0	55
394	180	395	1	22
395	181	396	1	9
396	181	397	0	17
397	182	398	2	1
398	182	399	1	22
399	182	400	0	20
400	183	401	0	5
401	184	402	0	3
402	185	403	0	10
403	186	404	1	800
404	186	405	0	1000
405	187	406	0	30
406	187	407	2	1
407	187	408	1	44
408	188	409	0	5
409	189	410	0	5
410	190	411	2	5
411	190	412	0	30
412	190	413	1	37
413	190	414	3	60
416	191	417	0	10
417	191	418	1	10
427	192	428	1	5
428	192	429	4	26
429	192	430	0	25
430	192	431	7	1
431	192	432	3	10
432	192	433	5	6
433	192	434	6	4
354	155	355	2	831
353	155	354	1	2097
434	192	435	9	33
436	192	437	8	1500
437	192	438	2	6
438	193	439	0	3
439	194	440	0	5
440	195	441	1	9
441	195	442	2	1
442	195	443	0	30
443	196	444	0	12
444	197	445	0	9
445	198	446	0	20
446	198	447	2	30
447	198	448	1	30
448	199	449	0	2
451	200	452	1	600
452	200	453	0	300
455	202	456	0	331
456	203	457	0	13
457	204	458	0	8
458	205	459	1	25
459	205	460	2	2
460	205	461	0	20
461	206	462	1	36
462	206	463	2	3
463	206	464	3	1
464	206	465	0	14
465	207	466	0	46
468	208	469	0	384
469	208	470	1	168
482	211	483	0	218
483	211	484	1	209
485	215	486	1	15
488	215	489	3	1
487	215	488	2	5
484	215	485	0	12
486	215	487	4	36
490	217	491	0	240
491	218	492	0	12
492	219	493	0	3
494	220	495	0	40
496	221	497	0	20
497	222	498	0	13
498	223	499	2	1
499	223	500	0	18
500	223	501	1	17
501	223	502	3	37
502	224	503	3	2
503	224	504	2	34
504	224	505	1	40
505	224	506	0	30
506	225	507	0	20
507	225	508	2	34
508	225	509	1	30
509	226	510	0	4
510	227	511	0	2
435	192	436	10	1
86	27	87	0	36
511	228	512	0	70
512	228	513	1	320
513	228	514	2	338
514	229	515	0	100
515	230	516	2	24
516	230	517	3	1
517	230	518	0	12
518	230	519	1	50
519	231	520	0	2
521	232	522	0	15
522	233	523	0	30
523	234	524	0	40
524	234	525	2	15
525	234	526	1	50
526	235	527	0	6
527	236	528	0	20
528	237	529	1	161
529	237	530	0	8
530	238	531	0	53
531	239	532	3	30
532	239	533	1	180
533	239	534	4	80
534	239	535	2	8
535	239	536	0	40
536	240	537	0	20
537	241	538	0	5
538	241	539	1	1
539	242	540	0	50
540	243	541	2	20
541	243	542	1	24
542	243	543	0	62
543	244	544	0	20
544	245	545	2	2
545	245	546	1	50
546	245	547	0	30
547	246	548	0	8
\.


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 194
-- Name: incoming_article_incoming_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('incoming_article_incoming_article_id_seq', 547, true);


--
-- TOC entry 3245 (class 0 OID 420594)
-- Dependencies: 195
-- Data for Name: incoming_delivery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY incoming_delivery (incoming_delivery_id, organisation_id, person_id, delivery_nr, date, comment, update_timestamp, archived) FROM stdin;
35	197	602	0	2015-02-24	WP S 09	2015-06-01	1
36	108	602	0	2015-02-20	WP S 10	2015-06-01	1
37	108	602	0	2015-02-06	WP S 11	2015-06-01	1
38	108	602	0	2015-02-13	WP S 12	2015-06-01	1
39	13	602	0	2015-02-24	WP S 13	2015-06-01	1
11	221	519	0	2015-01-27	WP 3	2015-05-18	1
40	13	602	0	2015-02-10	WP S 14	2015-06-01	1
99	119	602	0	2015-05-18	WP S 32	2015-06-20	1
41	13	602	0	2015-02-17	WP S 15	2015-06-01	1
42	13	602	0	2015-02-03	WP S 16	2015-06-01	1
15	197	519	0	2015-01-30	WP 1	2015-05-22	1
16	197	519	0	2015-01-28	WP 2	2015-05-22	1
29	197	602	0	2015-02-09	WP S 02	2015-06-01	1
17	156	519	0	2015-01-30	WP M 02	2015-05-23	1
103	251	642	0	2015-03-12	WP L 22	2015-07-07	1
19	108	519	0	2015-01-30	WP M 04	2015-05-23	1
106	251	642	0	2015-03-31	WP L 25	2015-07-07	1
20	13	519	0	2015-01-27	WP M 05	2015-05-23	1
21	241	519	0	2015-01-23	WP M 06	2015-05-23	1
43	119	602	0	2015-02-05	WP S 17	2015-06-01	1
44	229	602	0	2015-02-12	WP S 18	2015-06-01	1
45	221	602	0	2015-02-16		2015-06-01	1
46	197	253	0	2015-04-09	WP A 01	2015-06-01	1
47	13	253	0	2015-04-17	WP A 05	2015-06-01	1
48	108	253	0	2015-04-24	WP A 06	2015-06-01	1
49	13	253	0	2015-04-28	WP A 07	2015-06-01	1
23	13	519	0	2015-01-29	WP M 03	2015-05-23	1
24	18	519	0	2015-01-27	WP M 07	2015-05-23	1
25	18	519	0	2015-01-19	WP M 08	2015-05-23	1
26	53	519	0	2015-01-20	WP M 09	2015-05-23	1
28	197	602	0	2015-02-27	WP S 01	2015-06-01	1
31	197	602	0	2015-03-06	WP S 04	2015-06-01	1
30	197	602	0	2015-02-02	WP S 03	2015-06-01	1
32	197	602	0	2015-02-19	WP S 06	2015-06-01	1
33	197	602	0	2015-04-18	WP S 07	2015-06-01	1
34	197	602	0	2015-05-12	WP S 08	2015-06-01	1
50	197	253	0	2015-04-24	WP A 08	2015-06-01	1
51	13	253	0	2015-04-30	WP A 09	2015-06-01	1
52	108	574	0	2015-01-02	WP U 01	2015-06-01	1
53	197	574	0	2015-01-02	WP U 02	2015-06-01	1
54	197	574	0	2015-01-09	WP U 03	2015-06-01	1
56	108	574	0	2015-01-09	WP U 05	2015-06-01	1
57	206	574	0	2015-01-09	WP U 06	2015-06-02	1
58	119	574	0	2015-01-07	WP U 07	2015-06-02	1
60	13	574	0	2015-01-13	WP U 08	2015-06-02	1
61	197	574	0	2015-01-14	WP U 09	2015-06-02	1
62	13	574	0	2015-01-15	WP U 10	2015-06-02	1
63	108	574	0	2015-01-16	WP U 11	2015-06-02	1
105	251	642	0	2015-03-24	WP L 24	2015-07-07	1
64	13	642	0	2015-03-31	WP L 01	2015-06-04	1
65	108	642	0	2015-03-27	WP L 02	2015-06-04	1
66	13	642	0	2015-03-12	WP L 03	2015-06-04	1
67	108	642	0	2015-03-13	WP L 04	2015-06-04	1
69	197	642	0	2015-03-11	WP L 06	2015-06-04	1
70	157	642	0	2015-03-19	WP L 07	2015-06-04	1
75	206	642	0	2015-03-06	WP L 12	2015-06-04	1
76	18	642	0	2015-03-02	WP L 13	2015-06-04	1
74	31	642	0	2015-03-02	WP L 11	2015-06-04	1
80	221	642	0	2015-03-31	WP L 17	2015-06-04	1
84	241	519	0	2015-01-26	WP 4	2015-06-11	1
68	197	642	0	2015-03-27	WP L 05	2015-07-03	1
14	197	519	0	2015-01-23	WP M 01	2015-05-22	1
83	53	253	0	2015-01-20	WP M 09	2015-06-10	1
82	251	253	0	2015-04-07	WP A 03	2015-06-10	1
85	251	253	0	2015-04-14	WP A 04	2015-06-11	1
86	251	253	0	2015-04-09	WP A 02	2015-06-11	1
87	251	602	0	2015-03-03	WP S 20	2015-06-20	1
88	251	602	0	2015-03-17	WP S 21	2015-06-20	1
89	251	602	0	2015-02-10	WP S 22	2015-06-20	1
90	251	602	0	2015-02-19	WP S 23	2015-06-20	1
91	251	602	0	2015-02-17	WP S 24	2015-06-20	1
92	251	602	0	2015-02-26	WP S 25	2015-06-20	1
93	13	602	0	2015-06-09	WP S 26	2015-06-20	1
94	197	602	0	2015-06-05	WP S 27	2015-06-20	1
95	13	602	0	2015-06-02	WP S 28	2015-06-20	1
96	141	602	0	2015-05-06	WP S 29	2015-06-20	1
78	13	642	0	2015-03-03	WP L 15	2015-06-04	1
79	13	642	0	2015-03-19	WP L 16	2015-06-04	1
72	18	642	0	2015-03-19	WP L 09	2015-06-04	1
81	221	642	0	2015-03-26	WP L 18	2015-06-04	1
100	251	642	0	2015-03-26	WP L 19	2015-07-07	1
77	119	642	0	2015-03-05	WP L 14	2015-06-04	1
101	251	642	0	2015-03-05	WP L 20	2015-07-07	1
104	251	642	0	2015-03-19	WP L 23	2015-07-07	1
102	251	642	0	2015-03-10	WP L 21	2015-07-07	1
98	13	602	0	2015-05-05	WP S 31	2015-06-20	1
109	206	602	0	2015-06-23	WP S 34	2015-07-24	1
97	221	602	0	2015-05-05	WP S 30	2015-06-20	1
108	206	602	0	2015-06-22	WP S 33	2015-07-24	1
110	108	602	0	2015-05-22	WP S35	2015-07-24	1
111	108	602	0	2015-05-29	WP S 36	2015-07-24	1
112	108	602	0	2015-06-19	WP S 37	2015-07-24	1
113	197	602	0	2015-05-19	WP S 38	2015-07-25	1
114	197	602	0	2015-04-14	WP S 39	2015-07-25	1
115	197	602	0	2015-03-17	WP S 40	2015-07-25	1
116	197	602	0	2015-03-03	WP S 41	2015-07-25	1
117	197	602	0	2015-05-22	WP S 42	2015-07-25	1
118	197	602	0	2015-03-31	WP S 43	2015-07-25	1
119	13	602	0	2015-05-21	WP S 44	2015-07-25	1
120	13	602	0	2015-03-17	WP S 45	2015-07-25	1
121	13	602	0	2015-06-05	WP S 46	2015-07-25	1
122	13	602	0	2015-04-09	WP S 47	2015-07-25	1
123	13	602	0	2015-05-07	WP S 48	2015-07-25	1
124	13	602	0	2015-05-12	WP S 49	2015-07-25	1
125	13	602	0	2015-04-14	WP S 50	2015-07-25	1
126	13	602	0	2015-06-30	WP S 51	2015-07-25	1
127	197	642	0	2015-07-01	WP L 26	2015-07-30	1
128	11	642	0	2015-06-12	WP L 27	2015-07-30	1
129	11	642	0	2015-07-02	WP L 28	2015-07-30	1
130	197	642	0	2015-07-08	WP L 29	2015-07-30	1
131	108	642	0	2015-07-03	WP L 30	2015-07-30	1
132	13	642	0	2015-07-14	WP L 31	2015-07-30	1
133	108	642	0	2015-07-10	WP L 32	2015-07-30	1
134	197	642	0	2015-07-03	WP L 33	2015-07-30	1
135	108	642	0	2015-06-26	WP L 34	2015-07-30	1
55	18	574	0	2015-01-09	WP U 04	2015-06-01	1
73	119	642	0	2015-03-26	WP L 10	2015-06-04	1
71	119	642	0	2015-03-24	WP L 08	2015-06-04	1
136	197	642	0	2015-06-22		2015-07-30	1
137	197	642	0	2015-06-19	WP L 36	2015-07-30	1
138	13	642	0	2015-07-07	WP L 37	2015-07-30	1
139	108	642	0	2015-07-17	WP L 38	2015-07-30	1
140	108	642	0	2015-07-24	WP L 39	2015-07-30	1
141	13	642	0	2015-07-28	WP L 40	2015-07-30	1
142	221	642	0	2015-07-17	WP L 41	2015-07-30	1
146	13	642	0	2015-06-18	WP L 45	2015-07-30	1
145	108	642	0	2015-06-12	WP L 44	2015-07-30	1
143	156	642	0	2015-07-28	WP L 42	2015-07-30	1
144	13	642	0	2015-07-16	WP L 43	2015-07-30	1
148	13	642	0	2015-07-02	WP L 47	2015-08-18	1
149	13	642	0	2015-03-24	WP L 48	2015-08-18	1
150	13	642	0	2015-04-07	WP L 49	2015-08-18	1
151	13	642	0	2015-04-21	WP L 50	2015-08-18	1
153	108	642	0	2015-07-09	WP L 52	2015-08-18	1
156	252	519	0	2015-09-09	WP M 10	2015-09-10	1
157	197	574	0	2015-08-09	WP U 12	2015-09-29	1
158	13	574	0	2015-08-25	WP U 13	2015-09-29	1
159	13	574	0	2015-08-27	WP U 14	2015-09-29	1
160	197	574	0	2015-08-28	WP U 15	2015-09-29	1
162	119	574	0	2015-08-19	WP U 17	2015-10-18	1
163	119	574	0	2015-08-18	WP U 18	2015-10-18	1
152	57	574	0	2015-07-31	WP L 51	2015-10-30	1
161	57	574	0	2015-08-07	WP U 16	2015-10-18	1
59	189	574	0	2014-12-31	Original nv	2015-06-02	1
165	13	602	0	2015-06-11	WP S 52	2015-11-13	1
166	13	602	0	2015-04-23	WP S 53	2015-11-13	1
167	13	602	0	2015-04-09	WP S 54	2015-11-13	1
168	13	602	0	2015-04-02	WP S 55	2015-11-13	1
169	13	602	0	2014-05-26	WP S 56	2015-11-13	1
170	13	602	0	2015-05-19	WP S 57	2015-11-13	1
171	108	602	0	2015-04-30	WP S 58	2015-11-13	1
172	108	602	0	2015-05-15	WP S 59	2015-11-13	1
173	13	602	0	2015-02-26	WP S 60	2015-11-13	1
174	13	602	0	2015-02-05	WP S 61	2015-11-13	1
175	13	602	0	2015-02-12	WP S 62	2015-11-13	1
176	108	602	0	2015-09-25	WP S 63	2015-11-13	1
178	251	602	0	2015-02-12	WP S 65	2015-11-13	1
177	156	602	0	2015-01-30	WP S 64	2015-11-13	1
179	251	602	0	2015-02-24	WP S 66	2015-11-13	1
199	256	602	0	2015-10-09	WP S 71	2015-12-27	1
181	197	602	0	2015-10-07	WP S 68	2015-11-14	1
182	197	602	0	2015-10-09	WP S 69	2015-11-14	1
183	108	602	0	2015-10-09	WP S 70	2015-11-14	1
184	108	602	0	2015-10-30	WP S 72	2015-11-14	1
185	108	602	0	2015-10-02	WP S 73	2015-11-14	1
186	254	642	0	2015-07-15	WP L 53	2015-11-21	1
147	119	642	0	2015-07-08	WP L 46	2015-07-30	1
187	197	642	0	2015-07-22	WP L 54	2015-11-21	1
188	13	642	0	2015-07-21	WP L 55	2015-11-21	1
189	108	642	0	2015-11-06	WP L 56	2015-11-21	1
190	197	642	0	2015-11-10	WP L 57	2015-11-21	1
180	57	602	0	2015-04-17	WP S 67	2015-11-13	1
191	157	574	0	2015-08-31	WP U 19	2015-12-01	1
222	11	642	0	2015-12-03	WP L 69	2016-01-12	1
193	13	602	0	2015-08-06	WP S 75	2015-12-27	1
194	13	602	0	2015-08-20	WP S 76	2015-12-27	1
195	197	602	0	2015-10-20	WP S 77	2015-12-27	1
196	13	602	0	2015-06-12	WP S 78	2015-12-27	1
197	108	602	0	2015-10-23	WP S 79	2015-12-27	1
198	197	602	0	2015-09-01	WP S 80	2015-12-27	1
200	255	602	0	2015-05-19	WP S 81	2015-12-27	1
221	11	642	0	2015-10-13	WP L 70	2016-01-12	1
202	18	602	0	2015-06-17	WP S 82	2015-12-27	1
203	108	602	0	2015-03-06	WP S 83	2015-12-27	1
204	108	642	0	2015-11-27	WP L 58	2015-12-31	1
205	197	642	0	2015-11-18	WP L 60	2015-12-31	1
206	197	642	0	2015-11-14	WP L 59	2015-12-31	1
207	156	642	0	2015-07-29	WP L 61	2015-12-31	1
208	255	642	0	2015-12-16	WP L 62	2015-12-31	1
215	119	642	0	2015-12-03	WP L 64	2015-12-31	1
217	18	642	0	2015-12-02	WP L 66	2015-12-31	1
218	108	642	0	2015-12-11	WP L 67	2015-12-31	1
219	108	642	0	2015-11-13	WP L 68	2015-12-31	1
220	221	642	0	2015-12-07	WP L 65	2016-01-06	1
211	31	642	0	2015-11-19	WP L 63	2015-12-31	1
224	197	642	0	2015-11-21	WP L 72	2016-01-12	1
223	197	642	0	2015-10-02	WP L 71	2016-01-12	1
225	197	642	0	2015-10-16	WP L 73	2016-01-12	1
227	108	642	0	2015-12-04	WP L 74	2016-01-12	1
226	108	642	0	2015-09-18	WP L 75	2016-01-12	1
192	119	602	0	2015-10-21	WP S 74	2015-12-18	1
27	119	602	0	2015-02-19	WP S 05	2015-06-01	1
228	73	642	0	2015-10-23	WP L 76	2016-01-25	1
155	139	253	0	2015-04-14	WP A 10	2015-09-01	1
229	156	602	0	2015-07-13	WP S 84	2016-02-01	1
230	197	602	0	2015-12-19	WP S 85	2016-02-01	1
231	53	519	0	2015-10-02	WP M 11	2016-02-03	1
232	108	574	0	2016-01-08	WP U 20	2016-02-12	1
234	197	574	0	2016-01-13	WP U 23	2016-02-12	1
233	197	574	0	2016-01-02	WP U 22	2016-02-12	1
242	260	642	0	2015-12-22	WP L 78	2016-02-17	1
236	11	574	0	2016-01-23	WP U 25	2016-02-12	1
237	119	574	0	2016-01-07	WP U 26	2016-02-14	0
239	262	574	0	2016-01-22	WP U 28	2016-02-14	0
240	221	574	0	2016-01-22	WP U 29 (orininal LS fehlt noch)	2016-02-14	0
238	31	574	0	2016-01-19	WP U 27	2016-02-14	1
235	108	574	0	2016-01-29	WP U 24	2016-02-14	1
241	11	574	0	2015-11-19	WP U 21 (Lieferant korrigieren auf Dekubitusprävention)	2016-02-14	0
243	262	642	0	2015-12-23	WP L 79	2016-02-17	1
244	108	642	0	2015-12-18	WP L 80	2016-02-17	1
245	197	574	0	2016-01-22	WP U 30	2016-02-19	1
246	108	574	0	2016-01-15	WP U 31	2016-02-19	1
\.


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 196
-- Name: incoming_delivery_incoming_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('incoming_delivery_incoming_delivery_id_seq', 246, true);


--
-- TOC entry 3247 (class 0 OID 420604)
-- Dependencies: 197
-- Data for Name: logging; Type: TABLE DATA; Schema: public; Owner: -
--

COPY logging (logging_id, loggingtext, "timestamp", person_id) FROM stdin;
371	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-21 07:19:51.693+00	1
372	[INFO] Organisation mit der id 5 gespeichert	2015-04-21 07:21:13.065+00	1
373	[INFO] Organisation mit der id 13 gespeichert	2015-04-21 07:21:47.026+00	1
374	[INFO] Organisation mit der id 14 gespeichert	2015-04-21 07:22:40.908+00	1
375	[INFO] Person mit der id 543 gespeichert. personId: 543, salutation: Herr, title: , firstName: Gerhard, lastName: Thürridl, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 07:23:15.451+00	1
376	[INFO] Organisation mit der id 17 gespeichert	2015-04-21 07:24:18.185+00	1
377	[INFO] Organisation mit der id 227 gespeichert	2015-04-21 07:25:24.648+00	1
378	[INFO] Person mit der id 610 gespeichert. personId: 610, salutation: Herr, title: , firstName: Roger, lastName: Dance, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 07:26:03.896+00	1
379	[INFO] Person mit der id 611 gespeichert. personId: 611, salutation: Herr, title: , firstName: Jörg, lastName: Weisser, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 07:26:51.377+00	1
380	[INFO] Organisation mit der id 227 gespeichert	2015-04-21 07:27:26.826+00	1
381	[INFO] Person mit der id 70 gelöscht	2015-04-21 07:28:34.397+00	1
382	[INFO] Organisation mit der id 28 gelöscht	2015-04-21 07:30:27.508+00	1
383	[INFO] Person mit der id 371 gespeichert. personId: 371, salutation: Herr, title: Mag., firstName: Stefan, lastName: Ornig, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 07:31:40.676+00	1
384	[INFO] Organisation mit der id 29 gespeichert	2015-04-21 07:32:13.18+00	1
385	[INFO] Organisation mit der id 37 gelöscht	2015-04-21 07:33:12.734+00	1
386	[INFO] Person mit der id 283 gelöscht	2015-04-21 07:33:26.098+00	1
387	[INFO] Person mit der id 112 gelöscht	2015-04-21 07:33:50.997+00	1
388	[INFO] Organisation mit der id 39 gelöscht	2015-04-21 07:34:07.959+00	1
389	[INFO] Organisation mit der id 40 gespeichert	2015-04-21 07:34:32.618+00	1
390	[INFO] Organisation mit der id 45 gespeichert	2015-04-21 07:35:04.847+00	1
391	[INFO] Person mit der id 168 gespeichert. personId: 168, salutation: Frau, title: , firstName: Walburga, lastName: Gwechenberger, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 07:38:06.353+00	1
392	[INFO] Person mit der id 36 gelöscht	2015-04-21 07:39:02.482+00	1
393	[INFO] Organisation mit der id 56 gespeichert	2015-04-21 07:39:24.72+00	1
394	[INFO] Organisation mit der id 60 gespeichert	2015-04-21 07:40:14.335+00	1
395	[INFO] Organisation mit der id 61 gespeichert	2015-04-21 07:40:41.234+00	1
396	[INFO] Organisation mit der id 66 gespeichert	2015-04-21 07:41:03.921+00	1
397	[INFO] Organisation mit der id 67 gespeichert	2015-04-21 07:41:17.363+00	1
398	[INFO] Person mit der id 612 gespeichert. personId: 612, salutation: Frau, title: , firstName: Manuela, lastName: Spießberger, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 07:42:33.213+00	1
399	[INFO] Organisation mit der id 228 gespeichert	2015-04-21 07:43:21.517+00	1
400	[INFO] Person mit der id 282 gelöscht	2015-04-21 07:43:53.546+00	1
401	[INFO] Organisation mit der id 71 gespeichert	2015-04-21 07:45:07.075+00	1
402	[INFO] Organisation mit der id 73 gespeichert	2015-04-21 07:45:22.525+00	1
403	[INFO] Organisation mit der id 76 gespeichert	2015-04-21 07:45:36.248+00	1
404	[INFO] Organisation mit der id 77 gespeichert	2015-04-21 07:45:51.107+00	1
405	[INFO] Person mit der id 459 gelöscht	2015-04-21 07:46:42.919+00	1
406	[INFO] Organisation mit der id 78 gelöscht	2015-04-21 07:47:01.555+00	1
407	[INFO] Organisation mit der id 81 gespeichert	2015-04-21 07:47:29.564+00	1
408	[INFO] Organisation mit der id 82 gespeichert	2015-04-21 07:47:44.316+00	1
409	[INFO] Organisation mit der id 84 gespeichert	2015-04-21 07:48:03.413+00	1
410	[INFO] Organisation mit der id 94 gespeichert	2015-04-21 07:48:47.637+00	1
411	[INFO] Organisation mit der id 96 gespeichert	2015-04-21 07:49:02.688+00	1
412	[INFO] Organisation mit der id 104 gespeichert	2015-04-21 08:10:48.866+00	1
413	[INFO] Organisation mit der id 106 gespeichert	2015-04-21 08:11:55.857+00	1
414	[INFO] Organisation mit der id 107 gespeichert	2015-04-21 08:12:20.382+00	1
415	[INFO] Organisation mit der id 108 gespeichert	2015-04-21 08:12:41.315+00	1
416	[INFO] Organisation mit der id 109 gespeichert	2015-04-21 08:13:02.737+00	1
417	[INFO] Organisation mit der id 112 gespeichert	2015-04-21 08:15:10.154+00	1
418	[INFO] Organisation mit der id 114 gespeichert	2015-04-21 08:15:24.686+00	1
419	[INFO] Organisation mit der id 115 gespeichert	2015-04-21 08:15:43.268+00	1
420	[INFO] Organisation mit der id 118 gespeichert	2015-04-21 08:16:00.145+00	1
421	[INFO] Organisation mit der id 119 gespeichert	2015-04-21 08:16:40.356+00	1
422	[INFO] Organisation mit der id 121 gespeichert	2015-04-21 08:16:59.9+00	1
423	[INFO] Organisation mit der id 124 gespeichert	2015-04-21 08:20:16.8+00	1
424	[INFO] Organisation mit der id 127 gespeichert	2015-04-21 08:20:49.531+00	1
425	[INFO] Organisation mit der id 128 gespeichert	2015-04-21 08:21:10.102+00	1
426	[INFO] Organisation mit der id 219 gespeichert	2015-04-21 08:21:23.236+00	1
427	[INFO] Organisation mit der id 131 gespeichert	2015-04-21 08:21:42.837+00	1
428	[INFO] Organisation mit der id 135 gelöscht	2015-04-21 08:22:05.179+00	1
429	[INFO] Person mit der id 392 gelöscht	2015-04-21 08:22:17.003+00	1
430	[INFO] Organisation mit der id 138 gespeichert	2015-04-21 08:22:43.801+00	1
431	[INFO] Organisation mit der id 141 gespeichert	2015-04-21 08:23:02.107+00	1
432	[INFO] Person mit der id 52 gelöscht	2015-04-21 08:23:29.633+00	1
433	[INFO] Person mit der id 516 gelöscht	2015-04-21 08:23:41.483+00	1
434	[INFO] Organisation mit der id 145 gespeichert	2015-04-21 08:24:17.973+00	1
435	[INFO] Organisation mit der id 146 gespeichert	2015-04-21 08:25:24.08+00	1
436	[INFO] Organisation mit der id 91 gespeichert	2015-04-21 08:25:49.293+00	1
437	[INFO] Organisation mit der id 149 gelöscht	2015-04-21 08:27:38.928+00	1
438	[INFO] Person mit der id 284 gelöscht	2015-04-21 08:27:50.668+00	1
439	[INFO] Organisation mit der id 151 gespeichert	2015-04-21 08:28:15.121+00	1
440	[INFO] Organisation mit der id 155 gespeichert	2015-04-21 08:28:35.983+00	1
441	[INFO] Organisation mit der id 159 gespeichert	2015-04-21 08:28:56.941+00	1
442	[INFO] Organisation mit der id 160 gespeichert	2015-04-21 08:29:28.682+00	1
443	[INFO] Organisation mit der id 162 gespeichert	2015-04-21 08:31:09.716+00	1
444	[INFO] Organisation mit der id 164 gespeichert	2015-04-21 08:31:29.738+00	1
445	[INFO] Organisation mit der id 177 gespeichert	2015-04-21 08:31:54.921+00	1
446	[INFO] Organisation mit der id 179 gespeichert	2015-04-21 08:32:16.825+00	1
447	[INFO] Organisation mit der id 186 gespeichert	2015-04-21 08:33:16.971+00	1
448	[INFO] Person mit der id 320 gespeichert. personId: 320, salutation: Frau AR, title: Mag., firstName: Karoline, lastName: Tanzer, comment: Aufsichtsrat, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 08:33:48.666+00	1
478	[INFO] Organisation mit der id 213 gespeichert	2015-04-21 08:47:54.784+00	1
449	[INFO] Organisation mit der id 188 gespeichert	2015-04-21 08:34:14.749+00	1
450	[INFO] Organisation mit der id 189 gespeichert	2015-04-21 08:34:43.142+00	1
451	[INFO] Person mit der id 558 gespeichert. personId: 558, salutation: Frau, title: , firstName: Theresia, lastName: Wallerstorfer, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 08:36:03.43+00	1
452	[INFO] Organisation mit der id 192 gespeichert	2015-04-21 08:36:24.723+00	1
453	[INFO] Organisation mit der id 193 gespeichert	2015-04-21 08:36:55.981+00	1
454	[INFO] Organisation mit der id 194 gespeichert	2015-04-21 08:37:14.098+00	1
455	[INFO] Person mit der id 12 gelöscht	2015-04-21 08:37:39.34+00	1
456	[INFO] Person mit der id 25 gelöscht	2015-04-21 08:37:49.246+00	1
457	[INFO] Person mit der id 124 gelöscht	2015-04-21 08:38:02.697+00	1
458	[INFO] Person mit der id 129 gelöscht	2015-04-21 08:38:14.118+00	1
459	[INFO] Person mit der id 218 gelöscht	2015-04-21 08:38:22.274+00	1
460	[INFO] Person mit der id 378 gelöscht	2015-04-21 08:38:31.274+00	1
461	[INFO] Person mit der id 455 gelöscht	2015-04-21 08:38:41.272+00	1
462	[INFO] Person mit der id 472 gelöscht	2015-04-21 08:38:55.755+00	1
463	[INFO] Person mit der id 482 gelöscht	2015-04-21 08:39:04.865+00	1
464	[INFO] Person mit der id 576 gelöscht	2015-04-21 08:39:17.624+00	1
465	[INFO] Person mit der id 239 gelöscht	2015-04-21 08:40:31.841+00	1
466	[INFO] Person mit der id 613 gespeichert. personId: 613, salutation: Frau, title: , firstName: Stephanie, lastName: Lorber, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 08:41:14.294+00	1
467	[INFO] Person mit der id 614 gespeichert. personId: 614, salutation: Frau, title: , firstName: Nicole, lastName: Struber, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 08:41:44.007+00	1
468	[INFO] Organisation mit der id 200 gespeichert	2015-04-21 08:42:12.331+00	1
469	[INFO] Person mit der id 499 gelöscht	2015-04-21 08:42:27.329+00	1
470	[INFO] Person mit der id 555 gelöscht	2015-04-21 08:42:39.203+00	1
471	[INFO] Organisation mit der id 201 gespeichert	2015-04-21 08:43:46.814+00	1
472	[INFO] Organisation mit der id 202 gespeichert	2015-04-21 08:44:07.767+00	1
473	[INFO] Organisation mit der id 207 gespeichert	2015-04-21 08:44:39.723+00	1
474	[INFO] Organisation mit der id 208 gespeichert	2015-04-21 08:44:56.477+00	1
475	[INFO] Organisation mit der id 210 gespeichert	2015-04-21 08:45:59.159+00	1
476	[INFO] Organisation mit der id 219 gespeichert	2015-04-21 08:46:44.549+00	1
477	[INFO] Organisation mit der id 219 gespeichert	2015-04-21 08:47:06.305+00	1
479	[INFO] Organisation mit der id 214 gespeichert	2015-04-21 08:48:07.352+00	1
480	[INFO] Organisation mit der id 221 gespeichert	2015-04-21 08:48:30.541+00	1
481	[INFO] Person mit der id 22 gespeichert. personId: 22, salutation: Frau, title: , firstName: Ilse, lastName: Asen, comment: Tätigkeit: Waren, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:29:51.628+00	1
482	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:32:37.064+00	1
483	[INFO] Person mit der id 63 gelöscht	2015-04-21 09:34:45.564+00	1
484	[INFO] Person mit der id 67 gelöscht	2015-04-21 09:34:59.39+00	1
485	[INFO] Person mit der id 69 gespeichert. personId: 69, salutation: Frau, title: , firstName: Veronika, lastName: Canaval, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:35:34.744+00	1
486	[INFO] Person mit der id 95 gespeichert. personId: 95, salutation: Frau, title: , firstName: Ingrid, lastName: Eckerl, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:36:46.441+00	1
487	[INFO] Person mit der id 104 gelöscht	2015-04-21 09:37:15.011+00	1
488	[INFO] Person mit der id 113 gelöscht	2015-04-21 09:37:32.615+00	1
489	[INFO] Person mit der id 123 gelöscht	2015-04-21 09:37:56.903+00	1
490	[INFO] Person mit der id 134 gespeichert. personId: 134, salutation: Herr, title: Dkfm., firstName: Bernd, lastName: Gaubinger, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:38:22.323+00	1
491	[INFO] Person mit der id 615 gespeichert. personId: 615, salutation: Herr, title: , firstName: Anton, lastName: Gietzinger, comment: Tätigkeit: Waren, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:39:51.598+00	1
492	[INFO] Person mit der id 145 gespeichert. personId: 145, salutation: Frau, title: , firstName: Christine, lastName: Gölzner, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:40:32.824+00	1
493	[INFO] Person mit der id 157 gelöscht	2015-04-21 09:41:16.501+00	1
494	[INFO] Person mit der id 180 gespeichert. personId: 180, salutation: Herr, title: , firstName: Reinhold, lastName: Harfmann, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:42:13.359+00	1
495	[INFO] Person mit der id 184 gespeichert. personId: 184, salutation: Herr Landeshauptmann, title: Dr., firstName: Wilfried, lastName: Haslauer, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:42:50.308+00	1
496	[INFO] Person mit der id 186 gelöscht	2015-04-21 09:43:53.286+00	1
497	[INFO] Person mit der id 196 gespeichert. personId: 196, salutation: Frau, title: Mag., firstName: Sonja, lastName: Henhapl-Röhrich, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:44:11.082+00	1
498	[INFO] Person mit der id 198 gespeichert. personId: 198, salutation: Herr und Frau, title: , firstName: Hans, lastName: Herneth, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:44:30.707+00	1
499	[INFO] Person mit der id 204 gelöscht	2015-04-21 09:47:42.343+00	1
500	[INFO] Person mit der id 220 gespeichert. personId: 220, salutation: Frau, title: , firstName: Andrea, lastName: Hoppichler, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:48:27.171+00	1
501	[INFO] Person mit der id 224 gespeichert. personId: 224, salutation: Frau, title: Mag., firstName: Nicole, lastName: Huber, comment: Tätigkeit: Öffentlichkeit, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:48:49.829+00	1
502	[INFO] Person mit der id 232 gelöscht	2015-04-21 09:49:10.03+00	1
503	[INFO] Person mit der id 224 gespeichert. personId: 224, salutation: Frau, title: Mag., firstName: Nicole, lastName: Huber, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:49:47.173+00	1
556	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-23 05:13:58.728+00	1
504	[INFO] Person mit der id 246 gespeichert. personId: 246, salutation: Frau, title: , firstName: Minni, lastName: Karres, comment: Newsletter: ja, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:50:46.815+00	1
505	[INFO] Person mit der id 247 gelöscht	2015-04-21 09:50:58.669+00	1
506	[INFO] Person mit der id 266 gelöscht	2015-04-21 09:52:48.61+00	1
507	[INFO] Person mit der id 269 gespeichert. personId: 269, salutation: Herr, title: Dr., firstName: Karl, lastName: Koller, comment: Newsletter: ja, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:54:03.568+00	1
508	[INFO] Person mit der id 333 gespeichert. personId: 333, salutation: Herr und Frau, title: , firstName: Georg und Sabine, lastName: Mayrhofer, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 09:57:18.874+00	1
509	[INFO] Person mit der id 347 gespeichert. personId: 347, salutation: Herr, title: , firstName: Helfrid, lastName: Mooshammer, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:01:34.511+00	1
510	[INFO] Person mit der id 337 gespeichert. personId: 337, salutation: Frau, title: , firstName: Eva, lastName: Mentl, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:02:13.86+00	1
511	[INFO] Person mit der id 359 gespeichert. personId: 359, salutation: Herr, title: MMag., firstName: Michael, lastName: Neureiter, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:04:14.007+00	1
512	[INFO] Person mit der id 363 gespeichert. personId: 363, salutation: Herr, title: Mag., firstName: Erwin, lastName: Niese, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:04:33.118+00	1
513	[INFO] Person mit der id 616 gespeichert. personId: 616, salutation: Herr, title: , firstName: Peter, lastName: Nussbaum, comment: Tätigkeit: Waren/Fahrer, Newsletter: ja, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:06:06.351+00	1
514	[INFO] Person mit der id 372 gespeichert. personId: 372, salutation: Herr, title: , firstName: Johannes, lastName: Orsini-Rosenberg, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:06:50.307+00	1
515	[INFO] Person mit der id 377 gespeichert. personId: 377, salutation: Frau, title: , firstName: Renate, lastName: Ourth, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:07:25.226+00	1
516	[INFO] Person mit der id 379 gelöscht	2015-04-21 10:08:10.692+00	1
517	[INFO] Person mit der id 385 gelöscht	2015-04-21 10:08:39.919+00	1
518	[INFO] Person mit der id 386 gespeichert. personId: 386, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Pfaffenberger, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:08:54.125+00	1
519	[INFO] Person mit der id 412 gelöscht	2015-04-21 10:09:31.917+00	1
520	[INFO] Person mit der id 415 gespeichert. personId: 415, salutation: Frau Präsidentin, title: Dr., firstName: Helga, lastName: Rabl-Stadler, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:10:02.784+00	1
521	[INFO] Person mit der id 431 gelöscht	2015-04-21 10:10:41.425+00	1
522	[INFO] Person mit der id 432 gespeichert. personId: 432, salutation: Frau, title: , firstName: Maria, lastName: Reiter, comment: Newsletter: ja, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:10:56.601+00	1
523	[INFO] Person mit der id 476 gelöscht	2015-04-21 10:12:28.762+00	1
524	[INFO] Person mit der id 481 gespeichert. personId: 481, salutation: Herr, title: Dr., firstName: Eduard, lastName: Schöpfer, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:12:59.643+00	1
525	[INFO] Person mit der id 487 gelöscht	2015-04-21 10:13:16.079+00	1
526	[INFO] Person mit der id 496 gelöscht	2015-04-21 10:13:36.922+00	1
527	[INFO] Person mit der id 502 gespeichert. personId: 502, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:13:52.445+00	1
528	[INFO] Person mit der id 513 gelöscht	2015-04-21 10:14:32.968+00	1
529	[INFO] Person mit der id 519 gespeichert. personId: 519, salutation: Herr, title: , firstName: Michael, lastName: Steingaßner, comment: Tätigkeit: Waren, updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:15:04.586+00	1
530	[INFO] Person mit der id 517 gespeichert. personId: 517, salutation: Frau, title: , firstName: Anna, lastName: Steiner, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:15:30.134+00	1
531	[INFO] Person mit der id 546 gespeichert. personId: 546, salutation: Herr, title: , firstName: Felix, lastName: Tomo, comment: Tätigkeit: Waren, Tel., updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:18:26.973+00	1
532	[INFO] Person mit der id 547 gespeichert. personId: 547, salutation: Herr, title: Mag., firstName: Volker, lastName: Toth, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:19:22.961+00	1
533	[INFO] Person mit der id 549 gespeichert. personId: 549, salutation: Frau, title: DI, firstName: Tina, lastName: Tscherteu, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:20:44.723+00	1
534	[INFO] Person mit der id 550 gelöscht	2015-04-21 10:20:57.724+00	1
535	[INFO] Person mit der id 556 gelöscht	2015-04-21 10:21:25.98+00	1
536	[INFO] Person mit der id 571 gelöscht	2015-04-21 10:21:55.512+00	1
537	[INFO] Person mit der id 579 gelöscht	2015-04-21 10:22:28.196+00	1
538	[INFO] Person mit der id 580 gespeichert. personId: 580, salutation: Herr KommR, title: , firstName: Johann, lastName: Wieser, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:22:57.834+00	1
539	[INFO] Person mit der id 586 gelöscht	2015-04-21 10:23:15.918+00	1
540	[INFO] Organisation mit der id 30 gespeichert	2015-04-21 10:46:28.964+00	1
541	[INFO] Person mit der id 125 gespeichert. personId: 125, salutation: Herr, title: , firstName: Alexander, lastName: Fuchs, comment: , updateTimeStamp: 2015-04-21, active: 1	2015-04-21 10:46:47.833+00	1
542	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-04-21 10:52:52.817+00	1
543	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-21 11:49:41.16+00	1
544	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-21 11:51:52.991+00	1
545	[INFO] Alle Personen als CSV exportiert.	2015-04-21 11:57:30.411+00	1
546	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-22 07:42:38.723+00	1
547	[INFO] Person mit der id 72 gelöscht	2015-04-22 07:45:51.045+00	1
548	[INFO] Organisation mit der id 123 gespeichert. organisationId: 123, name: NÜRNBERGER Versicherung AG Österreich, comment: Webseite Ja, updateTimestamp: Wed Apr 22 07:47:10 UTC 2015, active: 1	2015-04-22 07:47:10.026+00	1
549	[INFO] Organisation mit der id 146 gelöscht	2015-04-22 07:49:01.333+00	1
550	[INFO] Person mit der id 523 gelöscht	2015-04-22 07:53:04.515+00	1
551	[INFO] Person mit der id 604 gelöscht	2015-04-22 08:07:26.154+00	1
552	[INFO] Person mit der id 605 gelöscht	2015-04-22 08:07:47.095+00	1
553	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-04-22 08:07:56.212+00	1
554	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-22 13:32:23.65+00	1
555	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-04-22 13:32:34.804+00	1
557	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-04-23 05:14:18.752+00	1
558	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-27 07:28:55.949+00	1
559	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-28 07:07:02.802+00	1
560	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-04-28 10:23:34.474+00	253
561	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-04-28 10:24:08.012+00	253
562	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-29 05:33:00.944+00	1
564	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-04-30 07:09:44.075+00	1
565	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-30 07:10:22.958+00	1
566	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-30 07:48:53.745+00	1
563	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-30 07:09:29.133+00	1
567	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-30 08:21:32.813+00	1
568	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-30 09:03:15.612+00	1
569	[INFO] Alle Personen als CSV exportiert.	2015-04-30 09:03:25.633+00	1
570	[INFO] Alle Personen als CSV exportiert.	2015-04-30 09:03:32.516+00	1
571	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-30 10:50:58.382+00	1
572	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-04-30 10:51:08.271+00	1
573	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-02 13:11:08.257+00	1
574	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-04 07:31:38.414+00	1
575	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-05-04 07:31:52.11+00	1
576	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-04 14:59:03.486+00	1
577	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-04 14:59:22.368+00	1
578	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-04 15:02:32.387+00	253
579	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-05 15:55:51.023+00	519
580	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-06 05:03:53.155+00	1
581	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-06 05:25:29.015+00	519
582	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-06 05:26:33.003+00	519
583	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-06 10:00:49.017+00	1
584	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-05-06 10:01:10.376+00	1
585	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-06 12:27:24.767+00	253
586	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-06 12:27:46.814+00	253
587	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-06 12:32:59.996+00	253
588	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-06 12:33:16.774+00	253
589	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-07 07:49:57.558+00	1
590	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-07 16:03:25.042+00	1
591	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-05-07 16:03:40.714+00	1
592	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-08 07:32:00.012+00	1
593	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-10 09:16:51.345+00	1
594	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-11 08:17:40.52+00	1
595	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-12 05:15:57.724+00	1
596	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-12 07:25:17.424+00	1
597	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-05-12 07:26:12.857+00	1
598	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-13 07:14:45.912+00	1
599	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-05-13 07:14:58.591+00	1
600	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-13 12:10:31.902+00	1
601	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-05-13 12:10:50.561+00	1
602	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-14 17:35:32.164+00	345
603	[INFO] Person mit der id 10 gespeichert. personId: 10, salutation: Frau, title: , firstName: Anna, lastName: Ablasser, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 17:52:01.885+00	345
604	[INFO] Person mit der id 11 gespeichert. personId: 11, salutation: Frau, title: Mag., firstName: Svitlana, lastName: Aheyeva, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 17:53:48.282+00	345
605	[INFO] Person mit der id 16 gespeichert. personId: 16, salutation: Herr, title: , firstName: , lastName: Altendorfer, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 17:54:41.234+00	345
606	[INFO] Person mit der id 617 gespeichert. personId: 617, salutation: Herr, title: Ing., firstName: Josef, lastName: Bachleitner, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 18:04:18.077+00	345
607	[INFO] Person mit der id 618 gespeichert. personId: 618, salutation: Frau, title: , firstName: Lisa, lastName: Authried, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 18:05:51.344+00	345
608	[INFO] Person mit der id 187 gespeichert. personId: 187, salutation: Frau, title: , firstName: Anni, lastName: Hauzenberger, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 18:12:07.772+00	345
609	[INFO] Person mit der id 3 gespeichert. personId: 3, salutation: Schwester, title: , firstName: Veronika, lastName:  , comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 18:13:13.311+00	345
610	[INFO] Person mit der id 45 gespeichert. personId: 45, salutation: Frau, title: , firstName: Berta, lastName: Berthold, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 18:14:03.532+00	345
611	[INFO] Person mit der id 289 gespeichert. personId: 289, salutation: Herr, title: , firstName: Eduard, lastName: Landes, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 18:15:07.45+00	345
612	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-14 18:16:01.661+00	345
613	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-14 20:07:57.04+00	345
614	[INFO] Passwort für Person mit Id 345 geändert.	2015-05-14 20:08:55.61+00	345
615	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-14 20:09:02.755+00	345
616	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-14 20:09:14.144+00	345
617	[INFO] Person mit der id 619 gespeichert. personId: 619, salutation: Herr, title: , firstName: Simon, lastName: Letsch, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:11:12.182+00	345
618	[INFO] Person mit der id 620 gespeichert. personId: 620, salutation: Frau, title: , firstName: Lena, lastName: Repplinger, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:12:49.959+00	345
619	[INFO] Person mit der id 621 gespeichert. personId: 621, salutation: Herr, title: Prof. Dr., firstName: René, lastName: Schmidpeter, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:14:51.266+00	345
666	[INFO] Person mit der id 585 gelöscht	2015-05-14 21:08:41.306+00	345
620	[INFO] Person mit der id 621 gespeichert. personId: 621, salutation: Herr, title: Prof. Dr., firstName: René, lastName: Schmidpeter, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:15:29.937+00	345
621	[INFO] Person mit der id 622 gespeichert. personId: 622, salutation: Herr, title: , firstName: Peter, lastName: Scheließnig, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:20:09.9+00	345
622	[INFO] Person mit der id 623 gespeichert. personId: 623, salutation: Frau, title: , firstName: Ingrid, lastName: Spitaler, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:21:29.991+00	345
623	[INFO] Person mit der id 327 gespeichert. personId: 327, salutation: Pater, title: , firstName: Karl, lastName: Mauri, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:22:26.716+00	345
671	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-14 21:14:35.317+00	345
624	[INFO] Person mit der id 624 gespeichert. personId: 624, salutation: Herr, title: Dipl. Ing. Dr. , firstName: Gerhard, lastName: Jöchtl, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:23:44.022+00	345
625	[INFO] Person mit der id 625 gespeichert. personId: 625, salutation: Frau, title: , firstName: Sandra, lastName: Lagler, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:24:53.431+00	345
626	[INFO] Person mit der id 626 gespeichert. personId: 626, salutation: Herr, title: , firstName: Roland, lastName: Lochmann, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:28:10.609+00	345
627	[INFO] Person mit der id 627 gespeichert. personId: 627, salutation: Frau, title: , firstName: Bianca, lastName: Rieder, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:29:04.425+00	345
628	[INFO] Person mit der id 89 gespeichert. personId: 89, salutation: Herr, title: , firstName: , lastName: Eberl, comment: Koch gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:29:40.862+00	345
629	[INFO] Person mit der id 595 gespeichert. personId: 595, salutation: Herr, title: , firstName: , lastName: Reischl, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:30:53.315+00	345
630	[INFO] Person mit der id 628 gespeichert. personId: 628, salutation: Frau, title: Mag., firstName: Christina, lastName: Laggner, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:31:50.985+00	345
631	[INFO] Person mit der id 629 gespeichert. personId: 629, salutation: Herr, title: MSc, firstName: Andreas, lastName: Van-Hametner, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:35:44.224+00	345
632	[INFO] Person mit der id 630 gespeichert. personId: 630, salutation: Herr Bakk.Komm., title: , firstName: Martin, lastName: Wautischer, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:37:36.133+00	345
633	[INFO] Person mit der id 59 gespeichert. personId: 59, salutation: Herr, title: , firstName: Wolfgang, lastName: Brudl, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:38:01.598+00	345
634	[INFO] Person mit der id 8 gespeichert. personId: 8, salutation: Schwester, title: , firstName: Bernadette, lastName:  , comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:38:33.397+00	345
635	[INFO] Person mit der id 631 gespeichert. personId: 631, salutation: Frau, title: Mag., firstName: Dagmar, lastName: Köttl, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:39:12.167+00	345
636	[INFO] Person mit der id 631 gespeichert. personId: 631, salutation: Frau, title: Mag., firstName: Dagmar, lastName: Köttl, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:39:25.071+00	345
637	[INFO] Person mit der id 527 gespeichert. personId: 527, salutation: Herr Ök.-Rat., title: , firstName: Walter, lastName: Strasser, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:39:52.098+00	345
638	[INFO] Person mit der id 632 gespeichert. personId: 632, salutation: Herr, title: Ing., firstName: Josef, lastName: Putz, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:41:25.176+00	345
639	[INFO] Person mit der id 633 gespeichert. personId: 633, salutation: Frau, title: , firstName: Roswitha, lastName: Beranek, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:43:07.342+00	345
640	[INFO] Person mit der id 634 gespeichert. personId: 634, salutation: Frau President, title: Dr., firstName: Maria, lastName: Ganauser, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:44:14.341+00	345
641	[INFO] Person mit der id 635 gespeichert. personId: 635, salutation: Frau, title: , firstName: Claudia, lastName: Eigenherr-Tschugmell, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:45:09.545+00	345
642	[INFO] Person mit der id 636 gespeichert. personId: 636, salutation: Herr, title: , firstName: Franz, lastName: Müller, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:46:05.814+00	345
643	[INFO] Person mit der id 206 gespeichert. personId: 206, salutation: Frau, title: , firstName: Veronika, lastName: Hirnböck, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:47:08.081+00	345
644	[INFO] Person mit der id 206 gelöscht	2015-05-14 20:47:50.515+00	345
645	[INFO] Person mit der id 8 gelöscht	2015-05-14 20:48:26.519+00	345
646	[INFO] Person mit der id 3 gelöscht	2015-05-14 20:48:44.932+00	345
647	[INFO] Person mit der id 327 gelöscht	2015-05-14 20:49:18.775+00	345
648	[INFO] Person mit der id 187 gelöscht	2015-05-14 20:50:36.579+00	345
649	[INFO] Person mit der id 45 gelöscht	2015-05-14 20:51:12.421+00	345
650	[INFO] Person mit der id 289 gelöscht	2015-05-14 20:51:34.807+00	345
651	[INFO] Person mit der id 89 gelöscht	2015-05-14 20:53:06.001+00	345
652	[INFO] Person mit der id 59 gelöscht	2015-05-14 20:53:37.198+00	345
653	[INFO] Person mit der id 16 gelöscht	2015-05-14 20:54:27.619+00	345
654	[INFO] Person mit der id 316 gelöscht	2015-05-14 20:54:58.448+00	345
655	[INFO] Person mit der id 210 gelöscht	2015-05-14 20:55:20.529+00	345
656	[INFO] Person mit der id 538 gelöscht	2015-05-14 20:55:38.768+00	345
657	[INFO] Person mit der id 388 gelöscht	2015-05-14 20:55:55.182+00	345
658	[INFO] Person mit der id 562 gelöscht	2015-05-14 20:56:17.022+00	345
659	[INFO] Person mit der id 110 gelöscht	2015-05-14 20:56:44.359+00	345
660	[INFO] Person mit der id 503 gelöscht	2015-05-14 20:57:03.996+00	345
661	[INFO] Person mit der id 360 gelöscht	2015-05-14 20:57:25.049+00	345
662	[INFO] Person mit der id 534 gelöscht	2015-05-14 20:57:48.367+00	345
663	[INFO] Person mit der id 28 gespeichert. personId: 28, salutation: Frau, title: , firstName: Elfi, lastName: Baier, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 20:58:43.654+00	345
664	[INFO] Person mit der id 28 gespeichert. personId: 28, salutation: Frau, title: , firstName: Elfi, lastName: Baier, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 21:01:59.05+00	345
665	[INFO] Person mit der id 587 gespeichert. personId: 587, salutation: Frau, title: , firstName: Elisabeth, lastName: Windhofer, comment: gelöscht, updateTimestamp: 2015-05-14, active: 1	2015-05-14 21:07:38.935+00	345
667	[INFO] Person mit der id 637 gespeichert. personId: 637, salutation: Frau, title: , firstName: Bernadette, lastName: Hawel, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 21:10:03.365+00	345
668	[INFO] Person mit der id 638 gespeichert. personId: 638, salutation: Herr, title: Mag. (FH), firstName: Duško, lastName: Stojaković, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 21:11:18.023+00	345
669	[INFO] Person mit der id 639 gespeichert. personId: 639, salutation: Herr, title: MBA, firstName: Michael, lastName: Florian, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 21:12:46.372+00	345
670	[INFO] Person mit der id 640 gespeichert. personId: 640, salutation: Herr, title: Mag., firstName: Bernd, lastName: Huber, comment: , updateTimestamp: 2015-05-14, active: 1	2015-05-14 21:13:56.345+00	345
672	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-15 12:34:06.397+00	345
673	[INFO] Passwort für Person mit Id 345 geändert.	2015-05-15 12:34:31.549+00	345
674	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-15 12:34:49.84+00	345
675	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-15 12:46:06.78+00	345
676	[INFO] Organisation mit der id 3 gespeichert. organisationId: 3, name: ADEG Österreich HandelsAG, comment: , updateTimestamp: Fri May 15 12:47:04 UTC 2015, active: 1	2015-05-15 12:47:04.54+00	345
677	[INFO] Organisation mit der id 14 gespeichert. organisationId: 14, name: Bauer & Thürridl HandelsGmbH, comment: , updateTimestamp: Fri May 15 12:47:58 UTC 2015, active: 1	2015-05-15 12:47:58.961+00	345
678	[INFO] Organisation mit der id 19 gespeichert. organisationId: 19, name: Bio-Nahrungsmittel GmbH, comment: , updateTimestamp: Fri May 15 12:50:40 UTC 2015, active: 1	2015-05-15 12:50:40.259+00	345
679	[INFO] Organisation mit der id 229 gespeichert. organisationId: 229, name: Bonduelle Deutschland GmbH, comment: Webseite: ja, updateTimestamp: Fri May 15 12:52:55 UTC 2015, active: 1	2015-05-15 12:52:55.965+00	345
680	[INFO] Organisation mit der id 230 gespeichert. organisationId: 230, name: Cologne Business School, comment: , updateTimestamp: Fri May 15 12:55:05 UTC 2015, active: 1	2015-05-15 12:55:05.57+00	345
681	[INFO] Organisation mit der id 26 gespeichert. organisationId: 26, name: Concept Fresh VertriebsGmbH, comment: , updateTimestamp: Fri May 15 12:56:23 UTC 2015, active: 1	2015-05-15 12:56:23.175+00	345
682	[INFO] Organisation mit der id 231 gespeichert. organisationId: 231, name: DESK TOP MEDIA GmbH, comment: , updateTimestamp: Fri May 15 12:58:48 UTC 2015, active: 1	2015-05-15 12:58:48.662+00	345
683	[INFO] Organisation mit der id 232 gespeichert. organisationId: 232, name: Doringer Werbenetzwerk GmbH, comment: , updateTimestamp: Fri May 15 13:00:33 UTC 2015, active: 1	2015-05-15 13:00:33.228+00	345
684	[INFO] Organisation mit der id 35 gespeichert. organisationId: 35, name: Erzdiözese Salzburg, comment: , updateTimestamp: Fri May 15 13:02:13 UTC 2015, active: 1	2015-05-15 13:02:13.78+00	345
685	[INFO] Person mit der id 233 gespeichert. personId: 233, salutation: Frau, title: Mag., firstName: Andrea, lastName: Huttegger, comment: Pressereferentin, Amt für Kommunikation und Öffentlichkeitsarbeit, updateTimestamp: 2015-05-15, active: 1	2015-05-15 13:03:04.487+00	345
686	[INFO] Organisation mit der id 38 gespeichert. organisationId: 38, name: Jugend-Notschlafstelle Exit 7, comment: , updateTimestamp: Fri May 15 13:05:28 UTC 2015, active: 1	2015-05-15 13:05:28.766+00	345
687	[INFO] Organisation mit der id 233 gespeichert. organisationId: 233, name: Fachhochschule Salzburg GmbH, comment: , updateTimestamp: Fri May 15 13:07:00 UTC 2015, active: 1	2015-05-15 13:07:00.147+00	345
688	[INFO] Organisation mit der id 43 gespeichert. organisationId: 43, name: Franz Gramiller & Sohn GmbH, comment: , updateTimestamp: Fri May 15 13:08:28 UTC 2015, active: 1	2015-05-15 13:08:28.012+00	345
689	[INFO] Organisation mit der id 44 gespeichert. organisationId: 44, name: Franziskaner Kloster Salzburg, comment: , updateTimestamp: Fri May 15 13:09:28 UTC 2015, active: 1	2015-05-15 13:09:28.049+00	345
690	[INFO] Person mit der id 6 gespeichert. personId: 6, salutation: Pater, title: , firstName: Alexander, lastName: Puchberger, comment: Guardian, updateTimestamp: 2015-05-15, active: 1	2015-05-15 13:10:05.114+00	345
691	[INFO] Organisation mit der id 51 gespeichert. organisationId: 51, name: Gebrüder Weiss GmbH, comment: , updateTimestamp: Fri May 15 13:11:34 UTC 2015, active: 1	2015-05-15 13:11:34.481+00	345
692	[INFO] Organisation mit der id 53 gespeichert. organisationId: 53, name: Geissler Cosmetics GmbH, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:13:27 UTC 2015, active: 1	2015-05-15 13:13:27.915+00	345
693	[INFO] Organisation mit der id 229 gespeichert. organisationId: 229, name: Bonduelle Deutschland GmbH, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:14:27 UTC 2015, active: 1	2015-05-15 13:14:27.499+00	345
694	[INFO] Organisation mit der id 4 gespeichert. organisationId: 4, name: Adhurricane Advertising GmbH, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:14:44 UTC 2015, active: 1	2015-05-15 13:14:44.612+00	345
695	[INFO] Organisation mit der id 227 gespeichert. organisationId: 227, name: Commend International GmbH, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:15:00 UTC 2015, active: 1	2015-05-15 13:15:00.312+00	345
696	[INFO] Organisation mit der id 30 gespeichert. organisationId: 30, name: Dr.-Viktor-Freiherr-von-Fuchs-Stiftung, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:15:22 UTC 2015, active: 1	2015-05-15 13:15:22.186+00	345
697	[INFO] Organisation mit der id 41 gespeichert. organisationId: 41, name: Format Orange, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:19:26 UTC 2015, active: 1	2015-05-15 13:19:26.047+00	345
698	[INFO] Organisation mit der id 42 gespeichert. organisationId: 42, name: Foto Sulzer, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:19:40 UTC 2015, active: 1	2015-05-15 13:19:40.164+00	345
699	[INFO] Organisation mit der id 47 gespeichert. organisationId: 47, name: Freie Christengemeinde, comment: Webseite: Ja, updateTimestamp: Fri May 15 13:19:56 UTC 2015, active: 1	2015-05-15 13:19:56.292+00	345
700	[INFO] Organisation mit der id 103 gespeichert. organisationId: 103, name: Lions Club Elsbethen, comment: Kontakt über Walter Riezinger, updateTimestamp: Fri May 15 13:20:42 UTC 2015, active: 1	2015-05-15 13:20:42.133+00	345
701	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-15 13:23:23.698+00	345
702	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-15 13:23:33.83+00	345
703	[INFO] Organisation mit der id 63 gespeichert. organisationId: 63, name: HBLA Ursprung, comment: , updateTimestamp: Fri May 15 13:26:39 UTC 2015, active: 1	2015-05-15 13:26:39.717+00	345
704	[INFO] Organisation mit der id 70 gespeichert. organisationId: 70, name: IBM Salzburg, comment: , updateTimestamp: Fri May 15 13:31:15 UTC 2015, active: 1	2015-05-15 13:31:15.47+00	345
705	[INFO] Organisation mit der id 234 gespeichert. organisationId: 234, name: IBM Austria, comment: , updateTimestamp: Fri May 15 13:32:58 UTC 2015, active: 1	2015-05-15 13:32:58.257+00	345
748	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-17 09:38:09.076+00	253
706	[INFO] Person mit der id 641 gespeichert. personId: 641, salutation: Herr, title: Mag., firstName: Helmut, lastName: Oszvald, comment: , updateTimestamp: 2015-05-15, active: 1	2015-05-15 13:34:43.428+00	345
707	[INFO] Organisation mit der id 234 gespeichert. organisationId: 234, name: IBM Austria, comment: , updateTimestamp: Fri May 15 13:35:12 UTC 2015, active: 1	2015-05-15 13:35:12.982+00	345
708	[INFO] Organisation mit der id 234 gespeichert. organisationId: 234, name: IBM Austria, comment: , updateTimestamp: Fri May 15 13:35:33 UTC 2015, active: 1	2015-05-15 13:35:33.049+00	345
709	[INFO] Person mit der id 345 gespeichert. personId: 345, salutation: Frau, title: , firstName: Doina, lastName: Moldovan, comment: Tätigkeit: Öffentlichkeit, updateTimestamp: 2015-02-24, active: 1	2015-05-15 13:43:16.717+00	345
754	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-17 18:36:37.903+00	345
710	[INFO] Person mit der id 345 gespeichert. personId: 345, salutation: Frau, title: , firstName: Doina, lastName: Moldovan, comment: Tätigkeit: Öffentlichkeit, updateTimestamp: 2015-02-24, active: 1	2015-05-15 13:43:40.976+00	345
711	[INFO] Person mit der id 2 gespeichert. personId: 2, salutation: Schwester, title: , firstName: Berta, lastName:  , comment: , updateTimestamp: 2015-05-15, active: 1	2015-05-15 13:44:04.658+00	345
712	[INFO] Person mit der id 2 gespeichert. personId: 2, salutation: Schwester, title: , firstName: Berta, lastName:  , comment: , updateTimestamp: 2015-05-15, active: 1	2015-05-15 13:44:14.398+00	345
713	[INFO] Organisation mit der id 70 gespeichert. organisationId: 70, name: IBM Salzburg, comment: , updateTimestamp: Fri May 15 13:52:07 UTC 2015, active: 1	2015-05-15 13:52:07.83+00	345
714	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-15 13:57:08.581+00	345
715	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-15 13:58:55.425+00	345
716	[INFO] Person mit der id 633 gespeichert. personId: 633, salutation: Frau, title: , firstName: Roswitha, lastName: Beranek, comment: Assistentin der Geschäftsführung, updateTimestamp: 2015-05-15, active: 1	2015-05-15 13:59:16.666+00	345
717	[INFO] Organisation mit der id 90 gespeichert. organisationId: 90, name: Land-Leben Nahrungsmittel GmbH, comment: Webseite Ja, updateTimestamp: Fri May 15 14:00:51 UTC 2015, active: 1	2015-05-15 14:00:51.659+00	345
718	[INFO] Organisation mit der id 99 gespeichert. organisationId: 99, name: Lebenshilfe Werkstätte, comment: , updateTimestamp: Fri May 15 14:01:23 UTC 2015, active: 1	2015-05-15 14:01:23.01+00	345
719	[INFO] Organisation mit der id 100 gespeichert. organisationId: 100, name: Lebenshilfe Wohnhaus, comment: , updateTimestamp: Fri May 15 14:01:51 UTC 2015, active: 1	2015-05-15 14:01:51.74+00	345
720	[INFO] Organisation mit der id 235 gespeichert. organisationId: 235, name: Kuratorium für Journalistenausbildung, comment: , updateTimestamp: Fri May 15 14:06:26 UTC 2015, active: 1	2015-05-15 14:06:26.821+00	345
721	[INFO] Organisation mit der id 236 gespeichert. organisationId: 236, name: LK Salzburg, comment: , updateTimestamp: Fri May 15 14:07:51 UTC 2015, active: 1	2015-05-15 14:07:51.17+00	345
722	[INFO] Organisation mit der id 236 gespeichert. organisationId: 236, name: LK Salzburg, comment: , updateTimestamp: Fri May 15 14:08:17 UTC 2015, active: 1	2015-05-15 14:08:17.395+00	345
723	[INFO] Organisation mit der id 236 gespeichert. organisationId: 236, name: LK Salzburg, comment: , updateTimestamp: Fri May 15 14:08:42 UTC 2015, active: 1	2015-05-15 14:08:42.679+00	345
724	[INFO] Organisation mit der id 237 gespeichert. organisationId: 237, name: Rieger Weinloft, comment: , updateTimestamp: Fri May 15 14:12:47 UTC 2015, active: 1	2015-05-15 14:12:47.841+00	345
725	[INFO] Organisation mit der id 154 gespeichert. organisationId: 154, name: S. SPITZ GmbH, comment: , updateTimestamp: Fri May 15 14:13:16 UTC 2015, active: 1	2015-05-15 14:13:16.451+00	345
726	[INFO] Organisation mit der id 238 gespeichert. organisationId: 238, name: Salzburger Bauernbund, comment: , updateTimestamp: Fri May 15 14:14:27 UTC 2015, active: 1	2015-05-15 14:14:27.93+00	345
727	[INFO] Organisation mit der id 239 gespeichert. organisationId: 239, name: Salzburger Seniorenbund, comment: , updateTimestamp: Fri May 15 14:16:02 UTC 2015, active: 1	2015-05-15 14:16:02.43+00	345
728	[INFO] Organisation mit der id 142 gespeichert. organisationId: 142, name: R&S GOURMET EXPRESS VertriebsGmbH, comment: Webseite Ja, updateTimestamp: Fri May 15 14:17:43 UTC 2015, active: 1	2015-05-15 14:17:43.677+00	345
729	[INFO] Organisation mit der id 129 gespeichert. organisationId: 129, name: Palfinger AG, comment: Webseite Ja\nKontakt über Walter Riezinger, updateTimestamp: Fri May 15 14:19:44 UTC 2015, active: 1	2015-05-15 14:19:44.527+00	345
730	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-15 14:23:16.652+00	253
731	[INFO] Person mit der id 587 gelöscht	2015-05-15 14:33:54.027+00	345
732	[INFO] Organisation mit der id 204 gespeichert. organisationId: 204, name: Traunsteiner Tafel, comment: , updateTimestamp: Fri May 15 14:36:03 UTC 2015, active: 1	2015-05-15 14:36:03.158+00	345
733	[INFO] Organisation mit der id 199 gelöscht	2015-05-15 14:36:49.965+00	345
734	[INFO] Organisation mit der id 200 gespeichert. organisationId: 200, name: Stiegl Getränke & Service GmbH & Co KG, comment: Webseite Ja, updateTimestamp: Fri May 15 14:37:04 UTC 2015, active: 1	2015-05-15 14:37:04.216+00	345
735	[INFO] Organisation mit der id 240 gespeichert. organisationId: 240, name: Stiegl Getränke & Service GmbH & Co KG, comment: , updateTimestamp: Fri May 15 14:37:48 UTC 2015, active: 1	2015-05-15 14:37:48.586+00	345
736	[INFO] Organisation mit der id 200 gespeichert. organisationId: 200, name: Stieglbrauerei zu Salzburg GmbH, comment: Webseite Ja, updateTimestamp: Fri May 15 14:38:14 UTC 2015, active: 1	2015-05-15 14:38:14.989+00	345
737	[INFO] Organisation mit der id 240 gespeichert. organisationId: 240, name: Stiegl Getränke & Service GmbH & Co KG, comment: , updateTimestamp: Fri May 15 14:39:08 UTC 2015, active: 1	2015-05-15 14:39:08.643+00	345
738	[INFO] Organisation mit der id 191 gespeichert. organisationId: 191, name: SOS-Kinderdorf Clearinghouse, comment: , updateTimestamp: Fri May 15 14:40:12 UTC 2015, active: 1	2015-05-15 14:40:12.566+00	345
739	[INFO] Organisation mit der id 165 gespeichert. organisationId: 165, name: San Helios, comment: , updateTimestamp: Fri May 15 14:41:02 UTC 2015, active: 1	2015-05-15 14:41:02.234+00	345
740	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-15 14:43:14.423+00	253
741	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-15 14:46:29.573+00	253
742	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-15 14:54:52.79+00	253
743	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-15 15:04:56.511+00	253
744	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-15 15:05:00.361+00	253
745	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-15 15:05:28.12+00	253
746	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-15 15:38:03.546+00	253
747	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-15 15:40:06.603+00	253
749	[INFO] Organisation mit der id 71 gespeichert. organisationId: 71, name: Industriellenvereinigung Salzburg, comment: , updateTimestamp: Sun May 17 11:42:34 CEST 2015, active: 1	2015-05-17 09:42:34.991+00	253
750	[INFO] Organisation mit der id 71 gespeichert. organisationId: 71, name: Industriellenvereinigung Salzburg, comment: , updateTimestamp: Sun May 17 11:43:59 CEST 2015, active: 1	2015-05-17 09:43:59.893+00	253
751	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-17 10:14:38.812+00	253
752	[INFO] Organisation mit der id 71 gespeichert. organisationId: 71, name: Industriellenvereinigung Salzburg, comment: , updateTimestamp: Sun May 17 10:15:25 UTC 2015, active: 1	2015-05-17 10:15:25.468+00	253
753	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-17 10:57:31.958+00	253
755	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-17 18:36:44.974+00	345
756	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-18 15:35:00.45+00	519
757	[INFO] Wareneingang mit der id 9 gespeichert	2015-05-18 16:06:39.845+00	519
758	[INFO] Wareneingang mit der id 9 gespeichert	2015-05-18 16:14:33.791+00	519
759	[INFO] Wareneingang mit der id 9 gespeichert	2015-05-18 16:15:58.475+00	519
760	[INFO] Wareneingang mit der id 9 gespeichert	2015-05-18 16:19:59.591+00	519
761	[INFO] Warenausgang mit der id 36 gespeichert	2015-05-18 16:22:59.476+00	519
762	[INFO] Warenausgang mit der id 36 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:23:09.602+00	519
763	[INFO] Wareneingang mit der id 9 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:24:14.291+00	519
764	[INFO] Warenausgang mit der id 36 gespeichert	2015-05-18 16:24:43.583+00	519
765	[INFO] Wareneingang mit der id 10 gespeichert	2015-05-18 16:38:59.683+00	519
766	[INFO] Warenausgang mit der id 37 gespeichert	2015-05-18 16:40:04.997+00	519
767	[INFO] Warenausgang mit der id 38 gespeichert	2015-05-18 16:40:36.925+00	519
768	[INFO] Warenausgang mit der id 39 gespeichert	2015-05-18 16:41:22.454+00	519
769	[INFO] Warenausgang mit der id 37 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:41:41.96+00	519
770	[INFO] Warenausgang mit der id 39 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:41:52.908+00	519
771	[INFO] Warenausgang mit der id 38 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:41:55.991+00	519
772	[INFO] Wareneingang mit der id 10 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:42:02.975+00	519
773	[INFO] Warenausgang mit der id 36 auf Archivierungsstatus 0 gesetzt	2015-05-18 16:42:45.696+00	519
774	[INFO] Warenausgang mit der id 36 gespeichert	2015-05-18 16:43:12.673+00	519
775	[INFO] Wareneingang mit der id 9 auf Archivierungsstatus 0 gesetzt	2015-05-18 16:43:42.717+00	519
776	[INFO] Warenausgang mit der id 36 gelöscht	2015-05-18 16:44:48.575+00	519
777	[INFO] Wareneingang mit der id 9 gespeichert	2015-05-18 16:45:17.31+00	519
778	[INFO] Wareneingang mit der id 9 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:45:57.572+00	519
779	[INFO] Warenausgang mit der id 40 gespeichert	2015-05-18 16:46:36.581+00	519
780	[INFO] Warenausgang mit der id 40 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:46:40.943+00	519
781	[INFO] Wareneingang mit der id 11 gespeichert	2015-05-18 16:54:19.198+00	519
782	[INFO] Wareneingang mit der id 11 gespeichert	2015-05-18 16:55:55.181+00	519
783	[INFO] Warenausgang mit der id 41 gespeichert	2015-05-18 16:56:53.842+00	519
784	[INFO] Warenausgang mit der id 42 gespeichert	2015-05-18 16:58:16.291+00	519
785	[INFO] Warenausgang mit der id 41 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:58:36.67+00	519
786	[INFO] Warenausgang mit der id 42 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:58:38.876+00	519
787	[INFO] Wareneingang mit der id 11 auf Archivierungsstatus 1 gesetzt	2015-05-18 16:58:42.811+00	519
788	[INFO] Organisation mit der id 241 gespeichert. organisationId: 241, name: Stadtlesen, comment: , updateTimestamp: Mon May 18 17:07:31 UTC 2015, active: 1	2015-05-18 17:07:31.213+00	519
789	[INFO] Wareneingang mit der id 12 gespeichert	2015-05-18 17:21:22.715+00	519
790	[INFO] Wareneingang mit der id 12 gespeichert	2015-05-18 17:21:42.834+00	519
791	[INFO] Warenausgang mit der id 43 gespeichert	2015-05-18 17:24:15.439+00	519
792	[INFO] Warenausgang mit der id 44 gespeichert	2015-05-18 17:25:30.22+00	519
793	[INFO] Warenausgang mit der id 45 gespeichert	2015-05-18 17:26:01.752+00	519
794	[INFO] Warenausgang mit der id 45 gespeichert	2015-05-18 17:27:26.215+00	519
795	[INFO] Warenausgang mit der id 46 gespeichert	2015-05-18 17:28:01.961+00	519
796	[INFO] Warenausgang mit der id 46 gelöscht	2015-05-18 17:31:22.02+00	519
797	[INFO] Warenausgang mit der id 45 gelöscht	2015-05-18 17:31:27.996+00	519
798	[INFO] Warenausgang mit der id 43 gelöscht	2015-05-18 17:31:32.057+00	519
799	[INFO] Warenausgang mit der id 44 gelöscht	2015-05-18 17:31:35.518+00	519
800	[INFO] Wareneingang mit der id 12 gespeichert	2015-05-18 17:32:21.954+00	519
801	[INFO] Warenausgang mit der id 47 gespeichert	2015-05-18 17:33:06.471+00	519
802	[INFO] Warenausgang mit der id 48 gespeichert	2015-05-18 17:33:35.222+00	519
803	[INFO] Warenausgang mit der id 49 gespeichert	2015-05-18 17:34:02.526+00	519
804	[INFO] Warenausgang mit der id 50 gespeichert	2015-05-18 17:34:23.019+00	519
805	[INFO] Warenausgang mit der id 52 gespeichert	2015-05-18 17:35:16.367+00	519
806	[INFO] Warenausgang mit der id 53 gespeichert	2015-05-18 17:35:36.557+00	519
807	[INFO] Person mit der id 10 gelöscht	2015-05-18 17:38:02.738+00	519
808	[INFO] Person mit der id 527 gespeichert. personId: 527, salutation: Herr Ök.-Rat., title: , firstName: Walter, lastName: Strasser, comment: , updateTimestamp: 2015-05-18, active: 1	2015-05-18 17:39:19.241+00	519
809	[INFO] Wareneingang mit der id 12 auf Archivierungsstatus 1 gesetzt	2015-05-18 17:54:08.209+00	519
810	[INFO] Warenausgang mit der id 47 auf Archivierungsstatus 1 gesetzt	2015-05-18 17:54:15.42+00	519
811	[INFO] Warenausgang mit der id 52 auf Archivierungsstatus 1 gesetzt	2015-05-18 17:54:20.784+00	519
812	[INFO] Warenausgang mit der id 53 auf Archivierungsstatus 1 gesetzt	2015-05-18 17:54:24.989+00	519
813	[INFO] Warenausgang mit der id 48 auf Archivierungsstatus 1 gesetzt	2015-05-18 17:54:27.164+00	519
814	[INFO] Warenausgang mit der id 49 auf Archivierungsstatus 1 gesetzt	2015-05-18 17:54:29.385+00	519
815	[INFO] Warenausgang mit der id 50 auf Archivierungsstatus 1 gesetzt	2015-05-18 17:54:31.672+00	519
816	[INFO] Person mit der id 574 gespeichert. personId: 574, salutation: Frau, title: , firstName: Ulrike, lastName: Wenzlhuemer, comment: Tätigkeit: Admin, updateTimestamp: 2015-05-18, active: 1	2015-05-18 18:00:27.526+00	519
817	[INFO] Person mit der id 602 gespeichert. personId: 602, salutation: Frau, title: , firstName: Sabine, lastName: Zöpfl, comment: Tätigkeit: Waren, updateTimestamp: 2015-05-18, active: 1	2015-05-18 18:01:49.139+00	519
950	[INFO] Warenausgang mit der id 70 gespeichert	2015-05-23 16:36:50.393+00	519
818	[INFO] Person mit der id 642 gespeichert. personId: 642, salutation: Frau, title: , firstName: Lisa, lastName: Traubenek, comment: , updateTimestamp: 2015-05-18, active: 1	2015-05-18 18:03:29.994+00	519
819	[INFO] Person mit der id 642 gespeichert. personId: 642, salutation: Frau, title: , firstName: Lisa, lastName: Traubenek, comment: , updateTimestamp: 2015-05-18, active: 1	2015-05-18 18:04:07.487+00	519
820	[INFO] Person mit der id 602 gespeichert. personId: 602, salutation: Frau, title: , firstName: Sabine, lastName: Zöpfl, comment: Tätigkeit: Waren, updateTimestamp: 2015-05-18, active: 1	2015-05-18 18:04:30.646+00	519
821	[INFO] Person mit der id 574 gespeichert. personId: 574, salutation: Frau, title: , firstName: Ulrike, lastName: Wenzlhuemer, comment: Tätigkeit: Admin, updateTimestamp: 2015-05-18, active: 1	2015-05-18 18:04:48.197+00	519
822	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-18 18:05:13.085+00	519
823	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-19 11:55:14.875+00	519
824	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-19 18:57:53.073+00	519
825	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-19 19:10:27.097+00	519
826	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-05-20 11:54:14.966+00	602
830	[INFO] Wareneingang mit der id 13 gelöscht	2015-05-20 12:34:24.839+00	602
831	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-20 17:42:46.955+00	519
834	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-20 18:01:31.301+00	519
835	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-20 20:39:02.756+00	345
849	[INFO] Person mit der id 643 gespeichert. personId: 643, salutation: Herr, title: , firstName: Hugo, lastName: Rohner, comment: , updateTimestamp: 2015-05-20, active: 1	2015-05-20 20:56:12.768+00	345
827	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-05-20 12:28:20.748+00	602
828	[INFO] Wareneingang mit der id 13 gespeichert	2015-05-20 12:32:25.108+00	602
836	[INFO] Organisation mit der id 71 gespeichert. organisationId: 71, name: Industriellenvereinigung, comment: , updateTimestamp: Wed May 20 20:43:23 UTC 2015, active: 1	2015-05-20 20:43:23.137+00	345
837	[INFO] Organisation mit der id 77 gespeichert. organisationId: 77, name: J. Gschwandtner ImportGmbH., comment: , updateTimestamp: Wed May 20 20:44:40 UTC 2015, active: 1	2015-05-20 20:44:40.102+00	345
838	[INFO] Organisation mit der id 235 gespeichert. organisationId: 235, name: Kuratorium für Journalistenausbildung, comment: , updateTimestamp: Wed May 20 20:45:42 UTC 2015, active: 1	2015-05-20 20:45:42.436+00	345
839	[INFO] Organisation mit der id 108 gespeichert. organisationId: 108, name: Manfred Roth BackwarenerzeugungsGmbH, comment: Webseite offen, updateTimestamp: Wed May 20 20:46:28 UTC 2015, active: 1	2015-05-20 20:46:28.287+00	345
840	[INFO] Organisation mit der id 118 gespeichert. organisationId: 118, name: Nähr-Engel GmbH, comment: , updateTimestamp: Wed May 20 20:46:54 UTC 2015, active: 1	2015-05-20 20:46:54.041+00	345
841	[INFO] Organisation mit der id 123 gespeichert. organisationId: 123, name: NÜRNBERGER Versicherung AG, comment: Webseite Ja, updateTimestamp: Wed May 20 20:47:29 UTC 2015, active: 1	2015-05-20 20:47:29.458+00	345
842	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-20 20:48:50.272+00	345
843	[INFO] Organisation mit der id 242 gespeichert. organisationId: 242, name: Ökosoziales Forum Österreich|Europa, comment: , updateTimestamp: Wed May 20 20:50:08 UTC 2015, active: 1	2015-05-20 20:50:08.063+00	345
844	[INFO] Organisation mit der id 125 gespeichert. organisationId: 125, name: Öller-Brandstätter HandelsGmbH, comment: , updateTimestamp: Wed May 20 20:50:49 UTC 2015, active: 1	2015-05-20 20:50:49.739+00	345
845	[INFO] Organisation mit der id 243 gespeichert. organisationId: 243, name: Österreichisch-Amerikanische Gesellschaft, comment: , updateTimestamp: Wed May 20 20:51:51 UTC 2015, active: 1	2015-05-20 20:51:51.84+00	345
846	[INFO] Organisation mit der id 56 gespeichert. organisationId: 56, name: Pappas AutomobilvertriebsGmbH, comment: Webseite ja, updateTimestamp: Wed May 20 20:52:19 UTC 2015, active: 1	2015-05-20 20:52:19.962+00	345
847	[INFO] Organisation mit der id 239 gespeichert. organisationId: 239, name: Salzburger Seniorenbund, comment: , updateTimestamp: Wed May 20 20:53:19 UTC 2015, active: 1	2015-05-20 20:53:19.665+00	345
848	[INFO] Organisation mit der id 244 gespeichert. organisationId: 244, name: SKIDATA AG, comment: , updateTimestamp: Wed May 20 20:55:02 UTC 2015, active: 1	2015-05-20 20:55:02.624+00	345
850	[INFO] Organisation mit der id 244 gespeichert. organisationId: 244, name: SKIDATA AG, comment: , updateTimestamp: Wed May 20 20:56:44 UTC 2015, active: 1	2015-05-20 20:56:44.176+00	345
851	[INFO] Organisation mit der id 193 gespeichert. organisationId: 193, name: Sozialwerk Hallein, comment: Selbstabholer, updateTimestamp: Wed May 20 20:57:28 UTC 2015, active: 1	2015-05-20 20:57:28.499+00	345
852	[INFO] Organisation mit der id 245 gespeichert. organisationId: 245, name: Stadt Salzburg - Magistrat, comment: , updateTimestamp: Wed May 20 20:58:56 UTC 2015, active: 1	2015-05-20 20:58:56.586+00	345
829	[INFO] Wareneingang mit der id 13 gespeichert	2015-05-20 12:32:59.906+00	602
832	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-20 17:51:55.171+00	519
833	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-20 17:51:56.899+00	519
853	[INFO] Organisation mit der id 245 gespeichert. organisationId: 245, name: Magistrat der Stadt Salzburg, comment: , updateTimestamp: Wed May 20 21:01:27 UTC 2015, active: 1	2015-05-20 21:01:27.147+00	345
854	[INFO] Organisation mit der id 245 gespeichert. organisationId: 245, name: Stadt Salzburg - Magistrat , comment: , updateTimestamp: Wed May 20 21:03:20 UTC 2015, active: 1	2015-05-20 21:03:20.616+00	345
855	[INFO] Organisation mit der id 198 gespeichert. organisationId: 198, name: Stadt Salzburg - Stadtsenat, comment: , updateTimestamp: Wed May 20 21:03:40 UTC 2015, active: 1	2015-05-20 21:03:40.78+00	345
856	[INFO] Organisation mit der id 241 gespeichert. organisationId: 241, name: Stadtlesen VeranstaltungsGmbH, comment: , updateTimestamp: Wed May 20 21:05:24 UTC 2015, active: 1	2015-05-20 21:05:24.908+00	345
857	[INFO] Organisation mit der id 208 gespeichert. organisationId: 208, name: Verein für Alleinerziehende, comment: , updateTimestamp: Wed May 20 21:06:06 UTC 2015, active: 1	2015-05-20 21:06:06.783+00	345
858	[INFO] Organisation mit der id 209 gespeichert. organisationId: 209, name: Viele-Verein für interkulturellen Ansatz, comment: , updateTimestamp: Wed May 20 21:06:39 UTC 2015, active: 1	2015-05-20 21:06:39.729+00	345
859	[INFO] Organisation mit der id 246 gespeichert. organisationId: 246, name: Werner&Mertz Professional VertriebsGmbH, comment: , updateTimestamp: Wed May 20 21:07:43 UTC 2015, active: 1	2015-05-20 21:07:43.496+00	345
860	[INFO] Organisation mit der id 247 gespeichert. organisationId: 247, name: Wirtschaftskammer Österreich , comment: , updateTimestamp: Wed May 20 21:08:48 UTC 2015, active: 1	2015-05-20 21:08:48.534+00	345
861	[INFO] Person mit der id 549 gespeichert. personId: 549, salutation: Frau, title: Dipl.Ing., firstName: Tina, lastName: Tscherteu, comment: , updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:09:48.643+00	345
862	[INFO] Person mit der id 642 gespeichert. personId: 642, salutation: Frau, title: , firstName: Lisa, lastName: Traubenek, comment: Admin., Waren, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:11:50.076+00	345
863	[INFO] Person mit der id 546 gespeichert. personId: 546, salutation: Herr, title: , firstName: Felix, lastName: Tomo, comment: Tätigkeit: Waren, Telefon, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:12:19.137+00	345
864	[INFO] Person mit der id 642 gespeichert. personId: 642, salutation: Frau, title: , firstName: Lisa, lastName: Traubenek, comment: Tätigkeit: Administration, Waren, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:12:44.477+00	345
865	[INFO] Person mit der id 100 gespeichert. personId: 100, salutation: Herr, title: Dr., firstName: Oskar, lastName: Einzinger, comment: Tätigkeit: Waren, Administration, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:13:28.009+00	345
866	[INFO] Person mit der id 149 gespeichert. personId: 149, salutation: Frau, title: , firstName: Christa, lastName: Graf, comment: Tätigkeit: Waren; Newsletter: ja, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:13:53.237+00	345
867	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: Tätigkeit: Disposition, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:14:19.359+00	345
868	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: Tätigkeit: Obfrau, Disposition, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:14:50.69+00	345
869	[INFO] Person mit der id 616 gespeichert. personId: 616, salutation: Herr, title: , firstName: Peter, lastName: Nussbaum, comment: Tätigkeit: Waren, Newsletter: ja, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:15:14.23+00	345
870	[INFO] Person mit der id 574 gespeichert. personId: 574, salutation: Frau, title: , firstName: Ulrike, lastName: Wenzlhuemer, comment: Tätigkeit: Administration, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:15:43.704+00	345
871	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: Dr., firstName: Alois, lastName: Schweiger, comment: Tätigkeit: Waren, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:18:34.968+00	345
872	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-05-20 21:19:58.641+00	345
873	[INFO] Person mit der id 645 gespeichert. personId: 645, salutation: , title: , firstName: Leopold, lastName: Reichenauer, comment: , updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:20:55.923+00	345
874	[INFO] Person mit der id 646 gespeichert. personId: 646, salutation: Frau, title: , firstName: Elisabeth, lastName: Pfeffer, comment: , updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:22:21.26+00	345
875	[INFO] Person mit der id 647 gespeichert. personId: 647, salutation: Frau, title: Dr., firstName: Brigitta, lastName: Pallauf, comment: Newsletter: ja, updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:23:57.638+00	345
876	[INFO] Person mit der id 55 gespeichert. personId: 55, salutation: Frau, title: Mag. Dr., firstName: Brigitte , lastName: Brandstötter, comment: , updateTimestamp: 2015-05-20, active: 1	2015-05-20 21:26:46.73+00	345
877	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-05-20 21:27:02.158+00	345
878	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-05-21 14:52:35.666+00	1
879	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-05-21 14:53:20.918+00	1
880	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-22 10:09:51.006+00	519
881	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-22 10:55:26.24+00	519
882	[INFO] Wareneingang mit der id 14 gespeichert	2015-05-22 11:06:22.931+00	519
883	[INFO] Warenausgang mit der id 54 gespeichert	2015-05-22 11:06:57.558+00	519
884	[INFO] Warenausgang mit der id 54 auf Archivierungsstatus 1 gesetzt	2015-05-22 11:07:06.747+00	519
885	[INFO] Wareneingang mit der id 14 auf Archivierungsstatus 1 gesetzt	2015-05-22 11:07:14.883+00	519
886	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-22 11:07:50.814+00	519
887	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-22 12:38:03.436+00	519
888	[INFO] Wareneingang mit der id 9 auf Archivierungsstatus 0 gesetzt	2015-05-22 12:38:24.715+00	519
889	[INFO] Warenausgang mit der id 40 gelöscht	2015-05-22 12:40:17.07+00	519
890	[INFO] Wareneingang mit der id 9 gelöscht	2015-05-22 12:40:28.839+00	519
891	[INFO] Wareneingang mit der id 15 gespeichert	2015-05-22 12:43:48.712+00	519
892	[INFO] Warenausgang mit der id 55 gespeichert	2015-05-22 12:44:31.394+00	519
893	[INFO] Warenausgang mit der id 55 auf Archivierungsstatus 1 gesetzt	2015-05-22 12:44:37.967+00	519
894	[INFO] Wareneingang mit der id 15 auf Archivierungsstatus 1 gesetzt	2015-05-22 12:45:06.404+00	519
895	[INFO] Warenausgang mit der id 37 auf Archivierungsstatus 0 gesetzt	2015-05-22 12:45:44.46+00	519
896	[INFO] Warenausgang mit der id 37 gelöscht	2015-05-22 12:45:55.753+00	519
897	[INFO] Warenausgang mit der id 39 gelöscht	2015-05-22 12:46:01.413+00	519
898	[INFO] Warenausgang mit der id 38 gelöscht	2015-05-22 12:46:05.757+00	519
899	[INFO] Wareneingang mit der id 10 gelöscht	2015-05-22 12:46:14.071+00	519
901	[INFO] Warenausgang mit der id 56 gespeichert	2015-05-22 12:48:42.834+00	519
902	[INFO] Warenausgang mit der id 57 gespeichert	2015-05-22 12:49:15.845+00	519
904	[INFO] Warenausgang mit der id 56 auf Archivierungsstatus 1 gesetzt	2015-05-22 12:49:55.447+00	519
905	[INFO] Warenausgang mit der id 57 auf Archivierungsstatus 1 gesetzt	2015-05-22 12:49:58.53+00	519
906	[INFO] Warenausgang mit der id 58 auf Archivierungsstatus 1 gesetzt	2015-05-22 12:50:00.897+00	519
907	[INFO] Wareneingang mit der id 16 auf Archivierungsstatus 1 gesetzt	2015-05-22 12:50:07.8+00	519
908	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-22 12:50:53.284+00	519
909	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-23 09:20:50.655+00	519
913	[INFO] Warenausgang mit der id 61 gespeichert	2015-05-23 09:35:43.944+00	519
925	[INFO] Organisation mit der id 248 gespeichert. organisationId: 248, name: Lebenshilfe Wohnhaus, comment: , updateTimestamp: Sat May 23 15:49:06 UTC 2015, active: 1	2015-05-23 15:49:06.541+00	519
928	[INFO] Organisation mit der id 248 gespeichert. organisationId: 248, name: Lebenshilfe Wohnhaus Wagingerstraße, comment: , updateTimestamp: Sat May 23 15:54:16 UTC 2015, active: 1	2015-05-23 15:54:16.8+00	519
929	[INFO] Warenausgang mit der id 66 gespeichert	2015-05-23 15:55:03.812+00	519
930	[INFO] Warenausgang mit der id 66 auf Archivierungsstatus 1 gesetzt	2015-05-23 15:56:10.646+00	519
936	[INFO] Warenausgang mit der id 67 gespeichert	2015-05-23 16:21:23.735+00	519
943	[INFO] Warenausgang mit der id 69 gespeichert	2015-05-23 16:31:33.675+00	519
900	[INFO] Wareneingang mit der id 16 gespeichert	2015-05-22 12:47:49.397+00	519
912	[INFO] Warenausgang mit der id 60 gespeichert	2015-05-23 09:35:14.668+00	519
917	[INFO] Warenausgang mit der id 59 auf Archivierungsstatus 1 gesetzt	2015-05-23 09:41:19.122+00	519
918	[INFO] Warenausgang mit der id 60 auf Archivierungsstatus 1 gesetzt	2015-05-23 09:41:28.287+00	519
919	[INFO] Warenausgang mit der id 61 auf Archivierungsstatus 1 gesetzt	2015-05-23 09:41:35.072+00	519
920	[INFO] Warenausgang mit der id 63 auf Archivierungsstatus 1 gesetzt	2015-05-23 09:41:50.813+00	519
921	[INFO] Warenausgang mit der id 65 auf Archivierungsstatus 1 gesetzt	2015-05-23 09:41:55.437+00	519
924	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-23 15:47:28.293+00	519
931	[INFO] Wareneingang mit der id 18 gespeichert	2015-05-23 16:05:24.408+00	519
932	[INFO] Organisation mit der id 249 gespeichert. organisationId: 249, name: Lebenshilfe Oberndorf, comment: , updateTimestamp: Sat May 23 16:11:41 UTC 2015, active: 1	2015-05-23 16:11:41.928+00	519
933	[INFO] Warenausgang mit der id 62 gespeichert	2015-05-23 16:13:19.628+00	519
934	[INFO] Warenausgang mit der id 62 gelöscht	2015-05-23 16:13:29.084+00	519
935	[INFO] Organisation mit der id 132 gespeichert. organisationId: 132, name: Lebensmittelbrücke / Pfarre Wals, comment: vormals Pfarre Wals oder Vinzitisch, updateTimestamp: Sat May 23 16:15:20 UTC 2015, active: 1	2015-05-23 16:15:20.076+00	519
937	[INFO] Warenausgang mit der id 67 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:21:30.967+00	519
944	[INFO] Warenausgang mit der id 69 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:31:38.812+00	519
947	[INFO] Artikelverteilung für Artikel mit der Id 46 geändert	2015-05-23 16:32:29.836+00	519
948	[INFO] Wareneingang mit der id 14 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:32:39.059+00	519
949	[INFO] Wareneingang mit der id 20 gespeichert	2015-05-23 16:35:15.074+00	519
951	[INFO] Warenausgang mit der id 70 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:36:54.722+00	519
903	[INFO] Warenausgang mit der id 58 gespeichert	2015-05-22 12:49:41.785+00	519
914	[INFO] Warenausgang mit der id 62 gespeichert	2015-05-23 09:36:50.053+00	519
916	[INFO] Warenausgang mit der id 65 gespeichert	2015-05-23 09:37:54.165+00	519
910	[INFO] Wareneingang mit der id 17 gespeichert	2015-05-23 09:33:18.429+00	519
911	[INFO] Warenausgang mit der id 59 gespeichert	2015-05-23 09:34:38.48+00	519
915	[INFO] Warenausgang mit der id 63 gespeichert	2015-05-23 09:37:22.233+00	519
922	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-23 09:44:50.425+00	519
923	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-23 09:44:52.865+00	519
926	[INFO] Person mit der id 648 gespeichert. personId: 648, salutation: Herr, title: MAS, firstName: Kurt, lastName: Schiechl, comment: , updateTimestamp: 2015-05-23, active: 1	2015-05-23 15:51:46.928+00	519
927	[INFO] Organisation mit der id 248 gespeichert. organisationId: 248, name: Lebenshilfe Wohnhaus, comment: , updateTimestamp: Sat May 23 15:52:09 UTC 2015, active: 1	2015-05-23 15:52:09.047+00	519
938	[INFO] Wareneingang mit der id 17 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:21:40.962+00	519
939	[INFO] Warenausgang mit der id 68 gespeichert	2015-05-23 16:24:01.066+00	519
940	[INFO] Warenausgang mit der id 68 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:24:06.212+00	519
941	[INFO] Wareneingang mit der id 18 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:24:12.658+00	519
942	[INFO] Wareneingang mit der id 19 gespeichert	2015-05-23 16:29:13.459+00	519
945	[INFO] Wareneingang mit der id 14 auf Archivierungsstatus 0 gesetzt	2015-05-23 16:31:55.21+00	519
946	[INFO] Wareneingang mit der id 19 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:32:04.934+00	519
952	[INFO] Wareneingang mit der id 20 auf Archivierungsstatus 1 gesetzt	2015-05-23 16:36:59.847+00	519
953	[INFO] Wareneingang mit der id 21 gespeichert	2015-05-23 17:12:39.928+00	519
954	[INFO] Warenausgang mit der id 71 gespeichert	2015-05-23 17:13:43.071+00	519
955	[INFO] Warenausgang mit der id 72 gespeichert	2015-05-23 17:14:10.871+00	519
956	[INFO] Warenausgang mit der id 71 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:14:19.754+00	519
957	[INFO] Warenausgang mit der id 72 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:14:22.318+00	519
958	[INFO] Wareneingang mit der id 21 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:14:31.645+00	519
959	[INFO] Wareneingang mit der id 22 gespeichert	2015-05-23 17:35:17.453+00	519
960	[INFO] Warenausgang mit der id 73 gespeichert	2015-05-23 17:35:57.112+00	519
961	[INFO] Warenausgang mit der id 74 gespeichert	2015-05-23 17:36:33.925+00	519
962	[INFO] Warenausgang mit der id 75 gespeichert	2015-05-23 17:36:57.68+00	519
963	[INFO] Warenausgang mit der id 76 gespeichert	2015-05-23 17:37:34.313+00	519
964	[INFO] Warenausgang mit der id 77 gespeichert	2015-05-23 17:37:59.67+00	519
965	[INFO] Warenausgang mit der id 73 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:39:22.826+00	519
966	[INFO] Warenausgang mit der id 74 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:39:25.491+00	519
967	[INFO] Warenausgang mit der id 75 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:39:27.979+00	519
968	[INFO] Warenausgang mit der id 76 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:39:30.365+00	519
969	[INFO] Warenausgang mit der id 77 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:39:32.782+00	519
970	[INFO] Wareneingang mit der id 22 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:39:37.342+00	519
971	[INFO] Artikel mit der Id 54 für alle Wareneingänge und Warenausgänge gelöscht	2015-05-23 17:40:51.621+00	519
972	[INFO] Wareneingang mit der id 18 auf Archivierungsstatus 0 gesetzt	2015-05-23 17:41:00.048+00	519
973	[INFO] Wareneingang mit der id 18 gelöscht	2015-05-23 17:41:37.025+00	519
974	[INFO] Wareneingang mit der id 23 gespeichert	2015-05-23 17:42:20.843+00	519
975	[INFO] Warenausgang mit der id 78 gespeichert	2015-05-23 17:42:47.2+00	519
976	[INFO] Warenausgang mit der id 78 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:42:50.763+00	519
977	[INFO] Wareneingang mit der id 23 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:42:57.864+00	519
978	[INFO] Artikelverteilung für Artikel mit der Id 59 geändert	2015-05-23 17:53:37.049+00	519
979	[INFO] Wareneingang mit der id 22 auf Archivierungsstatus 0 gesetzt	2015-05-23 17:53:53.423+00	519
980	[INFO] Artikelverteilung für Artikel mit der Id 59 geändert	2015-05-23 17:54:26.945+00	519
981	[INFO] Wareneingang mit der id 22 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:54:30.958+00	519
982	[INFO] Wareneingang mit der id 22 auf Archivierungsstatus 0 gesetzt	2015-05-23 17:55:18.971+00	519
983	[INFO] Wareneingang mit der id 22 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:55:36.988+00	519
984	[INFO] Wareneingang mit der id 22 auf Archivierungsstatus 0 gesetzt	2015-05-23 17:55:45.705+00	519
985	[INFO] Warenausgang mit der id 73 gelöscht	2015-05-23 17:56:12.698+00	519
986	[INFO] Warenausgang mit der id 76 gelöscht	2015-05-23 17:56:29.233+00	519
987	[INFO] Warenausgang mit der id 75 gelöscht	2015-05-23 17:57:20.406+00	519
988	[INFO] Warenausgang mit der id 74 gelöscht	2015-05-23 17:57:25.951+00	519
989	[INFO] Warenausgang mit der id 68 gelöscht	2015-05-23 17:57:59.537+00	519
990	[INFO] Warenausgang mit der id 77 gelöscht	2015-05-23 17:58:08.343+00	519
991	[INFO] Wareneingang mit der id 22 gelöscht	2015-05-23 17:58:25.239+00	519
992	[INFO] Wareneingang mit der id 23 auf Archivierungsstatus 0 gesetzt	2015-05-23 17:58:37.01+00	519
993	[INFO] Wareneingang mit der id 23 gespeichert	2015-05-23 17:58:49.464+00	519
994	[INFO] Wareneingang mit der id 23 auf Archivierungsstatus 1 gesetzt	2015-05-23 17:59:14.576+00	519
995	[INFO] Wareneingang mit der id 23 auf Archivierungsstatus 0 gesetzt	2015-05-23 17:59:24.921+00	519
996	[INFO] Wareneingang mit der id 23 gespeichert	2015-05-23 17:59:51.472+00	519
997	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-23 18:00:06.14+00	519
998	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-23 18:00:08.113+00	519
999	[INFO] Wareneingang mit der id 23 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:00:23.707+00	519
1000	[INFO] Wareneingang mit der id 23 auf Archivierungsstatus 0 gesetzt	2015-05-23 18:00:32.314+00	519
1001	[INFO] Artikelverteilung für Artikel mit der Id 60 geändert	2015-05-23 18:00:57.984+00	519
1002	[INFO] Wareneingang mit der id 23 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:01:01.469+00	519
1003	[INFO] Wareneingang mit der id 24 gespeichert	2015-05-23 18:03:38.696+00	519
1004	[INFO] Warenausgang mit der id 79 gespeichert	2015-05-23 18:04:13.698+00	519
1005	[INFO] Warenausgang mit der id 80 gespeichert	2015-05-23 18:04:38.637+00	519
1006	[INFO] Warenausgang mit der id 81 gespeichert	2015-05-23 18:05:08.277+00	519
1007	[INFO] Warenausgang mit der id 82 gespeichert	2015-05-23 18:05:34.501+00	519
1008	[INFO] Warenausgang mit der id 83 gespeichert	2015-05-23 18:05:56.404+00	519
1009	[INFO] Warenausgang mit der id 79 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:06:06.257+00	519
1010	[INFO] Warenausgang mit der id 80 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:06:08.838+00	519
1011	[INFO] Warenausgang mit der id 81 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:06:11.165+00	519
1012	[INFO] Warenausgang mit der id 82 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:06:13.149+00	519
1013	[INFO] Warenausgang mit der id 83 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:06:15.472+00	519
1014	[INFO] Wareneingang mit der id 24 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:06:22.801+00	519
1021	[INFO] Warenausgang mit der id 89 gespeichert	2015-05-23 18:17:07.345+00	519
1026	[INFO] Warenausgang mit der id 92 gespeichert	2015-05-23 18:21:30.388+00	519
1031	[INFO] Warenausgang mit der id 97 gespeichert	2015-05-23 18:24:54.11+00	519
1032	[INFO] Warenausgang mit der id 98 gespeichert	2015-05-23 18:25:47.8+00	519
1033	[INFO] Warenausgang mit der id 99 gespeichert	2015-05-23 18:26:29.978+00	519
1040	[INFO] Warenausgang mit der id 106 gespeichert	2015-05-23 18:31:59.419+00	519
1041	[INFO] Warenausgang mit der id 107 gespeichert	2015-05-23 18:32:44.721+00	519
1015	[INFO] Wareneingang mit der id 25 gespeichert	2015-05-23 18:12:20.467+00	519
1017	[INFO] Warenausgang mit der id 85 gespeichert	2015-05-23 18:15:03.87+00	519
1022	[INFO] Warenausgang mit der id 90 gespeichert	2015-05-23 18:17:39.787+00	519
1025	[INFO] Warenausgang mit der id 91 gespeichert	2015-05-23 18:20:51.316+00	519
1027	[INFO] Warenausgang mit der id 93 gespeichert	2015-05-23 18:21:55.404+00	519
1028	[INFO] Warenausgang mit der id 94 gespeichert	2015-05-23 18:22:24.878+00	519
1029	[INFO] Warenausgang mit der id 95 gespeichert	2015-05-23 18:22:56.503+00	519
1037	[INFO] Warenausgang mit der id 103 gespeichert	2015-05-23 18:30:03.015+00	519
1016	[INFO] Warenausgang mit der id 84 gespeichert	2015-05-23 18:14:32.734+00	519
1020	[INFO] Warenausgang mit der id 88 gespeichert	2015-05-23 18:16:38.933+00	519
1042	[INFO] Warenausgang mit der id 108 gespeichert	2015-05-23 18:33:09.125+00	519
1043	[INFO] Warenausgang mit der id 84 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:16.621+00	519
1044	[INFO] Warenausgang mit der id 89 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:22.01+00	519
1045	[INFO] Warenausgang mit der id 91 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:24.846+00	519
1046	[INFO] Warenausgang mit der id 93 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:27.228+00	519
1047	[INFO] Warenausgang mit der id 86 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:29.388+00	519
1048	[INFO] Warenausgang mit der id 90 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:31.537+00	519
1049	[INFO] Warenausgang mit der id 87 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:34.35+00	519
1050	[INFO] Warenausgang mit der id 88 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:37.869+00	519
1051	[INFO] Warenausgang mit der id 92 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:42.54+00	519
1052	[INFO] Warenausgang mit der id 94 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:45.292+00	519
1053	[INFO] Warenausgang mit der id 107 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:48.285+00	519
1054	[INFO] Warenausgang mit der id 85 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:51.1+00	519
1055	[INFO] Warenausgang mit der id 95 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:53.301+00	519
1056	[INFO] Warenausgang mit der id 96 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:55.559+00	519
1057	[INFO] Warenausgang mit der id 97 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:33:58.821+00	519
1058	[INFO] Warenausgang mit der id 98 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:03.025+00	519
1059	[INFO] Warenausgang mit der id 99 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:05.893+00	519
1060	[INFO] Warenausgang mit der id 100 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:08.108+00	519
1061	[INFO] Warenausgang mit der id 101 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:10.278+00	519
1062	[INFO] Warenausgang mit der id 103 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:13.539+00	519
1063	[INFO] Warenausgang mit der id 104 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:15.73+00	519
1064	[INFO] Warenausgang mit der id 106 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:18.253+00	519
1018	[INFO] Warenausgang mit der id 86 gespeichert	2015-05-23 18:15:36.392+00	519
1019	[INFO] Warenausgang mit der id 87 gespeichert	2015-05-23 18:16:07.722+00	519
1023	[INFO] Organisation mit der id 248 gespeichert. organisationId: 248, name: Lebenshilfe Wagingerstraße, comment: , updateTimestamp: Sat May 23 18:19:06 UTC 2015, active: 1	2015-05-23 18:19:06.137+00	519
1024	[INFO] Organisation mit der id 250 gespeichert. organisationId: 250, name: Lebenshilfe Wals, comment: , updateTimestamp: Sat May 23 18:20:11 UTC 2015, active: 1	2015-05-23 18:20:11.48+00	519
1030	[INFO] Warenausgang mit der id 96 gespeichert	2015-05-23 18:23:56.354+00	519
1034	[INFO] Warenausgang mit der id 100 gespeichert	2015-05-23 18:27:05.674+00	519
1035	[INFO] Warenausgang mit der id 101 gespeichert	2015-05-23 18:27:56.445+00	519
1036	[INFO] Warenausgang mit der id 102 gespeichert	2015-05-23 18:28:23.162+00	519
1038	[INFO] Warenausgang mit der id 104 gespeichert	2015-05-23 18:30:40.847+00	519
1039	[INFO] Warenausgang mit der id 105 gespeichert	2015-05-23 18:31:27.641+00	519
1065	[INFO] Warenausgang mit der id 102 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:21.437+00	519
1066	[INFO] Warenausgang mit der id 105 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:24.245+00	519
1067	[INFO] Warenausgang mit der id 108 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:26.863+00	519
1068	[INFO] Wareneingang mit der id 25 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:34:34.112+00	519
1069	[INFO] Wareneingang mit der id 26 gespeichert	2015-05-23 18:47:24.171+00	519
1070	[INFO] Warenausgang mit der id 109 gespeichert	2015-05-23 18:49:23.484+00	519
1071	[INFO] Warenausgang mit der id 110 gespeichert	2015-05-23 18:49:53.848+00	519
1072	[INFO] Warenausgang mit der id 111 gespeichert	2015-05-23 18:50:25.193+00	519
1073	[INFO] Warenausgang mit der id 112 gespeichert	2015-05-23 18:51:01.773+00	519
1074	[INFO] Warenausgang mit der id 113 gespeichert	2015-05-23 18:51:25.869+00	519
1075	[INFO] Warenausgang mit der id 112 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:51:50.652+00	519
1076	[INFO] Warenausgang mit der id 113 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:51:53.035+00	519
1077	[INFO] Warenausgang mit der id 109 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:51:55.026+00	519
1078	[INFO] Warenausgang mit der id 110 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:51:56.933+00	519
1079	[INFO] Warenausgang mit der id 111 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:51:59.158+00	519
1080	[INFO] Wareneingang mit der id 26 auf Archivierungsstatus 1 gesetzt	2015-05-23 18:52:03.312+00	519
1081	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-23 19:07:22.232+00	519
1082	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-24 04:18:52.597+00	519
1083	[INFO] Artikelverteilung für Artikel mit der Id 63 geändert	2015-05-24 04:20:22.626+00	519
1084	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-24 04:24:56.961+00	519
1085	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-24 04:40:16.657+00	519
1086	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-24 04:41:54+00	519
1087	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-24 11:05:16.446+00	519
1088	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-24 11:13:12.596+00	519
1089	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-25 11:46:33.381+00	519
1090	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-25 11:47:18.349+00	519
1091	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-26 04:50:51.907+00	519
1092	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-26 04:51:09.967+00	519
1093	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-28 05:41:02.868+00	519
1094	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-30 06:11:25.6+00	253
1095	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-30 06:28:10.083+00	253
1096	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-30 06:28:23.925+00	253
1097	[INFO] Passwort für Person mit Id 253 geändert.	2015-05-30 06:28:43.772+00	253
1098	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-30 06:28:48.021+00	253
1099	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-30 06:28:52.563+00	253
1100	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-05-30 06:29:19.382+00	253
1101	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-30 18:09:33.776+00	519
1102	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-05-30 18:13:58.434+00	519
1103	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-05-31 17:05:44.581+00	519
1104	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-01 06:34:04.182+00	519
1105	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-01 06:42:15.481+00	519
1106	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-06-01 08:38:22.607+00	602
1107	[INFO] Wareneingang mit der id 27 gespeichert	2015-06-01 09:01:35.506+00	602
1108	[INFO] Wareneingang mit der id 27 gespeichert	2015-06-01 09:02:24.867+00	602
1109	[INFO] Wareneingang mit der id 27 gespeichert	2015-06-01 09:09:24.22+00	602
1110	[INFO] Wareneingang mit der id 27 gespeichert	2015-06-01 09:12:09.602+00	602
1111	[INFO] Wareneingang mit der id 27 gespeichert	2015-06-01 09:15:25.744+00	602
1112	[INFO] Warenausgang mit der id 114 gespeichert	2015-06-01 09:16:49.626+00	602
1113	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-06-01 11:17:12.209+00	602
1114	[INFO] Warenausgang mit der id 115 gespeichert	2015-06-01 11:20:04.288+00	602
1115	[INFO] Warenausgang mit der id 116 gespeichert	2015-06-01 11:21:28.508+00	602
1116	[INFO] Warenausgang mit der id 117 gespeichert	2015-06-01 11:23:40.1+00	602
1117	[INFO] Warenausgang mit der id 118 gespeichert	2015-06-01 11:25:36.677+00	602
1118	[INFO] Wareneingang mit der id 28 gespeichert	2015-06-01 11:34:04.416+00	602
1119	[INFO] Warenausgang mit der id 114 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:34:27.779+00	602
1120	[INFO] Warenausgang mit der id 115 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:34:32.137+00	602
1121	[INFO] Warenausgang mit der id 116 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:34:36.583+00	602
1122	[INFO] Warenausgang mit der id 117 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:34:40.067+00	602
1123	[INFO] Warenausgang mit der id 118 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:34:43.868+00	602
1124	[INFO] Warenausgang mit der id 119 gespeichert	2015-06-01 11:36:38.901+00	602
1125	[INFO] Warenausgang mit der id 119 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:36:52.455+00	602
1126	[INFO] Warenausgang mit der id 120 gespeichert	2015-06-01 11:37:37.137+00	602
1127	[INFO] Warenausgang mit der id 121 gespeichert	2015-06-01 11:38:16.115+00	602
1128	[INFO] Warenausgang mit der id 120 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:38:23.119+00	602
1129	[INFO] Warenausgang mit der id 121 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:38:26.708+00	602
1154	[INFO] Warenausgang mit der id 127 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:59:02.268+00	602
1155	[INFO] Warenausgang mit der id 129 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:59:05.747+00	602
1156	[INFO] Warenausgang mit der id 128 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:59:10.15+00	602
1157	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-06-01 13:01:35.96+00	602
1162	[INFO] Warenausgang mit der id 132 gespeichert	2015-06-01 13:05:55.556+00	602
1173	[INFO] Wareneingang mit der id 36 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:11:54.667+00	602
1175	[INFO] Warenausgang mit der id 135 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:12:40.935+00	602
1178	[INFO] Warenausgang mit der id 136 gespeichert	2015-06-01 13:14:41.98+00	602
1180	[INFO] Wareneingang mit der id 38 gespeichert	2015-06-01 13:15:56.253+00	602
1182	[INFO] Warenausgang mit der id 137 gespeichert	2015-06-01 13:16:40.528+00	602
1130	[INFO] Wareneingang mit der id 28 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:38:40.1+00	602
1133	[INFO] Warenausgang mit der id 122 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:42:35.109+00	602
1135	[INFO] Wareneingang mit der id 30 gespeichert	2015-06-01 11:45:13.164+00	602
1137	[INFO] Warenausgang mit der id 123 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:46:36.288+00	602
1138	[INFO] Wareneingang mit der id 31 gespeichert	2015-06-01 11:49:27.481+00	602
1141	[INFO] Warenausgang mit der id 124 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:51:26.528+00	602
1142	[INFO] Warenausgang mit der id 125 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:51:31.03+00	602
1143	[INFO] Wareneingang mit der id 31 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:51:52.362+00	602
1144	[INFO] Wareneingang mit der id 30 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:51:56.887+00	602
1152	[INFO] Warenausgang mit der id 128 gespeichert	2015-06-01 11:58:17.53+00	602
1158	[INFO] Wareneingang mit der id 34 gespeichert	2015-06-01 13:03:17.716+00	602
1164	[INFO] Warenausgang mit der id 130 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:06:41.125+00	602
1165	[INFO] Warenausgang mit der id 132 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:06:45.481+00	602
1166	[INFO] Warenausgang mit der id 131 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:06:49.14+00	602
1167	[INFO] Warenausgang mit der id 133 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:06:52.408+00	602
1171	[INFO] Warenausgang mit der id 134 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:09:42.088+00	602
1172	[INFO] Wareneingang mit der id 36 gespeichert	2015-06-01 13:11:46.911+00	602
1174	[INFO] Warenausgang mit der id 135 gespeichert	2015-06-01 13:12:32.546+00	602
1181	[INFO] Wareneingang mit der id 38 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:16:02.46+00	602
1183	[INFO] Warenausgang mit der id 137 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:16:47.364+00	602
1131	[INFO] Wareneingang mit der id 29 gespeichert	2015-06-01 11:41:19.74+00	602
1132	[INFO] Warenausgang mit der id 122 gespeichert	2015-06-01 11:42:23.692+00	602
1134	[INFO] Wareneingang mit der id 29 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:42:48.94+00	602
1136	[INFO] Warenausgang mit der id 123 gespeichert	2015-06-01 11:46:15.299+00	602
1139	[INFO] Warenausgang mit der id 124 gespeichert	2015-06-01 11:50:12.14+00	602
1140	[INFO] Warenausgang mit der id 125 gespeichert	2015-06-01 11:50:48.739+00	602
1145	[INFO] Wareneingang mit der id 32 gespeichert	2015-06-01 11:52:57.484+00	602
1146	[INFO] Wareneingang mit der id 32 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:53:08.994+00	602
1147	[INFO] Warenausgang mit der id 126 gespeichert	2015-06-01 11:54:07.707+00	602
1148	[INFO] Warenausgang mit der id 126 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:54:13.843+00	602
1149	[INFO] Wareneingang mit der id 33 gespeichert	2015-06-01 11:56:30.907+00	602
1150	[INFO] Wareneingang mit der id 33 auf Archivierungsstatus 1 gesetzt	2015-06-01 11:56:38.603+00	602
1151	[INFO] Warenausgang mit der id 127 gespeichert	2015-06-01 11:57:30.987+00	602
1153	[INFO] Warenausgang mit der id 129 gespeichert	2015-06-01 11:58:51.76+00	602
1159	[INFO] Wareneingang mit der id 34 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:03:56.257+00	602
1160	[INFO] Warenausgang mit der id 130 gespeichert	2015-06-01 13:04:28.048+00	602
1161	[INFO] Warenausgang mit der id 131 gespeichert	2015-06-01 13:05:17.445+00	602
1163	[INFO] Warenausgang mit der id 133 gespeichert	2015-06-01 13:06:23.023+00	602
1168	[INFO] Wareneingang mit der id 35 gespeichert	2015-06-01 13:08:41.251+00	602
1169	[INFO] Wareneingang mit der id 35 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:08:54.556+00	602
1170	[INFO] Warenausgang mit der id 134 gespeichert	2015-06-01 13:09:31.241+00	602
1176	[INFO] Wareneingang mit der id 37 gespeichert	2015-06-01 13:13:55.564+00	602
1177	[INFO] Wareneingang mit der id 37 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:14:03.5+00	602
1179	[INFO] Warenausgang mit der id 136 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:14:51.367+00	602
1184	[INFO] Wareneingang mit der id 39 gespeichert	2015-06-01 13:17:44.583+00	602
1185	[INFO] Wareneingang mit der id 39 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:17:49.776+00	602
1186	[INFO] Warenausgang mit der id 138 gespeichert	2015-06-01 13:20:04.169+00	602
1187	[INFO] Warenausgang mit der id 138 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:20:13.026+00	602
1188	[INFO] Wareneingang mit der id 40 gespeichert	2015-06-01 13:21:45.981+00	602
1189	[INFO] Wareneingang mit der id 41 gespeichert	2015-06-01 13:22:39.674+00	602
1190	[INFO] Warenausgang mit der id 139 gespeichert	2015-06-01 13:23:17.891+00	602
1191	[INFO] Warenausgang mit der id 139 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:23:27.537+00	602
1192	[INFO] Warenausgang mit der id 140 gespeichert	2015-06-01 13:24:00.577+00	602
1193	[INFO] Warenausgang mit der id 140 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:24:08.419+00	602
1194	[INFO] Wareneingang mit der id 40 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:24:17.377+00	602
1195	[INFO] Wareneingang mit der id 41 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:24:22.704+00	602
1196	[INFO] Wareneingang mit der id 42 gespeichert	2015-06-01 13:25:18.684+00	602
1197	[INFO] Wareneingang mit der id 42 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:25:24.258+00	602
1198	[INFO] Warenausgang mit der id 141 gespeichert	2015-06-01 13:25:57.736+00	602
1199	[INFO] Warenausgang mit der id 141 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:26:02.646+00	602
1200	[INFO] Wareneingang mit der id 29 gespeichert	2015-06-01 13:27:46.54+00	602
1201	[INFO] Wareneingang mit der id 43 gespeichert	2015-06-01 13:34:57.003+00	602
1202	[INFO] Wareneingang mit der id 43 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:35:13.772+00	602
1203	[INFO] Warenausgang mit der id 142 gespeichert	2015-06-01 13:36:23.463+00	602
1204	[INFO] Warenausgang mit der id 142 gelöscht	2015-06-01 13:39:05.27+00	602
1205	[INFO] Wareneingang mit der id 43 auf Archivierungsstatus 0 gesetzt	2015-06-01 13:39:27.642+00	602
1206	[INFO] Wareneingang mit der id 43 gespeichert	2015-06-01 13:40:18.558+00	602
1207	[INFO] Wareneingang mit der id 43 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:40:25.31+00	602
1208	[INFO] Warenausgang mit der id 143 gespeichert	2015-06-01 13:41:11.772+00	602
1209	[INFO] Warenausgang mit der id 144 gespeichert	2015-06-01 13:42:46.131+00	602
1210	[INFO] Warenausgang mit der id 145 gespeichert	2015-06-01 13:43:31.504+00	602
1211	[INFO] Warenausgang mit der id 145 gespeichert	2015-06-01 13:44:12.363+00	602
1212	[INFO] Warenausgang mit der id 146 gespeichert	2015-06-01 13:47:30.301+00	602
1213	[INFO] Warenausgang mit der id 144 gespeichert	2015-06-01 13:47:45.876+00	602
1214	[INFO] Warenausgang mit der id 147 gespeichert	2015-06-01 13:49:08.429+00	602
1215	[INFO] Warenausgang mit der id 143 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:49:14.047+00	602
1216	[INFO] Warenausgang mit der id 147 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:49:18.033+00	602
1217	[INFO] Warenausgang mit der id 144 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:49:22.45+00	602
1218	[INFO] Warenausgang mit der id 145 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:49:25.921+00	602
1219	[INFO] Warenausgang mit der id 146 auf Archivierungsstatus 1 gesetzt	2015-06-01 13:49:30.265+00	602
1220	[INFO] Wareneingang mit der id 44 gespeichert	2015-06-01 14:04:22.423+00	602
1221	[INFO] Warenausgang mit der id 148 gespeichert	2015-06-01 14:05:21.393+00	602
1222	[INFO] Warenausgang mit der id 149 gespeichert	2015-06-01 14:05:56.166+00	602
1223	[INFO] Warenausgang mit der id 150 gespeichert	2015-06-01 14:06:45.91+00	602
1224	[INFO] Warenausgang mit der id 151 gespeichert	2015-06-01 14:07:19.704+00	602
1225	[INFO] Warenausgang mit der id 152 gespeichert	2015-06-01 14:08:18.351+00	602
1226	[INFO] Warenausgang mit der id 153 gespeichert	2015-06-01 14:08:56.128+00	602
1227	[INFO] Warenausgang mit der id 154 gespeichert	2015-06-01 14:09:27.496+00	602
1228	[INFO] Warenausgang mit der id 155 gespeichert	2015-06-01 14:09:58.262+00	602
1229	[INFO] Warenausgang mit der id 156 gespeichert	2015-06-01 14:14:27.419+00	602
1230	[INFO] Warenausgang mit der id 157 gespeichert	2015-06-01 14:15:38.672+00	602
1231	[INFO] Warenausgang mit der id 148 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:15:48.054+00	602
1232	[INFO] Warenausgang mit der id 150 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:15:51.449+00	602
1233	[INFO] Warenausgang mit der id 155 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:15:53.997+00	602
1234	[INFO] Warenausgang mit der id 157 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:15:56.944+00	602
1244	[INFO] Warenausgang mit der id 158 gespeichert	2015-06-01 14:20:07.28+00	602
1235	[INFO] Warenausgang mit der id 154 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:16:01.033+00	602
1236	[INFO] Warenausgang mit der id 153 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:16:04.284+00	602
1237	[INFO] Warenausgang mit der id 151 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:16:07.78+00	602
1238	[INFO] Warenausgang mit der id 149 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:16:11.507+00	602
1239	[INFO] Warenausgang mit der id 156 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:16:15.219+00	602
1240	[INFO] Warenausgang mit der id 152 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:16:20.67+00	602
1241	[INFO] Wareneingang mit der id 44 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:16:27.717+00	602
1242	[INFO] Wareneingang mit der id 45 gespeichert	2015-06-01 14:19:26.967+00	602
1249	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-01 15:54:20.489+00	519
1250	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-01 15:55:22.731+00	519
1251	[INFO] Wareneingang mit der id 46 gespeichert	2015-06-01 16:01:41.031+00	253
1253	[INFO] Warenausgang mit der id 159 gespeichert	2015-06-01 16:05:05.239+00	253
1254	[INFO] Warenausgang mit der id 160 gespeichert	2015-06-01 16:06:25.512+00	253
1262	[INFO] Wareneingang mit der id 47 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:20:49.126+00	253
1263	[INFO] Warenausgang mit der id 162 gespeichert	2015-06-01 16:21:26.305+00	253
1269	[INFO] Wareneingang mit der id 49 gespeichert	2015-06-01 16:27:02.346+00	253
1271	[INFO] Warenausgang mit der id 164 gespeichert	2015-06-01 16:27:47.278+00	253
1272	[INFO] Warenausgang mit der id 164 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:27:56.242+00	253
1274	[INFO] Wareneingang mit der id 50 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:32:02.873+00	253
1275	[INFO] Warenausgang mit der id 165 gespeichert	2015-06-01 16:33:14.103+00	253
1276	[INFO] Warenausgang mit der id 166 gespeichert	2015-06-01 16:34:05.71+00	253
1277	[INFO] Warenausgang mit der id 167 gespeichert	2015-06-01 16:34:48.731+00	253
1278	[INFO] Warenausgang mit der id 165 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:34:53.004+00	253
1279	[INFO] Warenausgang mit der id 166 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:34:55.247+00	253
1280	[INFO] Warenausgang mit der id 167 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:34:57.585+00	253
1281	[INFO] Wareneingang mit der id 51 gespeichert	2015-06-01 16:36:24.772+00	253
1282	[INFO] Wareneingang mit der id 51 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:36:35.2+00	253
1303	[INFO] Warenausgang mit der id 173 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:49:28.468+00	574
1304	[INFO] Warenausgang mit der id 172 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:49:33.409+00	574
1305	[INFO] Wareneingang mit der id 54 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:49:44.775+00	574
1306	[INFO] Wareneingang mit der id 55 gespeichert	2015-06-01 20:07:21.751+00	574
1307	[INFO] Wareneingang mit der id 56 gespeichert	2015-06-01 20:09:28.388+00	574
1243	[INFO] Wareneingang mit der id 45 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:19:32.743+00	602
1245	[INFO] Warenausgang mit der id 158 auf Archivierungsstatus 1 gesetzt	2015-06-01 14:20:15.992+00	602
1246	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-06-01 14:22:51.511+00	602
1247	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-01 14:37:03.013+00	519
1255	[INFO] Warenausgang mit der id 161 gespeichert	2015-06-01 16:08:31.81+00	253
1256	[INFO] Warenausgang mit der id 161 gespeichert	2015-06-01 16:09:20.557+00	253
1257	[INFO] Warenausgang mit der id 159 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:09:37.735+00	253
1258	[INFO] Warenausgang mit der id 160 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:09:41.074+00	253
1259	[INFO] Warenausgang mit der id 161 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:09:43.555+00	253
1260	[INFO] Wareneingang mit der id 46 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:09:53.002+00	253
1267	[INFO] Warenausgang mit der id 163 gespeichert	2015-06-01 16:25:40.95+00	253
1268	[INFO] Warenausgang mit der id 163 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:25:46.376+00	253
1270	[INFO] Wareneingang mit der id 49 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:27:12.804+00	253
1273	[INFO] Wareneingang mit der id 50 gespeichert	2015-06-01 16:31:17.971+00	253
1283	[INFO] Warenausgang mit der id 168 gespeichert	2015-06-01 16:40:24.19+00	253
1284	[INFO] Warenausgang mit der id 168 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:40:28.363+00	253
1285	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-01 16:52:24.82+00	519
1286	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-06-01 17:07:03.987+00	253
1287	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-01 17:59:27.656+00	519
1288	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-06-01 19:17:41.053+00	574
1302	[INFO] Warenausgang mit der id 173 gespeichert	2015-06-01 19:49:15.07+00	574
1248	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-06-01 15:50:12.414+00	253
1309	[INFO] Warenausgang mit der id 175 gespeichert	2015-06-01 20:13:36.34+00	574
1310	[INFO] Warenausgang mit der id 175 auf Archivierungsstatus 1 gesetzt	2015-06-01 20:14:10.226+00	574
1311	[INFO] Warenausgang mit der id 174 auf Archivierungsstatus 1 gesetzt	2015-06-01 20:14:17.722+00	574
1312	[INFO] Wareneingang mit der id 56 auf Archivierungsstatus 1 gesetzt	2015-06-01 20:14:35.861+00	574
1313	[INFO] Warenausgang mit der id 176 gespeichert	2015-06-01 20:20:33.405+00	574
1314	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-06-01 20:52:47.189+00	574
1315	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-02 05:09:35.56+00	519
1252	[INFO] Wareneingang mit der id 46 gespeichert	2015-06-01 16:02:28.485+00	253
1261	[INFO] Wareneingang mit der id 47 gespeichert	2015-06-01 16:20:34.176+00	253
1264	[INFO] Warenausgang mit der id 162 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:21:32.321+00	253
1265	[INFO] Wareneingang mit der id 48 gespeichert	2015-06-01 16:24:14.321+00	253
1266	[INFO] Wareneingang mit der id 48 auf Archivierungsstatus 1 gesetzt	2015-06-01 16:24:46.648+00	253
1289	[INFO] Wareneingang mit der id 52 gespeichert	2015-06-01 19:25:01.946+00	574
1290	[INFO] Warenausgang mit der id 169 gespeichert	2015-06-01 19:26:24.268+00	574
1291	[INFO] Warenausgang mit der id 169 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:26:47.034+00	574
1292	[INFO] Wareneingang mit der id 52 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:27:01.961+00	574
1293	[INFO] Wareneingang mit der id 53 gespeichert	2015-06-01 19:31:20.419+00	574
1294	[INFO] Warenausgang mit der id 170 gespeichert	2015-06-01 19:33:44.99+00	574
1295	[INFO] Warenausgang mit der id 170 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:33:52.586+00	574
1296	[INFO] Warenausgang mit der id 171 gespeichert	2015-06-01 19:34:39.018+00	574
1297	[INFO] Warenausgang mit der id 171 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:35:27.435+00	574
1298	[INFO] Wareneingang mit der id 53 auf Archivierungsstatus 1 gesetzt	2015-06-01 19:39:33.054+00	574
1299	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-01 19:42:06.025+00	519
1300	[INFO] Wareneingang mit der id 54 gespeichert	2015-06-01 19:45:36.674+00	574
1301	[INFO] Warenausgang mit der id 172 gespeichert	2015-06-01 19:46:45.848+00	574
1308	[INFO] Warenausgang mit der id 174 gespeichert	2015-06-01 20:11:16.945+00	574
1316	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-02 05:26:45.123+00	519
1317	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-06-02 09:35:40.093+00	574
1318	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-06-02 09:38:56.585+00	574
1319	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-06-02 19:55:41.926+00	574
1320	[INFO] Warenausgang mit der id 176 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:02:25.676+00	574
1321	[INFO] Warenausgang mit der id 177 gespeichert	2015-06-02 20:03:59.244+00	574
1322	[INFO] Warenausgang mit der id 177 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:04:04.743+00	574
1323	[INFO] Wareneingang mit der id 57 gespeichert	2015-06-02 20:07:54.974+00	574
1324	[INFO] Wareneingang mit der id 58 gespeichert	2015-06-02 20:13:57.111+00	574
1325	[INFO] Wareneingang mit der id 59 gespeichert	2015-06-02 20:22:17.347+00	574
1326	[INFO] Warenausgang mit der id 178 gespeichert	2015-06-02 20:24:33.688+00	574
1327	[INFO] Warenausgang mit der id 178 gelöscht	2015-06-02 20:25:51.123+00	574
1328	[INFO] Wareneingang mit der id 59 gespeichert	2015-06-02 20:26:15.436+00	574
1329	[INFO] Warenausgang mit der id 179 gespeichert	2015-06-02 20:27:50.829+00	574
1330	[INFO] Warenausgang mit der id 180 gespeichert	2015-06-02 20:30:08.982+00	574
1331	[INFO] Warenausgang mit der id 181 gespeichert	2015-06-02 20:31:16.025+00	574
1332	[INFO] Warenausgang mit der id 182 gespeichert	2015-06-02 20:32:19.437+00	574
1333	[INFO] Warenausgang mit der id 183 gespeichert	2015-06-02 20:34:03.963+00	574
1334	[INFO] Warenausgang mit der id 184 gespeichert	2015-06-02 20:35:14.487+00	574
1335	[INFO] Warenausgang mit der id 179 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:35:57.006+00	574
1336	[INFO] Warenausgang mit der id 182 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:36:10.646+00	574
1337	[INFO] Warenausgang mit der id 180 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:36:16.249+00	574
1338	[INFO] Warenausgang mit der id 181 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:36:21.985+00	574
1339	[INFO] Warenausgang mit der id 183 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:36:26.589+00	574
1340	[INFO] Warenausgang mit der id 184 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:36:31.467+00	574
1341	[INFO] Wareneingang mit der id 57 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:38:49.538+00	574
1342	[INFO] Wareneingang mit der id 58 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:39:00.484+00	574
1343	[INFO] Wareneingang mit der id 60 gespeichert	2015-06-02 20:40:18.03+00	574
1344	[INFO] Warenausgang mit der id 185 gespeichert	2015-06-02 20:41:26.652+00	574
1345	[INFO] Warenausgang mit der id 185 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:42:24.424+00	574
1346	[INFO] Wareneingang mit der id 60 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:42:40.148+00	574
1347	[INFO] Wareneingang mit der id 61 gespeichert	2015-06-02 20:45:57.516+00	574
1348	[INFO] Warenausgang mit der id 186 gespeichert	2015-06-02 20:48:23.697+00	574
1349	[INFO] Warenausgang mit der id 186 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:48:34.215+00	574
1350	[INFO] Wareneingang mit der id 61 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:48:50.699+00	574
1351	[INFO] Wareneingang mit der id 62 gespeichert	2015-06-02 20:50:12.859+00	574
1352	[INFO] Warenausgang mit der id 187 gespeichert	2015-06-02 20:51:17.938+00	574
1353	[INFO] Warenausgang mit der id 187 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:51:25.136+00	574
1354	[INFO] Wareneingang mit der id 62 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:51:46.196+00	574
1355	[INFO] Wareneingang mit der id 63 gespeichert	2015-06-02 20:53:04.976+00	574
1356	[INFO] Warenausgang mit der id 188 gespeichert	2015-06-02 20:54:01.719+00	574
1357	[INFO] Warenausgang mit der id 188 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:54:08.698+00	574
1358	[INFO] Wareneingang mit der id 63 auf Archivierungsstatus 1 gesetzt	2015-06-02 20:54:18.221+00	574
1359	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-06-02 20:54:58.853+00	574
1360	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-06-04 06:41:39.496+00	642
1361	[INFO] Wareneingang mit der id 64 gespeichert	2015-06-04 06:46:32.262+00	642
1362	[INFO] Warenausgang mit der id 189 gespeichert	2015-06-04 06:47:45.069+00	642
1363	[INFO] Warenausgang mit der id 189 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:47:53.352+00	642
1364	[INFO] Wareneingang mit der id 64 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:48:02.893+00	642
1365	[INFO] Wareneingang mit der id 65 gespeichert	2015-06-04 06:50:54.99+00	642
1366	[INFO] Wareneingang mit der id 64 auf Archivierungsstatus 0 gesetzt	2015-06-04 06:51:19.869+00	642
1367	[INFO] Warenausgang mit der id 189 auf Archivierungsstatus 0 gesetzt	2015-06-04 06:52:02.899+00	642
1368	[INFO] Warenausgang mit der id 189 gelöscht	2015-06-04 06:52:13.176+00	642
1369	[INFO] Wareneingang mit der id 64 gespeichert	2015-06-04 06:52:50.802+00	642
1370	[INFO] Warenausgang mit der id 190 gespeichert	2015-06-04 06:53:41.645+00	642
1371	[INFO] Warenausgang mit der id 190 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:53:49.674+00	642
1372	[INFO] Wareneingang mit der id 64 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:53:56.213+00	642
1374	[INFO] Warenausgang mit der id 191 gespeichert	2015-06-04 06:55:08.722+00	642
1381	[INFO] Wareneingang mit der id 66 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:59:00.245+00	642
1383	[INFO] Warenausgang mit der id 193 gespeichert	2015-06-04 07:03:03.29+00	642
1389	[INFO] Warenausgang mit der id 194 gespeichert	2015-06-04 07:17:21.794+00	642
1403	[INFO] Wareneingang mit der id 71 gespeichert	2015-06-04 07:47:43.466+00	642
1404	[INFO] Wareneingang mit der id 72 gespeichert	2015-06-04 07:51:17.051+00	642
1405	[INFO] Wareneingang mit der id 73 gespeichert	2015-06-04 07:55:51.918+00	642
1407	[INFO] Wareneingang mit der id 75 gespeichert	2015-06-04 08:15:51.163+00	642
1412	[INFO] Warenausgang mit der id 201 gespeichert	2015-06-04 08:19:59.133+00	642
1424	[INFO] Warenausgang mit der id 207 gespeichert	2015-06-04 08:29:53.485+00	642
1425	[INFO] Warenausgang mit der id 208 gespeichert	2015-06-04 08:30:28.206+00	642
1426	[INFO] Warenausgang mit der id 209 gespeichert	2015-06-04 08:32:01.067+00	642
1427	[INFO] Warenausgang mit der id 207 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:32:07.646+00	642
1428	[INFO] Warenausgang mit der id 208 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:32:11.168+00	642
1432	[INFO] Wareneingang mit der id 76 gespeichert	2015-06-04 08:43:15.665+00	642
1433	[INFO] Wareneingang mit der id 76 gespeichert	2015-06-04 08:48:05.063+00	642
1434	[INFO] Wareneingang mit der id 77 gespeichert	2015-06-04 08:55:29.557+00	642
1442	[INFO] Warenausgang mit der id 215 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:02:21.931+00	642
1443	[INFO] Warenausgang mit der id 216 gespeichert	2015-06-04 09:02:46.942+00	642
1451	[INFO] Warenausgang mit der id 209 gespeichert	2015-06-04 09:14:15.637+00	642
1452	[INFO] Warenausgang mit der id 211 gespeichert	2015-06-04 09:14:48.546+00	642
1373	[INFO] Wareneingang mit der id 65 gespeichert	2015-06-04 06:54:19.766+00	642
1377	[INFO] Wareneingang mit der id 65 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:55:36.742+00	642
1378	[INFO] Wareneingang mit der id 66 gespeichert	2015-06-04 06:58:07.669+00	642
1379	[INFO] Warenausgang mit der id 192 gespeichert	2015-06-04 06:58:48.435+00	642
1380	[INFO] Warenausgang mit der id 192 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:58:53.723+00	642
1394	[INFO] Wareneingang mit der id 70 gespeichert	2015-06-04 07:29:26.234+00	642
1406	[INFO] Wareneingang mit der id 74 gespeichert	2015-06-04 08:03:52.667+00	642
1408	[INFO] Warenausgang mit der id 199 gespeichert	2015-06-04 08:17:08.882+00	642
1409	[INFO] Warenausgang mit der id 199 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:17:13.244+00	642
1410	[INFO] Warenausgang mit der id 200 gespeichert	2015-06-04 08:18:02.403+00	642
1411	[INFO] Warenausgang mit der id 200 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:18:11.415+00	642
1413	[INFO] Warenausgang mit der id 202 gespeichert	2015-06-04 08:21:17.819+00	642
1414	[INFO] Warenausgang mit der id 201 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:23:40.308+00	642
1415	[INFO] Warenausgang mit der id 202 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:23:44.31+00	642
1416	[INFO] Warenausgang mit der id 203 gespeichert	2015-06-04 08:25:25.443+00	642
1444	[INFO] Warenausgang mit der id 216 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:02:53.287+00	642
1449	[INFO] Warenausgang mit der id 220 gespeichert	2015-06-04 09:10:09.51+00	642
1450	[INFO] Warenausgang mit der id 221 gespeichert	2015-06-04 09:11:40.295+00	642
1453	[INFO] Warenausgang mit der id 211 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:14:54.79+00	642
1454	[INFO] Warenausgang mit der id 210 gespeichert	2015-06-04 09:15:33.887+00	642
1455	[INFO] Warenausgang mit der id 219 gespeichert	2015-06-04 09:20:50.012+00	642
1456	[INFO] Warenausgang mit der id 220 gespeichert	2015-06-04 09:21:10.678+00	642
1457	[INFO] Warenausgang mit der id 221 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:21:23.522+00	642
1458	[INFO] Warenausgang mit der id 221 auf Archivierungsstatus 0 gesetzt	2015-06-04 09:21:39.642+00	642
1459	[INFO] Warenausgang mit der id 221 gespeichert	2015-06-04 09:22:24.466+00	642
1460	[INFO] Warenausgang mit der id 210 gespeichert	2015-06-04 09:23:07.159+00	642
1375	[INFO] Warenausgang mit der id 191 gespeichert	2015-06-04 06:55:23.339+00	642
1376	[INFO] Warenausgang mit der id 191 auf Archivierungsstatus 1 gesetzt	2015-06-04 06:55:27.912+00	642
1384	[INFO] Warenausgang mit der id 193 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:03:07.547+00	642
1387	[INFO] Wareneingang mit der id 68 gespeichert	2015-06-04 07:13:44.034+00	642
1388	[INFO] Wareneingang mit der id 69 gespeichert	2015-06-04 07:16:37.569+00	642
1382	[INFO] Wareneingang mit der id 67 gespeichert	2015-06-04 07:02:14.009+00	642
1385	[INFO] Wareneingang mit der id 67 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:03:13.806+00	642
1386	[INFO] Wareneingang mit der id 68 gespeichert	2015-06-04 07:12:24.428+00	642
1390	[INFO] Warenausgang mit der id 195 gespeichert	2015-06-04 07:18:04.557+00	642
1391	[INFO] Warenausgang mit der id 194 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:18:08.465+00	642
1392	[INFO] Warenausgang mit der id 195 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:18:11.187+00	642
1393	[INFO] Wareneingang mit der id 69 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:18:25.625+00	642
1395	[INFO] Wareneingang mit der id 70 gespeichert	2015-06-04 07:31:04.021+00	642
1396	[INFO] Warenausgang mit der id 196 gespeichert	2015-06-04 07:32:19.168+00	642
1397	[INFO] Warenausgang mit der id 197 gespeichert	2015-06-04 07:32:51.151+00	642
1398	[INFO] Warenausgang mit der id 198 gespeichert	2015-06-04 07:33:19.918+00	642
1399	[INFO] Warenausgang mit der id 196 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:33:28.285+00	642
1400	[INFO] Warenausgang mit der id 197 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:33:31.227+00	642
1401	[INFO] Warenausgang mit der id 198 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:33:34.3+00	642
1402	[INFO] Wareneingang mit der id 70 auf Archivierungsstatus 1 gesetzt	2015-06-04 07:33:43.501+00	642
1417	[INFO] Warenausgang mit der id 203 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:25:31.154+00	642
1418	[INFO] Warenausgang mit der id 204 gespeichert	2015-06-04 08:26:31.213+00	642
1419	[INFO] Warenausgang mit der id 204 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:26:35.978+00	642
1420	[INFO] Warenausgang mit der id 205 gespeichert	2015-06-04 08:28:00.511+00	642
1421	[INFO] Warenausgang mit der id 205 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:28:04.158+00	642
1422	[INFO] Warenausgang mit der id 206 gespeichert	2015-06-04 08:28:32.839+00	642
1423	[INFO] Warenausgang mit der id 206 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:28:39.149+00	642
1429	[INFO] Warenausgang mit der id 210 gespeichert	2015-06-04 08:33:35.7+00	642
1430	[INFO] Warenausgang mit der id 211 gespeichert	2015-06-04 08:34:35.691+00	642
1431	[INFO] Wareneingang mit der id 75 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:35:16.898+00	642
1435	[INFO] Warenausgang mit der id 212 gespeichert	2015-06-04 08:59:05.549+00	642
1436	[INFO] Warenausgang mit der id 212 auf Archivierungsstatus 1 gesetzt	2015-06-04 08:59:53.427+00	642
1437	[INFO] Warenausgang mit der id 213 gespeichert	2015-06-04 09:00:56.532+00	642
1438	[INFO] Warenausgang mit der id 213 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:01:02.754+00	642
1439	[INFO] Warenausgang mit der id 214 gespeichert	2015-06-04 09:01:34.264+00	642
1440	[INFO] Warenausgang mit der id 214 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:01:42.344+00	642
1441	[INFO] Warenausgang mit der id 215 gespeichert	2015-06-04 09:02:14.063+00	642
1445	[INFO] Warenausgang mit der id 217 gespeichert	2015-06-04 09:04:05.578+00	642
1446	[INFO] Warenausgang mit der id 218 gespeichert	2015-06-04 09:04:50.66+00	642
1447	[INFO] Warenausgang mit der id 218 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:04:56.873+00	642
1448	[INFO] Warenausgang mit der id 219 gespeichert	2015-06-04 09:08:26.873+00	642
1461	[INFO] Warenausgang mit der id 209 gespeichert	2015-06-04 09:42:52.89+00	642
1462	[INFO] Warenausgang mit der id 210 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:46:23.765+00	642
1463	[INFO] Warenausgang mit der id 220 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:47:08.676+00	642
1464	[INFO] Warenausgang mit der id 219 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:47:15.85+00	642
1465	[INFO] Warenausgang mit der id 221 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:47:19.741+00	642
1466	[INFO] Warenausgang mit der id 217 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:48:13.45+00	642
1467	[INFO] Wareneingang mit der id 76 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:48:58.3+00	642
1468	[INFO] Wareneingang mit der id 74 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:49:41.286+00	642
1469	[INFO] Wareneingang mit der id 78 gespeichert	2015-06-04 09:50:35.074+00	642
1470	[INFO] Wareneingang mit der id 78 gespeichert	2015-06-04 09:50:55.804+00	642
1471	[INFO] Warenausgang mit der id 222 gespeichert	2015-06-04 09:52:06.78+00	642
1472	[INFO] Warenausgang mit der id 222 auf Archivierungsstatus 1 gesetzt	2015-06-04 09:52:14.081+00	642
1473	[INFO] Wareneingang mit der id 79 gespeichert	2015-06-04 09:53:06.236+00	642
1474	[INFO] Wareneingang mit der id 80 gespeichert	2015-06-04 09:54:19.563+00	642
1475	[INFO] Wareneingang mit der id 79 gespeichert	2015-06-04 09:54:33.061+00	642
1476	[INFO] Wareneingang mit der id 81 gespeichert	2015-06-04 09:55:19.571+00	642
1477	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-06-04 10:02:18.531+00	642
1478	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-04 19:37:20.717+00	519
1479	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-06 05:37:18.026+00	519
1480	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-08 05:21:54.921+00	519
1481	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-08 05:28:24.407+00	519
1482	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-08 08:50:30.413+00	519
1483	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-08 08:51:17.371+00	519
1484	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-09 03:51:55.972+00	519
1485	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-09 07:08:17.268+00	519
1486	[INFO] Organisation mit der id 132 gespeichert. organisationId: 132, name: Lebensmittelbrücke / Pfarre Wals, comment: vormals Pfarre Wals oder Vinzitisch / nur Zustelladresse - Postadresse siehe VinziTisch, updateTimestamp: Tue Jun 09 07:16:53 UTC 2015, active: 1	2015-06-09 07:16:53.643+00	519
1487	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-09 07:17:10.729+00	519
1488	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-09 13:25:31.389+00	519
1489	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-10 08:23:46.4+00	519
1490	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-10 09:12:40.696+00	345
1491	[INFO] Person mit der id 649 gespeichert. personId: 649, salutation: Herr, title: Dr., firstName: Leonhard, lastName: Schitter, comment: Newsletter: nein, updateTimestamp: 2015-06-10, active: 1	2015-06-10 09:15:26.615+00	345
1492	[INFO] Person mit der id 650 gespeichert. personId: 650, salutation: Frau, title: , firstName: Petra, lastName:  Ummenberger, comment: , updateTimestamp: 2015-06-10, active: 1	2015-06-10 09:18:11.634+00	345
1496	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-10 16:20:02.635+00	519
1493	[INFO] Organisation mit der id 114 gespeichert. organisationId: 114, name: MIELE Gesellschaft m.b.H., comment: , updateTimestamp: Wed Jun 10 09:18:34 UTC 2015, active: 1	2015-06-10 09:18:34.826+00	345
1494	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-10 09:19:34.864+00	345
1495	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-10 16:02:50.624+00	519
1508	[INFO] Person mit der id 169 gespeichert. personId: 169, salutation: Frau, title: , firstName: Bettina, lastName: Haberl, comment: , updateTimestamp: 2015-06-11, active: 1	2015-06-11 09:25:11.758+00	519
1509	[INFO] Wareneingang mit der id 12 auf Archivierungsstatus 0 gesetzt	2015-06-11 10:39:32.223+00	519
1516	[INFO] Warenausgang mit der id 48 gelöscht	2015-06-11 10:51:04.877+00	519
1519	[INFO] Wareneingang mit der id 84 gespeichert	2015-06-11 10:55:47.844+00	519
1525	[INFO] Warenausgang mit der id 228 gespeichert	2015-06-11 11:02:22.328+00	519
1526	[INFO] Warenausgang mit der id 226 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:02:30.801+00	519
1527	[INFO] Warenausgang mit der id 227 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:02:33.827+00	519
1528	[INFO] Warenausgang mit der id 228 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:02:36.619+00	519
1529	[INFO] Warenausgang mit der id 223 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:02:40.285+00	519
1530	[INFO] Warenausgang mit der id 224 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:02:42.997+00	519
1531	[INFO] Warenausgang mit der id 225 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:02:46.609+00	519
1497	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-06-10 16:20:50.484+00	642
1498	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-06-10 16:22:07.235+00	642
1499	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-06-10 16:23:53.314+00	253
1500	[INFO] Organisation mit der id 251 gespeichert. organisationId: 251, name: Billa Elixhausen, comment: , updateTimestamp: Wed Jun 10 16:26:02 UTC 2015, active: 1	2015-06-10 16:26:02.548+00	253
1501	[INFO] Organisation mit der id 251 gespeichert. organisationId: 251, name: Billa Elixhausen, comment: , updateTimestamp: Wed Jun 10 16:26:36 UTC 2015, active: 1	2015-06-10 16:26:36.63+00	253
1505	[INFO] Warenausgang mit der id 209 auf Archivierungsstatus 1 gesetzt	2015-06-10 16:43:04.156+00	253
1506	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-06-10 16:49:23.811+00	253
1507	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-11 08:33:32.834+00	519
1514	[INFO] Warenausgang mit der id 47 gelöscht	2015-06-11 10:50:30.937+00	519
1515	[INFO] Warenausgang mit der id 49 gelöscht	2015-06-11 10:50:51.84+00	519
1521	[INFO] Warenausgang mit der id 224 gespeichert	2015-06-11 10:58:37.22+00	519
1522	[INFO] Warenausgang mit der id 225 gespeichert	2015-06-11 10:59:41.398+00	519
1524	[INFO] Warenausgang mit der id 227 gespeichert	2015-06-11 11:01:56.812+00	519
1533	[INFO] Wareneingang mit der id 83 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:05:07.353+00	519
1502	[INFO] Wareneingang mit der id 82 gespeichert	2015-06-10 16:31:49.596+00	253
1503	[INFO] Wareneingang mit der id 83 gespeichert	2015-06-10 16:42:08.884+00	253
1504	[INFO] Warenausgang mit der id 209 gespeichert	2015-06-10 16:42:46.861+00	253
1510	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-06-11 10:39:44.455+00	253
1511	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-06-11 10:42:15.232+00	253
1512	[INFO] Warenausgang mit der id 53 gelöscht	2015-06-11 10:50:01.534+00	519
1513	[INFO] Warenausgang mit der id 52 gelöscht	2015-06-11 10:50:12.569+00	519
1517	[INFO] Warenausgang mit der id 50 gelöscht	2015-06-11 10:51:24.579+00	519
1518	[INFO] Wareneingang mit der id 12 gelöscht	2015-06-11 10:52:06.09+00	519
1520	[INFO] Warenausgang mit der id 223 gespeichert	2015-06-11 10:57:15.478+00	519
1523	[INFO] Warenausgang mit der id 226 gespeichert	2015-06-11 11:01:18.674+00	519
1532	[INFO] Wareneingang mit der id 84 auf Archivierungsstatus 1 gesetzt	2015-06-11 11:04:08.736+00	519
1534	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-06-11 16:45:52.059+00	253
1535	[INFO] Wareneingang mit der id 82 auf Archivierungsstatus 1 gesetzt	2015-06-11 16:54:32.434+00	253
1536	[INFO] Wareneingang mit der id 85 gespeichert	2015-06-11 16:56:42.233+00	253
1537	[INFO] Wareneingang mit der id 86 gespeichert	2015-06-11 16:57:30.115+00	253
1538	[INFO] Wareneingang mit der id 85 auf Archivierungsstatus 1 gesetzt	2015-06-11 16:58:22.66+00	253
1539	[INFO] Wareneingang mit der id 86 auf Archivierungsstatus 1 gesetzt	2015-06-11 16:58:26.787+00	253
1540	[INFO] Warenausgang mit der id 229 gespeichert	2015-06-11 16:59:25.79+00	253
1541	[INFO] Warenausgang mit der id 230 gespeichert	2015-06-11 16:59:54.214+00	253
1542	[INFO] Warenausgang mit der id 231 gespeichert	2015-06-11 17:00:23.399+00	253
1543	[INFO] Warenausgang mit der id 229 auf Archivierungsstatus 1 gesetzt	2015-06-11 17:00:33.042+00	253
1544	[INFO] Warenausgang mit der id 230 auf Archivierungsstatus 1 gesetzt	2015-06-11 17:00:35.886+00	253
1545	[INFO] Warenausgang mit der id 231 auf Archivierungsstatus 1 gesetzt	2015-06-11 17:00:38.115+00	253
1546	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-14 09:38:35.115+00	345
1547	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-14 10:06:22.666+00	345
1548	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-14 11:19:50.08+00	519
1549	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-14 11:20:03.535+00	519
1550	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-06-14 20:54:08.197+00	1
1551	[INFO] mschnoell@gmx.net hat sich abgemeldet	2015-06-14 20:56:18.578+00	1
1552	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-15 14:43:47.544+00	519
1553	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-15 14:43:54.654+00	519
1554	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-15 17:42:19.448+00	519
1555	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-15 17:43:06.249+00	519
1556	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-15 18:01:34.569+00	519
1557	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-16 13:14:05.004+00	519
1558	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-18 15:17:42.359+00	519
1559	[INFO] Passwort für Person mit Id 519 geändert.	2015-06-18 15:18:00.832+00	519
1560	[INFO] Person mit der id 445 gespeichert. personId: 445, salutation: Herr, title: Mag., firstName: Walter, lastName: Riezinger, comment: Tätigkeit: Akquise, updateTimestamp: 2015-06-18, active: 1	2015-06-18 15:19:38.605+00	519
1561	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: Dipl.-Ing., firstName: Albert, lastName: Kiefel, comment: Tätigkeit: Administration, updateTimestamp: 2015-06-18, active: 1	2015-06-18 15:22:04.986+00	519
1562	[INFO] Person mit der id 165 gespeichert. personId: 165, salutation: Herr, title: , firstName: Irmin, lastName: Gundl, comment: , updateTimestamp: 2015-06-18, active: 1	2015-06-18 15:25:40+00	519
1632	[INFO] Warenausgang mit der id 246 gespeichert	2015-06-20 10:02:16.432+00	602
1563	[INFO] Person mit der id 165 gespeichert. personId: 165, salutation: Herr, title: , firstName: Irmin, lastName: Gundl, comment: , updateTimestamp: 2015-06-18, active: 1	2015-06-18 15:53:37.607+00	519
1564	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-18 17:05:48.703+00	519
1565	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-18 17:05:57.75+00	519
1566	[INFO] irmin.gundl@aon.at hat sich angemeldet	2015-06-18 19:28:25.329+00	165
1567	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-19 12:43:41.189+00	519
1568	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-19 12:56:53.909+00	519
1569	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-06-20 09:01:39.703+00	602
1570	[INFO] Wareneingang mit der id 87 gespeichert	2015-06-20 09:09:00.273+00	602
1571	[INFO] Warenausgang mit der id 232 gespeichert	2015-06-20 09:09:41.76+00	602
1572	[INFO] Warenausgang mit der id 232 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:09:48.433+00	602
1573	[INFO] Wareneingang mit der id 87 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:10:05.104+00	602
1574	[INFO] Wareneingang mit der id 88 gespeichert	2015-06-20 09:11:09.701+00	602
1575	[INFO] Wareneingang mit der id 88 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:11:17.318+00	602
1576	[INFO] Warenausgang mit der id 233 gespeichert	2015-06-20 09:11:44.406+00	602
1577	[INFO] Warenausgang mit der id 233 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:11:47.771+00	602
1578	[INFO] Wareneingang mit der id 89 gespeichert	2015-06-20 09:13:07.221+00	602
1579	[INFO] Wareneingang mit der id 89 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:13:17.854+00	602
1580	[INFO] Warenausgang mit der id 234 gespeichert	2015-06-20 09:14:08.843+00	602
1581	[INFO] Warenausgang mit der id 234 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:14:12.58+00	602
1582	[INFO] Wareneingang mit der id 90 gespeichert	2015-06-20 09:15:13.412+00	602
1583	[INFO] Wareneingang mit der id 90 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:15:21.013+00	602
1584	[INFO] Warenausgang mit der id 235 gespeichert	2015-06-20 09:15:59.107+00	602
1585	[INFO] Warenausgang mit der id 235 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:16:02.27+00	602
1586	[INFO] Wareneingang mit der id 91 gespeichert	2015-06-20 09:17:35.531+00	602
1587	[INFO] Wareneingang mit der id 91 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:17:42.042+00	602
1588	[INFO] Warenausgang mit der id 236 gespeichert	2015-06-20 09:18:11.02+00	602
1589	[INFO] Warenausgang mit der id 236 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:18:14.008+00	602
1590	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-20 09:20:01.11+00	345
1591	[INFO] Wareneingang mit der id 92 gespeichert	2015-06-20 09:20:07.839+00	602
1592	[INFO] Wareneingang mit der id 92 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:20:14.646+00	602
1593	[INFO] Warenausgang mit der id 237 gespeichert	2015-06-20 09:20:40.511+00	602
1594	[INFO] Warenausgang mit der id 237 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:20:43.124+00	602
1595	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: Dipl.-Ing., firstName: Albert, lastName: Kiefel, comment: Tätigkeit: Administration, updateTimestamp: 2015-06-20, active: 1	2015-06-20 09:22:11.128+00	345
1596	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: Tätigkeit: Obfrau, Disposition, updateTimestamp: 2015-06-20, active: 1	2015-06-20 09:23:38.563+00	345
1597	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: Dipl.-Ing., firstName: Albert, lastName: Kiefel, comment: Tätigkeit: Administration, updateTimestamp: 2015-06-20, active: 1	2015-06-20 09:24:08.307+00	345
1602	[INFO] Wareneingang mit der id 94 gespeichert	2015-06-20 09:29:56.905+00	602
1603	[INFO] Wareneingang mit der id 94 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:30:04.375+00	602
1604	[INFO] Warenausgang mit der id 239 gespeichert	2015-06-20 09:33:09.702+00	602
1605	[INFO] Warenausgang mit der id 240 gespeichert	2015-06-20 09:33:35.56+00	602
1606	[INFO] Warenausgang mit der id 239 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:33:42.443+00	602
1607	[INFO] Warenausgang mit der id 240 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:33:44.953+00	602
1608	[INFO] Wareneingang mit der id 95 gespeichert	2015-06-20 09:35:04.293+00	602
1609	[INFO] Wareneingang mit der id 95 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:35:12.258+00	602
1613	[INFO] Warenausgang mit der id 238 gespeichert	2015-06-20 09:38:21.348+00	602
1614	[INFO] Warenausgang mit der id 238 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:38:24.997+00	602
1615	[INFO] Wareneingang mit der id 96 gespeichert	2015-06-20 09:43:33.288+00	602
1616	[INFO] Wareneingang mit der id 96 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:43:39.436+00	602
1619	[INFO] Warenausgang mit der id 242 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:45:11.622+00	602
1620	[INFO] Warenausgang mit der id 243 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:45:27.857+00	602
1598	[INFO] Wareneingang mit der id 93 gespeichert	2015-06-20 09:25:54.865+00	602
1599	[INFO] Wareneingang mit der id 93 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:26:40.368+00	602
1601	[INFO] Warenausgang mit der id 238 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:27:47.812+00	602
1600	[INFO] Warenausgang mit der id 238 gespeichert	2015-06-20 09:27:38.801+00	602
1610	[INFO] Warenausgang mit der id 241 gespeichert	2015-06-20 09:36:57.308+00	602
1611	[INFO] Warenausgang mit der id 241 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:37:03.205+00	602
1612	[INFO] Warenausgang mit der id 238 auf Archivierungsstatus 0 gesetzt	2015-06-20 09:38:03.747+00	602
1617	[INFO] Warenausgang mit der id 242 gespeichert	2015-06-20 09:44:30.646+00	602
1618	[INFO] Warenausgang mit der id 243 gespeichert	2015-06-20 09:45:07.058+00	602
1621	[INFO] Wareneingang mit der id 97 gespeichert	2015-06-20 09:47:38.237+00	602
1622	[INFO] Warenausgang mit der id 244 gespeichert	2015-06-20 09:48:46.517+00	602
1623	[INFO] Warenausgang mit der id 244 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:49:02.472+00	602
1624	[INFO] Wareneingang mit der id 98 gespeichert	2015-06-20 09:49:52.472+00	602
1625	[INFO] Warenausgang mit der id 245 gespeichert	2015-06-20 09:50:26.949+00	602
1626	[INFO] Warenausgang mit der id 245 auf Archivierungsstatus 1 gesetzt	2015-06-20 09:50:36.795+00	602
1627	[INFO] Wareneingang mit der id 99 gespeichert	2015-06-20 09:57:57.448+00	602
1628	[INFO] Wareneingang mit der id 99 gespeichert	2015-06-20 09:58:23.825+00	602
1629	[INFO] Wareneingang mit der id 99 gespeichert	2015-06-20 09:59:23.087+00	602
1630	[INFO] Wareneingang mit der id 99 gespeichert	2015-06-20 10:00:05.121+00	602
1631	[INFO] Wareneingang mit der id 99 auf Archivierungsstatus 1 gesetzt	2015-06-20 10:00:15.057+00	602
1633	[INFO] Warenausgang mit der id 246 auf Archivierungsstatus 1 gesetzt	2015-06-20 10:02:22.27+00	602
1634	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-20 10:07:03.085+00	345
1635	[INFO] Person mit der id 148 gespeichert. personId: 148, salutation: Frau, title: , firstName: Marijana, lastName: Grabovac, Bakk.Phil., comment: Newsletter: ja, updateTimestamp: 2015-06-20, active: 1	2015-06-20 10:07:26.903+00	345
1636	[INFO] Passwort für Person mit Id 602 geändert.	2015-06-20 10:10:19.469+00	602
1637	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-06-20 10:10:24.791+00	602
1638	[INFO] Person mit der id 310 gespeichert. personId: 310, salutation: Frau, title: , firstName: Bettina, lastName: Lorentschitsch, Msc MBA, comment: , updateTimestamp: 2015-06-20, active: 1	2015-06-20 10:13:14.238+00	345
1639	[INFO] Person mit der id 617 gespeichert. personId: 617, salutation: Herr, title: , firstName: Josef, lastName: Bachleitner, Ing., comment: , updateTimestamp: 2015-06-20, active: 1	2015-06-20 10:15:49.286+00	345
1640	[INFO] Person mit der id 617 gespeichert. personId: 617, salutation: Herr, title: Ing., firstName: Josef, lastName: Bachleitner, comment: , updateTimestamp: 2015-06-20, active: 1	2015-06-20 10:21:22.444+00	345
1641	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-20 10:27:48.486+00	345
1642	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-20 10:54:30.76+00	345
1643	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: Tätigkeit: Obfrau, Disposition, updateTimestamp: 2015-06-20, active: 1	2015-06-20 10:54:50.251+00	345
1644	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-20 10:54:54.936+00	345
1645	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-20 11:10:06.371+00	345
1646	[INFO] Person mit der id 651 gespeichert. personId: 651, salutation: Herr, title: , firstName: Bernhard, lastName: Rosegger, comment: Newsletter: nein, updateTimestamp: 2015-06-20, active: 1	2015-06-20 11:12:59.788+00	345
1647	[INFO] Kategorie mit der id 3 gespeichert	2015-06-20 11:27:56.571+00	345
1648	[INFO] Kategorie mit der id 3 gespeichert	2015-06-20 11:30:30.471+00	345
1649	[INFO] Kategorie mit der id 4 gespeichert	2015-06-20 11:31:23.138+00	345
1650	[INFO] Kategorie mit der id 3 gespeichert	2015-06-20 11:31:36.56+00	345
1651	[INFO] Kategorie mit der id 5 gespeichert	2015-06-20 11:32:31.384+00	345
1652	[INFO] Kategorie mit der id 6 gespeichert	2015-06-20 11:33:56.998+00	345
1653	[INFO] Kategorie mit der id 7 gespeichert	2015-06-20 11:34:28.829+00	345
1654	[INFO] Kategorie mit der id 8 gespeichert	2015-06-20 11:35:04.761+00	345
1655	[INFO] Kategorie mit der id 5 gespeichert	2015-06-20 11:35:26.96+00	345
1656	[INFO] Kategorie mit der id 3 gespeichert	2015-06-20 11:35:42.784+00	345
1657	[INFO] Kategorie mit der id 4 gespeichert	2015-06-20 11:36:05.584+00	345
1658	[INFO] Kategorie mit der id 7 gespeichert	2015-06-20 11:36:22.16+00	345
1659	[INFO] Kategorie mit der id 6 gespeichert	2015-06-20 11:36:29.053+00	345
1660	[INFO] Kategorie mit der id 8 gespeichert	2015-06-20 11:38:16.54+00	345
1661	[INFO] Kategorie mit der id 9 gespeichert	2015-06-20 11:38:47.618+00	345
1662	[INFO] Kategorie mit der id 10 gespeichert	2015-06-20 11:40:54.638+00	345
1663	[INFO] Kategorie mit der id 10 gespeichert	2015-06-20 11:41:20.283+00	345
1664	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-20 11:41:23.558+00	345
1665	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-20 11:41:58.103+00	345
1666	[INFO] Person mit der id 652 gespeichert. personId: 652, salutation: Herr, title: Dr., firstName: Helmut, lastName: Leube, comment: Newsletter: ja, updateTimestamp: 2015-06-20, active: 1	2015-06-20 11:43:38.873+00	345
1667	[INFO] Alle Personen als CSV exportiert.	2015-06-20 11:45:20.422+00	345
1668	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-20 11:45:37.599+00	345
1669	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-20 16:52:51.456+00	345
1670	[INFO] Alle Personen als CSV exportiert.	2015-06-20 16:53:25.614+00	345
1671	[INFO] Alle Personen als CSV exportiert.	2015-06-20 17:00:30.323+00	345
1672	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: Dipl.-Ing., firstName: Albert, lastName: Kiefel, comment: Tätigkeit: Administration, updateTimestamp: 2015-06-20, active: 1	2015-06-20 17:24:39.927+00	345
1673	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-21 07:45:50.187+00	345
1674	[INFO] Person mit der id 147 gespeichert. personId: 147, salutation: Herr, title: , firstName: Franz, lastName: Grabmer, comment: , updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:51:05.483+00	345
1675	[INFO] Person mit der id 651 gespeichert. personId: 651, salutation: Herr, title: , firstName: Bernhard, lastName: Rosegger, comment: Newsletter: nein, updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:51:58.281+00	345
1676	[INFO] Person mit der id 221 gespeichert. personId: 221, salutation: Herr Generaldirektor, title: Dr., firstName: Johannes, lastName: Hörl, comment: Newsletter: nein, updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:52:56.534+00	345
1677	[INFO] Person mit der id 505 gespeichert. personId: 505, salutation: Schwester, title: , firstName: Joanella, lastName: Six, comment: , updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:53:36.064+00	345
1678	[INFO] Person mit der id 564 gespeichert. personId: 564, salutation: Herr, title: , firstName: Hans-Peter, lastName: Wawra, comment: , updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:54:20.004+00	345
1679	[INFO] Person mit der id 647 gespeichert. personId: 647, salutation: Frau, title: Dr., firstName: Brigitta, lastName: Pallauf, comment: Newsletter: ja, updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:54:49.645+00	345
1680	[INFO] Person mit der id 558 gespeichert. personId: 558, salutation: Frau, title: , firstName: Theresia, lastName: Wallerstorfer, comment: , updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:57:59.092+00	345
1681	[INFO] Person mit der id 649 gespeichert. personId: 649, salutation: Herr, title: Dr., firstName: Leonhard, lastName: Schitter, comment: Newsletter: nein, updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:58:24.069+00	345
1682	[INFO] Person mit der id 652 gespeichert. personId: 652, salutation: Herr, title: Dr., firstName: Helmut, lastName: Leube, comment: Newsletter: ja, updateTimestamp: 2015-06-21, active: 1	2015-06-21 07:58:47.434+00	345
1683	[INFO] Alle Personen als CSV exportiert.	2015-06-21 08:03:42.726+00	345
1684	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-21 08:45:45.554+00	345
1685	[INFO] Person mit der id 221 gespeichert. personId: 221, salutation: Herr Generaldirektor, title: Dr., firstName: Johannes, lastName: Hörl, comment: Newsletter: nein, updateTimestamp: 2015-06-21, active: 1	2015-06-21 08:46:05.915+00	345
1686	[INFO] Person mit der id 34 gespeichert. personId: 34, salutation: Herr, title: , firstName: Wolf, lastName: Baur, comment: Tätigkeit: Waren, updateTimestamp: 2015-06-21, active: 1	2015-06-21 09:03:10.456+00	345
1687	[INFO] Person mit der id 120 gespeichert. personId: 120, salutation: Frau, title: , firstName: Claudia, lastName: Frauenschuh, comment: , updateTimestamp: 2015-06-21, active: 1	2015-06-21 09:03:23.498+00	345
1688	[INFO] Person mit der id 121 gespeichert. personId: 121, salutation: Herr, title: , firstName: Hermann, lastName: Frauenschuh, comment: , updateTimestamp: 2015-06-21, active: 1	2015-06-21 09:03:36.96+00	345
1689	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-21 09:21:39.681+00	345
1690	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-21 19:05:41.325+00	519
1691	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-23 09:47:11.578+00	519
1692	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: , updateTimestamp: 2015-06-23, active: 1	2015-06-23 09:48:55.875+00	519
1693	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: Tätigkeit: Waren, updateTimestamp: 2015-06-23, active: 1	2015-06-23 09:51:12.428+00	519
1694	[INFO] Person mit der id 615 gespeichert. personId: 615, salutation: Herr, title: , firstName: Anton, lastName: Gietzinger, comment: , updateTimestamp: 2015-06-23, active: 1	2015-06-23 09:52:42.129+00	519
1695	[INFO] Organisation mit der id 172 gelöscht	2015-06-23 10:04:28.526+00	519
1696	[INFO] Organisation mit der id 173 gelöscht	2015-06-23 10:04:48.847+00	519
1697	[INFO] Organisation mit der id 174 gelöscht	2015-06-23 10:05:02.094+00	519
1698	[INFO] Organisation mit der id 177 gelöscht	2015-06-23 10:05:13.6+00	519
1699	[INFO] Person mit der id 194 gelöscht	2015-06-23 10:07:48.807+00	519
1700	[INFO] Person mit der id 443 gelöscht	2015-06-23 10:08:03.616+00	519
1701	[INFO] Alle Personen als CSV exportiert.	2015-06-23 10:37:48.791+00	519
1702	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-06-23 17:30:21.322+00	345
1703	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-06-23 17:32:01.437+00	345
1704	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-23 19:00:13.403+00	519
1705	[INFO] Alle Personen als CSV exportiert.	2015-06-23 19:00:53.219+00	519
1706	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-06-23 19:05:15.725+00	519
1707	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-06-24 13:27:56.218+00	253
1708	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-06-24 13:28:51.301+00	253
1709	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-06-27 17:38:41.592+00	642
1710	[INFO] Passwort für Person mit Id 642 geändert.	2015-06-27 17:38:57.064+00	642
1711	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-06-29 18:36:18.804+00	519
1712	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-07-03 08:53:44.232+00	642
1713	[INFO] Wareneingang mit der id 68 gespeichert	2015-07-03 08:56:26.963+00	642
1714	[INFO] Warenausgang mit der id 247 gespeichert	2015-07-03 09:03:48.086+00	642
1715	[INFO] Warenausgang mit der id 247 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:03:53.658+00	642
1716	[INFO] Warenausgang mit der id 248 gespeichert	2015-07-03 09:05:30.038+00	642
1717	[INFO] Warenausgang mit der id 248 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:06:56.571+00	642
1718	[INFO] Warenausgang mit der id 249 gespeichert	2015-07-03 09:11:42.14+00	642
1719	[INFO] Warenausgang mit der id 249 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:12:41.919+00	642
1720	[INFO] Wareneingang mit der id 80 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:13:07.467+00	642
1721	[INFO] Wareneingang mit der id 68 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:13:13.539+00	642
1722	[INFO] Wareneingang mit der id 78 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:19:25.216+00	642
1723	[INFO] Wareneingang mit der id 79 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:19:50.553+00	642
1724	[INFO] Warenausgang mit der id 250 gespeichert	2015-07-03 09:22:56.472+00	642
1725	[INFO] Warenausgang mit der id 250 auf Archivierungsstatus 1 gesetzt	2015-07-03 09:23:06.063+00	642
1726	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-07-07 06:13:24.057+00	642
1727	[INFO] Wareneingang mit der id 72 auf Archivierungsstatus 1 gesetzt	2015-07-07 06:21:53.011+00	642
1728	[INFO] Warenausgang mit der id 251 gespeichert	2015-07-07 06:28:57.066+00	642
1729	[INFO] Wareneingang mit der id 100 gespeichert	2015-07-07 06:33:19.471+00	642
1730	[INFO] Wareneingang mit der id 100 gespeichert	2015-07-07 06:34:31.215+00	642
1731	[INFO] Warenausgang mit der id 252 gespeichert	2015-07-07 06:39:15.34+00	642
1732	[INFO] Warenausgang mit der id 252 gespeichert	2015-07-07 06:40:31.035+00	642
1733	[INFO] Warenausgang mit der id 253 gespeichert	2015-07-07 06:42:18.903+00	642
1734	[INFO] Warenausgang mit der id 253 auf Archivierungsstatus 1 gesetzt	2015-07-07 06:42:24.888+00	642
1735	[INFO] Wareneingang mit der id 81 auf Archivierungsstatus 1 gesetzt	2015-07-07 06:42:41.242+00	642
1736	[INFO] Wareneingang mit der id 100 auf Archivierungsstatus 1 gesetzt	2015-07-07 06:43:02.739+00	642
1737	[INFO] Warenausgang mit der id 251 auf Archivierungsstatus 1 gesetzt	2015-07-07 06:45:43.557+00	642
1738	[INFO] Warenausgang mit der id 252 auf Archivierungsstatus 1 gesetzt	2015-07-07 06:45:47.243+00	642
1739	[INFO] Warenausgang mit der id 209 auf Archivierungsstatus 0 gesetzt	2015-07-07 07:05:16.009+00	642
1740	[INFO] Warenausgang mit der id 209 gespeichert	2015-07-07 07:06:22.835+00	642
1741	[INFO] Warenausgang mit der id 209 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:06:42.69+00	642
1742	[INFO] Warenausgang mit der id 209 auf Archivierungsstatus 0 gesetzt	2015-07-07 07:07:37.168+00	642
1743	[INFO] Warenausgang mit der id 209 gespeichert	2015-07-07 07:09:32.272+00	642
1744	[INFO] Warenausgang mit der id 219 auf Archivierungsstatus 0 gesetzt	2015-07-07 07:13:17.426+00	642
1745	[INFO] Warenausgang mit der id 221 auf Archivierungsstatus 0 gesetzt	2015-07-07 07:13:33.183+00	642
1746	[INFO] Warenausgang mit der id 219 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:16:26.755+00	642
1747	[INFO] Warenausgang mit der id 209 gespeichert	2015-07-07 07:17:50.768+00	642
1748	[INFO] Warenausgang mit der id 221 gespeichert	2015-07-07 07:18:25.868+00	642
1749	[INFO] Warenausgang mit der id 209 gespeichert	2015-07-07 07:18:57.31+00	642
1750	[INFO] Warenausgang mit der id 209 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:19:30.206+00	642
1751	[INFO] Warenausgang mit der id 221 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:19:33.639+00	642
1752	[INFO] Wareneingang mit der id 77 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:19:44.03+00	642
1753	[INFO] Wareneingang mit der id 101 gespeichert	2015-07-07 07:24:05.147+00	642
1754	[INFO] Wareneingang mit der id 102 gespeichert	2015-07-07 07:25:22.02+00	642
1755	[INFO] Wareneingang mit der id 103 gespeichert	2015-07-07 07:28:47.972+00	642
1757	[INFO] Wareneingang mit der id 105 gespeichert	2015-07-07 07:30:56.192+00	642
1764	[INFO] Warenausgang mit der id 257 gespeichert	2015-07-07 07:34:33.468+00	642
1765	[INFO] Warenausgang mit der id 257 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:34:44.7+00	642
1766	[INFO] Warenausgang mit der id 256 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:34:48.43+00	642
1767	[INFO] Warenausgang mit der id 258 gespeichert	2015-07-07 07:36:53.18+00	642
1768	[INFO] Warenausgang mit der id 259 gespeichert	2015-07-07 07:37:18.601+00	642
1771	[INFO] Wareneingang mit der id 101 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:37:44.99+00	642
1772	[INFO] Wareneingang mit der id 104 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:37:52.098+00	642
1773	[INFO] Wareneingang mit der id 103 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:37:57.306+00	642
1774	[INFO] Wareneingang mit der id 106 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:38:02.48+00	642
1775	[INFO] Wareneingang mit der id 105 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:38:07.077+00	642
1776	[INFO] Wareneingang mit der id 102 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:38:13.246+00	642
1777	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-07-07 07:38:29.087+00	642
1778	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-07-07 07:43:02.637+00	642
1780	[INFO] Warenausgang mit der id 251 gespeichert	2015-07-07 07:44:05.07+00	642
1781	[INFO] Warenausgang mit der id 252 auf Archivierungsstatus 0 gesetzt	2015-07-07 07:44:27.361+00	642
1756	[INFO] Wareneingang mit der id 104 gespeichert	2015-07-07 07:29:43.803+00	642
1782	[INFO] Warenausgang mit der id 252 gespeichert	2015-07-07 07:49:33.218+00	642
1783	[INFO] Warenausgang mit der id 251 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:52:37.863+00	642
1784	[INFO] Warenausgang mit der id 252 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:52:41.611+00	642
1785	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-07-07 07:53:04.209+00	642
1786	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-07 21:01:33.068+00	519
1758	[INFO] Wareneingang mit der id 106 gespeichert	2015-07-07 07:31:38.771+00	642
1759	[INFO] Warenausgang mit der id 254 gespeichert	2015-07-07 07:32:21.146+00	642
1760	[INFO] Warenausgang mit der id 255 gespeichert	2015-07-07 07:32:53.412+00	642
1761	[INFO] Warenausgang mit der id 255 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:33:09.512+00	642
1762	[INFO] Warenausgang mit der id 254 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:33:13.258+00	642
1763	[INFO] Warenausgang mit der id 256 gespeichert	2015-07-07 07:33:58.475+00	642
1769	[INFO] Warenausgang mit der id 259 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:37:27.19+00	642
1770	[INFO] Warenausgang mit der id 258 auf Archivierungsstatus 1 gesetzt	2015-07-07 07:37:31.531+00	642
1779	[INFO] Warenausgang mit der id 251 auf Archivierungsstatus 0 gesetzt	2015-07-07 07:43:28.247+00	642
1787	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-07-10 13:08:05.794+00	345
1788	[INFO] Person mit der id 397 gespeichert. personId: 397, salutation: Frau, title: , firstName: Monika, lastName: Pointner, comment: , updateTimestamp: 2015-07-10, active: 1	2015-07-10 13:09:02.318+00	345
1789	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-07-10 13:20:46.369+00	345
1790	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-12 17:19:41.942+00	519
1791	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-07-12 17:30:57.357+00	519
1792	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-15 16:02:56.788+00	519
1793	[INFO] Person mit der id 430 gespeichert. personId: 430, salutation: Frau, title: , firstName: Sabrina, lastName: Reiter, comment: Tätigkeit: Waren, updateTimestamp: 2015-07-15, active: 1	2015-07-15 16:04:29.734+00	519
1794	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-07-15 16:07:11.234+00	519
1795	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-15 16:15:24.585+00	519
1796	[INFO] Wareneingang mit der id 107 gespeichert	2015-07-15 16:24:39.734+00	519
1797	[INFO] Wareneingang mit der id 107 auf Archivierungsstatus 1 gesetzt	2015-07-15 16:25:51.753+00	519
1798	[INFO] Warenausgang mit der id 260 gespeichert	2015-07-15 16:29:55.45+00	519
1799	[INFO] Warenausgang mit der id 261 gespeichert	2015-07-15 16:30:38.516+00	519
1800	[INFO] Warenausgang mit der id 260 auf Archivierungsstatus 1 gesetzt	2015-07-15 16:31:04.113+00	519
1801	[INFO] Warenausgang mit der id 261 auf Archivierungsstatus 1 gesetzt	2015-07-15 16:31:06.716+00	519
1802	[INFO] Wareneingang mit der id 107 auf Archivierungsstatus 0 gesetzt	2015-07-15 16:48:33.344+00	519
1803	[INFO] Warenausgang mit der id 260 gelöscht	2015-07-15 16:49:46.104+00	519
1804	[INFO] Warenausgang mit der id 261 gelöscht	2015-07-15 16:50:04.353+00	519
1805	[INFO] Wareneingang mit der id 107 gelöscht	2015-07-15 16:50:22.324+00	519
1806	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-23 18:19:52.75+00	519
1807	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-07-24 18:38:09.053+00	602
1808	[INFO] Wareneingang mit der id 108 gespeichert	2015-07-24 19:03:09.517+00	602
1809	[INFO] Wareneingang mit der id 109 gespeichert	2015-07-24 19:04:25.666+00	602
1810	[INFO] Wareneingang mit der id 109 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:04:31.737+00	602
1811	[INFO] Wareneingang mit der id 108 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:04:35.133+00	602
1812	[INFO] Wareneingang mit der id 109 auf Archivierungsstatus 0 gesetzt	2015-07-24 19:05:00.821+00	602
1813	[INFO] Wareneingang mit der id 109 gespeichert	2015-07-24 19:12:29.204+00	602
1814	[INFO] Wareneingang mit der id 109 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:12:34.372+00	602
1815	[INFO] Warenausgang mit der id 262 gespeichert	2015-07-24 19:13:58.789+00	602
1816	[INFO] Warenausgang mit der id 263 gespeichert	2015-07-24 19:14:34.876+00	602
1817	[INFO] Warenausgang mit der id 264 gespeichert	2015-07-24 19:15:01.532+00	602
1818	[INFO] Warenausgang mit der id 265 gespeichert	2015-07-24 19:15:37.224+00	602
1819	[INFO] Warenausgang mit der id 266 gespeichert	2015-07-24 19:16:04.25+00	602
1820	[INFO] Warenausgang mit der id 267 gespeichert	2015-07-24 19:16:30.952+00	602
1821	[INFO] Warenausgang mit der id 268 gespeichert	2015-07-24 19:16:59.381+00	602
1822	[INFO] Warenausgang mit der id 269 gespeichert	2015-07-24 19:17:35.75+00	602
1823	[INFO] Warenausgang mit der id 270 gespeichert	2015-07-24 19:18:27.281+00	602
1824	[INFO] Warenausgang mit der id 271 gespeichert	2015-07-24 19:19:19.798+00	602
1825	[INFO] Warenausgang mit der id 272 gespeichert	2015-07-24 19:19:43.069+00	602
1826	[INFO] Warenausgang mit der id 273 gespeichert	2015-07-24 19:20:19.694+00	602
1827	[INFO] Warenausgang mit der id 274 gespeichert	2015-07-24 19:21:27.33+00	602
1828	[INFO] Warenausgang mit der id 275 gespeichert	2015-07-24 19:22:38.383+00	602
1829	[INFO] Warenausgang mit der id 276 gespeichert	2015-07-24 19:23:07.562+00	602
1830	[INFO] Warenausgang mit der id 265 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:20.724+00	602
1831	[INFO] Warenausgang mit der id 262 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:23.466+00	602
1832	[INFO] Warenausgang mit der id 263 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:25.672+00	602
1833	[INFO] Warenausgang mit der id 264 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:28.15+00	602
1834	[INFO] Warenausgang mit der id 266 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:30.388+00	602
1835	[INFO] Warenausgang mit der id 267 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:32.537+00	602
1836	[INFO] Warenausgang mit der id 268 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:34.938+00	602
1837	[INFO] Warenausgang mit der id 269 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:37.185+00	602
1838	[INFO] Warenausgang mit der id 270 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:39.296+00	602
1839	[INFO] Warenausgang mit der id 271 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:42.464+00	602
1840	[INFO] Warenausgang mit der id 272 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:44.609+00	602
1841	[INFO] Warenausgang mit der id 273 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:52.466+00	602
1842	[INFO] Warenausgang mit der id 274 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:23:58.836+00	602
1843	[INFO] Warenausgang mit der id 275 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:24:03.247+00	602
1844	[INFO] Warenausgang mit der id 276 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:24:06.249+00	602
1845	[INFO] Wareneingang mit der id 110 gespeichert	2015-07-24 19:25:42.545+00	602
1846	[INFO] Wareneingang mit der id 110 gespeichert	2015-07-24 19:30:05.28+00	602
1847	[INFO] Wareneingang mit der id 110 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:30:32.377+00	602
1848	[INFO] Warenausgang mit der id 277 gespeichert	2015-07-24 19:31:29.199+00	602
1849	[INFO] Warenausgang mit der id 277 auf Archivierungsstatus 1 gesetzt	2015-07-24 19:31:34.85+00	602
1850	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-24 19:37:56.252+00	519
1851	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-07-24 19:40:09.38+00	519
1852	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-07-24 21:00:31.475+00	602
1853	[INFO] Wareneingang mit der id 111 gespeichert	2015-07-24 21:01:38.558+00	602
1854	[INFO] Warenausgang mit der id 278 gespeichert	2015-07-24 21:02:18.346+00	602
1918	[INFO] Warenausgang mit der id 296 gespeichert	2015-07-25 10:32:26.415+00	602
1929	[INFO] Wareneingang mit der id 124 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:48:42.092+00	602
1935	[INFO] Warenausgang mit der id 300 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:51:11.196+00	602
1936	[INFO] Wareneingang mit der id 126 gespeichert	2015-07-25 10:52:49.931+00	602
1937	[INFO] Wareneingang mit der id 126 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:52:55.838+00	602
1938	[INFO] Warenausgang mit der id 301 gespeichert	2015-07-25 10:53:17.045+00	602
1939	[INFO] Warenausgang mit der id 301 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:53:23.37+00	602
1940	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-07-25 11:02:01.13+00	602
1941	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-28 07:19:34.002+00	519
1855	[INFO] Warenausgang mit der id 278 auf Archivierungsstatus 1 gesetzt	2015-07-24 21:02:22.437+00	602
1856	[INFO] Wareneingang mit der id 111 auf Archivierungsstatus 1 gesetzt	2015-07-24 21:02:34.164+00	602
1860	[INFO] Warenausgang mit der id 279 auf Archivierungsstatus 1 gesetzt	2015-07-24 21:04:41.84+00	602
1863	[INFO] Wareneingang mit der id 98 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:29:44.866+00	602
1864	[INFO] Wareneingang mit der id 97 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:29:48.833+00	602
1865	[INFO] Wareneingang mit der id 113 gespeichert	2015-07-25 09:37:58.847+00	602
1871	[INFO] Wareneingang mit der id 114 gespeichert	2015-07-25 09:43:57.755+00	602
1873	[INFO] Warenausgang mit der id 282 gespeichert	2015-07-25 09:46:13.834+00	602
1881	[INFO] Warenausgang mit der id 285 gespeichert	2015-07-25 10:03:26.615+00	602
1885	[INFO] Wareneingang mit der id 116 gespeichert	2015-07-25 10:07:12.737+00	602
1886	[INFO] Wareneingang mit der id 116 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:07:17.412+00	602
1894	[INFO] Wareneingang mit der id 117 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:11:25.01+00	602
1895	[INFO] Warenausgang mit der id 290 gespeichert	2015-07-25 10:12:30.458+00	602
1896	[INFO] Warenausgang mit der id 291 gespeichert	2015-07-25 10:13:53.187+00	602
1897	[INFO] Warenausgang mit der id 290 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:14:07.086+00	602
1898	[INFO] Warenausgang mit der id 291 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:14:11.401+00	602
1899	[INFO] Wareneingang mit der id 118 gespeichert	2015-07-25 10:14:55.243+00	602
1900	[INFO] Wareneingang mit der id 118 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:14:59.73+00	602
1903	[INFO] Warenausgang mit der id 294 gespeichert	2015-07-25 10:16:21.407+00	602
1909	[INFO] Warenausgang mit der id 262 auf Archivierungsstatus 0 gesetzt	2015-07-25 10:21:11.904+00	602
1914	[INFO] Wareneingang mit der id 120 gespeichert	2015-07-25 10:25:14.912+00	602
1915	[INFO] Wareneingang mit der id 120 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:25:19.211+00	602
1916	[INFO] Wareneingang mit der id 121 gespeichert	2015-07-25 10:31:26.432+00	602
1917	[INFO] Wareneingang mit der id 121 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:31:53.423+00	602
1919	[INFO] Warenausgang mit der id 296 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:32:48.495+00	602
1920	[INFO] Wareneingang mit der id 122 gespeichert	2015-07-25 10:33:29.412+00	602
1921	[INFO] Wareneingang mit der id 122 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:33:33.659+00	602
1922	[INFO] Warenausgang mit der id 297 gespeichert	2015-07-25 10:33:59.982+00	602
1923	[INFO] Warenausgang mit der id 297 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:34:02.387+00	602
1924	[INFO] Wareneingang mit der id 123 gespeichert	2015-07-25 10:35:17.356+00	602
1925	[INFO] Wareneingang mit der id 123 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:35:21.233+00	602
1926	[INFO] Warenausgang mit der id 298 gespeichert	2015-07-25 10:35:55.134+00	602
1927	[INFO] Warenausgang mit der id 298 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:36:16.824+00	602
1928	[INFO] Wareneingang mit der id 124 gespeichert	2015-07-25 10:48:37.368+00	602
1930	[INFO] Warenausgang mit der id 299 gespeichert	2015-07-25 10:49:20.513+00	602
1931	[INFO] Warenausgang mit der id 299 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:49:23.674+00	602
1932	[INFO] Wareneingang mit der id 125 gespeichert	2015-07-25 10:50:30.915+00	602
1933	[INFO] Wareneingang mit der id 125 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:50:45.667+00	602
1857	[INFO] Wareneingang mit der id 112 gespeichert	2015-07-24 21:03:56.754+00	602
1859	[INFO] Warenausgang mit der id 279 gespeichert	2015-07-24 21:04:35.264+00	602
1861	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-07-24 21:05:02.83+00	602
1862	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-07-25 09:28:18.062+00	602
1866	[INFO] Wareneingang mit der id 113 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:38:30.182+00	602
1874	[INFO] Warenausgang mit der id 283 gespeichert	2015-07-25 09:56:24.686+00	602
1875	[INFO] Warenausgang mit der id 284 gespeichert	2015-07-25 09:58:07.119+00	602
1879	[INFO] Wareneingang mit der id 115 gespeichert	2015-07-25 10:01:16.421+00	602
1880	[INFO] Wareneingang mit der id 115 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:01:27.649+00	602
1882	[INFO] Warenausgang mit der id 286 gespeichert	2015-07-25 10:04:53.97+00	602
1883	[INFO] Warenausgang mit der id 285 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:05:21.276+00	602
1884	[INFO] Warenausgang mit der id 286 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:05:31.778+00	602
1887	[INFO] Warenausgang mit der id 287 gespeichert	2015-07-25 10:07:53.644+00	602
1888	[INFO] Warenausgang mit der id 288 gespeichert	2015-07-25 10:08:33.123+00	602
1889	[INFO] Warenausgang mit der id 289 gespeichert	2015-07-25 10:09:22.736+00	602
1902	[INFO] Warenausgang mit der id 293 gespeichert	2015-07-25 10:15:56.527+00	602
1904	[INFO] Warenausgang mit der id 292 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:16:27.162+00	602
1905	[INFO] Warenausgang mit der id 293 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:16:29.761+00	602
1906	[INFO] Warenausgang mit der id 294 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:16:32.178+00	602
1910	[INFO] Warenausgang mit der id 262 gespeichert	2015-07-25 10:21:30.418+00	602
1911	[INFO] Warenausgang mit der id 262 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:21:33.25+00	602
1912	[INFO] Warenausgang mit der id 295 gespeichert	2015-07-25 10:22:50.38+00	602
1913	[INFO] Warenausgang mit der id 295 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:22:53.206+00	602
1858	[INFO] Wareneingang mit der id 112 auf Archivierungsstatus 1 gesetzt	2015-07-24 21:04:02.001+00	602
1867	[INFO] Warenausgang mit der id 280 gespeichert	2015-07-25 09:39:31.801+00	602
1868	[INFO] Warenausgang mit der id 281 gespeichert	2015-07-25 09:40:15.368+00	602
1869	[INFO] Warenausgang mit der id 280 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:40:18.967+00	602
1870	[INFO] Warenausgang mit der id 281 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:40:21.517+00	602
1872	[INFO] Wareneingang mit der id 114 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:44:33.386+00	602
1876	[INFO] Warenausgang mit der id 282 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:58:10.125+00	602
1877	[INFO] Warenausgang mit der id 283 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:58:14.682+00	602
1878	[INFO] Warenausgang mit der id 284 auf Archivierungsstatus 1 gesetzt	2015-07-25 09:58:17.057+00	602
1890	[INFO] Warenausgang mit der id 288 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:09:25.861+00	602
1891	[INFO] Warenausgang mit der id 287 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:09:33.433+00	602
1892	[INFO] Warenausgang mit der id 289 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:09:38.205+00	602
1893	[INFO] Wareneingang mit der id 117 gespeichert	2015-07-25 10:11:19.98+00	602
1901	[INFO] Warenausgang mit der id 292 gespeichert	2015-07-25 10:15:23.887+00	602
1907	[INFO] Wareneingang mit der id 119 gespeichert	2015-07-25 10:18:15.337+00	602
1908	[INFO] Wareneingang mit der id 119 auf Archivierungsstatus 1 gesetzt	2015-07-25 10:18:19.133+00	602
1934	[INFO] Warenausgang mit der id 300 gespeichert	2015-07-25 10:51:07.965+00	602
1942	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-07-29 11:46:26.981+00	519
1943	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-07-30 07:51:02.312+00	642
1944	[INFO] Wareneingang mit der id 127 gespeichert	2015-07-30 07:55:21.282+00	642
1945	[INFO] Warenausgang mit der id 302 gespeichert	2015-07-30 07:56:23.604+00	642
1946	[INFO] Warenausgang mit der id 302 auf Archivierungsstatus 1 gesetzt	2015-07-30 07:56:28.332+00	642
1947	[INFO] Wareneingang mit der id 127 auf Archivierungsstatus 1 gesetzt	2015-07-30 07:56:38.331+00	642
1948	[INFO] Wareneingang mit der id 128 gespeichert	2015-07-30 07:57:44.001+00	642
1949	[INFO] Warenausgang mit der id 303 gespeichert	2015-07-30 07:58:17.017+00	642
1950	[INFO] Warenausgang mit der id 304 gespeichert	2015-07-30 07:59:58.153+00	642
1951	[INFO] Warenausgang mit der id 305 gespeichert	2015-07-30 08:00:32.733+00	642
1952	[INFO] Warenausgang mit der id 303 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:00:52.8+00	642
1953	[INFO] Warenausgang mit der id 305 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:00:56.459+00	642
1954	[INFO] Warenausgang mit der id 304 gespeichert	2015-07-30 08:02:10.173+00	642
1955	[INFO] Warenausgang mit der id 304 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:02:14.929+00	642
1956	[INFO] Wareneingang mit der id 128 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:02:21.464+00	642
1957	[INFO] Wareneingang mit der id 129 gespeichert	2015-07-30 08:03:07.197+00	642
1958	[INFO] Warenausgang mit der id 306 gespeichert	2015-07-30 08:03:35.774+00	642
1959	[INFO] Warenausgang mit der id 306 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:03:47.632+00	642
1960	[INFO] Wareneingang mit der id 129 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:04:05.738+00	642
1961	[INFO] Wareneingang mit der id 130 gespeichert	2015-07-30 08:06:07.541+00	642
1962	[INFO] Warenausgang mit der id 307 gespeichert	2015-07-30 08:07:01.257+00	642
1963	[INFO] Warenausgang mit der id 308 gespeichert	2015-07-30 08:07:34.234+00	642
1964	[INFO] Warenausgang mit der id 309 gespeichert	2015-07-30 08:08:01.446+00	642
1965	[INFO] Warenausgang mit der id 307 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:08:06.798+00	642
1966	[INFO] Warenausgang mit der id 308 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:08:10.678+00	642
1967	[INFO] Warenausgang mit der id 309 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:08:14.101+00	642
1968	[INFO] Wareneingang mit der id 130 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:08:25.472+00	642
1969	[INFO] Wareneingang mit der id 131 gespeichert	2015-07-30 08:10:24.337+00	642
1970	[INFO] Warenausgang mit der id 310 gespeichert	2015-07-30 08:11:13.041+00	642
1971	[INFO] Warenausgang mit der id 310 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:11:21.993+00	642
1972	[INFO] Wareneingang mit der id 131 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:11:36.718+00	642
1973	[INFO] Wareneingang mit der id 132 gespeichert	2015-07-30 08:12:27.982+00	642
1974	[INFO] Warenausgang mit der id 310 auf Archivierungsstatus 0 gesetzt	2015-07-30 08:12:55.08+00	642
1975	[INFO] Wareneingang mit der id 131 auf Archivierungsstatus 0 gesetzt	2015-07-30 08:13:11.5+00	642
1976	[INFO] Warenausgang mit der id 310 gelöscht	2015-07-30 08:13:38.663+00	642
1977	[INFO] Wareneingang mit der id 131 gespeichert	2015-07-30 08:14:13.134+00	642
1978	[INFO] Warenausgang mit der id 311 gespeichert	2015-07-30 08:14:38.185+00	642
1979	[INFO] Warenausgang mit der id 311 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:14:43.435+00	642
1980	[INFO] Wareneingang mit der id 131 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:14:51.654+00	642
1981	[INFO] Warenausgang mit der id 312 gespeichert	2015-07-30 08:15:21.729+00	642
1982	[INFO] Warenausgang mit der id 312 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:15:28.462+00	642
1983	[INFO] Wareneingang mit der id 132 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:15:41.54+00	642
1984	[INFO] Wareneingang mit der id 133 gespeichert	2015-07-30 08:16:19.48+00	642
1985	[INFO] Warenausgang mit der id 313 gespeichert	2015-07-30 08:16:52.366+00	642
1986	[INFO] Warenausgang mit der id 313 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:16:57.66+00	642
1987	[INFO] Wareneingang mit der id 133 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:17:11.324+00	642
1988	[INFO] Wareneingang mit der id 134 gespeichert	2015-07-30 08:19:35.842+00	642
1989	[INFO] Warenausgang mit der id 314 gespeichert	2015-07-30 08:20:24.074+00	642
1990	[INFO] Warenausgang mit der id 315 gespeichert	2015-07-30 08:20:55.21+00	642
1991	[INFO] Warenausgang mit der id 316 gespeichert	2015-07-30 08:21:26.707+00	642
1992	[INFO] Warenausgang mit der id 317 gespeichert	2015-07-30 08:22:00.775+00	642
1993	[INFO] Warenausgang mit der id 314 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:22:08.873+00	642
1994	[INFO] Warenausgang mit der id 315 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:22:13.195+00	642
1995	[INFO] Warenausgang mit der id 316 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:22:21.404+00	642
1996	[INFO] Warenausgang mit der id 317 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:22:26.415+00	642
1997	[INFO] Wareneingang mit der id 134 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:22:35.633+00	642
1998	[INFO] Wareneingang mit der id 135 gespeichert	2015-07-30 08:23:07.999+00	642
2023	[INFO] Wareneingang mit der id 139 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:11:31.061+00	642
2024	[INFO] Wareneingang mit der id 140 gespeichert	2015-07-30 13:13:34.513+00	642
2025	[INFO] Warenausgang mit der id 325 gespeichert	2015-07-30 13:14:28.986+00	642
2026	[INFO] Warenausgang mit der id 325 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:14:33.85+00	642
2031	[INFO] Wareneingang mit der id 141 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:17:58.832+00	642
2033	[INFO] Warenausgang mit der id 327 gespeichert	2015-07-30 13:30:02.1+00	642
2034	[INFO] Warenausgang mit der id 328 gespeichert	2015-07-30 13:30:28.206+00	642
2035	[INFO] Warenausgang mit der id 327 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:30:39.553+00	642
2036	[INFO] Warenausgang mit der id 328 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:30:46.212+00	642
2037	[INFO] Wareneingang mit der id 142 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:30:59.4+00	642
2038	[INFO] Wareneingang mit der id 143 gespeichert	2015-07-30 13:36:52.546+00	642
2039	[INFO] Warenausgang mit der id 329 gespeichert	2015-07-30 13:37:30.154+00	642
2040	[INFO] Warenausgang mit der id 330 gespeichert	2015-07-30 13:37:54.98+00	642
2041	[INFO] Warenausgang mit der id 329 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:37:58.932+00	642
2042	[INFO] Warenausgang mit der id 330 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:38:07.646+00	642
2043	[INFO] Wareneingang mit der id 143 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:38:33.108+00	642
2044	[INFO] Wareneingang mit der id 144 gespeichert	2015-07-30 13:39:01.157+00	642
2045	[INFO] Warenausgang mit der id 331 gespeichert	2015-07-30 13:40:33.731+00	642
2052	[INFO] Warenausgang mit der id 333 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:44:35.47+00	642
2053	[INFO] Warenausgang mit der id 332 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:44:39.835+00	642
1999	[INFO] Warenausgang mit der id 318 gespeichert	2015-07-30 08:23:44.802+00	642
2000	[INFO] Warenausgang mit der id 318 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:23:49.577+00	642
2001	[INFO] Wareneingang mit der id 135 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:23:59.19+00	642
2002	[INFO] Wareneingang mit der id 136 gespeichert	2015-07-30 08:25:16.626+00	642
2003	[INFO] Warenausgang mit der id 319 gespeichert	2015-07-30 08:25:53.231+00	642
2004	[INFO] Warenausgang mit der id 320 gespeichert	2015-07-30 08:26:22.01+00	642
2005	[INFO] Warenausgang mit der id 319 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:26:27.428+00	642
2006	[INFO] Warenausgang mit der id 320 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:26:36.555+00	642
2007	[INFO] Wareneingang mit der id 136 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:26:44.025+00	642
2008	[INFO] Wareneingang mit der id 137 gespeichert	2015-07-30 08:27:37.32+00	642
2009	[INFO] Warenausgang mit der id 321 gespeichert	2015-07-30 08:28:12.991+00	642
2010	[INFO] Warenausgang mit der id 322 gespeichert	2015-07-30 08:28:47.609+00	642
2011	[INFO] Warenausgang mit der id 321 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:28:51.818+00	642
2012	[INFO] Warenausgang mit der id 322 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:28:55.01+00	642
2013	[INFO] Wareneingang mit der id 137 auf Archivierungsstatus 1 gesetzt	2015-07-30 08:29:02.31+00	642
2014	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-07-30 08:31:56.084+00	642
2015	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-07-30 13:02:57.783+00	642
2016	[INFO] Wareneingang mit der id 138 gespeichert	2015-07-30 13:08:06.134+00	642
2017	[INFO] Warenausgang mit der id 323 gespeichert	2015-07-30 13:08:47.717+00	642
2018	[INFO] Warenausgang mit der id 323 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:08:55.554+00	642
2019	[INFO] Wareneingang mit der id 138 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:09:10.608+00	642
2020	[INFO] Wareneingang mit der id 139 gespeichert	2015-07-30 13:10:06.911+00	642
2021	[INFO] Warenausgang mit der id 324 gespeichert	2015-07-30 13:11:19.763+00	642
2022	[INFO] Warenausgang mit der id 324 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:11:23.23+00	642
2027	[INFO] Wareneingang mit der id 140 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:16:28.997+00	642
2028	[INFO] Wareneingang mit der id 141 gespeichert	2015-07-30 13:17:03.239+00	642
2030	[INFO] Warenausgang mit der id 326 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:17:52.532+00	642
2032	[INFO] Wareneingang mit der id 142 gespeichert	2015-07-30 13:27:49.12+00	642
2048	[INFO] Wareneingang mit der id 145 gespeichert	2015-07-30 13:42:55.634+00	642
2049	[INFO] Wareneingang mit der id 146 gespeichert	2015-07-30 13:43:20.187+00	642
2029	[INFO] Warenausgang mit der id 326 gespeichert	2015-07-30 13:17:47.983+00	642
2046	[INFO] Warenausgang mit der id 331 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:41:30.992+00	642
2047	[INFO] Wareneingang mit der id 144 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:42:02.401+00	642
2050	[INFO] Warenausgang mit der id 332 gespeichert	2015-07-30 13:44:01.455+00	642
2051	[INFO] Warenausgang mit der id 333 gespeichert	2015-07-30 13:44:31.915+00	642
2054	[INFO] Wareneingang mit der id 147 gespeichert	2015-07-30 13:51:23.128+00	642
2055	[INFO] Wareneingang mit der id 146 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:51:45.379+00	642
2056	[INFO] Wareneingang mit der id 145 auf Archivierungsstatus 1 gesetzt	2015-07-30 13:51:48.684+00	642
2057	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-07-30 13:57:04.94+00	642
2058	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-08-01 19:34:02.704+00	519
2059	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-08-17 15:05:02.973+00	345
2060	[INFO] Person mit der id 441 gespeichert. personId: 441, salutation: Frau, title: , firstName: Brigitte, lastName: Ricciotti, comment: Tätigkeit: Mitarbeiter, updateTimestamp: 2015-08-17, active: 1	2015-08-17 15:05:54.648+00	345
2061	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-08-17 15:06:40.22+00	345
2062	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-08-17 15:12:05.097+00	441
2063	[INFO] Passwort für Person mit Id 441 geändert.	2015-08-17 15:12:45.803+00	441
2064	[INFO] Alle Personen als CSV exportiert.	2015-08-17 15:33:08.699+00	441
2065	[INFO] info@view-salzburg.at hat sich angemeldet	2015-08-17 15:51:45.297+00	252
2066	[INFO] Person mit der id 441 gespeichert. personId: 441, salutation: Frau, title: , firstName: Brigitte, lastName: Ricciotti, comment: Tätigkeit: Mitarbeiter, updateTimestamp: 2015-08-17, active: 1	2015-08-17 15:59:13.925+00	252
2067	[INFO] b.ricciotti@view-salzburg.at hat sich abgemeldet	2015-08-17 16:01:46.502+00	441
2068	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-08-17 16:02:47.814+00	441
2069	[INFO] info@view-salzburg.at hat sich abgemeldet	2015-08-17 16:07:52.978+00	252
2070	[INFO] b.ricciotti@view-salzburg.at hat sich abgemeldet	2015-08-17 16:25:46.271+00	441
2071	[INFO] info@view-salzburg.at hat sich angemeldet	2015-08-17 16:29:31.419+00	252
2072	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: Tätigkeit: Obfrau, Disposition, updateTimestamp: 2015-06-20, active: 1	2015-08-17 16:31:16.43+00	252
2073	[INFO] Passwort für Person mit Id 252 geändert.	2015-08-17 16:32:37.591+00	252
2074	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-17 16:32:50.288+00	252
2075	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-17 16:33:44.101+00	252
2076	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-17 16:43:21.469+00	252
2077	[INFO] Organisation mit der id 66 gespeichert. organisationId: 66, name: Freiwilligenzentrum Salzburg, comment: , updateTimestamp: Mon Aug 17 16:44:57 UTC 2015, active: 1	2015-08-17 16:44:57.275+00	252
2078	[INFO] Person mit der id 93 gespeichert. personId: 93, salutation: Frau, title: Mag., firstName: Ingrid, lastName: Ebner, comment: , updateTimestamp: 2015-08-17, active: 1	2015-08-17 16:50:18.569+00	252
2079	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-17 16:52:06.167+00	252
2080	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-17 20:57:40.143+00	252
2081	[INFO] Person mit der id 491 gespeichert. personId: 491, salutation: Herr, title: Mag., firstName: Christoph, lastName: Schwaiger, comment: , updateTimestamp: 2015-08-17, active: 1	2015-08-17 21:04:36.349+00	252
2082	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-17 21:05:04.835+00	252
2083	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-08-18 06:34:00.143+00	642
2084	[INFO] Wareneingang mit der id 148 gespeichert	2015-08-18 06:38:36.391+00	642
2085	[INFO] Warenausgang mit der id 334 gespeichert	2015-08-18 06:39:17.406+00	642
2086	[INFO] Warenausgang mit der id 334 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:39:22.736+00	642
2087	[INFO] Wareneingang mit der id 148 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:39:32.254+00	642
2088	[INFO] Wareneingang mit der id 149 gespeichert	2015-08-18 06:40:46.211+00	642
2089	[INFO] Warenausgang mit der id 335 gespeichert	2015-08-18 06:42:37.261+00	642
2090	[INFO] Warenausgang mit der id 335 gespeichert	2015-08-18 06:43:29.337+00	642
2091	[INFO] Warenausgang mit der id 335 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:43:36.474+00	642
2092	[INFO] Wareneingang mit der id 149 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:43:49.829+00	642
2093	[INFO] Wareneingang mit der id 150 gespeichert	2015-08-18 06:44:18.594+00	642
2094	[INFO] Warenausgang mit der id 336 gespeichert	2015-08-18 06:44:44.363+00	642
2095	[INFO] Warenausgang mit der id 336 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:44:51.429+00	642
2096	[INFO] Wareneingang mit der id 150 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:45:03.414+00	642
2097	[INFO] Wareneingang mit der id 151 gespeichert	2015-08-18 06:45:30.279+00	642
2098	[INFO] Warenausgang mit der id 337 gespeichert	2015-08-18 06:45:55.901+00	642
2099	[INFO] Warenausgang mit der id 337 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:45:59.818+00	642
2100	[INFO] Wareneingang mit der id 151 auf Archivierungsstatus 1 gesetzt	2015-08-18 06:47:21.487+00	642
2101	[INFO] Wareneingang mit der id 152 gespeichert	2015-08-18 06:57:59.257+00	642
2102	[INFO] Wareneingang mit der id 152 gespeichert	2015-08-18 07:06:17.267+00	642
2103	[INFO] Warenausgang mit der id 338 gespeichert	2015-08-18 07:07:12.278+00	642
2104	[INFO] Warenausgang mit der id 339 gespeichert	2015-08-18 07:07:43.474+00	642
2105	[INFO] Warenausgang mit der id 340 gespeichert	2015-08-18 07:08:30.094+00	642
2106	[INFO] Warenausgang mit der id 341 gespeichert	2015-08-18 07:09:07.473+00	642
2107	[INFO] Warenausgang mit der id 338 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:09:15.505+00	642
2108	[INFO] Warenausgang mit der id 339 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:09:20.509+00	642
2109	[INFO] Warenausgang mit der id 340 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:09:26.871+00	642
2110	[INFO] Warenausgang mit der id 341 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:09:44.858+00	642
2111	[INFO] Wareneingang mit der id 153 gespeichert	2015-08-18 07:13:07.967+00	642
2112	[INFO] Wareneingang mit der id 154 gespeichert	2015-08-18 07:13:45.076+00	642
2113	[INFO] Warenausgang mit der id 342 gespeichert	2015-08-18 07:14:24.427+00	642
2114	[INFO] Warenausgang mit der id 343 gespeichert	2015-08-18 07:14:54.332+00	642
2115	[INFO] Warenausgang mit der id 342 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:14:58.071+00	642
2119	[INFO] Warenausgang mit der id 331 gespeichert	2015-08-18 07:18:22.44+00	642
2116	[INFO] Warenausgang mit der id 343 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:15:01.97+00	642
2120	[INFO] Warenausgang mit der id 342 auf Archivierungsstatus 0 gesetzt	2015-08-18 07:18:36.099+00	642
2122	[INFO] Warenausgang mit der id 342 gelöscht	2015-08-18 07:19:18.986+00	642
2123	[INFO] Wareneingang mit der id 154 gelöscht	2015-08-18 07:19:29.946+00	642
2124	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-08-18 07:20:48.017+00	642
2125	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-20 08:09:02.177+00	252
2128	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-20 08:16:40.202+00	252
2129	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-20 08:31:33.03+00	252
2134	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-20 15:38:02.1+00	252
2137	[INFO] Person mit der id 643 gespeichert. personId: 643, salutation: Herr, title: , firstName: Hugo, lastName: Rohner, comment: , updateTimestamp: 2015-08-20, active: 1	2015-08-20 15:51:13.688+00	345
2140	[INFO] Person mit der id 246 gespeichert. personId: 246, salutation: Frau, title: , firstName: Minni, lastName: Karres, comment: Newsletter: ja, updateTimestamp: 2015-08-20, active: 1	2015-08-20 16:19:00.744+00	345
2141	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: Tätigkeit: Waren, updateTimestamp: 2015-08-20, active: 1	2015-08-20 16:19:17.385+00	345
2142	[INFO] Person mit der id 468 gespeichert. personId: 468, salutation: Frau, title: , firstName: Edeltraud, lastName: Schirlbauer, comment: , updateTimestamp: 2015-08-20, active: 1	2015-08-20 16:21:18.315+00	345
2143	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-08-20 16:36:22.203+00	345
2144	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-08-22 16:06:10.978+00	441
2145	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-08-24 06:55:47.398+00	441
2146	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-24 10:04:22.713+00	252
2147	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-24 10:06:06.577+00	252
2117	[INFO] Wareneingang mit der id 154 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:15:15.566+00	642
2118	[INFO] Wareneingang mit der id 153 auf Archivierungsstatus 1 gesetzt	2015-08-18 07:15:19.146+00	642
2121	[INFO] Wareneingang mit der id 154 auf Archivierungsstatus 0 gesetzt	2015-08-18 07:18:58.718+00	642
2126	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-20 08:09:54.849+00	252
2127	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-20 08:15:49.811+00	252
2130	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-20 08:32:06.842+00	252
2131	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-20 08:33:00.479+00	252
2132	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-20 08:33:28.712+00	252
2133	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-20 15:31:07.432+00	252
2135	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-20 15:41:30.966+00	252
2136	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-08-20 15:46:25.869+00	345
2138	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-08-20 16:16:12.191+00	345
2139	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-08-20 16:18:21.973+00	345
2148	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-08-25 08:23:01.925+00	252
2149	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-08-25 08:26:51.03+00	252
2150	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-08-25 17:31:20.593+00	345
2151	[INFO] Organisation mit der id 62 gespeichert. organisationId: 62, name: Halleiner Schwestern Franziskanerinnen, comment: , updateTimestamp: Tue Aug 25 17:34:24 UTC 2015, active: 1	2015-08-25 17:34:24.156+00	345
2152	[INFO] Organisation mit der id 62 gelöscht	2015-08-25 17:34:51.664+00	345
2153	[INFO] Person mit der id 214 gelöscht	2015-08-25 17:42:12.096+00	345
2154	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-08-25 18:04:57.44+00	345
2155	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-08-31 07:46:56.955+00	441
2156	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-09-01 14:46:22.212+00	253
2157	[INFO] Wareneingang mit der id 155 gespeichert	2015-09-01 14:57:42.794+00	253
2158	[INFO] Wareneingang mit der id 155 gespeichert	2015-09-01 15:06:25.319+00	253
2159	[INFO] Wareneingang mit der id 155 gespeichert	2015-09-01 15:06:39.438+00	253
2160	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-09-01 17:51:46.428+00	519
2161	[INFO] Person mit der id 441 gespeichert. personId: 441, salutation: Frau, title: , firstName: Brigitte, lastName: Ricciotti, comment: Tätigkeit: Mitarbeiter, updateTimestamp: 2015-09-01, active: 1	2015-09-01 17:55:23.855+00	519
2162	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-09-01 17:56:17.469+00	519
2163	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-09-01 17:57:34.624+00	519
2164	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-09-01 18:17:46.897+00	519
2165	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-09-02 15:53:50.149+00	441
2166	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-09-03 10:08:30.065+00	252
2167	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-09-03 20:11:23.704+00	253
2168	[INFO] Warenausgang mit der id 344 gespeichert	2015-09-03 20:15:09.221+00	253
2169	[INFO] Warenausgang mit der id 345 gespeichert	2015-09-03 20:16:24.45+00	253
2170	[INFO] Warenausgang mit der id 344 auf Archivierungsstatus 1 gesetzt	2015-09-03 20:16:39.437+00	253
2171	[INFO] Warenausgang mit der id 345 auf Archivierungsstatus 1 gesetzt	2015-09-03 20:16:42.768+00	253
2172	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-09-05 22:07:24.318+00	252
2173	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-09-05 22:11:44.502+00	252
2174	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-09-07 17:31:11.585+00	253
2175	[INFO] Warenausgang mit der id 346 gespeichert	2015-09-07 17:33:40.254+00	253
2176	[INFO] Warenausgang mit der id 346 auf Archivierungsstatus 1 gesetzt	2015-09-07 17:33:45.198+00	253
2177	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-09-09 12:06:20.152+00	519
2178	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-09-09 15:50:41.808+00	441
2179	[INFO] Alle Personen als CSV exportiert.	2015-09-09 15:51:34.693+00	441
2180	[INFO] b.ricciotti@view-salzburg.at hat sich abgemeldet	2015-09-09 15:52:10.046+00	441
2181	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-09-09 15:56:48.853+00	441
2182	[INFO] Person mit der id 44 gespeichert. personId: 44, salutation: Frau, title: , firstName: Anita, lastName: Bernhofer, comment: Tätigkeit: Waren, updateTimestamp: 2015-09-09, active: 1	2015-09-09 15:58:09.811+00	441
2183	[INFO] Person mit der id 653 gespeichert. personId: 653, salutation: Herr, title: , firstName: Stefan, lastName: Scherzer, comment: , updateTimestamp: 2015-09-09, active: 1	2015-09-09 15:59:44.45+00	441
2184	[INFO] Person mit der id 653 gespeichert. personId: 653, salutation: Herr, title: , firstName: Stefan, lastName: Scherzer, comment: , updateTimestamp: 2015-09-09, active: 1	2015-09-09 16:00:46.902+00	441
2185	[INFO] Person mit der id 653 gelöscht	2015-09-09 16:01:09.717+00	441
2186	[INFO] Alle Personen als CSV exportiert.	2015-09-09 16:04:37.585+00	441
2187	[INFO] Person mit der id 149 gespeichert. personId: 149, salutation: Frau, title: , firstName: Christa, lastName: Graf, comment: Tätigkeit: Waren; Newsletter: ja, updateTimestamp: 2015-09-09, active: 1	2015-09-09 16:15:27.495+00	441
2188	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-09-10 19:59:13.181+00	519
2189	[INFO] Person mit der id 654 gespeichert. personId: 654, salutation: Herr, title: , firstName: Thomas, lastName: Klein, comment: Wildsau Dirt Run www.wild-sau.com, updateTimestamp: 2015-09-10, active: 1	2015-09-10 20:02:16.267+00	519
2190	[INFO] Organisation mit der id 252 gespeichert. organisationId: 252, name: Projektbasis GmbH, comment: Wildsau Dirt Run (Leube) www.wild-sau.com, updateTimestamp: Thu Sep 10 20:03:32 UTC 2015, active: 1	2015-09-10 20:03:32.993+00	519
2191	[INFO] Person mit der id 654 gespeichert. personId: 654, salutation: Herr, title: , firstName: Thomas, lastName: Klein, comment: , updateTimestamp: 2015-09-10, active: 1	2015-09-10 20:03:53.138+00	519
2192	[INFO] Wareneingang mit der id 156 gespeichert	2015-09-10 20:07:11.335+00	519
2193	[INFO] Warenausgang mit der id 347 gespeichert	2015-09-10 20:08:04.078+00	519
2194	[INFO] Warenausgang mit der id 348 gespeichert	2015-09-10 20:08:38.03+00	519
2195	[INFO] Warenausgang mit der id 347 auf Archivierungsstatus 1 gesetzt	2015-09-10 20:08:45.243+00	519
2196	[INFO] Warenausgang mit der id 348 auf Archivierungsstatus 1 gesetzt	2015-09-10 20:08:48.092+00	519
2197	[INFO] Wareneingang mit der id 156 auf Archivierungsstatus 1 gesetzt	2015-09-10 20:09:02.893+00	519
2198	[INFO] Wareneingang mit der id 156 auf Archivierungsstatus 0 gesetzt	2015-09-10 20:10:09.787+00	519
2199	[INFO] Wareneingang mit der id 156 gespeichert	2015-09-10 20:10:27.747+00	519
2200	[INFO] Wareneingang mit der id 156 auf Archivierungsstatus 1 gesetzt	2015-09-10 20:11:31.392+00	519
2201	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-09-10 20:14:10.715+00	519
2202	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-09-22 08:20:00.564+00	519
2203	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-09-23 08:15:10.546+00	441
2204	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-09-23 09:00:29.909+00	345
2205	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-09-23 09:01:53.688+00	345
2206	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-09-29 09:20:42.335+00	519
2207	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-09-29 16:01:35.152+00	252
2208	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-09-29 16:03:16.165+00	252
2209	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-09-29 18:33:23.591+00	574
2210	[INFO] Wareneingang mit der id 157 gespeichert	2015-09-29 19:03:34.926+00	574
2211	[INFO] Warenausgang mit der id 349 gespeichert	2015-09-29 19:20:55.822+00	574
2212	[INFO] Warenausgang mit der id 350 gespeichert	2015-09-29 19:21:50.326+00	574
2213	[INFO] Warenausgang mit der id 351 gespeichert	2015-09-29 19:22:31.041+00	574
2214	[INFO] Warenausgang mit der id 351 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:23:04.643+00	574
2215	[INFO] Warenausgang mit der id 350 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:23:10.363+00	574
2216	[INFO] Warenausgang mit der id 349 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:23:14.165+00	574
2217	[INFO] Wareneingang mit der id 157 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:24:02.263+00	574
2218	[INFO] Wareneingang mit der id 158 gespeichert	2015-09-29 19:25:48.143+00	574
2219	[INFO] Warenausgang mit der id 352 gespeichert	2015-09-29 19:34:00.288+00	574
2220	[INFO] Wareneingang mit der id 158 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:35:29.799+00	574
2221	[INFO] Wareneingang mit der id 159 gespeichert	2015-09-29 19:37:43.442+00	574
2222	[INFO] Warenausgang mit der id 353 gespeichert	2015-09-29 19:38:59.324+00	574
2223	[INFO] Warenausgang mit der id 353 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:39:15.861+00	574
2224	[INFO] Wareneingang mit der id 159 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:39:26.948+00	574
2225	[INFO] Wareneingang mit der id 160 gespeichert	2015-09-29 19:42:04.434+00	574
2226	[INFO] Warenausgang mit der id 354 gespeichert	2015-09-29 19:43:26.764+00	574
2227	[INFO] Warenausgang mit der id 355 gespeichert	2015-09-29 19:44:16.218+00	574
2228	[INFO] Warenausgang mit der id 356 gespeichert	2015-09-29 19:44:54.408+00	574
2229	[INFO] Warenausgang mit der id 354 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:45:08.283+00	574
2230	[INFO] Warenausgang mit der id 355 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:45:16.462+00	574
2231	[INFO] Warenausgang mit der id 356 auf Archivierungsstatus 1 gesetzt	2015-09-29 19:45:22.976+00	574
2232	[INFO] Wareneingang mit der id 160 auf Archivierungsstatus 1 gesetzt	2015-09-29 20:15:25.143+00	574
2233	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-09-29 20:20:24.477+00	574
2234	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-09-29 20:30:50.369+00	519
2235	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-10-15 14:25:19.305+00	253
2236	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-10-15 14:37:03.436+00	253
2237	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-10-18 12:16:06.432+00	574
2238	[INFO] Wareneingang mit der id 161 gespeichert	2015-10-18 12:22:30.324+00	574
2239	[INFO] Warenausgang mit der id 352 auf Archivierungsstatus 1 gesetzt	2015-10-18 12:22:57.896+00	574
2240	[INFO] Warenausgang mit der id 357 gespeichert	2015-10-18 12:24:20.825+00	574
2241	[INFO] Warenausgang mit der id 358 gespeichert	2015-10-18 12:25:26.609+00	574
2242	[INFO] Warenausgang mit der id 359 gespeichert	2015-10-18 12:26:59.619+00	574
2243	[INFO] Warenausgang mit der id 357 gelöscht	2015-10-18 12:36:39.626+00	574
2244	[INFO] Warenausgang mit der id 358 gelöscht	2015-10-18 12:36:46.688+00	574
2245	[INFO] Warenausgang mit der id 359 gelöscht	2015-10-18 12:36:56.697+00	574
2246	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-10-18 12:38:49.373+00	574
2247	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-10-18 15:19:19.431+00	345
2248	[INFO] Organisation mit der id 253 gespeichert. organisationId: 253, name: Haus der Hoffnung, comment: , updateTimestamp: Sun Oct 18 15:21:14 UTC 2015, active: 1	2015-10-18 15:21:14.606+00	345
2249	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-10-18 18:10:49.638+00	574
2253	[INFO] Wareneingang mit der id 162 gespeichert	2015-10-18 18:41:15.197+00	574
2250	[INFO] Warenausgang mit der id 360 gespeichert	2015-10-18 18:31:44.659+00	574
2251	[INFO] Warenausgang mit der id 360 auf Archivierungsstatus 1 gesetzt	2015-10-18 18:31:53.938+00	574
2252	[INFO] Wareneingang mit der id 162 gespeichert	2015-10-18 18:39:01.781+00	574
2254	[INFO] Wareneingang mit der id 163 gespeichert	2015-10-18 18:50:17.847+00	574
2266	[INFO] Person mit der id 446 gespeichert. personId: 446, salutation: Frau, title: , firstName: Cornelia, lastName: Robl, comment: Tätigkeit: Waren, updateTimestamp: 2015-10-21, active: 1	2015-10-21 07:33:27.84+00	441
2267	[INFO] b.ricciotti@view-salzburg.at hat sich abgemeldet	2015-10-21 07:34:04.155+00	441
2255	[INFO] Warenausgang mit der id 361 gespeichert	2015-10-18 18:54:40.827+00	574
2256	[INFO] Warenausgang mit der id 362 gespeichert	2015-10-18 18:57:29.576+00	574
2257	[INFO] Warenausgang mit der id 361 auf Archivierungsstatus 1 gesetzt	2015-10-18 18:58:09.86+00	574
2258	[INFO] Warenausgang mit der id 362 auf Archivierungsstatus 1 gesetzt	2015-10-18 18:58:15.767+00	574
2259	[INFO] Wareneingang mit der id 162 auf Archivierungsstatus 1 gesetzt	2015-10-18 18:58:27.466+00	574
2260	[INFO] Wareneingang mit der id 163 auf Archivierungsstatus 1 gesetzt	2015-10-18 18:58:36.325+00	574
2261	[INFO] Wareneingang mit der id 161 gespeichert	2015-10-18 18:58:58.638+00	574
2262	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-10-18 18:59:08.747+00	574
2263	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-10-20 12:03:01.681+00	574
2264	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-10-20 12:05:34.096+00	574
2265	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-10-21 07:32:07.227+00	441
2268	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-10-27 18:52:26.952+00	252
2269	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-10-27 18:53:21.829+00	252
2270	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-10-28 17:00:59.483+00	253
2271	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: Tätigkeit: Obfrau, Disposition, updateTimestamp: 2015-10-28, active: 1	2015-10-28 17:01:58.948+00	253
2272	[INFO] Wareneingang mit der id 164 gespeichert	2015-10-28 17:16:07.893+00	253
2273	[INFO] Wareneingang mit der id 164 gelöscht	2015-10-28 17:22:18.527+00	253
2274	[INFO] Alle Personen als CSV exportiert.	2015-10-28 17:50:29.626+00	253
2275	[INFO] Alle Personen als CSV exportiert.	2015-10-28 18:00:35.129+00	253
2276	[INFO] Alle Personen als CSV exportiert.	2015-10-28 18:01:21.742+00	253
2277	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-10-29 18:46:16.36+00	345
2278	[INFO] Person mit der id 386 gespeichert. personId: 386, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Pfaffenberger, comment: , updateTimestamp: 2015-10-29, active: 1	2015-10-29 18:48:09.837+00	345
2279	[INFO] Person mit der id 649 gespeichert. personId: 649, salutation: Herr, title: Dr., firstName: Leonhard, lastName: Schitter, comment: Newsletter: nein, updateTimestamp: 2015-10-29, active: 1	2015-10-29 18:53:14.919+00	345
2280	[INFO] Person mit der id 602 gespeichert. personId: 602, salutation: Frau, title: , firstName: Sabine, lastName: Zöpfl, comment: Tätigkeit: Waren, updateTimestamp: 2015-10-29, active: 1	2015-10-29 18:54:23.583+00	345
2281	[INFO] Person mit der id 655 gespeichert. personId: 655, salutation: Herr, title: Mag., firstName: Rudolf, lastName: Zrost, comment: Newsletter: , updateTimestamp: 2015-10-29, active: 1	2015-10-29 18:57:22.454+00	345
2282	[INFO] Person mit der id 88 gespeichert. personId: 88, salutation: Herr, title: Ing., firstName: Franz, lastName: Dusch, comment: , updateTimestamp: 2015-10-29, active: 1	2015-10-29 18:59:45.055+00	345
2283	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-10-30 11:19:39.556+00	574
2284	[INFO] Wareneingang mit der id 152 gespeichert	2015-10-30 11:31:53.953+00	574
2285	[INFO] Wareneingang mit der id 152 auf Archivierungsstatus 1 gesetzt	2015-10-30 11:33:26.467+00	574
2286	[INFO] Warenausgang mit der id 363 gespeichert	2015-10-30 11:49:52.703+00	574
2287	[INFO] Warenausgang mit der id 364 gespeichert	2015-10-30 11:51:12.898+00	574
2288	[INFO] Warenausgang mit der id 365 gespeichert	2015-10-30 11:52:02.829+00	574
2289	[INFO] Warenausgang mit der id 366 gespeichert	2015-10-30 11:53:46.079+00	574
2290	[INFO] Warenausgang mit der id 367 gespeichert	2015-10-30 11:54:23.817+00	574
2291	[INFO] Warenausgang mit der id 366 auf Archivierungsstatus 1 gesetzt	2015-10-30 11:54:32.483+00	574
2292	[INFO] Warenausgang mit der id 367 auf Archivierungsstatus 1 gesetzt	2015-10-30 11:54:35.967+00	574
2293	[INFO] Warenausgang mit der id 363 auf Archivierungsstatus 1 gesetzt	2015-10-30 11:54:39.264+00	574
2294	[INFO] Warenausgang mit der id 364 auf Archivierungsstatus 1 gesetzt	2015-10-30 11:54:42.451+00	574
2295	[INFO] Warenausgang mit der id 365 auf Archivierungsstatus 1 gesetzt	2015-10-30 11:54:45.745+00	574
2296	[INFO] Wareneingang mit der id 161 auf Archivierungsstatus 1 gesetzt	2015-10-30 11:54:53.924+00	574
2297	[INFO] Wareneingang mit der id 152 gespeichert	2015-10-30 12:26:02.808+00	574
2298	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-10-31 17:39:08.146+00	345
2299	[INFO] Person mit der id 655 gespeichert. personId: 655, salutation: Herr, title: Mag., firstName: Rudolf, lastName: Zrost, comment: Newsletter: ja, updateTimestamp: 2015-10-31, active: 1	2015-10-31 17:39:51.345+00	345
2300	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-10-31 17:39:57.289+00	345
2301	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-11-01 09:45:54.49+00	252
2302	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-01 09:48:05.118+00	252
2303	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-03 15:07:50.209+00	253
2304	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-03 16:13:18.143+00	253
2305	[INFO] Person mit der id 656 gespeichert. personId: 656, salutation: Frau, title: , firstName: Sabine, lastName: Füssl, comment: , updateTimestamp: 2015-11-03, active: 1	2015-11-03 16:15:15.993+00	253
2306	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-03 16:15:59.308+00	253
2307	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2015-11-03 16:16:34.855+00	656
2308	[INFO] sabine.fuessl@view-salzburg.at hat sich abgemeldet	2015-11-03 16:19:30.834+00	656
2309	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-03 19:41:10.65+00	253
2310	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-03 19:44:52.175+00	253
2311	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-03 19:45:29.416+00	253
2312	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-03 19:45:32.786+00	253
2313	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-05 20:49:22.975+00	253
2314	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-05 20:49:26.375+00	253
2315	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-05 20:57:15.766+00	253
2316	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-05 20:58:14.814+00	253
2317	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-05 20:58:33.61+00	253
2318	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-05 20:58:54.638+00	253
2319	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-05 21:00:19.308+00	253
2320	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-05 21:04:26.793+00	253
2321	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-11 16:39:10.284+00	253
2322	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-11-11 17:04:10.834+00	602
2323	[INFO] Warenausgang mit der id 368 gespeichert	2015-11-11 17:12:25.488+00	602
2324	[INFO] Warenausgang mit der id 368 auf Archivierungsstatus 1 gesetzt	2015-11-11 17:12:37.443+00	602
2325	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-11 18:07:31.356+00	253
2326	[INFO] Wareneingang mit der id 59 auf Archivierungsstatus 1 gesetzt	2015-11-11 18:13:31.664+00	253
2327	[INFO] Organisation mit der id 254 gespeichert. organisationId: 254, name: Revolution Event GmbH (Electric Love), comment: , updateTimestamp: Wed Nov 11 18:28:19 UTC 2015, active: 1	2015-11-11 18:28:19.247+00	253
2328	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-11 18:29:14.358+00	253
2329	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-11-13 17:07:20.198+00	602
2330	[INFO] Wareneingang mit der id 165 gespeichert	2015-11-13 17:12:30.196+00	602
2334	[INFO] Wareneingang mit der id 166 gespeichert	2015-11-13 17:24:31.194+00	602
2335	[INFO] Wareneingang mit der id 166 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:24:38.206+00	602
2346	[INFO] Wareneingang mit der id 169 gespeichert	2015-11-13 17:29:31.458+00	602
2347	[INFO] Wareneingang mit der id 169 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:29:45.406+00	602
2348	[INFO] Warenausgang mit der id 373 gespeichert	2015-11-13 17:30:16.575+00	602
2352	[INFO] Warenausgang mit der id 374 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:31:49.824+00	602
2353	[INFO] Wareneingang mit der id 170 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:32:07.349+00	602
2354	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-11-13 18:45:17.539+00	602
2363	[INFO] Wareneingang mit der id 173 gespeichert	2015-11-13 18:49:58.85+00	602
2371	[INFO] Warenausgang mit der id 378 gespeichert	2015-11-13 18:53:20.919+00	602
2372	[INFO] Warenausgang mit der id 379 gespeichert	2015-11-13 18:53:50.461+00	602
2373	[INFO] Warenausgang mit der id 379 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:54:00.198+00	602
2374	[INFO] Warenausgang mit der id 378 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:54:02.969+00	602
2375	[INFO] Wareneingang mit der id 176 gespeichert	2015-11-13 18:55:27.915+00	602
2376	[INFO] Wareneingang mit der id 176 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:55:34.671+00	602
2377	[INFO] Warenausgang mit der id 380 gespeichert	2015-11-13 18:55:57.828+00	602
2401	[INFO] Wareneingang mit der id 178 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:45:37.613+00	602
2402	[INFO] Wareneingang mit der id 177 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:45:42.926+00	602
2408	[INFO] Warenausgang mit der id 388 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:49:14.966+00	602
2411	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-11-13 19:57:29.988+00	602
2331	[INFO] Wareneingang mit der id 165 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:12:47.573+00	602
2349	[INFO] Warenausgang mit der id 373 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:30:19.976+00	602
2358	[INFO] Warenausgang mit der id 375 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:47:25.848+00	602
2359	[INFO] Wareneingang mit der id 172 gespeichert	2015-11-13 18:48:26.717+00	602
2388	[INFO] Warenausgang mit der id 382 gespeichert	2015-11-13 19:34:01.406+00	602
2389	[INFO] Warenausgang mit der id 383 gespeichert	2015-11-13 19:34:52.033+00	602
2390	[INFO] Warenausgang mit der id 384 gespeichert	2015-11-13 19:36:12.094+00	602
2394	[INFO] Warenausgang mit der id 386 gespeichert	2015-11-13 19:40:06.983+00	602
2395	[INFO] Warenausgang mit der id 383 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:40:13.276+00	602
2396	[INFO] Warenausgang mit der id 384 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:40:16.74+00	602
2397	[INFO] Warenausgang mit der id 382 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:40:19.404+00	602
2398	[INFO] Warenausgang mit der id 386 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:40:21.941+00	602
2399	[INFO] Warenausgang mit der id 385 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:40:24.879+00	602
2400	[INFO] Wareneingang mit der id 178 gespeichert	2015-11-13 19:45:31.339+00	602
2403	[INFO] Warenausgang mit der id 387 gespeichert	2015-11-13 19:46:18.302+00	602
2404	[INFO] Warenausgang mit der id 387 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:46:22.068+00	602
2405	[INFO] Wareneingang mit der id 179 gespeichert	2015-11-13 19:48:17.319+00	602
2406	[INFO] Wareneingang mit der id 179 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:48:23.075+00	602
2407	[INFO] Warenausgang mit der id 388 gespeichert	2015-11-13 19:49:02.079+00	602
2332	[INFO] Warenausgang mit der id 369 gespeichert	2015-11-13 17:23:10.081+00	602
2333	[INFO] Warenausgang mit der id 369 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:23:14.931+00	602
2336	[INFO] Wareneingang mit der id 167 gespeichert	2015-11-13 17:25:28.781+00	602
2337	[INFO] Wareneingang mit der id 167 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:25:35.821+00	602
2341	[INFO] Warenausgang mit der id 370 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:27:12.804+00	602
2342	[INFO] Warenausgang mit der id 371 gespeichert	2015-11-13 17:27:55.198+00	602
2343	[INFO] Warenausgang mit der id 371 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:28:02.286+00	602
2344	[INFO] Warenausgang mit der id 372 gespeichert	2015-11-13 17:28:27.253+00	602
2345	[INFO] Warenausgang mit der id 372 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:28:32.406+00	602
2350	[INFO] Wareneingang mit der id 170 gespeichert	2015-11-13 17:31:17.678+00	602
2351	[INFO] Warenausgang mit der id 374 gespeichert	2015-11-13 17:31:46.767+00	602
2355	[INFO] Wareneingang mit der id 171 gespeichert	2015-11-13 18:46:39.932+00	602
2356	[INFO] Wareneingang mit der id 171 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:46:44.544+00	602
2360	[INFO] Wareneingang mit der id 172 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:48:31.193+00	602
2361	[INFO] Warenausgang mit der id 376 gespeichert	2015-11-13 18:48:57.702+00	602
2362	[INFO] Warenausgang mit der id 376 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:49:02.206+00	602
2364	[INFO] Wareneingang mit der id 173 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:50:04.789+00	602
2365	[INFO] Warenausgang mit der id 377 gespeichert	2015-11-13 18:50:33.666+00	602
2366	[INFO] Warenausgang mit der id 377 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:51:14.393+00	602
2367	[INFO] Wareneingang mit der id 174 gespeichert	2015-11-13 18:51:56.813+00	602
2368	[INFO] Wareneingang mit der id 174 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:52:01.847+00	602
2369	[INFO] Wareneingang mit der id 175 gespeichert	2015-11-13 18:52:47.227+00	602
2370	[INFO] Wareneingang mit der id 175 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:52:52.395+00	602
2378	[INFO] Warenausgang mit der id 380 auf Archivierungsstatus 1 gesetzt	2015-11-13 18:56:03.94+00	602
2379	[INFO] Wareneingang mit der id 27 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:01:04.927+00	602
2380	[INFO] Wareneingang mit der id 55 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:01:42.414+00	602
2381	[INFO] Wareneingang mit der id 71 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:02:34.75+00	602
2382	[INFO] Wareneingang mit der id 55 auf Archivierungsstatus 0 gesetzt	2015-11-13 19:04:32.339+00	602
2383	[INFO] Wareneingang mit der id 27 auf Archivierungsstatus 0 gesetzt	2015-11-13 19:06:09.558+00	602
2384	[INFO] Wareneingang mit der id 71 auf Archivierungsstatus 0 gesetzt	2015-11-13 19:06:50.236+00	602
2385	[INFO] Warenausgang mit der id 381 gespeichert	2015-11-13 19:25:22.009+00	602
2386	[INFO] Warenausgang mit der id 381 auf Archivierungsstatus 1 gesetzt	2015-11-13 19:25:47.788+00	602
2387	[INFO] Wareneingang mit der id 177 gespeichert	2015-11-13 19:32:47.441+00	602
2391	[INFO] Warenausgang mit der id 382 gespeichert	2015-11-13 19:36:27.478+00	602
2392	[INFO] Warenausgang mit der id 385 gespeichert	2015-11-13 19:36:54.917+00	602
2393	[INFO] Artikelverteilung für Artikel mit der Id 389 geändert	2015-11-13 19:39:40.758+00	602
2409	[INFO] Wareneingang mit der id 180 gespeichert	2015-11-13 19:56:26.485+00	602
2410	[INFO] Wareneingang mit der id 180 gespeichert	2015-11-13 19:56:46.676+00	602
2338	[INFO] Wareneingang mit der id 168 gespeichert	2015-11-13 17:26:20.676+00	602
2339	[INFO] Wareneingang mit der id 168 auf Archivierungsstatus 1 gesetzt	2015-11-13 17:26:25.175+00	602
2340	[INFO] Warenausgang mit der id 370 gespeichert	2015-11-13 17:27:09.526+00	602
2357	[INFO] Warenausgang mit der id 375 gespeichert	2015-11-13 18:47:16.045+00	602
2412	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-11-14 11:41:11.054+00	602
2413	[INFO] Wareneingang mit der id 181 gespeichert	2015-11-14 11:46:07.617+00	602
2414	[INFO] Wareneingang mit der id 181 auf Archivierungsstatus 1 gesetzt	2015-11-14 11:46:11.339+00	602
2415	[INFO] Warenausgang mit der id 389 gespeichert	2015-11-14 11:46:48.029+00	602
2416	[INFO] Warenausgang mit der id 390 gespeichert	2015-11-14 11:47:22.03+00	602
2417	[INFO] Warenausgang mit der id 389 auf Archivierungsstatus 1 gesetzt	2015-11-14 11:47:27.955+00	602
2418	[INFO] Warenausgang mit der id 390 auf Archivierungsstatus 1 gesetzt	2015-11-14 11:47:30.854+00	602
2419	[INFO] Wareneingang mit der id 182 gespeichert	2015-11-14 12:03:32.248+00	602
2420	[INFO] Wareneingang mit der id 182 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:03:39.007+00	602
2421	[INFO] Warenausgang mit der id 391 gespeichert	2015-11-14 12:04:25.787+00	602
2422	[INFO] Warenausgang mit der id 392 gespeichert	2015-11-14 12:04:52.102+00	602
2423	[INFO] Warenausgang mit der id 391 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:05:31.716+00	602
2424	[INFO] Warenausgang mit der id 392 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:05:34.399+00	602
2425	[INFO] Wareneingang mit der id 183 gespeichert	2015-11-14 12:06:25.633+00	602
2426	[INFO] Wareneingang mit der id 183 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:08:22.454+00	602
2427	[INFO] Warenausgang mit der id 393 gespeichert	2015-11-14 12:08:48.03+00	602
2428	[INFO] Warenausgang mit der id 393 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:08:55.656+00	602
2429	[INFO] Wareneingang mit der id 184 gespeichert	2015-11-14 12:10:05.79+00	602
2430	[INFO] Wareneingang mit der id 184 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:10:13.172+00	602
2431	[INFO] Warenausgang mit der id 394 gespeichert	2015-11-14 12:11:02.409+00	602
2432	[INFO] Warenausgang mit der id 394 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:11:05.169+00	602
2433	[INFO] Wareneingang mit der id 185 gespeichert	2015-11-14 12:11:50.144+00	602
2434	[INFO] Wareneingang mit der id 185 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:11:55.787+00	602
2435	[INFO] Warenausgang mit der id 395 gespeichert	2015-11-14 12:12:19.62+00	602
2436	[INFO] Warenausgang mit der id 395 auf Archivierungsstatus 1 gesetzt	2015-11-14 12:12:24.7+00	602
2437	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-11-14 12:14:28.857+00	602
2438	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-16 18:05:11.174+00	253
2439	[INFO] Passwort für Person mit Id 519 zurückgesetzt.	2015-11-16 18:05:35.719+00	253
2440	[INFO] Passwort für Person mit Id 519 zurückgesetzt.	2015-11-16 18:05:51.15+00	253
2441	[INFO] Person mit der id 519 gespeichert. personId: 519, salutation: Herr, title: , firstName: Michael, lastName: Steingaßner, comment: Tätigkeit: Waren, updateTimestamp: 2015-11-16, active: 1	2015-11-16 18:05:52.719+00	253
2442	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-16 18:06:00.47+00	253
2443	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-11-17 08:40:30.269+00	519
2444	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-11-17 08:40:40.397+00	519
2445	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-11-17 08:41:21.909+00	519
2446	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-11-17 10:57:55.048+00	441
2447	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-11-17 17:10:48.725+00	519
2448	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-11-21 15:47:48.7+00	642
2449	[INFO] Warenausgang mit der id 253 gespeichert	2015-11-21 16:26:30.303+00	642
2450	[INFO] Wareneingang mit der id 73 auf Archivierungsstatus 1 gesetzt	2015-11-21 16:28:36.373+00	642
2451	[INFO] Warenausgang mit der id 396 gespeichert	2015-11-21 16:38:41.265+00	642
2452	[INFO] Warenausgang mit der id 396 auf Archivierungsstatus 1 gesetzt	2015-11-21 16:38:48.947+00	642
2453	[INFO] Warenausgang mit der id 396 gespeichert	2015-11-21 16:39:46.876+00	642
2454	[INFO] Wareneingang mit der id 71 auf Archivierungsstatus 1 gesetzt	2015-11-21 16:40:14.7+00	642
2455	[INFO] Wareneingang mit der id 186 gespeichert	2015-11-21 16:57:26.17+00	642
2456	[INFO] Warenausgang mit der id 397 gespeichert	2015-11-21 16:58:10.485+00	642
2457	[INFO] Warenausgang mit der id 397 auf Archivierungsstatus 1 gesetzt	2015-11-21 16:58:21.862+00	642
2458	[INFO] Warenausgang mit der id 398 gespeichert	2015-11-21 17:00:32.94+00	642
2459	[INFO] Warenausgang mit der id 398 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:00:54.429+00	642
2460	[INFO] Wareneingang mit der id 186 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:01:08.084+00	642
2461	[INFO] Wareneingang mit der id 147 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:01:13.114+00	642
2462	[INFO] Wareneingang mit der id 187 gespeichert	2015-11-21 17:04:55.221+00	642
2463	[INFO] Warenausgang mit der id 399 gespeichert	2015-11-21 17:05:47.27+00	642
2464	[INFO] Warenausgang mit der id 400 gespeichert	2015-11-21 17:06:17.971+00	642
2465	[INFO] Warenausgang mit der id 401 gespeichert	2015-11-21 17:07:43.503+00	642
2466	[INFO] Warenausgang mit der id 399 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:07:51.745+00	642
2467	[INFO] Warenausgang mit der id 400 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:07:55.583+00	642
2468	[INFO] Warenausgang mit der id 401 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:07:58.926+00	642
2469	[INFO] Wareneingang mit der id 187 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:08:16.109+00	642
2470	[INFO] Wareneingang mit der id 188 gespeichert	2015-11-21 17:09:20.721+00	642
2471	[INFO] Warenausgang mit der id 402 gespeichert	2015-11-21 17:09:53.199+00	642
2472	[INFO] Warenausgang mit der id 402 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:09:58.818+00	642
2473	[INFO] Wareneingang mit der id 188 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:10:07.109+00	642
2474	[INFO] Wareneingang mit der id 189 gespeichert	2015-11-21 17:11:06.981+00	642
2475	[INFO] Warenausgang mit der id 403 gespeichert	2015-11-21 17:11:43.161+00	642
2476	[INFO] Warenausgang mit der id 403 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:11:51.36+00	642
2477	[INFO] Wareneingang mit der id 189 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:12:31.877+00	642
2478	[INFO] Wareneingang mit der id 190 gespeichert	2015-11-21 17:14:18.451+00	642
2479	[INFO] Warenausgang mit der id 404 gespeichert	2015-11-21 17:15:01.641+00	642
2480	[INFO] Warenausgang mit der id 405 gespeichert	2015-11-21 17:15:45.865+00	642
2481	[INFO] Warenausgang mit der id 406 gespeichert	2015-11-21 17:18:26.916+00	642
2488	[INFO] Person mit der id 657 gespeichert. personId: 657, salutation: Herr, title: , firstName: Josef, lastName: Nobis, comment: Newsletter: nein, updateTimestamp: 2015-11-23, active: 1	2015-11-23 18:57:15.527+00	345
2489	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-11-23 19:06:36.043+00	345
2482	[INFO] Warenausgang mit der id 404 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:18:31.61+00	642
2483	[INFO] Warenausgang mit der id 405 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:18:34.704+00	642
2484	[INFO] Warenausgang mit der id 406 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:18:37.714+00	642
2485	[INFO] Wareneingang mit der id 190 auf Archivierungsstatus 1 gesetzt	2015-11-21 17:18:45.243+00	642
2486	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-11-21 17:19:56.757+00	642
2487	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-11-23 18:54:50.299+00	345
2490	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-11-28 14:38:26.084+00	602
2491	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-11-28 14:38:51.448+00	602
2492	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-11-28 14:42:51.739+00	602
2493	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-11-28 14:54:15.687+00	602
2494	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-11-28 17:49:41.294+00	345
2495	[INFO] Person mit der id 658 gespeichert. personId: 658, salutation: Frau, title: , firstName: Edith , lastName: Frauscher, comment: Marketing- und Innovationsmanagerin, updateTimestamp: 2015-11-28, active: 1	2015-11-28 17:52:58.577+00	345
2496	[INFO] Organisation mit der id 142 gespeichert. organisationId: 142, name: R&S GOURMET EXPRESS VertriebsGmbH, comment: Webseite Ja, updateTimestamp: Sat Nov 28 17:53:30 UTC 2015, active: 1	2015-11-28 17:53:30.919+00	345
2497	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-11-28 17:53:37.203+00	345
2498	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-11-28 18:22:49.552+00	253
2499	[INFO] Organisation mit der id 255 gespeichert. organisationId: 255, name: Unipark Mensa - Bodengraf GmbH, comment: , updateTimestamp: Sat Nov 28 18:24:32 UTC 2015, active: 1	2015-11-28 18:24:32.034+00	253
2500	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-11-29 15:44:47.356+00	252
2501	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-29 15:47:49.984+00	252
2502	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-11-29 16:15:01.672+00	252
2503	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-29 16:15:59.646+00	252
2504	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-11-29 17:20:11.903+00	252
2505	[INFO] Wareneingang mit der id 180 auf Archivierungsstatus 1 gesetzt	2015-11-29 17:26:56.793+00	252
2506	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-29 17:30:05.668+00	252
2507	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-11-29 19:21:38.982+00	441
2508	[INFO] Alle Personen als CSV exportiert.	2015-11-29 19:23:25.564+00	441
2509	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-11-30 09:10:45.123+00	252
2510	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-11-30 09:13:04.033+00	252
2511	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-12-01 12:14:10.258+00	574
2512	[INFO] Wareneingang mit der id 191 gespeichert	2015-12-01 12:21:46.852+00	574
2513	[INFO] Wareneingang mit der id 191 gespeichert	2015-12-01 12:22:55.397+00	574
2514	[INFO] Wareneingang mit der id 191 auf Archivierungsstatus 1 gesetzt	2015-12-01 12:23:05.338+00	574
2515	[INFO] Warenausgang mit der id 407 gespeichert	2015-12-01 12:23:56.526+00	574
2516	[INFO] Warenausgang mit der id 408 gespeichert	2015-12-01 12:24:38.222+00	574
2517	[INFO] Warenausgang mit der id 407 auf Archivierungsstatus 1 gesetzt	2015-12-01 12:24:43.423+00	574
2518	[INFO] Warenausgang mit der id 408 auf Archivierungsstatus 1 gesetzt	2015-12-01 12:24:46.739+00	574
2519	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-12-01 12:24:55.571+00	574
2520	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-02 09:12:24.276+00	519
2521	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-02 10:31:48.204+00	519
2522	[INFO] Organisation mit der id 256 gespeichert. organisationId: 256, name: UnikumSky, comment: , updateTimestamp: Wed Dec 02 10:42:33 UTC 2015, active: 1	2015-12-02 10:42:33.084+00	519
2523	[INFO] Person mit der id 659 gespeichert. personId: 659, salutation: Herr, title: , firstName: Florian, lastName: Hoffmeister, comment: , updateTimestamp: 2015-12-02, active: 1	2015-12-02 10:45:24.987+00	519
2524	[INFO] Organisation mit der id 256 gespeichert. organisationId: 256, name: UnikumSky, comment: , updateTimestamp: Wed Dec 02 10:45:44 UTC 2015, active: 1	2015-12-02 10:45:44.161+00	519
2525	[INFO] Person mit der id 659 gespeichert. personId: 659, salutation: Herr, title: , firstName: Florian, lastName: Hoffmeister, comment: , updateTimestamp: 2015-12-02, active: 1	2015-12-02 10:46:49.445+00	519
2526	[INFO] Organisation mit der id 73 gespeichert. organisationId: 73, name: Innovationswerkstatt Sebastian Mettler, comment: Fax: 0662/841079; www.innovationserkstatt.at, updateTimestamp: Wed Dec 02 10:48:43 UTC 2015, active: 1	2015-12-02 10:48:43.051+00	519
2527	[INFO] Organisation mit der id 194 gespeichert. organisationId: 194, name: SPAR AG, comment: , updateTimestamp: Wed Dec 02 10:49:35 UTC 2015, active: 1	2015-12-02 10:49:35.435+00	519
2528	[INFO] Person mit der id 42 gespeichert. personId: 42, salutation: Frau, title: Mag., firstName: Nicole, lastName: Berkmann, comment: , updateTimestamp: 2015-12-02, active: 1	2015-12-02 10:50:05.84+00	519
2529	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-12-02 11:08:20.942+00	519
2530	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-02 14:05:39.765+00	519
2531	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-12-02 18:09:36.345+00	345
2532	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2015-12-02 18:25:22.988+00	345
2533	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-12-02 19:45:53.319+00	574
2534	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-04 09:49:56.665+00	252
2535	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-04 15:39:45.807+00	519
2536	[INFO] Organisation mit der id 257 gespeichert. organisationId: 257, name: andere Zwecke / Differenzen, comment: , updateTimestamp: Fri Dec 04 15:45:01 UTC 2015, active: 1	2015-12-04 15:45:01.83+00	519
2537	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-12-04 16:12:41.516+00	519
2538	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-05 10:51:17.573+00	519
2539	[INFO] Organisation mit der id 257 gespeichert. organisationId: 257, name: andere Zwecke, comment: , updateTimestamp: Sat Dec 05 10:52:07 UTC 2015, active: 1	2015-12-05 10:52:07.082+00	519
2540	[INFO] Organisation mit der id 258 gespeichert. organisationId: 258, name: Differenzen, comment: , updateTimestamp: Sat Dec 05 10:52:22 UTC 2015, active: 1	2015-12-05 10:52:22.074+00	519
2541	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-12-05 11:01:48.571+00	519
2542	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-12-05 16:10:33.948+00	253
2629	[INFO] Wareneingang mit der id 200 gespeichert	2015-12-27 14:44:50.575+00	602
2543	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-05 16:16:23.188+00	253
2544	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-05 22:05:42.287+00	252
2545	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-05 22:06:10.701+00	252
2546	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-06 15:16:36.624+00	252
2547	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-06 15:21:58.125+00	252
2548	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-06 15:37:45.259+00	252
2549	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-06 15:38:14.318+00	252
2550	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-12-08 17:54:43.737+00	441
2551	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-09 07:17:48.669+00	519
2553	[INFO] Person mit der id 660 gespeichert. personId: 660, salutation: Frau, title: , firstName: Sabine, lastName: Mayrhofer, comment: , updateTimestamp: 2015-12-09, active: 1	2015-12-09 07:22:41.761+00	519
2555	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-12-09 07:30:42.34+00	519
2556	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2015-12-10 19:21:58.824+00	574
2557	[INFO] Warenausgang mit der id 409 gespeichert	2015-12-10 19:24:42.301+00	574
2558	[INFO] Wareneingang mit der id 55 auf Archivierungsstatus 1 gesetzt	2015-12-10 19:25:36.26+00	574
2559	[INFO] Warenausgang mit der id 409 gespeichert	2015-12-10 19:25:52.508+00	574
2560	[INFO] Warenausgang mit der id 409 auf Archivierungsstatus 1 gesetzt	2015-12-10 19:25:58.125+00	574
2561	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2015-12-10 19:27:14.176+00	574
2552	[INFO] Organisation mit der id 259 gespeichert. organisationId: 259, name: Soziales Netzwerk Oberndorf, comment: , updateTimestamp: Wed Dec 09 07:20:36 UTC 2015, active: 1	2015-12-09 07:20:36.243+00	519
2554	[INFO] Organisation mit der id 259 gespeichert. organisationId: 259, name: Soziales Netzwerk Oberndorf, comment: , updateTimestamp: Wed Dec 09 07:23:44 UTC 2015, active: 1	2015-12-09 07:23:44.863+00	519
2562	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-14 13:05:50.459+00	519
2563	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-12-14 13:06:02.875+00	519
2564	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-15 14:26:35.761+00	252
2565	[INFO] Organisation mit der id 255 gespeichert. organisationId: 255, name: Bodengraf GmbH, comment: , updateTimestamp: Tue Dec 15 14:29:05 UTC 2015, active: 1	2015-12-15 14:29:05.372+00	252
2566	[INFO] Organisation mit der id 255 gespeichert. organisationId: 255, name: Bodengraf GmbH, comment: , updateTimestamp: Tue Dec 15 14:30:23 UTC 2015, active: 1	2015-12-15 14:30:23.87+00	252
2567	[INFO] Organisation mit der id 255 gespeichert. organisationId: 255, name: Bodengraf GmbH, comment: , updateTimestamp: Tue Dec 15 14:30:26 UTC 2015, active: 1	2015-12-15 14:30:26.74+00	252
2568	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-15 14:30:42.991+00	252
2569	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-17 09:19:50.245+00	252
2570	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-17 16:07:50.168+00	252
2571	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-17 16:08:27.91+00	252
2572	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2015-12-18 07:14:25.767+00	441
2573	[INFO] Alle Personen als CSV exportiert.	2015-12-18 07:14:52.45+00	441
2574	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-12-18 11:08:33.314+00	602
2575	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-12-18 15:26:28.848+00	602
2576	[INFO] Wareneingang mit der id 192 gespeichert	2015-12-18 15:32:39.15+00	602
2577	[INFO] Wareneingang mit der id 192 auf Archivierungsstatus 1 gesetzt	2015-12-18 15:32:47.63+00	602
2578	[INFO] Wareneingang mit der id 192 auf Archivierungsstatus 0 gesetzt	2015-12-18 15:33:12.767+00	602
2579	[INFO] Wareneingang mit der id 192 gespeichert	2015-12-18 15:34:50.317+00	602
2580	[INFO] Wareneingang mit der id 192 auf Archivierungsstatus 1 gesetzt	2015-12-18 15:35:09.192+00	602
2581	[INFO] Warenausgang mit der id 410 gespeichert	2015-12-18 15:36:59.257+00	602
2582	[INFO] Warenausgang mit der id 411 gespeichert	2015-12-18 15:37:52.545+00	602
2583	[INFO] Warenausgang mit der id 412 gespeichert	2015-12-18 15:41:12.239+00	602
2584	[INFO] Warenausgang mit der id 410 auf Archivierungsstatus 1 gesetzt	2015-12-18 15:41:22.966+00	602
2585	[INFO] Warenausgang mit der id 411 auf Archivierungsstatus 1 gesetzt	2015-12-18 15:41:25.309+00	602
2586	[INFO] Warenausgang mit der id 412 auf Archivierungsstatus 1 gesetzt	2015-12-18 15:41:27.725+00	602
2587	[INFO] Warenausgang mit der id 413 gespeichert	2015-12-18 15:44:30.423+00	602
2588	[INFO] Warenausgang mit der id 413 auf Archivierungsstatus 1 gesetzt	2015-12-18 15:46:17.733+00	602
2589	[INFO] Wareneingang mit der id 192 auf Archivierungsstatus 0 gesetzt	2015-12-18 15:46:35.288+00	602
2590	[INFO] Warenausgang mit der id 414 gespeichert	2015-12-18 15:51:11.533+00	602
2591	[INFO] Warenausgang mit der id 414 auf Archivierungsstatus 1 gesetzt	2015-12-18 15:51:17.383+00	602
2592	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2015-12-23 15:43:06.406+00	519
2593	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2015-12-23 15:44:15.927+00	519
2594	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2015-12-27 14:15:58.018+00	602
2595	[INFO] Wareneingang mit der id 193 gespeichert	2015-12-27 14:19:20.039+00	602
2596	[INFO] Wareneingang mit der id 193 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:19:31.936+00	602
2597	[INFO] Warenausgang mit der id 415 gespeichert	2015-12-27 14:19:53.87+00	602
2598	[INFO] Warenausgang mit der id 415 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:20:05.343+00	602
2599	[INFO] Wareneingang mit der id 194 gespeichert	2015-12-27 14:20:56.234+00	602
2600	[INFO] Wareneingang mit der id 194 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:21:01.694+00	602
2601	[INFO] Warenausgang mit der id 416 gespeichert	2015-12-27 14:21:58.529+00	602
2602	[INFO] Warenausgang mit der id 416 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:22:02.522+00	602
2603	[INFO] Wareneingang mit der id 195 gespeichert	2015-12-27 14:24:18.1+00	602
2604	[INFO] Warenausgang mit der id 417 gespeichert	2015-12-27 14:24:56.423+00	602
2605	[INFO] Warenausgang mit der id 418 gespeichert	2015-12-27 14:26:15.644+00	602
2606	[INFO] Warenausgang mit der id 419 gespeichert	2015-12-27 14:26:56.893+00	602
2607	[INFO] Warenausgang mit der id 417 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:26:59.799+00	602
2608	[INFO] Warenausgang mit der id 418 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:27:02.374+00	602
2609	[INFO] Warenausgang mit der id 419 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:27:04.605+00	602
2610	[INFO] Wareneingang mit der id 195 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:27:11.06+00	602
2611	[INFO] Wareneingang mit der id 196 gespeichert	2015-12-27 14:28:18.738+00	602
2612	[INFO] Wareneingang mit der id 196 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:28:32.86+00	602
2613	[INFO] Warenausgang mit der id 420 gespeichert	2015-12-27 14:29:04.127+00	602
2614	[INFO] Warenausgang mit der id 420 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:29:44.331+00	602
2615	[INFO] Wareneingang mit der id 197 gespeichert	2015-12-27 14:30:45.575+00	602
2616	[INFO] Warenausgang mit der id 421 gespeichert	2015-12-27 14:31:10.8+00	602
2617	[INFO] Warenausgang mit der id 421 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:31:13.254+00	602
2618	[INFO] Wareneingang mit der id 197 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:31:25.812+00	602
2619	[INFO] Wareneingang mit der id 198 gespeichert	2015-12-27 14:33:07.163+00	602
2620	[INFO] Wareneingang mit der id 198 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:33:16.878+00	602
2621	[INFO] Warenausgang mit der id 422 gespeichert	2015-12-27 14:33:40.709+00	602
2622	[INFO] Warenausgang mit der id 423 gespeichert	2015-12-27 14:34:18.867+00	602
2623	[INFO] Warenausgang mit der id 422 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:34:32.479+00	602
2624	[INFO] Warenausgang mit der id 423 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:34:34.809+00	602
2625	[INFO] Wareneingang mit der id 199 gespeichert	2015-12-27 14:40:19.032+00	602
2626	[INFO] Wareneingang mit der id 199 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:40:23.55+00	602
2627	[INFO] Warenausgang mit der id 424 gespeichert	2015-12-27 14:40:51.834+00	602
2628	[INFO] Warenausgang mit der id 424 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:41:31.146+00	602
2646	[INFO] Warenausgang mit der id 432 gespeichert	2015-12-27 15:06:04.481+00	602
2648	[INFO] Warenausgang mit der id 431 gespeichert	2015-12-27 15:09:36.867+00	602
2649	[INFO] Warenausgang mit der id 428 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:10:10.004+00	602
2650	[INFO] Warenausgang mit der id 432 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:10:12.731+00	602
2651	[INFO] Warenausgang mit der id 431 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:10:15.122+00	602
2652	[INFO] Warenausgang mit der id 430 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:10:17.481+00	602
2653	[INFO] Warenausgang mit der id 429 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:10:19.505+00	602
2656	[INFO] Warenausgang mit der id 433 gespeichert	2015-12-27 15:16:36.743+00	602
2658	[INFO] Warenausgang mit der id 435 gespeichert	2015-12-27 15:17:42.778+00	602
2663	[INFO] Warenausgang mit der id 440 gespeichert	2015-12-27 15:20:01.43+00	602
2664	[INFO] Warenausgang mit der id 441 gespeichert	2015-12-27 15:21:35.363+00	602
2665	[INFO] Warenausgang mit der id 442 gespeichert	2015-12-27 15:22:10.164+00	602
2680	[INFO] Wareneingang mit der id 202 auf Archivierungsstatus 0 gesetzt	2015-12-27 15:24:11.993+00	602
2683	[INFO] Wareneingang mit der id 203 gespeichert	2015-12-27 15:28:56.305+00	602
2684	[INFO] Wareneingang mit der id 203 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:29:49.756+00	602
2689	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-29 20:13:54.867+00	252
2690	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2015-12-30 08:39:40.721+00	345
2696	[INFO] Wareneingang mit der id 204 gespeichert	2015-12-31 14:36:29.602+00	642
2697	[INFO] Warenausgang mit der id 446 gespeichert	2015-12-31 14:37:05.048+00	642
2699	[INFO] Wareneingang mit der id 204 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:37:21.486+00	642
2700	[INFO] Wareneingang mit der id 205 gespeichert	2015-12-31 14:39:50.29+00	642
2701	[INFO] Warenausgang mit der id 447 gespeichert	2015-12-31 14:40:34.611+00	642
2702	[INFO] Warenausgang mit der id 448 gespeichert	2015-12-31 14:41:00.921+00	642
2706	[INFO] Wareneingang mit der id 206 gespeichert	2015-12-31 14:43:12.882+00	642
2707	[INFO] Warenausgang mit der id 449 gespeichert	2015-12-31 14:43:48.571+00	642
2708	[INFO] Warenausgang mit der id 449 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:43:55.012+00	642
2709	[INFO] Wareneingang mit der id 206 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:44:08.173+00	642
2712	[INFO] Warenausgang mit der id 451 gespeichert	2015-12-31 14:49:14.108+00	642
2713	[INFO] Warenausgang mit der id 450 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:49:24.342+00	642
2714	[INFO] Warenausgang mit der id 451 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:49:31.768+00	642
2715	[INFO] Wareneingang mit der id 207 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:49:37.933+00	642
2716	[INFO] Wareneingang mit der id 208 gespeichert	2015-12-31 14:52:57.466+00	642
2718	[INFO] Warenausgang mit der id 452 gespeichert	2015-12-31 14:56:25.458+00	642
2719	[INFO] Warenausgang mit der id 453 gespeichert	2015-12-31 14:57:01.53+00	642
2720	[INFO] Warenausgang mit der id 452 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:57:05.293+00	642
2721	[INFO] Warenausgang mit der id 453 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:57:08.287+00	642
2722	[INFO] Wareneingang mit der id 208 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:57:15.029+00	642
2723	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-12-31 15:33:42.053+00	642
2630	[INFO] Wareneingang mit der id 200 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:45:13.658+00	602
2632	[INFO] Wareneingang mit der id 200 gespeichert	2015-12-27 14:46:17.817+00	602
2635	[INFO] Warenausgang mit der id 426 gespeichert	2015-12-27 14:48:00.693+00	602
2636	[INFO] Warenausgang mit der id 425 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:48:45.29+00	602
2637	[INFO] Warenausgang mit der id 426 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:48:47.719+00	602
2644	[INFO] Warenausgang mit der id 430 gespeichert	2015-12-27 15:02:41.181+00	602
2647	[INFO] Warenausgang mit der id 432 gespeichert	2015-12-27 15:07:29.202+00	602
2659	[INFO] Warenausgang mit der id 436 gespeichert	2015-12-27 15:18:06.841+00	602
2660	[INFO] Warenausgang mit der id 437 gespeichert	2015-12-27 15:18:44.292+00	602
2661	[INFO] Warenausgang mit der id 438 gespeichert	2015-12-27 15:19:08.176+00	602
2662	[INFO] Warenausgang mit der id 439 gespeichert	2015-12-27 15:19:33.974+00	602
2666	[INFO] Warenausgang mit der id 443 gespeichert	2015-12-27 15:22:40.34+00	602
2685	[INFO] Warenausgang mit der id 445 gespeichert	2015-12-27 15:30:18.72+00	602
2686	[INFO] Warenausgang mit der id 445 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:30:24.92+00	602
2687	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2015-12-27 15:31:01.117+00	602
2688	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-29 20:11:32.254+00	252
2710	[INFO] Wareneingang mit der id 207 gespeichert	2015-12-31 14:48:09.812+00	642
2717	[INFO] Wareneingang mit der id 208 gespeichert	2015-12-31 14:55:12.032+00	642
2724	[INFO] Wareneingang mit der id 209 gespeichert	2015-12-31 15:36:27.108+00	642
2725	[INFO] Wareneingang mit der id 210 gespeichert	2015-12-31 15:36:27.194+00	642
2726	[INFO] Wareneingang mit der id 211 gespeichert	2015-12-31 15:36:27.266+00	642
2727	[INFO] Wareneingang mit der id 212 gespeichert	2015-12-31 15:36:27.531+00	642
2728	[INFO] Wareneingang mit der id 213 gespeichert	2015-12-31 15:36:27.673+00	642
2729	[INFO] Wareneingang mit der id 214 gespeichert	2015-12-31 15:36:28.182+00	642
2730	[INFO] Wareneingang mit der id 210 gelöscht	2015-12-31 15:36:41.786+00	642
2731	[INFO] Wareneingang mit der id 209 gelöscht	2015-12-31 15:36:47.963+00	642
2732	[INFO] Wareneingang mit der id 214 gelöscht	2015-12-31 15:37:26.317+00	642
2733	[INFO] Wareneingang mit der id 213 gelöscht	2015-12-31 15:37:34.814+00	642
2734	[INFO] Wareneingang mit der id 212 gelöscht	2015-12-31 15:37:39.703+00	642
2631	[INFO] Wareneingang mit der id 200 auf Archivierungsstatus 0 gesetzt	2015-12-27 14:45:59.149+00	602
2633	[INFO] Wareneingang mit der id 200 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:46:25.199+00	602
2634	[INFO] Warenausgang mit der id 425 gespeichert	2015-12-27 14:47:22.371+00	602
2638	[INFO] Warenausgang mit der id 427 gespeichert	2015-12-27 14:49:50.029+00	602
2639	[INFO] Warenausgang mit der id 427 auf Archivierungsstatus 1 gesetzt	2015-12-27 14:49:53.281+00	602
2640	[INFO] Wareneingang mit der id 201 gespeichert	2015-12-27 14:58:07.84+00	602
2641	[INFO] Wareneingang mit der id 201 gelöscht	2015-12-27 14:59:56.701+00	602
2642	[INFO] Warenausgang mit der id 428 gespeichert	2015-12-27 15:00:55.45+00	602
2643	[INFO] Warenausgang mit der id 429 gespeichert	2015-12-27 15:01:57.051+00	602
2667	[INFO] Warenausgang mit der id 444 gespeichert	2015-12-27 15:23:08.998+00	602
2668	[INFO] Warenausgang mit der id 434 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:14.491+00	602
2669	[INFO] Warenausgang mit der id 433 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:17.298+00	602
2670	[INFO] Warenausgang mit der id 436 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:20.082+00	602
2671	[INFO] Warenausgang mit der id 437 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:22.604+00	602
2672	[INFO] Warenausgang mit der id 438 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:26.197+00	602
2673	[INFO] Warenausgang mit der id 435 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:28.785+00	602
2674	[INFO] Warenausgang mit der id 439 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:30.982+00	602
2675	[INFO] Warenausgang mit der id 440 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:33.108+00	602
2676	[INFO] Warenausgang mit der id 441 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:35.522+00	602
2677	[INFO] Warenausgang mit der id 442 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:38.01+00	602
2678	[INFO] Warenausgang mit der id 444 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:52.745+00	602
2679	[INFO] Warenausgang mit der id 443 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:23:55.017+00	602
2681	[INFO] Artikelverteilung für Artikel mit der Id 456 geändert	2015-12-27 15:24:48.006+00	602
2682	[INFO] Wareneingang mit der id 202 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:24:56.745+00	602
2691	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2015-12-30 17:24:47.902+00	252
2692	[INFO] Person mit der id 522 gespeichert. personId: 522, salutation: Herr, title: , firstName: Bruno, lastName: Steinwender, comment: , updateTimestamp: 2015-12-30, active: 1	2015-12-30 17:25:55.795+00	252
2693	[INFO] Person mit der id 522 gespeichert. personId: 522, salutation: Herr, title: , firstName: Bruno, lastName: Steinwender, comment: , updateTimestamp: 2015-12-30, active: 1	2015-12-30 17:25:59.918+00	252
2694	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2015-12-30 17:26:53.838+00	252
2695	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2015-12-31 14:34:35.208+00	642
2698	[INFO] Warenausgang mit der id 446 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:37:14.601+00	642
2703	[INFO] Warenausgang mit der id 447 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:41:07.511+00	642
2704	[INFO] Warenausgang mit der id 448 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:41:10.507+00	642
2705	[INFO] Wareneingang mit der id 205 auf Archivierungsstatus 1 gesetzt	2015-12-31 14:41:16.501+00	642
2645	[INFO] Warenausgang mit der id 431 gespeichert	2015-12-27 15:05:30.242+00	602
2654	[INFO] Wareneingang mit der id 202 gespeichert	2015-12-27 15:15:47.21+00	602
2655	[INFO] Wareneingang mit der id 202 auf Archivierungsstatus 1 gesetzt	2015-12-27 15:16:00.392+00	602
2657	[INFO] Warenausgang mit der id 434 gespeichert	2015-12-27 15:17:05.831+00	602
2711	[INFO] Warenausgang mit der id 450 gespeichert	2015-12-31 14:48:49.3+00	642
2735	[INFO] Wareneingang mit der id 211 gespeichert	2015-12-31 15:59:12.313+00	642
2736	[INFO] Warenausgang mit der id 454 gespeichert	2015-12-31 15:59:46.683+00	642
2737	[INFO] Warenausgang mit der id 455 gespeichert	2015-12-31 16:00:12.444+00	642
2738	[INFO] Warenausgang mit der id 456 gespeichert	2015-12-31 16:00:38.521+00	642
2739	[INFO] Warenausgang mit der id 457 gespeichert	2015-12-31 16:01:03.463+00	642
2740	[INFO] Warenausgang mit der id 458 gespeichert	2015-12-31 16:01:36.967+00	642
2741	[INFO] Warenausgang mit der id 459 gespeichert	2015-12-31 16:02:27.182+00	642
2742	[INFO] Warenausgang mit der id 460 gespeichert	2015-12-31 16:05:02.004+00	642
2743	[INFO] Warenausgang mit der id 461 gespeichert	2015-12-31 16:05:57.403+00	642
2744	[INFO] Warenausgang mit der id 462 gespeichert	2015-12-31 16:07:15.462+00	642
2745	[INFO] Warenausgang mit der id 463 gespeichert	2015-12-31 16:13:57.365+00	642
2746	[INFO] Warenausgang mit der id 464 gespeichert	2015-12-31 16:16:19.538+00	642
2747	[INFO] Warenausgang mit der id 465 gespeichert	2015-12-31 16:16:47.574+00	642
2748	[INFO] Warenausgang mit der id 466 gespeichert	2015-12-31 16:17:14.56+00	642
2749	[INFO] Warenausgang mit der id 466 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:13.767+00	642
2750	[INFO] Warenausgang mit der id 461 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:17.308+00	642
2751	[INFO] Warenausgang mit der id 462 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:20.435+00	642
2752	[INFO] Warenausgang mit der id 465 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:23.664+00	642
2753	[INFO] Warenausgang mit der id 455 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:27.668+00	642
2754	[INFO] Warenausgang mit der id 456 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:30.944+00	642
2755	[INFO] Warenausgang mit der id 457 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:34.162+00	642
2756	[INFO] Warenausgang mit der id 454 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:50.224+00	642
2757	[INFO] Warenausgang mit der id 459 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:29:57.328+00	642
2758	[INFO] Warenausgang mit der id 460 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:30:00.637+00	642
2759	[INFO] Warenausgang mit der id 458 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:30:03.366+00	642
2760	[INFO] Warenausgang mit der id 464 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:30:07.248+00	642
2761	[INFO] Warenausgang mit der id 463 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:30:10.359+00	642
2762	[INFO] Wareneingang mit der id 215 gespeichert	2015-12-31 16:37:12.741+00	642
2763	[INFO] Warenausgang mit der id 467 gespeichert	2015-12-31 16:38:29.44+00	642
2764	[INFO] Warenausgang mit der id 467 gespeichert	2015-12-31 16:38:53.141+00	642
2765	[INFO] Warenausgang mit der id 467 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:38:58.23+00	642
2766	[INFO] Warenausgang mit der id 468 gespeichert	2015-12-31 16:39:42.084+00	642
2767	[INFO] Warenausgang mit der id 468 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:39:56.624+00	642
2768	[INFO] Warenausgang mit der id 469 gespeichert	2015-12-31 16:41:04.841+00	642
2769	[INFO] Warenausgang mit der id 470 gespeichert	2015-12-31 16:42:28.367+00	642
2770	[INFO] Artikelverteilung für Artikel mit der Id 488 geändert	2015-12-31 16:43:59.236+00	642
2771	[INFO] Artikelverteilung für Artikel mit der Id 485 geändert	2015-12-31 16:45:46.533+00	642
2772	[INFO] Artikelverteilung für Artikel mit der Id 486 geändert	2015-12-31 16:47:45.665+00	642
2773	[INFO] Warenausgang mit der id 470 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:48:22.274+00	642
2774	[INFO] Warenausgang mit der id 469 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:48:25.244+00	642
2775	[INFO] Wareneingang mit der id 216 gespeichert	2015-12-31 16:53:55.344+00	642
2776	[INFO] Warenausgang mit der id 471 gespeichert	2015-12-31 16:55:00.728+00	642
2777	[INFO] Warenausgang mit der id 471 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:55:12.45+00	642
2778	[INFO] Warenausgang mit der id 472 gespeichert	2015-12-31 16:55:59.925+00	642
2779	[INFO] Artikelverteilung für Artikel mit der Id 487 geändert	2015-12-31 16:56:32.318+00	642
2780	[INFO] Wareneingang mit der id 216 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:56:40.076+00	642
2781	[INFO] Wareneingang mit der id 215 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:56:43.764+00	642
2782	[INFO] Warenausgang mit der id 472 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:56:50.434+00	642
2783	[INFO] Warenausgang mit der id 473 gespeichert	2015-12-31 16:57:43.944+00	642
2784	[INFO] Warenausgang mit der id 473 auf Archivierungsstatus 1 gesetzt	2015-12-31 16:57:48.907+00	642
2785	[INFO] Wareneingang mit der id 217 gespeichert	2015-12-31 16:59:13.513+00	642
2786	[INFO] Warenausgang mit der id 474 gespeichert	2015-12-31 17:00:12.473+00	642
2787	[INFO] Warenausgang mit der id 475 gespeichert	2015-12-31 17:00:59.149+00	642
2788	[INFO] Warenausgang mit der id 476 gespeichert	2015-12-31 17:02:02.018+00	642
2789	[INFO] Warenausgang mit der id 477 gespeichert	2015-12-31 17:03:13.425+00	642
2790	[INFO] Warenausgang mit der id 478 gespeichert	2015-12-31 17:04:11.106+00	642
2791	[INFO] Warenausgang mit der id 477 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:04:43.874+00	642
2792	[INFO] Warenausgang mit der id 478 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:05:11.403+00	642
2793	[INFO] Warenausgang mit der id 474 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:05:14.335+00	642
2794	[INFO] Warenausgang mit der id 475 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:05:17.097+00	642
2795	[INFO] Warenausgang mit der id 476 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:05:20.033+00	642
2796	[INFO] Wareneingang mit der id 217 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:05:29.799+00	642
2797	[INFO] Warenausgang mit der id 479 gespeichert	2015-12-31 17:08:14.821+00	642
2798	[INFO] Warenausgang mit der id 479 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:08:33.273+00	642
2799	[INFO] Wareneingang mit der id 218 gespeichert	2015-12-31 17:13:35.346+00	642
2800	[INFO] Wareneingang mit der id 219 gespeichert	2015-12-31 17:14:50.628+00	642
2801	[INFO] Warenausgang mit der id 480 gespeichert	2015-12-31 17:15:22.328+00	642
2802	[INFO] Warenausgang mit der id 481 gespeichert	2015-12-31 17:15:53.142+00	642
2803	[INFO] Warenausgang mit der id 481 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:16:01.365+00	642
2804	[INFO] Warenausgang mit der id 480 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:16:04.416+00	642
2805	[INFO] Wareneingang mit der id 218 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:16:20.086+00	642
2806	[INFO] Wareneingang mit der id 219 auf Archivierungsstatus 1 gesetzt	2015-12-31 17:16:23.96+00	642
2807	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2015-12-31 17:16:29.953+00	642
2808	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-03 20:52:31.588+00	519
2809	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-01-03 21:16:03.657+00	519
2810	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-04 13:39:24.55+00	519
2811	[INFO] Person mit der id 522 gelöscht	2016-01-04 13:39:42.562+00	519
2812	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-01-04 13:47:11.688+00	519
2813	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-01-06 16:26:55.084+00	642
2833	[INFO] Warenausgang mit der id 489 gespeichert	2016-01-06 17:21:22.606+00	642
2834	[INFO] Warenausgang mit der id 483 gespeichert	2016-01-06 17:22:07.076+00	642
2847	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-01-09 10:37:29.572+00	441
2848	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-10 11:27:08.356+00	519
2849	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-01-10 15:26:24.057+00	253
2850	[INFO] Person mit der id 446 gespeichert. personId: 446, salutation: Frau, title: , firstName: Cornelia, lastName: Robl, comment: Tätigkeit: Waren, updateTimestamp: 2016-01-10, active: 1	2016-01-10 15:27:05.318+00	253
2851	[INFO] Passwort für Person mit Id 446 zurückgesetzt.	2016-01-10 15:27:17.397+00	253
2852	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-10 15:27:31.369+00	253
2853	[INFO] conny_robl@yahoo.de hat sich angemeldet	2016-01-10 15:27:46.808+00	446
2866	[INFO] Warenausgang mit der id 498 gespeichert	2016-01-10 19:27:10.794+00	642
2868	[INFO] Warenausgang mit der id 500 gespeichert	2016-01-10 19:28:05.741+00	642
2874	[INFO] Warenausgang mit der id 506 gespeichert	2016-01-10 19:33:25.152+00	642
2876	[INFO] Warenausgang mit der id 508 gespeichert	2016-01-10 19:34:27.693+00	642
2898	[INFO] Warenausgang mit der id 511 gespeichert	2016-01-10 19:44:43.391+00	642
2899	[INFO] Warenausgang mit der id 512 gespeichert	2016-01-10 19:51:41.738+00	642
2900	[INFO] Warenausgang mit der id 476 gespeichert	2016-01-10 20:02:59.683+00	642
2907	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-12 20:53:41.126+00	252
2909	[INFO] Organisation mit der id 100 gespeichert. organisationId: 100, name: Lebenshilfe Wohnhaus, comment: , updateTimestamp: Tue Jan 12 20:58:12 UTC 2016, active: 1	2016-01-12 20:58:12.489+00	252
2910	[INFO] Person mit der id 330 gespeichert. personId: 330, salutation: Frau, title: , firstName: Elke, lastName: Mayer, comment: , updateTimestamp: 2016-01-12, active: 1	2016-01-12 20:59:51.793+00	252
2911	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-01-12 21:00:56.009+00	642
2912	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-12 21:01:18.791+00	252
2914	[INFO] Wareneingang mit der id 221 gespeichert	2016-01-12 21:04:05.43+00	642
2916	[INFO] Warenausgang mit der id 514 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:04:36.238+00	642
2919	[INFO] Warenausgang mit der id 515 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:07:06.142+00	642
2922	[INFO] Warenausgang mit der id 516 gespeichert	2016-01-12 21:10:18.152+00	642
2924	[INFO] Wareneingang mit der id 221 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:10:34.181+00	642
2925	[INFO] Wareneingang mit der id 224 gespeichert	2016-01-12 21:11:44.029+00	642
2967	[INFO] Warenausgang mit der id 525 gespeichert	2016-01-17 17:36:58.482+00	642
2968	[INFO] Warenausgang mit der id 526 gespeichert	2016-01-17 17:37:27.079+00	642
2969	[INFO] Warenausgang mit der id 527 gespeichert	2016-01-17 17:37:48.867+00	642
2972	[INFO] Warenausgang mit der id 530 gespeichert	2016-01-17 17:39:18.499+00	642
2974	[INFO] Warenausgang mit der id 532 gespeichert	2016-01-17 17:40:31.276+00	642
2977	[INFO] Warenausgang mit der id 535 gespeichert	2016-01-17 17:41:39.379+00	642
2979	[INFO] Warenausgang mit der id 537 gespeichert	2016-01-17 17:42:35.274+00	642
2980	[INFO] Warenausgang mit der id 538 gespeichert	2016-01-17 17:43:10.364+00	642
3005	[INFO] Warenausgang mit der id 540 auf Archivierungsstatus 1 gesetzt	2016-01-17 18:21:44.609+00	642
3006	[INFO] Warenausgang mit der id 512 auf Archivierungsstatus 1 gesetzt	2016-01-17 18:21:51.017+00	642
3007	[INFO] Warenausgang mit der id 511 auf Archivierungsstatus 1 gesetzt	2016-01-17 18:22:20.796+00	642
3008	[INFO] Warenausgang mit der id 346 gespeichert	2016-01-17 18:35:12.276+00	642
3009	[INFO] Warenausgang mit der id 253 gespeichert	2016-01-17 18:37:21.299+00	642
3010	[INFO] Warenausgang mit der id 249 gelöscht	2016-01-17 18:38:44.577+00	642
3011	[INFO] Warenausgang mit der id 253 gespeichert	2016-01-17 18:39:36.292+00	642
3012	[INFO] Warenausgang mit der id 541 gespeichert	2016-01-17 18:42:38.771+00	642
3013	[INFO] Warenausgang mit der id 541 auf Archivierungsstatus 1 gesetzt	2016-01-17 18:48:21.149+00	642
3014	[INFO] Warenausgang mit der id 542 gespeichert	2016-01-17 18:49:12.863+00	642
3015	[INFO] Warenausgang mit der id 542 auf Archivierungsstatus 1 gesetzt	2016-01-17 18:55:00.614+00	642
3016	[INFO] Warenausgang mit der id 396 gespeichert	2016-01-17 18:56:13.015+00	642
3017	[INFO] Warenausgang mit der id 252 gespeichert	2016-01-17 18:57:28.271+00	642
2814	[INFO] Warenausgang mit der id 466 gespeichert	2016-01-06 16:49:48.249+00	642
2815	[INFO] Artikelverteilung für Artikel mit der Id 484 geändert	2016-01-06 16:57:03.397+00	642
2817	[INFO] Warenausgang mit der id 471 gespeichert	2016-01-06 17:00:08.689+00	642
2818	[INFO] Warenausgang mit der id 479 gespeichert	2016-01-06 17:01:05.359+00	642
2819	[INFO] Warenausgang mit der id 461 gespeichert	2016-01-06 17:02:38.529+00	642
2825	[INFO] Wareneingang mit der id 220 gespeichert	2016-01-06 17:15:50.113+00	642
2826	[INFO] Warenausgang mit der id 482 gespeichert	2016-01-06 17:16:57.547+00	642
2828	[INFO] Warenausgang mit der id 484 gespeichert	2016-01-06 17:18:13.477+00	642
2829	[INFO] Warenausgang mit der id 485 gespeichert	2016-01-06 17:19:14.013+00	642
2831	[INFO] Warenausgang mit der id 487 gespeichert	2016-01-06 17:20:06.27+00	642
2832	[INFO] Warenausgang mit der id 488 gespeichert	2016-01-06 17:20:42.337+00	642
2835	[INFO] Warenausgang mit der id 489 gespeichert	2016-01-06 17:22:22.376+00	642
2859	[INFO] Warenausgang mit der id 491 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:08:28.588+00	642
2865	[INFO] Warenausgang mit der id 497 gespeichert	2016-01-10 19:26:27.035+00	642
2867	[INFO] Warenausgang mit der id 499 gespeichert	2016-01-10 19:27:43.138+00	642
2869	[INFO] Warenausgang mit der id 501 gespeichert	2016-01-10 19:28:36.315+00	642
2871	[INFO] Warenausgang mit der id 503 gespeichert	2016-01-10 19:31:14.942+00	642
2872	[INFO] Warenausgang mit der id 504 gespeichert	2016-01-10 19:31:48.665+00	642
2873	[INFO] Warenausgang mit der id 505 gespeichert	2016-01-10 19:32:25.749+00	642
2875	[INFO] Warenausgang mit der id 507 gespeichert	2016-01-10 19:33:54.084+00	642
2877	[INFO] Warenausgang mit der id 509 gespeichert	2016-01-10 19:34:58.93+00	642
2878	[INFO] Warenausgang mit der id 510 gespeichert	2016-01-10 19:35:37.612+00	642
2879	[INFO] Warenausgang mit der id 509 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:00.164+00	642
2880	[INFO] Warenausgang mit der id 510 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:03.727+00	642
2881	[INFO] Warenausgang mit der id 508 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:08.129+00	642
2882	[INFO] Warenausgang mit der id 504 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:11.56+00	642
2883	[INFO] Warenausgang mit der id 506 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:14.994+00	642
2884	[INFO] Warenausgang mit der id 505 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:18.383+00	642
2885	[INFO] Warenausgang mit der id 503 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:21.313+00	642
2886	[INFO] Warenausgang mit der id 498 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:24.483+00	642
2887	[INFO] Warenausgang mit der id 507 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:28.345+00	642
2888	[INFO] Warenausgang mit der id 497 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:31.544+00	642
2889	[INFO] Warenausgang mit der id 502 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:36.175+00	642
2890	[INFO] Warenausgang mit der id 501 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:39.264+00	642
2891	[INFO] Warenausgang mit der id 499 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:42.639+00	642
2892	[INFO] Warenausgang mit der id 500 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:45.771+00	642
2893	[INFO] Warenausgang mit der id 492 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:48.994+00	642
2894	[INFO] Warenausgang mit der id 494 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:52.045+00	642
2895	[INFO] Warenausgang mit der id 495 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:54.967+00	642
2896	[INFO] Warenausgang mit der id 493 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:43:57.828+00	642
2897	[INFO] Warenausgang mit der id 496 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:44:00.805+00	642
2901	[INFO] Warenausgang mit der id 513 gespeichert	2016-01-10 20:05:06.645+00	642
2902	[INFO] Warenausgang mit der id 464 gespeichert	2016-01-10 20:06:59.506+00	642
2903	[INFO] Warenausgang mit der id 513 auf Archivierungsstatus 1 gesetzt	2016-01-10 20:07:10.902+00	642
2908	[INFO] Person mit der id 330 gespeichert. personId: 330, salutation: Frau, title: , firstName: Elke, lastName: Mayer, comment: Leitern;Lebenshilfe Wohnhaus Franz-Gruber-Straße, updateTimestamp: 2016-01-12, active: 1	2016-01-12 20:56:47.592+00	252
2913	[INFO] Wareneingang mit der id 221 gespeichert	2016-01-12 21:03:24.172+00	642
2917	[INFO] Wareneingang mit der id 222 gespeichert	2016-01-12 21:06:02.474+00	642
2918	[INFO] Warenausgang mit der id 515 gespeichert	2016-01-12 21:06:57.753+00	642
2920	[INFO] Wareneingang mit der id 222 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:07:40.51+00	642
2921	[INFO] Wareneingang mit der id 223 gespeichert	2016-01-12 21:09:23.176+00	642
2923	[INFO] Warenausgang mit der id 516 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:10:25.974+00	642
2926	[INFO] Warenausgang mit der id 517 gespeichert	2016-01-12 21:12:25.342+00	642
2927	[INFO] Warenausgang mit der id 517 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:12:31.085+00	642
2928	[INFO] Wareneingang mit der id 224 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:12:43.892+00	642
2929	[INFO] Wareneingang mit der id 223 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:12:56.094+00	642
2930	[INFO] Wareneingang mit der id 225 gespeichert	2016-01-12 21:13:50.58+00	642
2932	[INFO] Warenausgang mit der id 519 gespeichert	2016-01-12 21:14:44.723+00	642
2933	[INFO] Warenausgang mit der id 520 gespeichert	2016-01-12 21:15:14.169+00	642
2941	[INFO] Warenausgang mit der id 522 gespeichert	2016-01-12 21:27:59.634+00	642
2942	[INFO] Warenausgang mit der id 521 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:28:08.524+00	642
2943	[INFO] Warenausgang mit der id 522 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:28:11.65+00	642
2944	[INFO] Wareneingang mit der id 227 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:28:28.947+00	642
2945	[INFO] Wareneingang mit der id 226 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:28:32.528+00	642
2946	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-01-12 21:29:18.319+00	642
2947	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-15 15:21:20.24+00	252
2966	[INFO] Warenausgang mit der id 524 gespeichert	2016-01-17 17:36:32.665+00	642
2970	[INFO] Warenausgang mit der id 528 gespeichert	2016-01-17 17:38:15.172+00	642
2971	[INFO] Warenausgang mit der id 529 gespeichert	2016-01-17 17:38:40.885+00	642
2816	[INFO] Warenausgang mit der id 473 gespeichert	2016-01-06 16:58:12.308+00	642
2820	[INFO] Warenausgang mit der id 476 gespeichert	2016-01-06 17:04:16.769+00	642
2821	[INFO] Warenausgang mit der id 472 gelöscht	2016-01-06 17:10:50.771+00	642
2822	[INFO] Warenausgang mit der id 471 gelöscht	2016-01-06 17:11:10.203+00	642
2823	[INFO] Wareneingang mit der id 216 gelöscht	2016-01-06 17:11:31.046+00	642
2824	[INFO] Wareneingang mit der id 220 gespeichert	2016-01-06 17:14:12.695+00	642
2827	[INFO] Warenausgang mit der id 483 gespeichert	2016-01-06 17:17:49.201+00	642
2830	[INFO] Warenausgang mit der id 486 gespeichert	2016-01-06 17:19:35.533+00	642
2836	[INFO] Warenausgang mit der id 488 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:22:51.408+00	642
2837	[INFO] Warenausgang mit der id 489 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:22:54.803+00	642
2838	[INFO] Warenausgang mit der id 482 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:22:57.918+00	642
2839	[INFO] Warenausgang mit der id 483 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:23:01.121+00	642
2840	[INFO] Warenausgang mit der id 484 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:23:05.234+00	642
2841	[INFO] Warenausgang mit der id 485 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:23:15.439+00	642
2842	[INFO] Warenausgang mit der id 486 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:23:30.5+00	642
2843	[INFO] Warenausgang mit der id 487 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:23:43.263+00	642
2844	[INFO] Wareneingang mit der id 220 auf Archivierungsstatus 1 gesetzt	2016-01-06 17:24:02.464+00	642
2845	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-01-06 17:28:27.79+00	642
2846	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-08 19:32:21.185+00	519
2860	[INFO] Warenausgang mit der id 492 gespeichert	2016-01-10 19:14:09.429+00	642
2915	[INFO] Warenausgang mit der id 514 gespeichert	2016-01-12 21:04:30.601+00	642
2931	[INFO] Warenausgang mit der id 518 gespeichert	2016-01-12 21:14:19.394+00	642
2934	[INFO] Warenausgang mit der id 518 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:15:26.838+00	642
2935	[INFO] Warenausgang mit der id 519 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:15:29.871+00	642
2936	[INFO] Warenausgang mit der id 520 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:15:34.973+00	642
2937	[INFO] Wareneingang mit der id 225 auf Archivierungsstatus 1 gesetzt	2016-01-12 21:19:31.66+00	642
2938	[INFO] Wareneingang mit der id 226 gespeichert	2016-01-12 21:26:19.527+00	642
2939	[INFO] Wareneingang mit der id 227 gespeichert	2016-01-12 21:26:57.983+00	642
2940	[INFO] Warenausgang mit der id 521 gespeichert	2016-01-12 21:27:31.472+00	642
2948	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-01-15, active: 1	2016-01-15 15:22:45.88+00	252
2949	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-01-15, active: 1	2016-01-15 15:24:24.469+00	252
2950	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-01-15, active: 1	2016-01-15 15:24:28.17+00	252
2951	[INFO] Person mit der id 14 gespeichert. personId: 14, salutation: Frau, title: , firstName: , lastName: Albrecht, comment: , updateTimestamp: 2016-01-15, active: 1	2016-01-15 15:24:35.221+00	252
2952	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-15 15:24:57.924+00	252
2953	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-01-17 15:23:23.024+00	345
2954	[INFO] Person mit der id 661 gespeichert. personId: 661, salutation: Herr, title: Dr., firstName: Eduard, lastName: Thaler, comment: Newsletter: ja;, updateTimestamp: 2016-01-17, active: 1	2016-01-17 15:41:14.043+00	345
2955	[INFO] Person mit der id 661 gespeichert. personId: 661, salutation: Herr, title: Dr., firstName: Eduard, lastName: Thaler, comment: Newsletter: ja;, updateTimestamp: 2016-01-17, active: 1	2016-01-17 15:41:53.289+00	345
2956	[INFO] Person mit der id 558 gespeichert. personId: 558, salutation: Frau, title: , firstName: Theresia, lastName: Wallerstorfer, comment: , updateTimestamp: 2016-01-17, active: 1	2016-01-17 15:52:26.542+00	345
2957	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-01-17 16:00:14.235+00	345
2958	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-01-17 16:01:42.573+00	345
2959	[INFO] Person mit der id 643 gespeichert. personId: 643, salutation: Herr, title: , firstName: Hugo, lastName: Rohner, comment: Newsletter: ja;, updateTimestamp: 2016-01-17, active: 1	2016-01-17 16:04:43.559+00	345
2960	[INFO] Person mit der id 602 gespeichert. personId: 602, salutation: Frau, title: , firstName: Sabine, lastName: Zöpfl, comment: Tätigkeit: Waren; Newsletter: ja;, updateTimestamp: 2016-01-17, active: 1	2016-01-17 16:05:29.282+00	345
2961	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-01-17 16:13:12.992+00	345
2962	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-17 16:32:43.819+00	252
2963	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-17 16:34:32.465+00	252
2964	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-01-17 17:31:10.705+00	642
2965	[INFO] Warenausgang mit der id 523 gespeichert	2016-01-17 17:35:25.779+00	642
2981	[INFO] Warenausgang mit der id 539 gespeichert	2016-01-17 17:43:36.09+00	642
2982	[INFO] Warenausgang mit der id 539 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:43:42.406+00	642
2983	[INFO] Warenausgang mit der id 538 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:43:49.49+00	642
2984	[INFO] Warenausgang mit der id 537 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:44:19.303+00	642
2985	[INFO] Warenausgang mit der id 536 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:44:26.435+00	642
2986	[INFO] Warenausgang mit der id 535 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:44:31.371+00	642
2987	[INFO] Warenausgang mit der id 534 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:44:38.272+00	642
2988	[INFO] Warenausgang mit der id 533 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:44:55.22+00	642
2989	[INFO] Warenausgang mit der id 532 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:45:03.36+00	642
2990	[INFO] Warenausgang mit der id 523 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:45:09.785+00	642
2991	[INFO] Warenausgang mit der id 524 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:45:26.619+00	642
2992	[INFO] Warenausgang mit der id 525 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:45:39.014+00	642
2993	[INFO] Warenausgang mit der id 526 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:46:21.653+00	642
2994	[INFO] Warenausgang mit der id 527 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:46:30.38+00	642
2995	[INFO] Warenausgang mit der id 528 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:46:45.659+00	642
2854	[INFO] conny_robl@yahoo.de hat sich abgemeldet	2016-01-10 15:27:49.57+00	446
2855	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-01-10 18:50:19.035+00	642
2856	[INFO] Warenausgang mit der id 490 gespeichert	2016-01-10 19:02:07.616+00	642
2857	[INFO] Warenausgang mit der id 490 auf Archivierungsstatus 1 gesetzt	2016-01-10 19:02:22.589+00	642
2858	[INFO] Warenausgang mit der id 491 gespeichert	2016-01-10 19:08:23.756+00	642
2861	[INFO] Warenausgang mit der id 493 gespeichert	2016-01-10 19:14:50.636+00	642
2862	[INFO] Warenausgang mit der id 494 gespeichert	2016-01-10 19:15:32.775+00	642
2863	[INFO] Warenausgang mit der id 495 gespeichert	2016-01-10 19:16:59.42+00	642
2864	[INFO] Warenausgang mit der id 496 gespeichert	2016-01-10 19:18:45.026+00	642
2870	[INFO] Warenausgang mit der id 502 gespeichert	2016-01-10 19:29:07.898+00	642
2904	[INFO] Wareneingang mit der id 211 auf Archivierungsstatus 1 gesetzt	2016-01-10 20:08:59.891+00	642
2905	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-01-10 20:09:15.942+00	642
2906	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-11 09:48:53.214+00	519
2973	[INFO] Warenausgang mit der id 531 gespeichert	2016-01-17 17:40:04.755+00	642
2975	[INFO] Warenausgang mit der id 533 gespeichert	2016-01-17 17:40:55.021+00	642
2976	[INFO] Warenausgang mit der id 534 gespeichert	2016-01-17 17:41:18.408+00	642
2978	[INFO] Warenausgang mit der id 536 gespeichert	2016-01-17 17:42:10.348+00	642
3001	[INFO] Warenausgang mit der id 497 gespeichert	2016-01-17 18:13:57.982+00	642
3002	[INFO] Warenausgang mit der id 508 gespeichert	2016-01-17 18:16:23.248+00	642
3003	[INFO] Warenausgang mit der id 491 gespeichert	2016-01-17 18:17:41.306+00	642
2996	[INFO] Warenausgang mit der id 529 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:46:50.905+00	642
2997	[INFO] Warenausgang mit der id 530 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:46:56.253+00	642
2998	[INFO] Warenausgang mit der id 531 auf Archivierungsstatus 1 gesetzt	2016-01-17 17:47:01.46+00	642
2999	[INFO] Artikelverteilung für Artikel mit der Id 355 geändert	2016-01-17 18:02:55.407+00	642
3000	[INFO] Artikelverteilung für Artikel mit der Id 354 geändert	2016-01-17 18:13:10.913+00	642
3004	[INFO] Warenausgang mit der id 540 gespeichert	2016-01-17 18:21:33.783+00	642
3018	[INFO] Warenausgang mit der id 543 gespeichert	2016-01-17 18:59:19.193+00	642
3019	[INFO] Warenausgang mit der id 543 auf Archivierungsstatus 1 gesetzt	2016-01-17 18:59:27.879+00	642
3020	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-01-17 18:59:49.281+00	642
3021	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-17 19:05:09.43+00	519
3022	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-01-18 18:58:13.076+00	345
3023	[INFO] Person mit der id 647 gespeichert. personId: 647, salutation: Frau, title: Dr., firstName: Brigitta, lastName: Pallauf, comment: Newsletter: ja, updateTimestamp: 2016-01-18, active: 1	2016-01-18 18:58:35.312+00	345
3024	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-01-18 18:58:44.212+00	345
3025	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-19 06:49:51.44+00	519
3026	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-01-19 08:35:11.052+00	441
3027	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-01-19 10:26:55.079+00	441
3028	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-20 07:29:08.427+00	252
3029	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-01-20, active: 1	2016-01-20 07:30:04.832+00	252
3030	[INFO] Organisation mit der id 193 gespeichert. organisationId: 193, name: Sozialwerk Hallein, comment: , updateTimestamp: Wed Jan 20 07:35:02 UTC 2016, active: 1	2016-01-20 07:35:02.235+00	252
3031	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-20 07:35:28.836+00	252
3032	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-20 22:27:45.403+00	252
3033	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-20 22:28:33.147+00	252
3034	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-21 10:17:48.402+00	252
3035	[INFO] Person mit der id 319 gespeichert. personId: 319, salutation: Frau, title: Mag., firstName: Petra, lastName: Maislinger-Knoll, comment: , updateTimestamp: 2016-01-21, active: 1	2016-01-21 10:18:52.858+00	252
3036	[INFO] Person mit der id 319 gespeichert. personId: 319, salutation: Frau, title: Mag., firstName: Petra, lastName: Maislinger-Knoll, comment: , updateTimestamp: 2016-01-21, active: 1	2016-01-21 10:18:56.125+00	252
3037	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-21 10:19:57.319+00	252
3038	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-22 13:21:47.903+00	252
3039	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-22 13:27:18.929+00	252
3040	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-25 11:26:14.055+00	519
3041	[INFO] Alle Personen als CSV exportiert.	2016-01-25 11:26:42.525+00	519
3042	[INFO] Alle Personen als CSV exportiert.	2016-01-25 11:28:41.096+00	519
3043	[INFO] Alle Personen als CSV exportiert.	2016-01-25 11:36:41.33+00	519
3044	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-25 15:30:11.286+00	519
3045	[INFO] Alle Personen als CSV exportiert.	2016-01-25 15:41:11.958+00	519
3046	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-25 16:21:41.993+00	519
3047	[INFO] Alle Organisationen als CSV exportiert.	2016-01-25 16:22:46.835+00	519
3048	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-01-25 16:35:05.807+00	642
3049	[INFO] Alle Organisationen als CSV exportiert.	2016-01-25 16:46:13.266+00	519
3050	[INFO] Warenausgang mit der id 544 gespeichert	2016-01-25 16:46:50.377+00	642
3051	[INFO] Warenausgang mit der id 544 auf Archivierungsstatus 1 gesetzt	2016-01-25 16:47:01.843+00	642
3052	[INFO] Warenausgang mit der id 545 gespeichert	2016-01-25 16:50:47.994+00	642
3053	[INFO] Warenausgang mit der id 545 auf Archivierungsstatus 1 gesetzt	2016-01-25 16:50:56.644+00	642
3054	[INFO] Alle Organisationen als CSV exportiert.	2016-01-25 16:57:41.1+00	519
3055	[INFO] Warenausgang mit der id 414 gespeichert	2016-01-25 16:57:59.28+00	642
3056	[INFO] Warenausgang mit der id 545 gespeichert	2016-01-25 16:59:00.723+00	642
3057	[INFO] Warenausgang mit der id 412 gespeichert	2016-01-25 17:06:57.959+00	642
3058	[INFO] Artikelverteilung für Artikel mit der Id 436 geändert	2016-01-25 17:07:50.825+00	642
3059	[INFO] Wareneingang mit der id 192 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:08:19.035+00	642
3060	[INFO] Artikelverteilung für Artikel mit der Id 87 geändert	2016-01-25 17:16:01.019+00	642
3061	[INFO] Wareneingang mit der id 27 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:16:18.456+00	642
3062	[INFO] Wareneingang mit der id 228 gespeichert	2016-01-25 17:31:15.895+00	642
3063	[INFO] Wareneingang mit der id 228 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:31:28.618+00	642
3064	[INFO] Warenausgang mit der id 546 gespeichert	2016-01-25 17:33:51.99+00	642
3065	[INFO] Warenausgang mit der id 547 gespeichert	2016-01-25 17:35:03.531+00	642
3066	[INFO] Warenausgang mit der id 548 gespeichert	2016-01-25 17:35:43.545+00	642
3067	[INFO] Warenausgang mit der id 549 gespeichert	2016-01-25 17:36:20.498+00	642
3068	[INFO] Warenausgang mit der id 550 gespeichert	2016-01-25 17:37:33.758+00	642
3069	[INFO] Warenausgang mit der id 551 gespeichert	2016-01-25 17:37:34.963+00	642
3070	[INFO] Warenausgang mit der id 552 gespeichert	2016-01-25 17:38:12.584+00	642
3071	[INFO] Warenausgang mit der id 546 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:38:20.564+00	642
3072	[INFO] Warenausgang mit der id 547 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:38:24.298+00	642
3073	[INFO] Warenausgang mit der id 552 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:38:30.816+00	642
3074	[INFO] Warenausgang mit der id 553 gespeichert	2016-01-25 17:39:02.084+00	642
3075	[INFO] Warenausgang mit der id 553 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:39:08.12+00	642
3076	[INFO] Warenausgang mit der id 554 gespeichert	2016-01-25 17:39:38.875+00	642
3077	[INFO] Warenausgang mit der id 554 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:39:44.392+00	642
3078	[INFO] Warenausgang mit der id 555 gespeichert	2016-01-25 17:40:21.542+00	642
3079	[INFO] Warenausgang mit der id 555 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:40:27.084+00	642
3080	[INFO] Warenausgang mit der id 556 gespeichert	2016-01-25 17:41:09.481+00	642
3081	[INFO] Warenausgang mit der id 557 gespeichert	2016-01-25 17:41:45.712+00	642
3082	[INFO] Warenausgang mit der id 558 gespeichert	2016-01-25 17:43:07.358+00	642
3094	[INFO] Artikelverteilung für Artikel mit der Id 512 geändert	2016-01-25 17:45:43.803+00	642
3097	[INFO] Artikelverteilung für Artikel mit der Id 88 geändert	2016-01-25 18:01:04.056+00	642
3101	[INFO] Artikelverteilung für Artikel mit der Id 354 geändert	2016-01-25 18:21:48.796+00	642
3102	[INFO] Wareneingang mit der id 155 auf Archivierungsstatus 1 gesetzt	2016-01-25 18:22:05.519+00	642
3083	[INFO] Warenausgang mit der id 559 gespeichert	2016-01-25 17:43:42.155+00	642
3084	[INFO] Warenausgang mit der id 560 gespeichert	2016-01-25 17:44:18.044+00	642
3085	[INFO] Warenausgang mit der id 558 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:23.5+00	642
3086	[INFO] Warenausgang mit der id 560 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:28.042+00	642
3087	[INFO] Warenausgang mit der id 556 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:31.907+00	642
3088	[INFO] Warenausgang mit der id 559 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:40.084+00	642
3089	[INFO] Warenausgang mit der id 557 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:43.605+00	642
3090	[INFO] Warenausgang mit der id 548 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:47.177+00	642
3091	[INFO] Warenausgang mit der id 549 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:50.613+00	642
3092	[INFO] Warenausgang mit der id 550 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:54.632+00	642
3093	[INFO] Warenausgang mit der id 551 auf Archivierungsstatus 1 gesetzt	2016-01-25 17:44:58.845+00	642
3098	[INFO] Warenausgang mit der id 561 gespeichert	2016-01-25 18:09:18.502+00	642
3099	[INFO] Warenausgang mit der id 561 auf Archivierungsstatus 1 gesetzt	2016-01-25 18:09:29.189+00	642
3100	[INFO] Artikelverteilung für Artikel mit der Id 355 geändert	2016-01-25 18:15:06.728+00	642
3103	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-01-25 18:23:50.108+00	642
3104	[INFO] conny_robl@yahoo.de hat sich angemeldet	2016-01-25 21:17:44.165+00	446
3105	[INFO] conny_robl@yahoo.de hat sich abgemeldet	2016-01-25 21:24:52.583+00	446
3106	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-01-27 12:05:54.468+00	656
3109	[INFO] Alle Organisationen als CSV exportiert.	2016-01-27 13:13:47.145+00	656
3110	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-29 12:35:53.599+00	519
3095	[INFO] Artikelverteilung für Artikel mit der Id 513 geändert	2016-01-25 17:51:51.118+00	642
3096	[INFO] Artikelverteilung für Artikel mit der Id 514 geändert	2016-01-25 17:53:57.628+00	642
3107	[INFO] Alle Personen als CSV exportiert.	2016-01-27 12:22:59.65+00	656
3108	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-01-27 13:11:41.153+00	656
3111	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-01-29 14:39:18.105+00	252
3112	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-01-29 14:42:32.671+00	252
3113	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-01-31 13:33:23.224+00	519
3114	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-01-31 13:34:16.267+00	519
3115	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-02-01 09:14:06.654+00	252
3116	[INFO] Person mit der id 574 gespeichert. personId: 574, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Wenzlhuemer, comment: Tätigkeit: Administration, updateTimestamp: 2016-02-01, active: 1	2016-02-01 09:15:35.954+00	252
3117	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: Dipl.Ing. Dr., firstName: Alois, lastName: Schweiger, comment: Tätigkeit: Waren, updateTimestamp: 2016-02-01, active: 1	2016-02-01 09:19:52.45+00	252
3118	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-01 09:23:42.89+00	519
3119	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-01 09:50:49.36+00	519
3120	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2016-02-01 19:11:17.516+00	602
3121	[INFO] Wareneingang mit der id 229 gespeichert	2016-02-01 19:16:14.306+00	602
3122	[INFO] Wareneingang mit der id 229 auf Archivierungsstatus 1 gesetzt	2016-02-01 19:16:21.506+00	602
3123	[INFO] Warenausgang mit der id 562 gespeichert	2016-02-01 19:17:20.796+00	602
3124	[INFO] Warenausgang mit der id 562 auf Archivierungsstatus 1 gesetzt	2016-02-01 19:17:27.858+00	602
3125	[INFO] Wareneingang mit der id 230 gespeichert	2016-02-01 19:25:58.734+00	602
3126	[INFO] Wareneingang mit der id 230 auf Archivierungsstatus 1 gesetzt	2016-02-01 19:26:04.699+00	602
3127	[INFO] Warenausgang mit der id 563 gespeichert	2016-02-01 19:26:44.831+00	602
3128	[INFO] Warenausgang mit der id 564 gespeichert	2016-02-01 19:27:24.868+00	602
3129	[INFO] Warenausgang mit der id 564 auf Archivierungsstatus 1 gesetzt	2016-02-01 19:27:38.31+00	602
3130	[INFO] Warenausgang mit der id 563 auf Archivierungsstatus 1 gesetzt	2016-02-01 19:27:42.532+00	602
3131	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-02 16:47:12.045+00	519
3132	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-02 16:47:51.99+00	519
3133	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-02-03 07:51:39.742+00	656
3134	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-03 08:27:04.89+00	519
3135	[INFO] Organisation mit der id 260 gespeichert. organisationId: 260, name: Hangar 7, comment: , updateTimestamp: Wed Feb 03 08:31:49 UTC 2016, active: 1	2016-02-03 08:31:49.129+00	519
3136	[INFO] Person mit der id 662 gespeichert. personId: 662, salutation: , title: , firstName: , lastName: Bruch, comment: , updateTimestamp: 2016-02-03, active: 1	2016-02-03 08:33:07.983+00	519
3137	[INFO] Organisation mit der id 260 gespeichert. organisationId: 260, name: Hangar 7, comment: , updateTimestamp: Wed Feb 03 08:34:37 UTC 2016, active: 1	2016-02-03 08:34:37.762+00	519
3138	[INFO] Person mit der id 662 gespeichert. personId: 662, salutation: Herr, title: , firstName: , lastName: Bruch, comment: , updateTimestamp: 2016-02-03, active: 1	2016-02-03 08:35:43.008+00	519
3139	[INFO] Organisation mit der id 261 gespeichert. organisationId: 261, name: Caritas-Zentrum Berchtesgadener Land, comment: , updateTimestamp: Wed Feb 03 08:44:33 UTC 2016, active: 1	2016-02-03 08:44:33.086+00	519
3140	[INFO] Person mit der id 663 gespeichert. personId: 663, salutation: Frau, title: , firstName: , lastName: Lorenzl, comment: , updateTimestamp: 2016-02-03, active: 1	2016-02-03 08:45:31.496+00	519
3141	[INFO] Organisation mit der id 261 gespeichert. organisationId: 261, name: Caritas-Zentrum Berchtesgadener Land, comment: , updateTimestamp: Wed Feb 03 08:46:10 UTC 2016, active: 1	2016-02-03 08:46:10.126+00	519
3142	[INFO] Organisation mit der id 262 gespeichert. organisationId: 262, name: Hügli Nährmittel Erzeugung Ges.mbH, comment: , updateTimestamp: Wed Feb 03 08:47:54 UTC 2016, active: 1	2016-02-03 08:47:54.166+00	519
3143	[INFO] Person mit der id 664 gespeichert. personId: 664, salutation: Frau, title: , firstName: Manuela, lastName: Rauter, comment: , updateTimestamp: 2016-02-03, active: 1	2016-02-03 08:48:47.842+00	519
3144	[INFO] Organisation mit der id 262 gespeichert. organisationId: 262, name: Hügli Nährmittel Erzeugung Ges.mbH, comment: , updateTimestamp: Wed Feb 03 08:49:30 UTC 2016, active: 1	2016-02-03 08:49:30.225+00	519
3145	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-02-03 12:08:57.112+00	252
3146	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-02-03 12:11:18.893+00	252
3147	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-03 16:01:59.791+00	519
3148	[INFO] Wareneingang mit der id 231 gespeichert	2016-02-03 16:43:22.043+00	519
3149	[INFO] Warenausgang mit der id 565 gespeichert	2016-02-03 16:44:04.467+00	519
3150	[INFO] Warenausgang mit der id 565 auf Archivierungsstatus 1 gesetzt	2016-02-03 16:44:10.236+00	519
3151	[INFO] Wareneingang mit der id 231 auf Archivierungsstatus 1 gesetzt	2016-02-03 16:44:56.593+00	519
3152	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-03 16:46:46.838+00	519
3153	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-03 19:52:30.859+00	519
3154	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-03 20:06:07.216+00	519
3155	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-02-04 14:44:07.8+00	252
3156	[INFO] Person mit der id 34 gespeichert. personId: 34, salutation: Herr, title: , firstName: Wolf, lastName: Baur, comment: derzeit Karenz, updateTimestamp: 2016-02-04, active: 1	2016-02-04 14:44:47.204+00	252
3157	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: DI, firstName: Albert, lastName: Kiefel, comment: Tätigkeit: Administration, updateTimestamp: 2016-02-04, active: 1	2016-02-04 14:45:35.812+00	252
3158	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: DI, firstName: Albert, lastName: Kiefel, comment: Tätigkeit: Administration, updateTimestamp: 2016-02-04, active: 1	2016-02-04 14:45:40.553+00	252
3159	[INFO] Person mit der id 345 gespeichert. personId: 345, salutation: Frau, title: DI, firstName: Doina, lastName: Moldovan, comment: Tätigkeit: Öffentlichkeit, updateTimestamp: 2016-02-04, active: 1	2016-02-04 14:46:06.374+00	252
3160	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schweiger, comment: Tätigkeit: Waren, updateTimestamp: 2016-02-04, active: 1	2016-02-04 14:46:47.399+00	252
3161	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schweiger, comment: Tätigkeit: Waren, updateTimestamp: 2016-02-04, active: 1	2016-02-04 14:46:51.32+00	252
3162	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-02-04 14:47:16.588+00	252
3163	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-05 10:02:18.886+00	519
3170	[INFO] Person mit der id 665 gespeichert. personId: 665, salutation: , title: , firstName: Mario, lastName: Ebner, comment: , updateTimestamp: 2016-02-10, active: 1	2016-02-10 20:53:12.686+00	441
3171	[INFO] Person mit der id 665 gespeichert. personId: 665, salutation: Herr, title: , firstName: Mario, lastName: Ebner, comment: , updateTimestamp: 2016-02-10, active: 1	2016-02-10 20:53:58.832+00	441
3172	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-12 09:46:18.265+00	574
3175	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-12 10:26:24.602+00	574
3193	[INFO] Wareneingang mit der id 235 gespeichert	2016-02-12 10:55:14.173+00	574
3200	[INFO] Wareneingang mit der id 236 auf Archivierungsstatus 1 gesetzt	2016-02-12 11:10:04.01+00	574
3206	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-14 18:43:55.14+00	519
3207	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-14 18:54:37.531+00	574
3208	[INFO] Wareneingang mit der id 237 gespeichert	2016-02-14 19:22:03.897+00	574
3216	[INFO] Warenausgang mit der id 579 gespeichert	2016-02-14 19:45:10.779+00	574
3217	[INFO] Warenausgang mit der id 580 gespeichert	2016-02-14 19:46:06.302+00	574
3218	[INFO] Warenausgang mit der id 579 auf Archivierungsstatus 1 gesetzt	2016-02-14 19:46:30.146+00	574
3219	[INFO] Warenausgang mit der id 576 auf Archivierungsstatus 1 gesetzt	2016-02-14 19:46:36.274+00	574
3220	[INFO] Warenausgang mit der id 577 auf Archivierungsstatus 1 gesetzt	2016-02-14 19:46:40.307+00	574
3221	[INFO] Warenausgang mit der id 578 auf Archivierungsstatus 1 gesetzt	2016-02-14 19:46:45.145+00	574
3222	[INFO] Warenausgang mit der id 580 auf Archivierungsstatus 1 gesetzt	2016-02-14 19:46:49.988+00	574
3223	[INFO] Warenausgang mit der id 568 gespeichert	2016-02-14 19:47:20.391+00	574
3232	[INFO] Wareneingang mit der id 240 gespeichert	2016-02-14 20:31:54.212+00	574
3233	[INFO] Warenausgang mit der id 585 gespeichert	2016-02-14 20:33:21.729+00	574
3238	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-02-14 20:50:56.814+00	574
3239	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-15 09:09:09.174+00	519
3240	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-15 19:07:56.43+00	519
3241	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-15 19:08:28.644+00	519
3242	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-16 14:09:12.954+00	519
3248	[INFO] Warenausgang mit der id 587 gespeichert	2016-02-17 16:20:18.387+00	642
3249	[INFO] Warenausgang mit der id 587 auf Archivierungsstatus 1 gesetzt	2016-02-17 16:20:40.924+00	642
3250	[INFO] Wareneingang mit der id 243 gespeichert	2016-02-17 16:54:54.443+00	642
3252	[INFO] Warenausgang mit der id 589 gespeichert	2016-02-17 16:56:20.053+00	642
3253	[INFO] Warenausgang mit der id 588 auf Archivierungsstatus 1 gesetzt	2016-02-17 16:56:29.399+00	642
3254	[INFO] Warenausgang mit der id 589 auf Archivierungsstatus 1 gesetzt	2016-02-17 16:56:35.029+00	642
3255	[INFO] Wareneingang mit der id 242 auf Archivierungsstatus 1 gesetzt	2016-02-17 16:57:02.621+00	642
3256	[INFO] Wareneingang mit der id 243 auf Archivierungsstatus 1 gesetzt	2016-02-17 16:57:09.285+00	642
3257	[INFO] Wareneingang mit der id 244 gespeichert	2016-02-17 16:57:52.175+00	642
3260	[INFO] Wareneingang mit der id 244 auf Archivierungsstatus 1 gesetzt	2016-02-17 16:59:02.913+00	642
3261	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-02-17 16:59:08.512+00	642
3262	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-19 09:37:54.222+00	574
3263	[INFO] Wareneingang mit der id 245 gespeichert	2016-02-19 09:40:45.523+00	574
3264	[INFO] Warenausgang mit der id 591 gespeichert	2016-02-19 09:43:13.342+00	574
3265	[INFO] Warenausgang mit der id 592 gespeichert	2016-02-19 09:44:16.514+00	574
3266	[INFO] Warenausgang mit der id 591 auf Archivierungsstatus 1 gesetzt	2016-02-19 09:45:18.729+00	574
3267	[INFO] Warenausgang mit der id 592 auf Archivierungsstatus 1 gesetzt	2016-02-19 09:45:25.765+00	574
3164	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-05 10:02:50.083+00	519
3165	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-10 11:09:40.24+00	519
3166	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-10 11:10:05.517+00	519
3167	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-02-10 19:20:31.28+00	441
3173	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-12 10:18:16.842+00	574
3174	[INFO] Wareneingang mit der id 232 gespeichert	2016-02-12 10:21:42.614+00	574
3176	[INFO] Wareneingang mit der id 232 gespeichert	2016-02-12 10:26:58.95+00	574
3180	[INFO] Wareneingang mit der id 233 gespeichert	2016-02-12 10:38:18.344+00	574
3181	[INFO] Warenausgang mit der id 567 gespeichert	2016-02-12 10:40:04.54+00	574
3183	[INFO] Warenausgang mit der id 567 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:46:21.487+00	574
3184	[INFO] Wareneingang mit der id 234 gespeichert	2016-02-12 10:49:30.715+00	574
3186	[INFO] Warenausgang mit der id 570 gespeichert	2016-02-12 10:51:26.685+00	574
3187	[INFO] Warenausgang mit der id 571 gespeichert	2016-02-12 10:53:32.759+00	574
3188	[INFO] Warenausgang mit der id 569 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:53:40.605+00	574
3189	[INFO] Warenausgang mit der id 570 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:53:44.463+00	574
3190	[INFO] Warenausgang mit der id 571 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:53:48.019+00	574
3191	[INFO] Wareneingang mit der id 234 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:53:58.263+00	574
3192	[INFO] Wareneingang mit der id 233 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:54:09.144+00	574
3194	[INFO] Warenausgang mit der id 572 gespeichert	2016-02-12 10:56:00.551+00	574
3195	[INFO] Warenausgang mit der id 572 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:56:20.706+00	574
3196	[INFO] Wareneingang mit der id 235 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:56:41.82+00	574
3197	[INFO] Wareneingang mit der id 236 gespeichert	2016-02-12 11:07:49.286+00	574
3198	[INFO] Warenausgang mit der id 573 gespeichert	2016-02-12 11:09:17.18+00	574
3199	[INFO] Warenausgang mit der id 573 auf Archivierungsstatus 1 gesetzt	2016-02-12 11:09:50.377+00	574
3201	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-12 12:16:07.867+00	519
3202	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-12 12:16:45.386+00	519
3203	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-12 12:29:05.046+00	574
3211	[INFO] Warenausgang mit der id 575 auf Archivierungsstatus 1 gesetzt	2016-02-14 19:30:26.3+00	574
3212	[INFO] Wareneingang mit der id 238 gespeichert	2016-02-14 19:40:25.999+00	574
3213	[INFO] Warenausgang mit der id 576 gespeichert	2016-02-14 19:41:30.449+00	574
3214	[INFO] Warenausgang mit der id 577 gespeichert	2016-02-14 19:42:21.341+00	574
3215	[INFO] Warenausgang mit der id 578 gespeichert	2016-02-14 19:44:24.15+00	574
3225	[INFO] Warenausgang mit der id 581 gespeichert	2016-02-14 20:23:15.131+00	574
3226	[INFO] Warenausgang mit der id 582 gespeichert	2016-02-14 20:25:07.151+00	574
3227	[INFO] Warenausgang mit der id 583 gespeichert	2016-02-14 20:26:52.024+00	574
3228	[INFO] Warenausgang mit der id 584 gespeichert	2016-02-14 20:27:36.921+00	574
3234	[INFO] Wareneingang mit der id 238 auf Archivierungsstatus 1 gesetzt	2016-02-14 20:42:52.591+00	574
3235	[INFO] Wareneingang mit der id 235 gespeichert	2016-02-14 20:45:21.901+00	574
3236	[INFO] Wareneingang mit der id 241 gespeichert	2016-02-14 20:49:07.955+00	574
3237	[INFO] Warenausgang mit der id 586 gespeichert	2016-02-14 20:50:05.313+00	574
3245	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-17 10:21:22.934+00	519
3246	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-02-17 16:14:44.683+00	642
3251	[INFO] Warenausgang mit der id 588 gespeichert	2016-02-17 16:55:54.859+00	642
3258	[INFO] Warenausgang mit der id 590 gespeichert	2016-02-17 16:58:36.687+00	642
3168	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-10 19:55:34.229+00	574
3169	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-02-10 20:50:10.294+00	441
3204	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-02-12 12:33:30.324+00	574
3205	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-14 18:42:47.901+00	519
3209	[INFO] Warenausgang mit der id 574 gespeichert	2016-02-14 19:26:07.769+00	574
3210	[INFO] Warenausgang mit der id 575 gespeichert	2016-02-14 19:28:08.319+00	574
3224	[INFO] Wareneingang mit der id 239 gespeichert	2016-02-14 20:21:41.778+00	574
3229	[INFO] Warenausgang mit der id 584 auf Archivierungsstatus 1 gesetzt	2016-02-14 20:27:45.336+00	574
3230	[INFO] Warenausgang mit der id 583 auf Archivierungsstatus 1 gesetzt	2016-02-14 20:28:04.675+00	574
3231	[INFO] Warenausgang mit der id 582 auf Archivierungsstatus 1 gesetzt	2016-02-14 20:28:09.026+00	574
3247	[INFO] Wareneingang mit der id 242 gespeichert	2016-02-17 16:18:20.585+00	642
3259	[INFO] Warenausgang mit der id 590 auf Archivierungsstatus 1 gesetzt	2016-02-17 16:58:53.309+00	642
3268	[INFO] Wareneingang mit der id 246 gespeichert	2016-02-19 09:47:04.962+00	574
3269	[INFO] Warenausgang mit der id 593 gespeichert	2016-02-19 09:47:36.172+00	574
3270	[INFO] Warenausgang mit der id 593 auf Archivierungsstatus 1 gesetzt	2016-02-19 09:49:29.969+00	574
3271	[INFO] Warenausgang mit der id 568 gespeichert	2016-02-19 09:50:05.831+00	574
3272	[INFO] Warenausgang mit der id 568 auf Archivierungsstatus 1 gesetzt	2016-02-19 09:50:12.215+00	574
3273	[INFO] Wareneingang mit der id 245 auf Archivierungsstatus 1 gesetzt	2016-02-19 09:51:05.883+00	574
3274	[INFO] Wareneingang mit der id 246 auf Archivierungsstatus 1 gesetzt	2016-02-19 09:51:11.746+00	574
3177	[INFO] Warenausgang mit der id 566 gespeichert	2016-02-12 10:27:48.098+00	574
3178	[INFO] Warenausgang mit der id 566 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:32:39.117+00	574
3179	[INFO] Wareneingang mit der id 232 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:32:49.162+00	574
3182	[INFO] Warenausgang mit der id 568 gespeichert	2016-02-12 10:44:21.55+00	574
3185	[INFO] Warenausgang mit der id 569 gespeichert	2016-02-12 10:50:29.827+00	574
3243	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-16 14:11:21.649+00	519
3244	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-17 10:21:03.156+00	519
\.


--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 198
-- Name: logging_logging_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('logging_logging_id_seq', 3274, true);


--
-- TOC entry 3249 (class 0 OID 420612)
-- Dependencies: 199
-- Data for Name: organisation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organisation (organisation_id, address_id, city_id, country_id, person_id, name, comment, update_timestamp, active) FROM stdin;
2	374	42	2	1	ABZ St. Josef		2015-02-24	1
77	478	94	2	345	J. Gschwandtner ImportGmbH.		2015-05-20	1
71	564	42	2	345	Industriellenvereinigung		2015-05-20	1
242	565	116	\N	345	Ökosoziales Forum Österreich|Europa		2015-05-20	1
6	322	42	2	1	Aktion Leben		2015-02-24	1
8	358	58	2	1	Altenwohnhaus St. Martin		2015-02-24	1
9	327	105	2	1	anderskompetent Gmbh		2015-02-24	1
10	308	24	3	1	AWO Seniorenzentrum Bürgerstift		2015-02-24	1
11	355	44	2	1	Bäckerei Schmidhuber		2015-02-24	1
12	139	42	2	1	Barmherzige Schwestern		2015-02-24	1
243	566	42	\N	345	Österreichisch-Amerikanische Gesellschaft		2015-05-20	1
241	563	42	\N	345	Stadtlesen VeranstaltungsGmbH		2015-05-20	1
15	416	42	2	1	Benediktinen Frauenstift Nonnberg		2015-02-24	1
16	385	4	2	1	Benediktinerabtei Michaelbeuern		2015-02-24	1
66	585	42	2	252	Freiwilligenzentrum Salzburg		2015-08-17	1
18	359	74	3	1	Bergader Privatkäserei GmbH		2015-02-24	1
20	281	28	2	1	Biofit Naturprodukte \nGmbH & Co KG		2015-02-24	1
21	311	82	2	1	Blumen und Gartendesign		2015-02-24	1
22	427	75	2	1	C+C Pfeiffer Salzburg		2015-02-24	1
23	439	47	2	1	Caritas Altenpension		2015-02-24	1
24	432	42	2	1	Caritas Flüchtlingshaus		2015-02-24	1
25	257	42	2	1	clearwhite GmbH		2015-02-24	1
27	272	42	2	1	CREDIT SUISSE		2015-02-24	1
31	282	103	3	1	Eberl Internationale Spedition		2015-02-24	1
32	\N	\N	2	1	Ehrenamtliches Team Obertrum		2015-02-24	1
33	370	83	2	1	Erste Steirische Kochschule		2015-02-24	1
34	453	101	2	1	Erzabtei  Stift Sankt Peter		2015-02-24	1
36	450	68	2	1	Essen und Leben		2015-02-24	1
187	378	71	2	1	Servus TV		2015-02-24	1
46	413	42	2	1	Frauenhaus Salzburg GmbH		2015-02-24	1
48	409	63	2	1	Frigologo Kühllogistik GmbH		2015-02-24	1
49	243	42	2	1	Gallbauer Event- & Officecatering GmbH		2015-02-24	1
50	407	42	2	1	Gärtnerei Aiglhof		2015-02-24	1
52	390	39	2	1	Geislinger GmbH		2015-02-24	1
54	8	5	2	1	Gemeinde Lamprechtshausen		2015-02-24	1
55	387	42	2	1	Generali Versicherung AG		2015-02-24	1
58	381	59	2	1	GLASERITALIA GMBH		2015-02-24	1
59	87	32	2	1	Gmachl Hotel	Webseite Ja	2015-02-24	1
64	340	67	2	1	HBLA Elisabethinum St. Johann		2015-02-24	1
65	317	97	3	1	Heilpädagogisches Zentrum BGL		2015-02-24	1
68	391	48	2	1	Hotel Iris Porsche		2015-02-24	1
69	290	42	2	1	Hotel Schaffenrath		2015-02-24	1
72	272	42	2	1	innocent Alps GmbH		2015-02-24	1
74	309	42	2	1	INSEL - Haus der Jugend		2015-02-24	1
75	436	93	2	1	Institut für Abfallwirtschaft		2015-02-24	1
79	363	42	2	1	Katholische Frauenbewegung		2015-02-24	1
80	437	47	2	1	Kloster Goldenstein - Hauptschule		2015-02-24	1
83	300	42	2	1	Konvent der Franziskanerinnen		2015-02-24	1
85	417	42	2	1	Kunstgärtnerei Doll GmbH		2015-02-24	1
86	426	61	2	1	L.P. Logistik Ges.m.b.H		2015-02-24	1
87	361	42	2	1	La Vie	Webseite ja	2015-02-24	1
88	446	72	2	1	Laboratis HandelsgmbH		2015-02-24	1
89	293	42	2	1	Lagermax Int. Spedition GmbH		2015-02-24	1
57	410	11	2	1	Gittis Naturprodukte		2015-04-14	1
92	357	31	2	1	Laube Sozial-Psychiatrische Aktivitäten GmbH		2015-02-24	1
93	347	81	3	1	Laufener Tafel		2015-02-24	1
17	465	86	3	1	Berchtesgadener Tafel		2015-04-21	1
28	402	79	2	1	dm drogerie markt GmbH		2015-04-21	0
29	467	85	2	1	DONAU Versicherung AG		2015-04-21	1
37	341	32	2	1	Eurogast Österreich GmbH		2015-04-21	0
39	318	42	2	1	Fa. ABA Österreichs Ansiedlungsberater	Newsletter: nein	2015-04-21	0
40	468	42	2	1	Fakultätsbibliothek für Rechtswissenschaften		2015-04-21	1
45	469	31	2	1	Frauenhaus Hallein - Haus Mirjam		2015-04-21	1
60	471	31	2	1	GREEN Egglgut		2015-04-21	1
61	272	42	2	1	Großglockner Hochalpenstraßen AG	Newsletter: nein	2015-04-21	1
67	473	84	2	1	Hipp Gmbh & Co Export KG	Webseite Ja	2015-04-21	1
76	477	39	2	1	Institut für Management GmbH		2015-04-21	1
78	262	80	2	1	Johann Schallmoser GmbH & Co KG	Webseite Ja	2015-04-21	0
81	479	42	2	1	Kolpinghaus Salzburg		2015-04-21	1
82	480	58	2	1	Konradinum Eugendorf		2015-04-21	1
84	481	32	2	1	Kühne & Nagel GmbH		2015-04-21	1
91	240	62	2	1	Landwirtschaftskammer Salzburg		2015-04-21	1
41	403	42	2	345	Format Orange	Webseite: Ja	2015-05-15	1
3	275	32	2	345	ADEG Österreich HandelsAG		2015-05-15	1
14	71	16	2	345	Bauer & Thürridl HandelsGmbH		2015-05-15	1
19	438	56	2	345	Bio-Nahrungsmittel GmbH		2015-05-15	1
26	409	63	2	345	Concept Fresh VertriebsGmbH		2015-05-15	1
35	270	42	2	345	Erzdiözese Salzburg		2015-05-15	1
38	362	42	2	345	Jugend-Notschlafstelle Exit 7		2015-05-15	1
43	375	42	2	345	Franz Gramiller & Sohn GmbH		2015-05-15	1
44	264	42	2	345	Franziskaner Kloster Salzburg		2015-05-15	1
51	558	42	2	345	Gebrüder Weiss GmbH		2015-05-15	1
53	328	31	2	345	Geissler Cosmetics GmbH	Webseite: Ja	2015-05-15	1
4	188	42	2	345	Adhurricane Advertising GmbH	Webseite: Ja	2015-05-15	1
30	323	42	2	345	Dr.-Viktor-Freiherr-von-Fuchs-Stiftung	Webseite: Ja	2015-05-15	1
42	297	28	2	345	Foto Sulzer	Webseite: Ja	2015-05-15	1
63	298	92	2	345	HBLA Ursprung		2015-05-15	1
70	560	42	2	345	IBM Salzburg		2015-05-15	1
90	430	56	2	345	Land-Leben Nahrungsmittel GmbH	Webseite Ja	2015-05-15	1
108	487	42	2	345	Manfred Roth BackwarenerzeugungsGmbH	Webseite offen	2015-05-20	1
95	372	31	2	1	LBS - Heim Hallein		2015-02-24	1
118	492	42	2	345	Nähr-Engel GmbH		2015-05-20	1
97	364	42	2	1	Lebenshilfe GmbH		2015-02-24	1
98	338	42	2	1	Lebenshilfe Kindergarten		2015-02-24	1
123	261	42	2	345	NÜRNBERGER Versicherung AG	Webseite Ja	2015-05-20	1
125	265	63	2	345	Öller-Brandstätter HandelsGmbH		2015-05-20	1
101	348	42	2	1	Lebensküche GmbH		2015-02-24	1
102	396	54	2	1	LFS Klessheim		2015-02-24	1
56	470	42	2	345	Pappas AutomobilvertriebsGmbH	Webseite ja	2015-05-20	1
105	88	42	2	1	Lorentschitsch GmbH Computer Center	Webseite Ja	2015-02-24	1
244	567	117	\N	345	SKIDATA AG		2015-05-20	1
249	260	13	2	519	Lebenshilfe Oberndorf		2015-05-23	1
110	343	76	2	1	Meggle - Verkaufsleitung Österreich		2015-02-24	1
111	373	42	2	1	Mercedes-Benz Österreich	Webseite Ja	2015-02-24	1
172	291	42	2	1	Seniorenheim Hellbrunn		2015-06-23	0
113	425	42	2	1	Michael Neugebauer Edition		2015-02-24	1
173	286	42	2	1	Seniorenheim Itzling		2015-06-23	0
174	336	42	2	1	Seniorenheim Liefering		2015-06-23	0
116	292	49	2	1	Moderne Gartechnik Anner GmbH	Webseite Ja	2015-02-24	1
117	335	97	3	1	Molkerei-Vertrieb Piding EG		2015-02-24	1
177	506	42	2	1	Seniorenheim Taxham		2015-06-23	0
120	315	73	2	1	Nehemia Hilfswerk Österreich		2015-02-24	1
122	279	42	2	1	Notschlafstelle der Caritas	Festnetz: 0662/629786\nEmail: Notschlafstelle@caritas-salzburg.at	2015-02-24	1
126	320	100	2	1	ORA International Österreich		2015-02-24	1
130	444	66	2	1	PAN&CO Success MarketingUnternehmensberatungsges.mbH		2015-02-24	1
133	393	42	2	1	Pfarrquelle Parsch		2015-02-24	1
134	366	97	3	1	Pidinger Werkstätten GmbH		2015-02-24	1
136	406	46	2	1	Pölzleitner Transport GmbH		2015-02-24	1
137	305	42	2	1	Pöyry Infra Gmbh		2015-02-24	1
139	428	95	2	1	QimiQ Handels GmbH	Webseite Ja	2015-02-24	1
140	339	32	2	1	Quehenberger Logistics GmbH Bergheim		2015-02-24	1
143	319	42	2	1	Raiffeisenverband Salzburg		2015-02-24	1
144	415	27	2	1	Raps GmbH		2015-02-24	1
147	440	42	2	1	Referat für Katholische Privatschulen		2015-02-24	1
148	352	69	3	1	Reichenhaller Tafel		2015-02-24	1
150	411	72	2	1	Rettet das Kind - BAZ St. Gilgen		2015-02-24	1
152	294	56	2	1	Rudolf Ölz Meisterbäcker GmbH	Webseite Ja	2015-02-24	1
153	412	42	2	1	Russisch-Orthodoxe Kirche		2015-02-24	1
156	400	28	2	1	Salzburg Patisserie GmbH	Webseite Ja	2015-02-24	1
157	324	56	2	1	Salzburg Schokolade GmbH		2015-02-24	1
158	368	54	2	1	Salzburger Agrarmarketing		2015-02-24	1
161	431	101	2	1	Salzburger Landesregierung		2015-02-24	1
163	306	42	2	1	Salzburger Woche		2015-02-24	1
166	353	32	2	1	Schenker & Co. AG		2015-02-24	1
167	329	42	2	1	Schmankerl		2015-02-24	1
168	418	102	2	1	Seniorenheim Golling		2015-02-24	1
169	330	56	2	1	Seniorenheim Grödig		2015-02-24	1
170	434	6	2	1	Seniorenheim Großgmain		2015-02-24	1
171	419	95	2	1	Seniorenheim Haus St. Sebastian		2015-02-24	1
175	405	10	2	1	Seniorenheim Seekirchen		2015-02-24	1
178	451	54	2	1	Seniorenheim Wals		2015-02-24	1
180	285	46	2	1	Seniorenwohnhaus Neumarkt		2015-02-24	1
181	422	59	2	1	Seniorenwohnhaus Straßwalchen		2015-02-24	1
182	398	70	2	1	Seniorenwohnheim Abtenau		2015-02-24	1
183	325	52	2	1	Seniorenwohnheim Bürmoos		2015-02-24	1
184	260	13	2	1	Seniorenwohnheim Oberndorf		2015-02-24	1
185	321	72	2	1	Seniorenwohnheim St. Gilgen		2015-02-24	1
104	484	32	2	1	Logwin Road + Rail Austria Gmbh		2015-04-21	1
106	485	42	2	1	Loreto Kloster		2015-04-21	1
107	486	65	2	1	LWS Winklhof		2015-04-21	1
112	489	54	2	1	Metro Cash & Carry Österrreich GmbH	Webseite Ja	2015-04-21	1
115	491	42	2	1	Missionshaus Liefering		2015-04-21	1
119	493	44	2	1	Nannerl Gmbh & Co KG	Webseite Ja	2015-04-21	1
121	494	42	2	1	Neustart Saftladen		2015-04-21	1
124	495	42	2	1	ÖAMTC Salzburg	Webseite ja	2015-04-21	1
127	496	42	2	1	ORF Salzburg		2015-04-21	1
128	497	42	2	1	ÖVP Salzburg		2015-04-21	1
131	498	42	2	1	Pfarre St. Martin		2015-04-21	1
135	302	42	2	1	Pieper Naturkosmetik & ätherische Öle		2015-04-21	0
138	499	42	2	1	pro mente plus Neuland		2015-04-21	1
145	501	88	4	1	Reckitt Benckiser Switzerland AG		2015-04-21	1
103	288	42	2	345	Lions Club Elsbethen	Kontakt über Walter Riezinger	2015-05-15	1
149	303	42	2	1	Reiter Offset	Webseite ja	2015-04-21	0
151	502	31	2	1	REWE International AG		2015-04-21	1
155	503	42	2	1	Salzburg AG		2015-04-21	1
159	504	42	2	1	Salzburger Bildungswerk		2015-04-21	1
160	146	42	2	1	Salzburger Hilfswerk		2015-04-21	1
162	306	42	2	1	Salzburger Nachrichten	Webseite Ja	2015-04-21	1
164	505	96	2	1	SalzburgMilch GmbH	Webseite Ja	2015-04-21	1
179	507	78	2	1	Seniorenwohnhaus Köstendorf		2015-04-21	1
186	508	32	2	1	Seniorenzentrum Bergheim		2015-04-21	1
188	457	62	2	1	SIG Stadt Salzburg Immobilien Gmbh		2015-04-21	1
146	240	62	2	1	Redaktion   “Salzburger Bauer”		2015-04-22	0
99	433	51	2	345	Lebenshilfe Werkstätte		2015-05-15	1
154	384	104	2	345	S. SPITZ GmbH		2015-05-15	1
129	371	32	2	345	Palfinger AG	Webseite Ja\nKontakt über Walter Riezinger	2015-05-15	1
165	414	31	2	345	San Helios		2015-05-15	1
235	306	42	\N	345	Kuratorium für Journalistenausbildung		2015-05-20	1
190	401	51	2	1	SOLEart  Straßwalchen		2015-02-24	1
239	497	42	\N	345	Salzburger Seniorenbund		2015-05-20	1
245	568	62	\N	345	Stadt Salzburg - Magistrat 		2015-05-20	1
195	258	42	2	1	SportImPuls Verlags- & Marketing GmbH		2015-02-24	1
100	365	42	2	252	Lebenshilfe Wohnhaus		2016-01-12	1
193	512	31	2	252	Sozialwerk Hallein		2016-01-20	1
196	453	42	2	1	St. Peter - Kloster		2015-02-24	1
197	420	42	2	1	St. Peter Stiftsbäckerei	Webseite Ja\nZufahrt Kapitelplatz 8, \nMittwochs Salzachmühle Aiglhof	2015-02-24	1
198	568	62	2	345	Stadt Salzburg - Stadtsenat		2015-05-20	1
208	517	42	2	345	Verein für Alleinerziehende		2015-05-20	1
209	569	42	2	345	Viele-Verein für interkulturellen Ansatz		2015-05-20	1
205	326	95	2	1	Ultrafrisch Salzburg GmbH		2015-02-24	1
206	259	98	2	1	Unilever Foodsolutions	Webseite Ja	2015-02-24	1
246	570	31	\N	345	Werner&Mertz Professional VertriebsGmbH		2015-05-20	1
247	571	118	\N	345	Wirtschaftskammer Österreich 		2015-05-20	1
211	314	42	2	1	Volkshilfe Salzburg		2015-02-24	1
212	458	31	2	1	Volksschule Hallein Burgfried		2015-02-24	1
251	580	123	2	253	Billa Elixhausen		2015-06-10	1
215	307	42	2	1	WIFF	Webseite ja	2015-02-24	1
216	310	42	2	1	Wildenhofer GmbH		2015-02-24	1
217	421	77	2	1	winnovation consulting gmbh		2015-02-24	1
218	299	42	2	1	Winternotschlafstelle Caritas		2015-02-24	1
220	267	91	2	1	Wirtschaftskammer Salzburg		2015-02-24	1
248	577	42	2	519	Lebenshilfe Wagingerstraße		2015-05-23	1
222	454	42	2	1	ZUPmedia Dienstleistungs OG		2015-02-24	1
203	313	65	2	1	TRAFFIX Verkehrsplanung GmbH		2015-03-26	1
250	578	54	2	519	Lebenshilfe Wals		2015-05-23	1
223	315	52	2	252	Sozialer Lieferservice Bürmoos		2015-04-10	1
224	\N	107	2	252	SOMA Linz		2015-04-10	1
225	\N	\N	\N	252	Rollende Herzen		2015-04-10	1
226	\N	24	3	252	Freilassinger Tafel	Adresse ergänzen	2015-04-10	1
132	383	53	2	519	Lebensmittelbrücke / Pfarre Wals	vormals Pfarre Wals oder Vinzitisch / nur Zustelladresse - Postadresse siehe VinziTisch	2015-06-09	1
7	399	42	2	1	Alpenländischer Kreditorenverband		2015-02-24	1
114	490	54	2	345	MIELE Gesellschaft m.b.H.		2015-06-10	1
5	464	32	2	1	AGM		2015-04-21	1
13	402	71	2	1	Bastian’s  im Designer Outlet Salzburg		2015-04-21	1
237	561	42	\N	345	Rieger Weinloft		2015-05-15	1
228	474	42	2	1	Hotel Heffterhof		2015-04-21	1
94	482	54	2	1	LBS - Heim  Wals		2015-04-21	1
96	483	61	2	1	LBS - Heim Obertrum		2015-04-21	1
109	488	87	2	1	McCain foods GmbH	Festnetz: 01/7684524; Email: info.austria@mccain.com\n	2015-04-21	1
141	500	54	2	1	Quehenberger Logistics GmbH Wals	Kontakt über Anna Gross	2015-04-21	1
189	509	42	2	1	Smartfood Vertriebs GmbH		2015-04-21	1
192	511	10	2	1	SOS-Kinderdorf Seekirchen		2015-04-21	1
62	346	42	2	345	Halleiner Schwestern Franziskanerinnen		2015-08-25	0
201	514	42	2	1	TEEKANNE  GmbH		2015-04-21	1
202	515	89	3	1	Teisendorfer Tafel		2015-04-21	1
207	516	42	2	1	Uniqa Versicherungen AG		2015-04-21	1
210	518	42	2	1	VinziTisch Salzburg		2015-04-21	1
238	562	42	\N	345	Salzburger Bauernbund		2015-05-15	1
219	497	42	2	1	Wirtschaftsbund Salzburg		2015-04-21	1
213	519	42	2	1	Wärmestube		2015-04-21	1
214	520	42	2	1	Wiberg GmbH	Webseite Nein	2015-04-21	1
221	521	44	2	1	Zaltech GmbH & Co KG	Webseite Ja	2015-04-21	1
230	554	112	3	345	Cologne Business School		2015-05-15	1
231	555	42	\N	345	DESK TOP MEDIA GmbH		2015-05-15	1
232	556	42	\N	345	Doringer Werbenetzwerk GmbH		2015-05-15	1
233	557	113	\N	345	Fachhochschule Salzburg GmbH		2015-05-15	1
229	553	111	3	345	Bonduelle Deutschland GmbH	Webseite: Ja	2015-05-15	1
227	466	42	2	345	Commend International GmbH	Webseite: Ja	2015-05-15	1
47	452	52	2	345	Freie Christengemeinde	Webseite: Ja	2015-05-15	1
234	559	114	\N	345	IBM Austria		2015-05-15	1
252	588	77	2	519	Projektbasis GmbH	Wildsau Dirt Run (Leube) www.wild-sau.com	2015-09-10	1
236	240	42	\N	345	LK Salzburg		2015-05-15	1
204	273	99	3	345	Traunsteiner Tafel		2015-05-15	1
199	379	90	2	1	Stiegl Getränke & Service GmbH & CO. KG		2015-05-15	0
200	445	90	2	345	Stieglbrauerei zu Salzburg GmbH	Webseite Ja	2015-05-15	1
240	445	90	\N	345	Stiegl Getränke & Service GmbH & Co KG		2015-05-15	1
191	287	42	2	345	SOS-Kinderdorf Clearinghouse		2015-05-15	1
253	\N	125	9	345	Haus der Hoffnung		2015-10-18	1
254	593	31	2	253	Revolution Event GmbH (Electric Love)		2015-11-11	1
142	295	53	2	345	R&S GOURMET EXPRESS VertriebsGmbH	Webseite Ja	2015-11-28	1
256	596	42	\N	519	UnikumSky		2015-12-02	1
73	476	42	2	519	Innovationswerkstatt Sebastian Mettler	Fax: 0662/841079; www.innovationserkstatt.at	2015-12-02	1
194	513	42	2	519	SPAR AG		2015-12-02	1
257	\N	\N	\N	519	andere Zwecke		2015-12-05	1
258	\N	\N	\N	519	Differenzen		2015-12-05	1
259	597	129	\N	519	Soziales Netzwerk Oberndorf		2015-12-09	1
260	599	121	\N	519	Hangar 7		2016-02-03	1
255	595	95	2	252	Bodengraf GmbH		2015-12-15	1
261	600	131	7	519	Caritas-Zentrum Berchtesgadener Land		2016-02-03	1
262	601	132	\N	519	Hügli Nährmittel Erzeugung Ges.mbH		2016-02-03	1
\.


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 200
-- Name: organisation_organisation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('organisation_organisation_id_seq', 262, true);


--
-- TOC entry 3251 (class 0 OID 420622)
-- Dependencies: 201
-- Data for Name: orgcontactperson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgcontactperson (person_id, organisation_id) FROM stdin;
511	2
638	246
637	247
395	202
154	6
603	7
245	8
197	9
219	10
471	11
271	11
393	12
2	12
21	202
249	207
231	207
103	16
98	207
137	18
65	18
334	20
56	21
79	22
33	22
470	23
222	24
169	24
46	24
323	25
279	27
211	210
515	219
442	219
381	31
578	32
173	33
189	36
641	234
540	46
201	48
128	49
588	50
144	52
168	54
592	55
628	234
357	204
172	58
141	59
143	64
479	65
394	65
614	200
403	68
456	69
109	200
613	200
309	72
29	72
254	200
464	240
569	74
414	74
474	75
407	191
510	191
116	79
306	165
640	245
505	83
234	198
82	85
390	86
77	87
265	88
566	89
406	198
596	198
639	241
436	92
285	92
62	92
545	93
314	208
376	95
66	95
313	209
366	97
530	98
263	98
294	101
43	102
71	209
311	105
419	209
280	110
13	113
19	116
398	117
240	120
429	126
213	126
322	130
236	133
126	133
473	134
467	136
251	137
450	139
304	139
174	139
570	140
506	143
421	143
217	143
160	143
423	144
50	147
191	148
163	148
492	152
11	153
417	156
339	156
84	156
447	157
401	157
340	158
583	161
489	161
127	161
463	163
183	166
648	249
230	168
102	169
452	170
132	171
648	248
648	250
105	132
336	114
650	114
195	175
78	175
391	213
171	178
57	178
589	214
335	180
23	180
536	181
87	181
257	182
410	183
410	184
39	114
93	66
312	214
164	221
404	187
466	221
654	252
411	3
30	14
543	14
590	19
558	190
554	190
262	190
621	230
14	26
622	231
293	195
147	197
623	232
233	35
514	38
170	38
625	233
624	233
396	43
6	44
458	51
626	51
138	53
627	53
619	229
620	229
548	4
564	4
594	205
301	205
507	206
369	212
317	215
329	216
300	217
286	218
611	227
469	220
367	220
295	220
207	220
108	220
26	220
599	222
610	227
501	203
243	203
248	223
606	224
607	225
608	226
400	57
349	57
609	57
68	5
159	13
437	29
291	29
480	40
277	45
344	60
221	61
321	67
612	228
426	76
532	81
64	81
227	82
539	82
342	84
32	94
111	96
182	104
9	106
260	107
303	112
518	115
438	115
387	119
54	119
325	119
326	121
255	121
308	124
250	127
192	128
341	128
296	131
362	138
535	138
41	141
281	141
274	145
527	91
439	91
577	91
559	91
96	151
457	155
500	159
413	160
384	160
542	160
151	160
416	160
167	160
273	160
244	162
319	164
58	164
133	164
298	164
493	164
199	179
568	186
99	186
175	188
60	188
299	188
483	188
508	188
223	189
181	192
383	192
125	30
31	41
601	201
533	42
248	47
420	103
462	103
595	63
491	70
370	90
49	90
139	99
632	236
636	237
409	154
617	238
448	129
635	129
630	71
629	71
486	71
162	77
631	235
451	108
600	118
346	123
290	123
633	242
55	125
634	243
380	56
131	56
618	239
643	244
427	142
524	142
495	142
658	142
122	142
659	256
639	73
338	73
150	73
42	194
660	259
364	100
156	100
28	193
662	260
663	261
664	262
\.


--
-- TOC entry 3233 (class 0 OID 420544)
-- Dependencies: 180
-- Data for Name: outgoing_article; Type: TABLE DATA; Schema: public; Owner: -
--

COPY outgoing_article (outgoing_article_id, outgoing_delivery_id, article_id, article_nr, numberpu) FROM stdin;
570	257	263	0	15
571	258	264	0	10
572	259	265	0	16
573	251	184	3	40
574	251	180	0	2
575	251	181	1	4
143	41	38	0	3
144	42	38	0	1
157	54	46	0	18
158	55	47	0	15
159	55	48	1	20
160	55	49	2	30
161	56	52	2	20
162	56	50	1	14
163	56	51	0	8
164	57	51	0	12
165	58	51	0	10
166	59	53	0	16
167	60	53	0	13
168	61	53	0	18
170	63	53	0	40
172	65	53	0	15
173	66	53	0	16
175	67	53	0	8
177	69	55	0	15
178	70	56	0	3
179	71	57	0	90
180	71	58	1	90
181	72	58	1	90
182	72	57	0	60
188	78	60	0	10
189	79	61	0	2
190	80	61	0	12
191	81	61	0	20
192	82	61	0	40
193	83	61	0	20
194	84	63	0	6
195	85	63	0	30
196	86	63	0	6
197	87	63	0	6
198	88	63	0	5
199	89	63	0	5
200	90	63	0	6
201	91	63	0	6
202	92	63	0	10
203	93	63	0	20
204	94	63	0	12
205	95	63	0	6
206	96	63	0	5
207	97	63	0	10
208	97	62	1	3
209	98	62	1	6
210	98	63	0	3
211	99	63	0	3
212	99	62	1	3
213	100	63	0	17
214	100	62	1	17
215	101	62	1	15
216	101	63	0	6
217	102	63	0	8
218	102	62	1	4
219	103	63	0	8
220	103	62	1	10
221	104	63	0	6
222	104	62	1	2
223	105	62	0	5
224	106	62	0	8
225	107	63	0	20
226	108	63	0	3
227	109	65	0	24
228	110	65	0	36
229	111	64	0	5
230	112	64	0	6
231	113	66	0	2
232	114	89	0	4
233	114	88	1	18
234	114	87	2	3
235	115	87	3	2
236	115	90	1	1
237	115	91	0	2
238	115	88	2	12
239	116	92	0	1
240	116	88	2	10
241	116	87	1	10
242	117	88	0	30
243	117	87	1	5
244	118	87	0	5
245	119	93	0	4
246	120	94	1	28
247	120	93	0	16
248	121	93	0	10
249	122	95	0	21
250	123	97	1	4
251	123	96	0	45
252	124	100	0	14
253	125	99	1	10
254	125	98	2	31
255	125	100	0	6
256	126	102	1	2
257	126	101	0	46
258	127	105	0	6
259	128	105	1	2
260	128	104	0	14
261	129	103	0	1
262	129	105	1	24
263	129	104	2	21
264	130	107	0	10
265	131	107	0	14
266	132	108	2	5
267	132	106	1	24
268	132	107	0	8
269	133	107	0	8
270	134	111	2	10
271	134	110	1	8
272	134	109	0	1
273	135	112	0	5
274	136	113	0	8
275	137	114	0	8
276	138	115	0	12
277	139	116	0	9
278	140	117	0	12
279	141	118	0	8
281	143	122	0	16
284	145	122	0	10
285	145	124	1	10
286	146	123	0	4
287	144	124	0	10
288	144	122	1	2
289	147	122	0	12
290	148	125	0	13
291	149	125	0	28
292	150	125	0	18
293	151	125	0	26
294	152	125	0	9
295	153	125	0	7
296	154	125	0	10
297	155	125	0	30
298	156	125	0	6
299	157	125	0	15
300	158	126	0	37
301	159	133	0	4
302	160	133	0	8
303	160	131	1	27
304	160	132	2	1
308	161	132	1	2
309	161	133	2	22
310	161	134	0	32
311	162	135	0	6
312	163	136	0	10
313	164	137	0	5
314	165	138	1	10
315	165	141	3	20
316	165	139	0	16
317	165	140	2	2
318	166	140	2	2
319	166	139	0	20
320	166	141	3	15
321	166	138	1	10
322	167	139	1	4
323	167	141	3	15
324	167	138	0	12
325	167	140	2	2
365	187	160	0	15
553	221	206	2	17
371	192	166	0	5
554	221	202	0	2
555	221	204	3	5
556	221	203	1	2
557	209	202	4	2
558	209	87	2	3
559	209	208	7	2
560	209	196	0	25
561	209	197	1	14
562	209	184	3	23
563	209	216	5	3
564	209	204	6	6
565	254	258	0	20
566	255	259	0	20
567	256	261	2	10
568	256	260	1	10
569	256	262	0	12
597	270	272	0	20
598	271	272	0	10
599	272	272	0	20
600	273	272	0	10
601	274	272	0	20
602	274	269	1	10
612	282	282	0	16
617	285	285	0	22
618	285	284	1	14
627	290	289	2	3
628	290	290	1	30
629	290	291	0	6
630	291	290	1	20
631	291	291	0	14
632	291	289	2	2
635	294	292	0	8
640	297	296	0	4
641	298	297	0	3
642	299	298	0	10
685	326	326	0	15
693	332	331	0	10
694	333	332	0	10
698	336	342	0	5
699	337	343	0	11
703	341	345	0	110
704	341	346	1	3
706	343	347	0	20
326	168	142	0	5
327	169	143	0	15
328	170	144	0	12
329	171	144	0	10
330	172	146	1	31
331	172	145	2	24
332	172	147	0	12
333	173	147	0	10
334	174	149	0	10
335	175	149	1	10
336	175	148	2	5
337	175	150	0	10
338	176	148	1	4
339	176	149	0	6
340	177	149	1	5
341	177	148	0	6
576	251	189	2	8
603	275	269	0	20
344	179	151	1	3
345	179	156	0	2
346	180	153	2	6
347	180	151	1	2
348	180	152	3	5
349	180	156	0	4
350	181	151	0	14
351	181	156	1	4
352	182	151	1	8
353	182	153	0	6
354	183	153	3	65
355	183	152	1	14
356	183	151	0	7
357	183	154	2	12
358	184	153	3	15
359	184	154	2	5
360	184	151	0	7
361	184	152	1	1
362	185	157	0	6
363	186	158	0	30
364	186	159	1	10
366	188	161	0	9
368	190	164	0	1
608	280	279	1	3
370	191	165	0	3
372	193	167	0	2
373	194	174	1	15
374	194	172	0	12
375	195	172	0	8
376	195	175	2	20
377	195	174	1	15
378	196	178	0	13
379	197	178	0	25
380	198	178	0	15
381	199	197	0	6
382	200	196	0	30
383	201	197	0	25
384	202	197	0	4
385	203	87	1	2
386	203	197	0	8
387	204	197	0	2
388	205	197	0	3
389	206	197	0	2
390	207	197	0	11
391	208	197	0	5
609	280	277	2	8
610	280	278	0	33
611	281	277	0	12
633	292	292	0	16
643	300	299	0	8
401	212	88	4	6
402	212	87	2	3
403	212	195	3	11
404	212	201	1	2
405	212	200	0	6
406	213	195	0	8
407	213	200	1	4
408	213	201	2	1
409	214	201	2	1
410	214	195	0	9
411	214	200	1	4
412	215	200	0	6
413	215	201	1	3
414	216	200	0	2
415	216	195	1	7
416	217	200	0	10
417	218	200	0	10
433	211	205	2	1
434	211	202	3	1
435	211	196	0	5
436	211	197	1	2
441	219	207	0	2
442	219	206	1	6
443	219	202	2	1
444	220	208	0	10
449	210	197	0	11
450	210	203	3	1
451	210	208	4	2
452	210	184	2	2
453	210	87	1	1
461	222	200	1	4
463	222	210	0	10
464	222	87	3	2
473	223	218	0	200
474	224	217	0	118
475	224	218	1	119
476	225	217	0	65
477	225	218	1	65
478	226	218	1	30
479	226	217	0	30
480	227	218	1	20
481	227	217	0	20
482	228	217	0	11
483	228	218	1	9
484	229	219	0	80
485	230	220	0	15
486	231	215	0	50
487	232	221	0	25
488	233	222	0	20
489	234	223	0	50
490	235	224	0	30
491	236	226	1	10
492	236	225	0	10
493	237	227	0	12
495	239	229	0	28
496	240	229	0	12
497	241	230	0	20
498	238	228	0	1
499	242	231	0	8
500	243	231	0	10
501	244	232	0	35
502	245	233	0	8
503	246	250	1	8
504	246	251	3	5
505	246	249	0	3
506	246	253	2	14
507	247	213	0	8
508	248	212	0	39
513	250	190	0	1
590	263	272	0	13
591	264	272	0	8
592	265	272	0	8
593	266	272	0	15
594	267	272	0	15
604	276	269	0	30
605	277	274	0	6
606	278	275	0	9
639	296	295	0	8
644	301	300	0	12
645	302	302	1	4
646	302	301	0	21
650	304	303	0	35
653	308	306	1	8
654	308	305	2	1
655	308	307	0	4
658	311	310	0	10
660	313	311	0	15
661	314	315	3	1
662	314	314	1	10
663	314	312	2	13
664	314	313	0	6
665	315	313	0	6
668	317	313	0	9
669	317	314	2	10
670	317	315	1	1
671	317	312	3	20
672	318	316	0	10
673	319	318	0	10
674	319	319	1	3
675	320	317	1	7
676	320	318	0	12
677	320	319	2	11
678	321	322	2	6
679	321	321	0	23
680	321	320	1	1
681	322	322	0	14
682	323	323	0	12
683	324	324	0	15
695	334	340	0	10
700	338	346	0	2
707	331	330	0	12
708	344	355	1	6
709	344	356	2	6
710	344	354	0	6
711	345	354	0	6
712	345	356	2	6
713	345	355	1	6
716	347	357	0	3
717	348	357	0	4
718	349	359	0	16
719	350	358	0	24
720	351	359	0	14
721	352	360	0	15
722	353	361	0	50
723	354	363	1	6
724	354	362	0	16
725	355	363	0	12
726	356	363	0	12
595	268	272	0	15
596	269	272	0	15
607	279	276	0	9
613	283	282	0	4
614	284	280	2	17
615	284	281	1	2
616	284	282	0	10
619	286	286	2	5
620	286	285	1	8
621	286	284	0	10
622	286	283	3	4
623	287	288	0	4
624	288	287	1	5
625	288	288	0	8
626	289	288	0	8
634	293	292	0	6
636	262	272	1	1
637	262	271	0	1
638	295	293	0	10
647	303	303	0	8
649	305	303	0	7
651	306	304	0	20
652	307	307	0	10
656	309	307	0	12
659	312	309	0	10
666	316	314	1	10
667	316	313	0	10
684	325	325	0	10
686	327	327	1	8
687	327	328	0	15
688	328	327	1	7
689	328	328	0	15
690	329	329	0	35
691	330	329	0	5
697	335	341	0	3
701	339	346	0	3
702	340	346	0	5
730	360	345	1	145
731	360	346	0	3
732	361	371	2	30
733	361	370	1	5
734	361	372	3	1
735	361	369	4	38
736	361	368	0	6
737	362	366	7	22
738	362	372	2	1
739	362	373	0	1
740	362	368	6	9
741	362	374	5	1
742	362	371	1	8
743	362	370	3	5
744	362	367	4	1
745	362	369	8	2
746	363	375	0	20
747	364	375	0	5
748	365	375	0	5
749	366	375	0	29
750	367	375	0	8
751	368	356	1	3
752	368	354	0	14
753	369	377	0	2
754	370	380	0	20
755	371	379	0	5
756	372	378	0	8
757	373	381	0	5
758	374	382	0	10
759	375	383	0	10
760	376	384	0	20
761	377	385	0	15
762	378	387	0	8
763	379	386	0	12
764	380	388	0	5
765	381	294	0	5
767	383	389	0	15
768	384	389	0	10
769	382	389	0	15
770	385	389	0	18
771	386	389	0	74
772	387	390	0	4
773	388	391	0	30
774	389	397	0	9
775	390	396	1	9
776	390	397	0	8
777	391	398	1	1
778	391	399	0	22
779	392	400	0	20
780	393	401	0	5
781	394	402	0	3
782	395	403	0	10
805	397	405	1	1000
806	397	404	0	800
807	398	338	1	4
808	398	334	6	2
809	398	339	3	2
810	398	333	2	14
811	398	336	4	30
812	398	335	0	2
813	398	337	5	1
814	399	406	0	6
815	399	408	2	24
816	399	407	1	1
817	400	406	0	8
818	400	408	1	20
819	401	406	0	16
820	402	409	0	5
821	403	410	0	5
822	404	414	2	20
823	404	411	3	1
824	404	413	1	7
825	404	412	0	14
826	405	412	0	10
827	405	413	1	15
828	405	411	3	2
829	405	414	2	20
830	406	414	2	20
831	406	413	3	15
832	406	411	0	2
833	406	412	1	6
834	407	417	1	5
835	407	418	0	5
836	408	418	0	5
837	408	417	1	5
839	409	149	0	1
840	410	437	0	500
841	410	430	1	10
842	411	437	0	500
843	411	434	1	1
850	413	433	1	3
851	413	431	0	1
858	415	439	0	3
859	416	440	0	5
860	417	443	0	8
861	417	442	1	1
862	417	441	2	9
863	418	443	0	10
864	419	443	0	12
865	420	444	0	12
866	421	445	0	9
867	422	446	0	12
868	423	446	1	8
869	423	447	0	30
870	423	448	2	30
871	424	449	0	2
872	425	452	0	87
873	426	453	0	24
874	427	452	0	70
875	428	394	0	11
876	429	394	0	10
877	429	395	1	2
878	430	394	0	10
879	430	395	1	10
883	432	394	0	5
884	431	394	1	19
885	431	395	0	10
886	433	456	0	15
887	434	456	0	72
888	435	456	0	12
889	436	456	0	8
890	437	456	0	20
891	438	456	0	10
892	439	456	0	24
893	440	456	0	15
894	441	456	0	70
895	442	456	0	8
896	443	456	0	60
897	444	456	0	17
898	445	457	0	13
899	446	458	0	8
900	447	461	2	4
901	447	460	1	2
902	447	459	0	25
903	448	461	0	16
904	449	462	0	36
905	449	463	1	3
906	449	464	2	1
907	449	465	3	14
908	450	466	0	36
909	451	466	0	10
910	452	469	0	288
911	452	470	1	72
912	453	469	0	96
913	453	470	1	96
914	454	484	1	25
915	454	483	0	25
916	455	483	0	20
917	455	484	1	20
918	456	483	0	3
919	456	484	1	3
920	457	484	1	10
921	457	483	0	10
922	458	483	1	5
923	458	484	0	5
924	459	483	0	6
925	459	484	1	6
926	460	484	0	1
927	460	483	1	1
930	462	483	0	20
931	462	484	1	20
932	463	483	0	25
935	465	483	0	15
936	465	484	1	15
941	467	485	0	2
942	468	485	0	1
943	468	488	1	1
945	469	486	2	2
946	469	488	1	2
947	469	485	0	1
948	470	489	1	1
949	470	488	2	2
950	470	485	0	8
944	468	486	2	4
1049	511	355	1	5
957	474	491	0	12
958	475	491	0	60
962	477	491	0	48
963	478	491	0	60
965	480	492	0	12
966	481	493	0	3
967	466	484	0	10
1050	511	356	2	8
1051	511	354	0	12
1052	512	354	0	1
1053	512	355	1	1
968	473	483	0	3
972	479	484	0	10
973	461	483	0	36
974	461	484	1	4
977	482	495	0	8
980	484	495	0	5
981	485	495	0	8
982	486	495	0	5
983	487	495	0	4
984	488	495	1	5
985	488	487	0	36
990	483	484	1	3
991	483	495	0	2
992	489	486	2	9
993	489	484	0	7
994	489	495	3	3
995	489	483	1	3
996	490	354	0	1792
998	492	354	0	30
999	492	355	1	30
1000	492	356	2	30
1001	493	356	2	5
1002	493	355	1	5
1003	493	354	0	5
1004	494	355	1	6
1005	494	354	0	6
1006	494	356	2	6
1007	495	355	0	10
1008	495	356	1	10
1009	495	354	2	10
1010	496	355	1	40
1011	496	354	0	30
1015	498	355	1	5
1016	498	356	2	5
1017	498	354	0	5
1018	499	354	0	10
1019	499	356	2	10
1020	499	355	1	10
1021	500	355	0	10
1022	501	354	0	2
1023	501	355	1	2
1024	502	355	1	5
1025	502	354	0	5
1026	502	356	2	5
1027	503	355	1	3
1028	503	354	0	3
1029	503	356	2	3
1030	504	354	0	3
1031	504	355	1	3
1032	504	356	2	3
1033	505	355	1	6
1034	505	356	2	8
1035	505	354	0	10
1036	506	356	2	8
1037	506	354	0	10
1038	506	355	1	8
1039	507	354	0	5
1040	507	355	1	3
1044	509	355	0	4
1045	509	356	1	4
1046	510	354	0	17
1047	510	355	1	13
1048	510	356	2	15
1054	512	356	2	1
1055	476	484	1	50
1056	476	483	2	10
1057	476	491	0	60
1058	513	483	0	2
1059	464	484	1	20
1060	464	483	0	34
1061	514	497	0	20
1062	515	498	0	13
1063	516	500	1	18
1064	516	499	0	1
1065	516	501	2	17
1066	516	502	3	37
1067	517	506	3	30
1068	517	503	0	2
1069	517	505	2	40
1070	517	504	1	34
1071	518	507	0	12
1072	519	507	0	6
1073	520	507	0	2
1074	520	508	1	34
1075	520	509	2	30
1076	521	511	0	2
1077	522	510	0	4
1078	523	190	0	8
1079	524	190	0	2
1080	525	190	0	5
1081	526	190	0	5
1082	527	190	0	1
1083	528	190	0	10
1084	529	190	0	6
1085	530	190	0	5
1086	531	190	0	4
1087	532	190	0	4
1088	533	190	0	1
1089	534	190	0	7
1090	535	190	0	4
1091	536	190	0	4
1092	537	190	0	1
1093	538	190	0	1
1094	539	190	0	1
1097	508	355	0	2
1098	508	354	1	2
1095	497	356	1	5
1096	497	355	0	4
1099	508	356	2	2
1100	491	355	0	200
1101	491	356	1	30
1102	540	354	0	20
1103	540	355	1	50
1104	540	356	2	20
1109	253	176	4	20
1110	253	193	1	9
1111	253	173	5	2
1112	253	214	0	20
1113	253	172	3	10
1114	253	171	2	6
1115	541	192	1	9
1116	541	191	0	1
1117	541	194	2	7
1118	542	200	0	1
1119	396	179	4	1
1120	396	182	5	1
1121	396	183	1	1
1122	396	187	6	1
1123	396	185	2	1
1124	396	186	8	5
1125	396	180	0	2
1126	396	189	3	23
1127	396	188	7	1
1128	252	180	0	5
1129	252	184	5	25
1130	252	257	2	40
1131	252	256	1	10
1132	252	189	3	30
1133	252	214	4	10
1134	543	180	0	7
1135	543	186	1	3
1136	544	252	0	3
1138	414	434	3	2
1139	414	432	5	5
1140	414	433	2	3
1141	414	429	4	14
1142	414	438	0	3
1143	414	428	1	1
1144	545	430	1	15
1145	545	428	0	4
1146	545	437	2	500
1147	412	432	0	5
1148	412	434	5	1
1149	412	436	3	1
1150	412	435	1	33
1151	412	438	2	3
1152	412	429	4	12
1153	546	512	0	70
1154	547	513	0	10
1155	547	514	1	10
1156	548	514	1	30
1157	548	513	0	30
1158	549	513	1	26
1159	549	514	0	18
1160	550	514	1	30
1162	551	514	1	30
1164	552	513	0	20
1165	552	514	1	20
1166	553	514	1	5
1167	553	513	0	5
1168	554	513	0	75
1169	554	514	1	75
1170	555	513	1	10
1171	555	514	0	10
1172	556	513	0	10
1173	556	514	1	10
1174	557	514	0	50
1175	557	513	1	54
1181	560	513	0	15
1179	559	513	0	20
1176	558	513	0	15
1163	551	513	0	10
1161	550	513	0	20
1177	558	514	1	15
1178	559	514	1	20
1180	560	514	1	15
462	222	88	2	7
1182	561	452	0	443
1183	561	453	1	276
1106	346	355	1	394
1105	346	354	0	93
1184	562	515	0	100
1185	563	519	0	6
1186	563	516	1	10
1187	564	517	1	1
1188	564	518	2	12
1189	564	516	0	14
1190	564	519	3	44
1191	565	520	0	2
1192	566	522	0	15
1193	567	523	0	2
1195	569	526	1	27
1196	569	524	0	10
1197	570	526	1	10
1198	570	525	2	3
1199	570	524	0	30
1200	571	525	0	12
1201	571	526	1	13
1202	572	527	0	6
1203	573	528	0	20
1204	574	530	0	2
1205	575	530	0	5
1206	575	529	1	103
1207	576	531	0	4
1208	577	531	0	9
1209	578	531	0	12
1210	579	531	0	18
1211	580	531	0	5
1213	581	533	0	3
1214	582	533	0	17
1215	582	535	3	8
1216	582	532	4	30
1217	582	529	1	30
1218	582	536	2	12
1219	582	534	5	20
1220	583	536	2	12
1221	583	534	1	35
1222	583	533	0	70
1223	584	533	0	90
1224	585	530	1	1
1225	585	531	0	5
1226	585	537	2	20
1227	586	539	1	1
1228	586	538	0	5
1229	587	540	0	50
1230	588	542	1	24
1231	588	541	0	10
1232	588	543	2	20
1233	589	543	1	42
1234	589	541	0	10
1235	590	544	0	20
1236	591	547	2	10
1237	591	546	1	10
1238	591	545	0	2
1239	592	547	1	20
1240	592	546	0	40
1241	593	548	0	8
1242	568	523	0	28
\.


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 202
-- Name: outgoing_article_outgoing_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('outgoing_article_outgoing_article_id_seq', 1242, true);


--
-- TOC entry 3253 (class 0 OID 420627)
-- Dependencies: 203
-- Data for Name: outgoing_delivery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY outgoing_delivery (outgoing_delivery_id, organisation_id, person_id, delivery_list_id, delivery_nr, date, comment, update_timestamp, archived) FROM stdin;
55	98	519	\N	0	2015-01-30		2015-05-22	1
97	121	519	\N	0	2015-01-20		2015-05-23	1
56	46	519	\N	0	2015-01-28		2015-05-22	1
57	122	519	\N	0	2015-01-28		2015-05-22	1
58	12	519	\N	0	2015-01-28		2015-05-22	1
59	190	519	\N	0	2015-01-30		2015-05-23	1
60	213	519	\N	0	2015-01-30		2015-05-23	1
61	223	519	\N	0	2015-01-30		2015-05-23	1
63	192	519	\N	0	2015-01-30		2015-05-23	1
65	82	519	\N	0	2015-01-30		2015-05-23	1
66	248	519	\N	0	2015-01-30		2015-05-23	1
67	249	519	\N	0	2015-01-30		2015-05-23	1
98	46	519	\N	0	2015-01-20		2015-05-23	1
69	12	519	\N	0	2015-01-30		2015-05-23	1
70	83	519	\N	0	2015-01-27		2015-05-23	1
99	82	519	\N	0	2015-01-20		2015-05-23	1
100	192	519	\N	0	2015-01-20		2015-05-23	1
101	175	519	\N	0	2015-01-20		2015-05-23	1
71	213	519	\N	0	2015-01-23		2015-05-23	1
41	223	519	\N	0	2015-01-27		2015-05-18	1
42	210	519	\N	0	2015-01-27		2015-05-18	1
72	12	519	\N	0	2015-01-23		2015-05-23	1
54	165	519	\N	0	2015-01-23		2015-05-22	1
103	223	519	\N	0	2015-01-20		2015-05-23	1
104	249	519	\N	0	2015-01-20		2015-05-23	1
106	45	519	\N	0	2015-01-20		2015-05-23	1
102	190	519	\N	0	2015-01-20		2015-05-23	1
105	165	519	\N	0	2015-01-20		2015-05-23	1
78	132	519	\N	0	2015-01-29		2015-05-23	1
79	74	519	\N	0	2015-01-27		2015-05-23	1
80	223	519	\N	0	2015-01-27		2015-05-23	1
81	121	519	\N	0	2015-01-27		2015-05-23	1
82	210	519	\N	0	2015-01-27		2015-05-23	1
83	12	519	\N	0	2015-01-27		2015-05-23	1
84	44	519	\N	0	2015-01-22		2015-05-23	1
89	210	519	\N	0	2015-01-21		2015-05-23	1
91	250	519	\N	0	2015-01-21		2015-05-23	1
93	148	519	\N	0	2015-01-21		2015-05-23	1
86	81	519	\N	0	2015-01-21		2015-05-23	1
90	248	519	\N	0	2015-01-21		2015-05-23	1
87	153	519	\N	0	2015-01-21		2015-05-23	1
88	209	519	\N	0	2015-01-21		2015-05-23	1
92	132	519	\N	0	2015-01-21		2015-05-23	1
94	65	519	\N	0	2015-01-21		2015-05-23	1
107	213	519	\N	0	2015-01-21		2015-05-23	1
85	12	519	\N	0	2015-01-21		2015-05-23	1
95	98	519	\N	0	2015-01-20		2015-05-23	1
96	83	519	\N	0	2015-01-20		2015-05-23	1
108	45	519	\N	0	2015-01-20		2015-05-23	1
112	223	519	\N	0	2015-01-21		2015-05-23	1
113	213	519	\N	0	2015-01-21		2015-05-23	1
109	45	519	\N	0	2015-01-20		2015-05-23	1
110	165	519	\N	0	2015-01-20		2015-05-23	1
111	165	519	\N	0	2015-01-20		2015-05-23	1
114	192	602	\N	0	2015-02-26		2015-06-01	1
115	96	602	\N	0	2015-02-26		2015-06-01	1
116	12	602	\N	0	2015-02-26		2015-06-01	1
117	213	602	\N	0	2015-02-26		2015-06-01	1
118	178	602	\N	0	2015-02-26		2015-06-01	1
119	122	602	\N	0	2015-02-27		2015-06-01	1
120	12	602	\N	0	2015-02-27		2015-06-01	1
121	121	602	\N	0	2015-02-27		2015-06-01	1
122	209	602	\N	0	2015-02-09		2015-06-01	1
123	46	602	\N	0	2015-02-03		2015-06-01	1
124	12	602	\N	0	2015-03-06		2015-06-01	1
125	46	602	\N	0	2015-03-06		2015-06-01	1
126	46	602	\N	0	2015-02-19		2015-06-01	1
127	122	602	\N	0	2015-04-18		2015-06-01	1
129	12	602	\N	0	2015-04-18		2015-06-01	1
128	46	602	\N	0	2015-04-18		2015-06-01	1
130	121	602	\N	0	2015-05-12		2015-06-01	1
132	46	602	\N	0	2015-05-12		2015-06-01	1
131	12	602	\N	0	2015-05-12		2015-06-01	1
133	122	602	\N	0	2015-05-12		2015-06-01	1
134	46	602	\N	0	2015-02-25		2015-06-01	1
135	12	602	\N	0	2015-02-20		2015-06-01	1
136	12	602	\N	0	2015-02-06		2015-06-01	1
137	12	602	\N	0	2015-02-13		2015-06-01	1
138	83	602	\N	0	2015-02-24		2015-06-01	1
139	83	602	\N	0	2015-02-10		2015-06-01	1
140	83	602	\N	0	2015-02-17		2015-06-01	1
141	83	602	\N	0	2015-02-03		2015-06-01	1
143	209	602	\N	0	2015-02-17		2015-06-01	1
147	192	602	\N	0	2015-02-13		2015-06-01	1
144	12	602	\N	0	2015-02-09		2015-06-01	1
145	121	602	\N	0	2015-02-09		2015-06-01	1
146	46	602	\N	0	2015-02-09		2015-06-01	1
148	210	602	\N	0	2015-02-13		2015-06-01	1
150	213	602	\N	0	2015-02-13		2015-06-01	1
155	192	602	\N	0	2015-02-13		2015-06-01	1
157	223	602	\N	0	2015-02-13		2015-06-01	1
154	190	602	\N	0	2015-02-13		2015-06-01	1
153	82	602	\N	0	2015-02-13		2015-06-01	1
151	148	602	\N	0	2015-02-13		2015-06-01	1
149	12	602	\N	0	2015-02-13		2015-06-01	1
156	132	602	\N	0	2015-02-13		2015-06-01	1
152	65	602	\N	0	2015-02-13		2015-06-01	1
158	165	602	\N	0	2015-02-16		2015-06-01	1
159	122	253	\N	0	2015-04-09		2015-06-01	1
160	46	253	\N	0	2015-04-09		2015-06-01	1
161	98	253	\N	0	2015-04-09		2015-06-01	1
162	12	253	\N	0	2015-04-17		2015-06-01	1
163	12	253	\N	0	2015-04-24		2015-06-01	1
164	83	253	\N	0	2015-04-28		2015-06-01	1
165	98	253	\N	0	2015-04-24		2015-06-01	1
166	12	253	\N	0	2015-04-24		2015-06-01	1
167	46	253	\N	0	2015-04-24		2015-06-01	1
168	132	253	\N	0	2015-04-30		2015-06-01	1
169	12	574	\N	0	2015-01-02	WP U 01	2015-06-01	1
170	12	574	\N	0	2015-01-02	WP U 02	2015-06-01	1
171	46	574	\N	0	2015-01-02	WP U 02	2015-06-01	1
173	122	574	\N	0	2015-01-09	WP U 03	2015-06-01	1
172	165	574	\N	0	2015-01-09	WP U 03	2015-06-01	1
175	12	574	\N	0	2015-01-09	WO U 04und05	2015-06-01	1
174	132	574	\N	0	2015-01-09	WP U 04	2015-06-01	1
176	223	574	\N	0	2015-01-12	WP U 04	2015-06-01	1
177	210	574	\N	0	2015-01-10	WP U 04	2015-06-02	1
179	32	574	\N	0	2015-01-09	WP U 06 und unbek.	2015-06-02	1
182	82	574	\N	0	2015-01-09	WP U 06 und 07	2015-06-02	1
180	165	574	\N	0	2015-01-09	WP U 06 und 07	2015-06-02	1
181	192	574	\N	0	2015-01-09	WP U 06	2015-06-02	1
183	12	574	\N	0	2015-01-09	WP U 06 und 07	2015-06-02	1
184	213	574	\N	0	2015-01-09	WP U 06 und 07	2015-06-02	1
185	83	574	\N	0	2015-01-13	WP U 08	2015-06-02	1
186	98	574	\N	0	2015-01-14	WP U 09	2015-06-02	1
187	132	574	\N	0	2015-01-15	WP U 10	2015-06-02	1
188	12	574	\N	0	2015-01-16	WP U 11	2015-06-02	1
190	83	642	\N	0	2015-03-31		2015-06-04	1
191	12	642	\N	0	2015-03-27		2015-06-04	1
192	132	642	\N	0	2015-03-12		2015-06-04	1
193	12	642	\N	0	2015-03-13		2015-06-04	1
194	12	642	\N	0	2015-03-11		2015-06-04	1
195	46	642	\N	0	2015-03-11		2015-06-04	1
196	165	642	\N	0	2015-03-19		2015-06-04	1
197	192	642	\N	0	2015-03-19		2015-06-04	1
198	213	642	\N	0	2015-03-19		2015-06-04	1
199	83	642	\N	0	2015-03-09		2015-06-04	1
200	213	642	\N	0	2015-03-09		2015-06-04	1
201	12	642	\N	0	2015-03-09		2015-06-04	1
202	100	642	\N	0	2015-03-09		2015-06-04	1
203	63	642	\N	0	2015-03-11		2015-06-04	1
204	132	642	\N	0	2015-03-11		2015-06-04	1
205	250	642	\N	0	2015-03-11		2015-06-04	1
206	100	642	\N	0	2015-03-11		2015-06-04	1
207	95	642	\N	0	2015-03-11		2015-06-04	1
208	94	642	\N	0	2015-03-11		2015-06-04	1
212	165	642	\N	0	2015-03-02		2015-06-04	1
213	96	642	\N	0	2015-03-02		2015-06-04	1
214	192	642	\N	0	2015-03-02		2015-06-04	1
215	175	642	\N	0	2015-03-02		2015-06-04	1
216	82	642	\N	0	2015-03-02		2015-06-04	1
218	44	642	\N	0	2015-03-04		2015-06-04	1
211	165	642	\N	0	2015-03-09		2015-06-04	1
240	12	602	\N	0	2015-06-05		2015-06-20	1
210	223	642	\N	0	2015-03-11		2015-06-04	1
220	153	642	\N	0	2015-03-06		2015-06-04	1
255	12	642	\N	0	2015-03-10		2015-07-07	1
217	132	642	\N	0	2015-03-02		2015-06-04	1
222	83	642	\N	0	2015-03-03		2015-06-04	1
254	12	642	\N	0	2015-03-05		2015-07-07	1
226	74	519	\N	0	2015-01-27		2015-06-11	1
227	121	519	\N	0	2015-01-27		2015-06-11	1
228	210	519	\N	0	2015-01-27		2015-06-11	1
223	132	519	\N	0	2015-01-26		2015-06-11	1
224	148	519	\N	0	2015-01-26		2015-06-11	1
225	165	519	\N	0	2015-01-26		2015-06-11	1
229	12	253	\N	0	2015-04-18		2015-06-11	1
230	12	253	\N	0	2015-04-09		2015-06-11	1
231	12	253	\N	0	2015-04-07		2015-06-11	1
232	12	602	\N	0	2015-03-03		2015-06-20	1
233	12	602	\N	0	2015-03-17		2015-06-20	1
234	12	602	\N	0	2015-02-10		2015-06-20	1
235	12	602	\N	0	2015-02-19		2015-06-20	1
236	12	602	\N	0	2015-02-17		2015-06-20	1
237	12	602	\N	0	2015-02-26		2015-06-20	1
239	98	602	\N	0	2015-06-05		2015-06-20	1
241	83	602	\N	0	2015-06-02		2015-06-20	1
238	83	602	\N	0	2015-06-09		2015-06-20	1
242	210	602	\N	0	2015-05-09		2015-06-20	1
243	12	602	\N	0	2015-05-09		2015-06-20	1
244	12	602	\N	0	2015-05-05		2015-06-20	1
245	83	602	\N	0	2015-05-05		2015-06-20	1
246	213	602	\N	0	2015-05-21		2015-06-20	1
247	132	642	\N	0	2015-03-19		2015-07-03	1
248	210	642	\N	0	2015-03-31		2015-07-03	1
250	96	642	\N	0	2015-03-24		2015-07-03	1
257	12	642	\N	0	2015-03-19		2015-07-07	1
256	12	642	\N	0	2015-03-12		2015-07-07	1
219	74	642	\N	0	2015-03-06		2015-06-04	1
209	148	642	\N	0	2015-03-09		2015-07-07	1
221	12	642	\N	0	2015-03-06		2015-07-07	1
259	12	642	\N	0	2015-03-31		2015-07-07	1
258	12	642	\N	0	2015-03-24		2015-07-07	1
251	63	642	\N	0	2015-03-26		2015-07-07	1
265	82	602	\N	0	2015-06-23		2015-07-24	1
263	12	602	\N	0	2015-06-23		2015-07-24	1
266	223	602	\N	0	2015-06-23		2015-07-24	1
267	213	602	\N	0	2015-06-23		2015-07-24	1
268	92	602	\N	0	2015-06-23		2015-07-24	1
269	96	602	\N	0	2015-06-23		2015-07-24	1
271	94	602	\N	0	2015-06-23		2015-07-24	1
272	226	602	\N	0	2015-06-23		2015-07-24	1
273	210	602	\N	0	2015-06-23		2015-07-24	1
274	202	602	\N	0	2015-06-23		2015-07-24	1
275	65	602	\N	0	2015-06-23		2015-07-24	1
276	148	602	\N	0	2015-06-23		2015-07-24	1
279	12	602	\N	0	2015-06-19		2015-07-24	1
280	46	602	\N	0	2015-05-19		2015-07-25	1
283	38	602	\N	0	2015-04-14		2015-07-25	1
264	210	602	\N	0	2015-06-23		2015-07-24	1
270	190	602	\N	0	2015-06-23		2015-07-24	1
277	12	602	\N	0	2015-05-22		2015-07-24	1
278	12	602	\N	0	2015-05-29		2015-07-24	1
281	12	602	\N	0	2015-05-19		2015-07-25	1
282	12	602	\N	0	2015-04-14		2015-07-25	1
284	46	602	\N	0	2015-04-14		2015-07-25	1
285	83	602	\N	0	2015-03-17		2015-07-25	1
286	46	602	\N	0	2015-03-17		2015-07-25	1
288	46	602	\N	0	2015-03-03		2015-07-25	1
287	38	602	\N	0	2015-03-03		2015-07-25	1
289	115	602	\N	0	2015-03-03		2015-07-25	1
290	46	602	\N	0	2015-05-22		2015-07-25	1
291	98	602	\N	0	2015-05-22		2015-07-25	1
292	12	602	\N	0	2015-03-31		2015-07-25	1
293	24	602	\N	0	2015-03-31		2015-07-25	1
294	46	602	\N	0	2015-03-31		2015-07-25	1
262	32	602	\N	0	2015-06-23		2015-07-25	1
295	132	602	\N	0	2015-05-21		2015-07-25	1
296	132	602	\N	0	2015-06-05		2015-07-25	1
297	132	602	\N	0	2015-04-09		2015-07-25	1
298	132	602	\N	0	2015-05-07		2015-07-25	1
299	83	602	\N	0	2015-05-12		2015-07-25	1
300	83	602	\N	0	2015-04-14		2015-07-25	1
252	12	642	\N	0	2015-03-26		2016-01-17	1
301	83	602	\N	0	2015-06-30		2015-07-25	1
302	12	642	\N	0	2015-07-01		2015-07-30	1
303	12	642	\N	0	2015-06-12		2015-07-30	1
305	121	642	\N	0	2015-06-12		2015-07-30	1
304	100	642	\N	0	2015-06-12		2015-07-30	1
306	100	642	\N	0	2015-07-02		2015-07-30	1
307	122	642	\N	0	2015-07-08		2015-07-30	1
308	46	642	\N	0	2015-07-08		2015-07-30	1
309	12	642	\N	0	2015-07-08		2015-07-30	1
337	83	642	\N	0	2015-04-21		2015-08-18	1
311	12	642	\N	0	2015-07-03		2015-07-30	1
312	250	642	\N	0	2015-07-14		2015-07-30	1
313	12	642	\N	0	2015-07-10		2015-07-30	1
314	46	642	\N	0	2015-07-03		2015-07-30	1
315	12	642	\N	0	2015-07-03		2015-07-30	1
316	122	642	\N	0	2015-07-03		2015-07-30	1
317	209	642	\N	0	2015-07-03		2015-07-30	1
318	12	642	\N	0	2015-06-26		2015-07-30	1
319	122	642	\N	0	2015-06-22		2015-07-30	1
320	12	642	\N	0	2015-06-22		2015-07-30	1
321	46	642	\N	0	2015-06-19		2015-07-30	1
322	209	642	\N	0	2015-06-19		2015-07-30	1
323	132	642	\N	0	2015-07-07		2015-07-30	1
324	12	642	\N	0	2015-07-17		2015-07-30	1
325	12	642	\N	0	2015-07-24		2015-07-30	1
326	250	642	\N	0	2015-07-28		2015-07-30	1
327	223	642	\N	0	2015-07-17		2015-07-30	1
328	210	642	\N	0	2015-07-17		2015-07-30	1
329	213	642	\N	0	2015-07-28		2015-07-30	1
330	46	642	\N	0	2015-07-28		2015-07-30	1
333	132	642	\N	0	2015-06-18		2015-07-30	1
332	12	642	\N	0	2015-06-12		2015-07-30	1
334	132	642	\N	0	2015-07-02		2015-08-18	1
335	83	642	\N	0	2015-03-24		2015-08-18	1
336	83	642	\N	0	2015-04-07		2015-08-18	1
338	96	642	\N	0	2015-07-31		2015-08-18	1
339	213	642	\N	0	2015-07-31		2015-08-18	1
340	44	642	\N	0	2015-07-31		2015-08-18	1
341	82	642	\N	0	2015-07-31		2015-08-18	1
343	12	642	\N	0	2015-07-09		2015-08-18	1
331	132	642	\N	0	2015-07-16		2015-08-18	1
344	181	253	\N	0	2015-04-21	WP A 10	2015-09-03	1
345	95	253	\N	0	2015-04-17	WP A 10	2015-09-03	1
347	165	519	\N	0	2015-09-09		2015-09-10	1
348	213	519	\N	0	2015-09-09		2015-09-10	1
351	121	574	\N	0	2015-08-09	WP U 12	2015-09-29	1
350	46	574	\N	0	2015-08-09	WP U 12	2015-09-29	1
349	12	574	\N	0	2015-08-09	WU U 12	2015-09-29	1
353	132	574	\N	0	2015-08-27	WP U 14	2015-09-29	1
354	46	574	\N	0	2015-08-28	WP U 15	2015-09-29	1
355	12	574	\N	0	2015-08-28	WP U 15	2015-09-29	1
356	210	574	\N	0	2015-08-28	WP U 15	2015-09-29	1
352	250	574	\N	0	2015-08-25	WP U 13	2015-09-29	1
360	253	574	\N	0	2015-08-09		2015-10-18	1
361	12	574	\N	0	2015-08-24	WP U 17 u 18	2015-10-18	1
362	213	574	\N	0	2015-08-24	WP U 17 u 18	2015-10-18	1
366	132	574	\N	0	2015-08-26	WP U 16	2015-10-30	1
367	226	574	\N	0	2015-08-11	WP U 16	2015-10-30	1
363	148	574	\N	0	2015-08-07	WP U 16	2015-10-30	1
364	132	574	\N	0	2015-08-07	WP U 16	2015-10-30	1
365	210	574	\N	0	2015-08-07	WP U 16	2015-10-30	1
368	12	602	\N	0	2015-05-05		2015-11-11	1
369	132	602	\N	0	2015-06-11		2015-11-13	1
370	132	602	\N	0	2015-04-02		2015-11-13	1
371	132	602	\N	0	2015-04-09		2015-11-13	1
372	132	602	\N	0	2015-04-23		2015-11-13	1
373	83	602	\N	0	2015-05-26		2015-11-13	1
374	132	602	\N	0	2015-05-19		2015-11-13	1
375	12	602	\N	0	2015-04-30		2015-11-13	1
376	12	602	\N	0	2015-05-15		2015-11-13	1
377	132	602	\N	0	2015-02-26		2015-11-13	1
379	132	602	\N	0	2015-02-05		2015-11-13	1
378	132	602	\N	0	2015-02-12		2015-11-13	1
380	12	602	\N	0	2015-09-25		2015-11-13	1
381	83	602	\N	0	2015-03-17		2015-11-13	1
383	165	602	\N	0	2015-02-02		2015-11-13	1
384	44	602	\N	0	2015-02-02		2015-11-13	1
382	98	602	\N	0	2015-02-02		2015-11-13	1
386	148	602	\N	0	2015-02-02		2015-11-13	1
385	121	602	\N	0	2015-02-02		2015-11-13	1
387	12	602	\N	0	2015-02-12		2015-11-13	1
388	12	602	\N	0	2015-02-24		2015-11-13	1
389	12	602	\N	0	2015-10-07		2015-11-14	1
390	46	602	\N	0	2015-10-07		2015-11-14	1
391	46	602	\N	0	2015-10-09		2015-11-14	1
392	122	602	\N	0	2015-10-09		2015-11-14	1
393	12	602	\N	0	2015-10-09		2015-11-14	1
394	12	602	\N	0	2015-10-30		2015-11-14	1
395	12	602	\N	0	2015-10-02		2015-11-14	1
414	12	642	\N	0	2015-10-28		2016-01-25	1
397	12	642	\N	0	2015-07-15		2015-11-21	1
398	12	642	\N	0	2015-07-10		2015-11-21	1
399	46	642	\N	0	2015-07-22		2015-11-21	1
400	12	642	\N	0	2015-07-22		2015-11-21	1
401	98	642	\N	0	2015-07-22		2015-11-21	1
402	250	642	\N	0	2015-07-21		2015-11-21	1
403	12	642	\N	0	2015-11-06		2015-11-21	1
404	12	642	\N	0	2015-11-10		2015-11-21	1
405	209	642	\N	0	2015-11-10		2015-11-21	1
406	46	642	\N	0	2015-11-10		2015-11-21	1
407	210	574	\N	0	2015-08-31	WP U 18	2015-12-01	1
408	213	574	\N	0	2015-08-31	WP U 18	2015-12-01	1
409	258	574	\N	0	2015-12-10	WP U 04	2015-12-10	1
410	121	602	\N	0	2015-10-29		2015-12-18	1
411	210	602	\N	0	2015-10-29		2015-12-18	1
413	223	602	\N	0	2015-10-28		2015-12-18	1
412	213	642	\N	0	2015-10-29		2016-01-25	1
415	132	602	\N	0	2015-08-06		2015-12-27	1
416	132	602	\N	0	2015-08-20		2015-12-27	1
346	224	642	\N	0	2015-04-15	WP A 10	2016-01-17	1
253	165	642	\N	0	2015-03-27		2016-01-17	1
396	213	642	\N	0	2015-03-26		2016-01-17	1
417	46	602	\N	0	2015-10-20		2015-12-27	1
418	12	602	\N	0	2015-10-20		2015-12-27	1
420	44	602	\N	0	2015-06-16		2015-12-27	1
421	12	602	\N	0	2015-10-23		2015-12-27	1
425	213	602	\N	0	2015-05-21		2015-12-27	1
426	226	602	\N	0	2015-05-21		2015-12-27	1
430	92	602	\N	0	2015-04-17		2015-12-27	1
436	82	602	\N	0	2015-06-19		2015-12-27	1
437	44	602	\N	0	2015-06-18		2015-12-27	1
438	210	602	\N	0	2015-06-18		2015-12-27	1
419	115	602	\N	0	2015-10-20		2015-12-27	1
424	12	602	\N	0	2015-10-09		2015-12-27	1
432	32	602	\N	0	2015-04-21		2015-12-27	1
433	132	602	\N	0	2015-06-19		2015-12-27	1
435	226	602	\N	0	2015-06-18		2015-12-27	1
422	12	602	\N	0	2015-09-01		2015-12-27	1
423	46	602	\N	0	2015-09-01		2015-12-27	1
431	190	602	\N	0	2015-04-21		2015-12-27	1
434	225	602	\N	0	2015-06-19		2015-12-27	1
427	132	602	\N	0	2015-05-21		2015-12-27	1
428	12	602	\N	0	2015-05-05		2015-12-27	1
429	165	602	\N	0	2015-04-17		2015-12-27	1
439	213	602	\N	0	2015-06-18		2015-12-27	1
440	12	602	\N	0	2015-06-18		2015-12-27	1
441	24	602	\N	0	2015-06-18		2015-12-27	1
442	96	602	\N	0	2015-06-18		2015-12-27	1
444	192	602	\N	0	2015-06-18		2015-12-27	1
443	190	602	\N	0	2015-06-18		2015-12-27	1
445	12	602	\N	0	2015-03-06		2015-12-27	1
446	12	642	\N	0	2015-11-27		2015-12-31	1
447	46	642	\N	0	2015-11-18		2015-12-31	1
448	122	642	\N	0	2015-11-18		2015-12-31	1
449	12	642	\N	0	2015-11-14		2015-12-31	1
450	12	642	\N	0	2015-07-29		2015-12-31	1
451	121	642	\N	0	2015-07-29		2015-12-31	1
452	12	642	\N	0	2015-12-16		2015-12-31	1
453	121	642	\N	0	2015-12-16		2015-12-31	1
484	223	642	\N	0	2015-12-07		2016-01-06	1
485	121	642	\N	0	2015-12-07		2016-01-06	1
462	192	642	\N	0	2015-11-24		2015-12-31	1
465	210	642	\N	0	2015-11-23		2015-12-31	1
455	259	642	\N	0	2015-11-19		2015-12-31	1
456	46	642	\N	0	2015-11-19		2015-12-31	1
457	209	642	\N	0	2015-11-19		2015-12-31	1
454	223	642	\N	0	2015-11-19		2015-12-31	1
459	83	642	\N	0	2015-11-19		2015-12-31	1
460	257	642	\N	0	2015-11-19		2015-12-31	1
458	121	642	\N	0	2015-11-19		2015-12-31	1
514	165	642	\N	0	2015-10-14		2016-01-12	1
463	190	642	\N	0	2015-11-24		2015-12-31	1
467	94	642	\N	0	2015-12-11		2015-12-31	1
468	134	642	\N	0	2015-12-11		2015-12-31	1
470	213	642	\N	0	2015-12-09		2015-12-31	1
469	65	642	\N	0	2015-12-11		2015-12-31	1
486	210	642	\N	0	2015-12-07		2016-01-06	1
487	259	642	\N	0	2015-12-07		2016-01-06	1
477	12	642	\N	0	2015-12-03		2015-12-31	1
478	213	642	\N	0	2015-12-03		2015-12-31	1
474	249	642	\N	0	2015-12-02		2015-12-31	1
475	259	642	\N	0	2015-12-02		2015-12-31	1
490	126	642	\N	0	2015-04-15		2016-01-10	1
481	12	642	\N	0	2015-11-13		2015-12-31	1
480	12	642	\N	0	2015-12-11		2015-12-31	1
466	210	642	\N	0	2015-12-09		2016-01-06	1
473	257	642	\N	0	2015-12-15		2016-01-06	1
479	44	642	\N	0	2015-12-09		2016-01-06	1
461	126	642	\N	0	2015-11-23		2016-01-06	1
488	210	642	\N	0	2015-12-11		2016-01-06	1
489	165	642	\N	0	2015-12-09		2016-01-06	1
482	190	642	\N	0	2015-12-07		2016-01-06	1
483	32	642	\N	0	2015-12-07		2016-01-06	1
509	81	642	\N	0	2015-04-17		2016-01-10	1
510	92	642	\N	0	2015-04-17		2016-01-10	1
491	36	642	\N	0	2015-04-15		2016-01-17	1
504	175	642	\N	0	2015-04-17		2016-01-10	1
506	179	642	\N	0	2015-04-17		2016-01-10	1
505	192	642	\N	0	2015-04-17		2016-01-10	1
503	82	642	\N	0	2015-04-17		2016-01-10	1
498	210	642	\N	0	2015-04-16		2016-01-10	1
507	180	642	\N	0	2015-04-17		2016-01-10	1
508	96	642	\N	0	2015-04-17		2016-01-17	1
502	12	642	\N	0	2015-04-16		2016-01-10	1
501	83	642	\N	0	2015-04-16		2016-01-10	1
499	213	642	\N	0	2015-04-16		2016-01-10	1
500	44	642	\N	0	2015-04-16		2016-01-10	1
492	93	642	\N	0	2015-04-15		2016-01-10	1
494	226	642	\N	0	2015-04-15		2016-01-10	1
495	223	642	\N	0	2015-04-15		2016-01-10	1
493	202	642	\N	0	2015-04-15		2016-01-10	1
496	225	642	\N	0	2015-04-16		2016-01-10	1
476	210	642	\N	0	2015-12-02		2016-01-10	1
464	12	642	\N	0	2015-11-19		2016-01-10	1
513	46	642	\N	0	2015-12-31		2016-01-10	1
515	12	642	\N	0	2015-12-04		2016-01-12	1
516	165	642	\N	0	2015-10-02		2016-01-12	1
517	97	642	\N	0	2015-11-21		2016-01-12	1
518	12	642	\N	0	2015-10-16		2016-01-12	1
519	121	642	\N	0	2015-10-16		2016-01-12	1
520	46	642	\N	0	2015-10-16		2016-01-12	1
521	12	642	\N	0	2015-12-04		2016-01-12	1
522	12	642	\N	0	2015-09-18		2016-01-12	1
539	121	642	\N	0	2015-03-23		2016-01-17	1
538	81	642	\N	0	2015-03-23		2016-01-17	1
537	82	642	\N	0	2015-03-23		2016-01-17	1
536	223	642	\N	0	2015-03-23		2016-01-17	1
535	179	642	\N	0	2015-03-23		2016-01-17	1
534	180	642	\N	0	2015-03-23		2016-01-17	1
533	181	642	\N	0	2015-03-23		2016-01-17	1
532	175	642	\N	0	2015-03-23		2016-01-17	1
523	12	642	\N	0	2015-03-20		2016-01-17	1
524	74	642	\N	0	2015-03-20		2016-01-17	1
525	44	642	\N	0	2015-03-20		2016-01-17	1
526	95	642	\N	0	2015-03-20		2016-01-17	1
527	165	642	\N	0	2015-03-20		2016-01-17	1
528	92	642	\N	0	2015-03-20		2016-01-17	1
529	250	642	\N	0	2015-03-20		2016-01-17	1
530	132	642	\N	0	2015-03-20		2016-01-17	1
531	65	642	\N	0	2015-03-20		2016-01-17	1
497	178	642	\N	0	2015-04-16		2016-01-17	1
540	148	642	\N	0	2015-04-15		2016-01-17	1
512	32	642	\N	0	2015-04-21		2016-01-10	1
511	190	642	\N	0	2015-04-21		2016-01-10	1
541	210	642	\N	0	2015-03-27		2016-01-17	1
542	96	642	\N	0	2015-03-26		2016-01-17	1
543	126	642	\N	0	2015-04-10		2016-01-17	1
544	132	642	\N	0	2015-05-21		2016-01-25	1
545	126	642	\N	0	2015-11-04		2016-01-25	1
548	250	642	\N	0	2015-10-23		2016-01-25	1
549	12	642	\N	0	2015-10-23		2016-01-25	1
550	170	642	\N	0	2015-10-23		2016-01-25	1
553	226	642	\N	0	2015-10-27		2016-01-25	1
554	148	642	\N	0	2015-10-27		2016-01-25	1
555	44	642	\N	0	2015-10-27		2016-01-25	1
558	249	642	\N	0	2015-10-28		2016-01-25	1
557	12	642	\N	0	2015-10-27		2016-01-25	1
551	170	642	\N	0	2015-10-23		2016-01-25	1
546	165	642	\N	0	2015-11-04		2016-01-25	1
547	121	642	\N	0	2015-10-29		2016-01-25	1
552	210	642	\N	0	2015-10-27		2016-01-25	1
560	223	642	\N	0	2015-10-28		2016-01-25	1
556	38	642	\N	0	2015-10-27		2016-01-25	1
559	213	642	\N	0	2015-10-27		2016-01-25	1
561	226	642	\N	0	2015-05-19		2016-01-25	1
562	121	602	\N	0	2015-07-13		2016-02-01	1
564	165	602	\N	0	2015-12-21		2016-02-01	1
563	46	602	\N	0	2015-12-19		2016-02-01	1
565	210	519	\N	0	2015-10-02		2016-02-03	1
566	12	574	\N	0	2016-01-08	WP U 20	2016-02-12	1
567	46	574	\N	0	2016-01-02	WP U 22	2016-02-12	1
569	12	574	\N	0	2016-01-13	WP U 23	2016-02-12	1
570	165	574	\N	0	2016-01-13	WP U 23	2016-02-12	1
571	46	574	\N	0	2016-01-13	WP U 23	2016-02-12	1
572	12	574	\N	0	2016-01-29	WP U 24	2016-02-12	1
573	12	574	\N	0	2016-01-23	WP U 25	2016-02-12	1
574	46	574	\N	0	2016-01-07	WP U 26 (eigentlich auch 2x1,16kg Müsliriegel Schoko dazu (gibts aber im ERP nicht)	2016-02-14	0
575	210	574	\N	0	2016-01-07	WP U 26	2016-02-14	1
579	92	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
576	98	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
577	210	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
578	210	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
580	165	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
581	96	574	\N	0	2016-01-22	WP U 28 (9x20kg Dosenfisch ergänzen)	2016-02-14	0
584	259	574	\N	0	2016-01-25	WP U 28	2016-02-14	1
583	190	574	\N	0	2016-01-25	WP U 28	2016-02-14	1
582	190	574	\N	0	2016-01-22	WP U 28	2016-02-14	1
585	32	574	\N	0	2016-01-22	WP U 29 u.a. (2x20kg Dosenfisch ergänzen)	2016-02-14	0
586	210	574	\N	0	2015-11-19	WP U 21	2016-02-14	0
587	210	642	\N	0	2015-12-22		2016-02-17	1
588	213	642	\N	0	2015-12-23		2016-02-17	1
589	12	642	\N	0	2015-12-23		2016-02-17	1
590	12	642	\N	0	2015-12-18		2016-02-17	1
591	46	574	\N	0	2016-01-22	WP U 30	2016-02-19	1
592	98	574	\N	0	2016-01-22	WP U 30	2016-02-19	1
593	12	574	\N	0	2016-01-15	WP U 31	2016-02-19	1
568	257	574	\N	0	2016-01-02	WP U 22 (Kunde Landw. Betrieb Riezinger)	2016-02-19	1
\.


--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 204
-- Name: outgoing_delivery_outgoing_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('outgoing_delivery_outgoing_delivery_id_seq', 593, true);


--
-- TOC entry 3255 (class 0 OID 420637)
-- Dependencies: 205
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (permission_id, description, permission) FROM stdin;
1		Admin
3		Read
2		ReadWrite
\.


--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 206
-- Name: permission_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permission_permission_id_seq', 1, false);


--
-- TOC entry 3257 (class 0 OID 420645)
-- Dependencies: 207
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: -
--

COPY person (person_id, country_id, city_id, address_id, per_person_id, salutation, title, first_name, last_name, comment, update_timestamp, active) FROM stdin;
479	\N	\N	\N	1	Frau		Sigrid	Schöndorfer		2015-02-24	1
9	\N	\N	\N	1			Sr. Oberin			2015-02-24	1
13	\N	\N	\N	1	Frau		Gudrun	Albertsmeier		2015-02-24	1
15	2	59	125	1	Herr		Wolfgang	Allmann		2015-02-24	1
17	2	64	140	1	Frau		Anna	Aminger		2015-02-24	1
19	\N	\N	\N	1	Herr		Christian	Anner	Geschäftsführer	2015-02-24	1
20	2	42	151	1	Frau		Franziska	Aschauer		2015-02-24	1
23	\N	\N	\N	1	Frau		Brigitte	Asen		2015-02-24	1
24	2	54	32	1	Herr		Christian	Atanassoff		2015-02-24	1
26	\N	\N	\N	1	Herr Dir.	Dr.	Johann	Bachleitner		2015-02-24	1
27	2	42	175	1	Herr		Horst	Badzong	Tätigkeit: Waren	2015-02-24	1
29	\N	\N	\N	1	Herr		Adam	Balon	Geschäftsführer	2015-02-24	1
30	2	16	71	1	Herr		Hans	Bauer		2015-02-24	1
31	\N	\N	\N	1	Herr		Thomas	Bauernfeind		2015-02-24	1
32	\N	\N	\N	1	Herr		Georg	Baumann		2015-02-24	1
33	\N	\N	\N	1	Herr			Baumgartner		2015-02-24	1
35	2	50	150	1	Herr		Ludwig	Bayer		2015-02-24	1
37	2	42	245	1	Frau		Lydia	Bazanella		2015-02-24	1
38	2	42	58	1	Frau		Gerlinde	Beinsteiner		2015-02-24	1
39	\N	\N	\N	1	Herr		Wolfgang	Bell		2015-02-24	1
40	2	37	111	1	Herr		Hubert	Berger		2015-02-24	1
41	\N	\N	\N	1	Herr		Stephan	Berger		2015-02-24	1
43	\N	\N	\N	1	Herr		Gerold	Berner	Küchenleiter	2015-02-24	1
46	\N	\N	\N	1	Herr			Bichler		2015-02-24	1
47	2	42	48	1	Herr	Mag.	Roland	Bieber		2015-02-24	1
48	2	42	35	1	Frau		Kathryn	Bishop		2015-02-24	1
49	\N	\N	\N	1	Herr		Franz	Bliem		2015-02-24	1
50	\N	\N	\N	1	Frau	Mag.	Rosalinde	Bonecker		2015-02-24	1
51	2	5	78	1	Frau		Brigitte	Borbely		2015-02-24	1
53	2	47	99	1	Herr	Dr.	Johannes	Brandl		2015-02-24	1
54	\N	\N	\N	1	Frau		Andrea	Brandner		2015-02-24	1
56	\N	\N	\N	1	Herr		Robert	Brandstätter		2015-02-24	1
57	\N	\N	\N	1	Herr		Berthold	Brötzner	Küchenleiter	2015-02-24	1
58	\N	\N	\N	1	Herr		Bernhard	Bruckmoser		2015-02-24	1
60	\N	\N	\N	1	Herr	Mag.	Herbert	Brugger	Generalversammlung	2015-02-24	1
61	2	42	216	1	Frau		Elisabeth	Brunner		2015-02-24	1
62	\N	\N	\N	1	Frau		Brigitte	Buchacher		2015-02-24	1
64	\N	\N	\N	1	Frau			Bühringer		2015-02-24	1
65	\N	\N	\N	1	Herr		Hans	Burger	GF (Marketing & Vertrieb, Sprecher der Geschäftsführung)	2015-02-24	1
66	\N	\N	\N	1	Herr		Michael	Burghardt		2015-02-24	1
68	\N	\N	\N	1	Frau			Bürkl		2015-02-24	1
71	\N	\N	\N	1	Frau		Nihal	Demirci		2015-02-24	1
73	2	42	223	1	Frau		Brigitte	Derkits		2015-02-24	1
74	2	42	16	1	Frau		Helga	Derkits		2015-02-24	1
75	2	49	53	1	Herr		Günther	Derler		2015-02-24	1
76	2	42	84	1	Frau	Mag.	Kirstin	Descho		2015-02-24	1
77	\N	\N	\N	1	Frau		Alexandra	Dietrichsteiner		2015-02-24	1
78	\N	\N	\N	1	Herr		Daniel	Dinter		2015-02-24	1
79	\N	\N	\N	1	Herr		Walter	Dintl		2015-02-24	1
80	2	36	222	1	Herr	Dr.	Johannes	Ditz		2015-02-24	1
81	2	42	252	1	Frau		Ingrid	Doblinger		2015-02-24	1
82	\N	\N	\N	1	Herr		Jörg	Doll		2015-02-24	1
83	2	31	217	1	Herr	Dr.	Arthur	Domig		2015-02-24	1
84	\N	\N	\N	1	Herr		Gregor Svend	Dreher		2015-02-24	1
85	2	42	137	1	Herr	Dipl.Ing.	Christian	Dreyer		2015-02-24	1
86	2	62	240	1	Herr	Ing.	Wolfgang	Dürnberger		2015-02-24	1
87	\N	\N	\N	1	Frau		Margarete	Dürnberger	Verwaltung	2015-02-24	1
90	2	56	173	1	Frau		Doraja	Eberle		2015-02-24	1
91	2	41	51	1	Frau		Wally	Ebner		2015-02-24	1
92	2	42	23	1	Frau	Mag.	Barbara	Ebner		2015-02-24	1
94	2	52	79	1	Frau		Johanna	Ebner		2015-02-24	1
22	2	63	522	1	Frau		Ilse	Asen	Tätigkeit: Waren	2015-04-21	1
52	\N	\N	\N	1	Herr	Dipl. BBW	Konrad	Brand		2015-04-21	0
12	\N	\N	\N	1	Frau GR	Mag.	Dagmar	Aigner		2015-04-21	0
25	\N	\N	\N	1	Herr GR		Bernhard	Auinger		2015-04-21	0
69	2	44	524	1	Frau		Veronika	Canaval		2015-04-21	1
67	3	22	33	1	Herr	Dipl.Math.	Axel	Burkart		2015-04-21	0
95	2	42	525	1	Frau		Ingrid	Eckerl		2015-04-21	1
72	\N	\N	\N	1	Herr	Mag.	Bernhard	Denk		2015-04-22	0
604	\N	\N	\N	1				TestUser		2015-04-22	0
11	\N	\N	\N	345	Frau	Mag.	Svitlana	Aheyeva		2015-05-14	1
8	\N	\N	\N	345	Schwester		Bernadette	 	gelöscht	2015-05-14	0
3	\N	\N	\N	345	Schwester		Veronika	 	gelöscht	2015-05-14	0
45	\N	\N	\N	345	Frau		Berta	Berthold	gelöscht	2015-05-14	0
289	\N	\N	\N	345	Herr		Eduard	Landes	gelöscht	2015-05-14	0
89	\N	\N	\N	345	Herr			Eberl	Koch gelöscht	2015-05-14	0
59	\N	\N	\N	345	Herr		Wolfgang	Brudl	gelöscht	2015-05-14	0
16	\N	\N	\N	345	Herr			Altendorfer	gelöscht	2015-05-14	0
388	\N	\N	\N	1	Herr			Pfeiffenberger		2015-05-14	0
28	\N	65	552	345	Frau		Elfi	Baier		2015-05-14	1
6	\N	\N	\N	345	Pater		Alexander	Puchberger	Guardian	2015-05-15	1
2	\N	\N	\N	345	Schwester		Berta	 		2015-05-15	1
63	2	42	432	1	Herr		Robert	Buggler		2015-04-21	0
55	\N	48	576	345	Frau	Mag. Dr.	Brigitte 	Brandstötter		2015-05-20	1
93	\N	\N	\N	252	Frau	Mag.	Ingrid	Ebner		2015-08-17	1
44	2	31	221	441	Frau		Anita	Bernhofer	Tätigkeit: Waren	2015-09-09	1
18	2	48	81	345	Frau		Ruth	Amon	Tätigkeit: Waren	2015-08-20	1
96	\N	\N	\N	1	Herr		Wolfgang	Eckerl		2015-02-24	1
97	2	42	130	1	Frau		Ingrid	Eder		2015-02-24	1
98	\N	\N	\N	1	Frau	Dr.	Andrea	Eder-Gitschthaler		2015-02-24	1
88	2	54	141	345	Herr	Ing.	Franz	Dusch		2015-10-29	1
42	\N	\N	\N	519	Frau	Mag.	Nicole	Berkmann		2015-12-02	1
14	\N	\N	\N	252	Frau			Albrecht		2016-01-15	1
34	2	46	226	252	Herr		Wolf	Baur	derzeit Karenz	2016-02-04	1
345	2	42	233	252	Frau	DI	Doina	Moldovan	Tätigkeit: Öffentlichkeit	2016-02-04	1
99	\N	\N	\N	1	Frau		Barbara	Eichberger		2015-02-24	1
101	2	25	109	1	Herr Landesrat a. D.		Sepp	Eisl		2015-02-24	1
102	\N	\N	\N	1	Herr		Manfred	Ellmer		2015-02-24	1
103	\N	\N	\N	1	Pater		Michael	Eppengschwandtner		2015-02-24	1
105	\N	\N	\N	1	Herr		Lorenz	Erlbacher		2015-02-24	1
106	2	9	134	1	Herr KR		Martin	Essl		2015-02-24	1
107	2	47	107	1	Herr		Fritz	Eybl		2015-02-24	1
108	\N	\N	\N	1	Herr	Mag.	Helmut	Eymannsberger		2015-02-24	1
109	\N	\N	\N	1	Frau	Mag.	Maria	Fally		2015-02-24	1
111	\N	\N	\N	1	Herr		Franz	Federspieler		2015-02-24	1
114	2	42	25	1	Frau		Ina	Fischinger	Newsletter: nein	2015-02-24	1
115	2	42	116	1	Herr		Ernst	Flatscher		2015-02-24	1
116	\N	\N	\N	1	Frau		Friederike	Flesch, MAS		2015-02-24	1
117	2	64	68	1	Frau		Resi	Fletschberger		2015-02-24	1
118	2	42	133	1	Frau	Dr.	Dagmar	Fliegel		2015-02-24	1
122	\N	\N	\N	1	Herr		Reinhard	Fritz	Geschäftsführer	2015-02-24	1
126	\N	\N	\N	1	Sr.		Gerlinde	Fuchsbauer		2015-02-24	1
127	\N	\N	\N	1	Frau	Dr.	Doris	Fuschlberger, MBL		2015-02-24	1
128	2	42	243	1	Herr		Horst	Gallbauer		2015-02-24	1
130	2	30	254	1	Herr Bürgermeister		Johann	Ganisl		2015-02-24	1
131	\N	\N	\N	1	Herr	Mag.	Stephan	Gantner		2015-02-24	1
132	\N	\N	\N	1	Frau		Marianne	Gastager		2015-02-24	1
133	\N	\N	\N	1	Herr		Andreas	Gasteiger		2015-02-24	1
135	2	42	196	1	Frau		Gudrun	Gebetsroither		2015-02-24	1
136	2	57	230	1	Herr		Thomas	Geierspichler		2015-02-24	1
137	\N	\N	\N	1	Frau		Annemarie	Geierstanger		2015-02-24	1
138	\N	\N	\N	1	Frau	Mag.(FH)	Claudia	Geissler		2015-02-24	1
139	\N	\N	\N	1	Herr		Martin	Gensluckner		2015-02-24	1
140	2	42	104	1	Herr		Gerald	Giesswein	Tätigkeit: Waren	2015-02-24	1
141	2	32	87	1	Frau		Silvia	Gmachl		2015-02-24	1
142	2	42	215	1	Frau		Eva-Maria	Goldmann		2015-02-24	1
143	\N	\N	\N	1	Frau		Angelika	Goller		2015-02-24	1
144	\N	\N	\N	1	Frau		Claudia	Göllner	Assistentin der Geschäftsführung	2015-02-24	1
146	2	3	3	1	Frau Bürgermeister		Antonia	Götzendorfer		2015-02-24	1
150	\N	\N	\N	1	Frau		Katharina	Grasser	Fax: 0662/841079;www.innovationserkstatt.at	2015-02-24	1
151	\N	\N	\N	1	Frau		Evelyne	Grasshof		2015-02-24	1
152	2	42	59	1	Frau		Roswitha	Graupner		2015-02-24	1
153	2	3	210	1	Herr		Martin	Greisberger		2015-02-24	1
154	\N	\N	\N	1	Frau		Brigitta	Grießl		2015-02-24	1
155	2	5	8	1	Herr Bürgermeister	Ing.	Johann	Grießner		2015-02-24	1
156	\N	\N	\N	1	Frau		Roswitha	Grießner	Urlaubsvertretung	2015-02-24	1
158	2	52	235	1	Herr		Christoph	Grötzinger		2015-02-24	1
159	\N	\N	\N	1	Herr		Markus	Gruber		2015-02-24	1
160	\N	\N	\N	1	Herr	Mag.	Arnold	Gruber		2015-02-24	1
161	2	3	10	1	Herr		Johann	Grubinger		2015-02-24	1
162	\N	\N	\N	1	Frau		Siglinde	Gschwandtner		2015-02-24	1
163	\N	\N	\N	1	Herr		Georg	Gschwendtner		2015-02-24	1
164	\N	\N	\N	1	Herr		Helmut	Gstöhl	Geschäftsführer	2015-02-24	1
166	2	31	212	1	Herr		Sören	Guth		2015-02-24	1
167	2	58	96	1	Frau	Mag.	Daniela	Gutschi		2015-02-24	1
170	\N	\N	\N	1	Frau		Sandra	Habersatter		2015-02-24	1
171	\N	\N	\N	1	Frau			Hager		2015-02-24	1
172	\N	\N	\N	1	Frau		Christine	Hahn		2015-02-24	1
173	\N	\N	\N	1	Herr		Willi	Haider		2015-02-24	1
174	\N	\N	\N	1	Herr		Rudolf	Haindl	Geschäftsführer	2015-02-24	1
175	\N	\N	\N	1	Frau AR	Mag.	Ingeborg	Haller	Aufsichtsrat	2015-02-24	1
176	2	42	145	1	Herr		Horst	Haltrich		2015-02-24	1
177	2	42	126	1	Frau	Mag.	Esther	Handschin		2015-02-24	1
178	2	19	213	1	Herr	Dr.	Rüdiger	Hanifle		2015-02-24	1
179	2	42	191	1	Frau		Renate	Harant		2015-02-24	1
181	\N	\N	\N	1	Herr		Rudi	Harner		2015-02-24	1
182	\N	\N	\N	1	Herr		Ernst	Harringer		2015-02-24	1
183	\N	\N	\N	1	Herr		Robert	Hartmann	Geschäftsstellenleiter	2015-02-24	1
185	2	42	127	253	Frau		Greta	Hauswiesner	Tätigkeit: Admin.;Newsletter: ja	2015-04-15	1
188	2	42	17	1	Herr	Dr.	Helmut	Hegen		2015-02-24	1
189	\N	\N	\N	1	Herr		Erwin	Hehenberger		2015-02-24	1
190	2	28	101	1	Herr		Reinhard	Heindl		2015-02-24	1
168	\N	\N	\N	1	Frau		Walburga	Gwechenberger		2015-04-21	1
134	2	57	526	1	Herr	Dkfm.	Bernd	Gaubinger		2015-04-21	1
129	\N	\N	\N	1	Herr GR	Mag.	Wolfgang	Gallei		2015-04-21	0
100	2	42	147	345	Herr	Dr.	Oskar	Einzinger	Tätigkeit: Waren, Administration	2015-05-20	1
113	2	42	27	1	Frau		Rosmarie	Fink		2015-04-21	0
123	2	42	27	1	Frau		Christiane	Fuchs		2015-04-21	0
145	2	18	528	1	Frau		Christine	Gölzner		2015-04-21	1
180	2	52	529	1	Herr		Reinhold	Harfmann		2015-04-21	1
157	2	42	61	1	Herr		David	Gross		2015-04-21	0
184	2	42	530	1	Herr Landeshauptmann	Dr.	Wilfried	Haslauer		2015-04-21	1
125	\N	\N	\N	1	Herr		Alexander	Fuchs		2015-04-21	1
186	2	42	155	1	Frau		Margareta	Hauswiesner		2015-04-21	0
187	\N	\N	\N	345	Frau		Anni	Hauzenberger	gelöscht	2015-05-14	0
104	2	42	518	1	Frau		Lucia	Erlbacher		2015-04-21	0
110	\N	\N	\N	1	Frau			Faulhaber		2015-05-14	0
169	\N	\N	\N	519	Frau		Bettina	Haberl		2015-06-11	1
165	2	42	40	519	Herr		Irmin	Gundl		2015-06-18	1
148	2	42	77	345	Frau		Marijana	Grabovac, Bakk.Phil.	Newsletter: ja	2015-06-20	1
147	2	42	420	345	Herr		Franz	Grabmer		2015-06-21	1
120	2	46	94	345	Frau		Claudia	Frauenschuh		2015-06-21	1
121	2	46	94	345	Herr		Hermann	Frauenschuh		2015-06-21	1
191	\N	\N	\N	1	Herr		Wolfgang	Heitmeier		2015-02-24	1
192	\N	\N	\N	1	Frau		Bettina	Hemetsberger		2015-02-24	1
193	2	56	102	1	Herr Bürgermeister		Richard	Hemetsberger		2015-02-24	1
195	\N	\N	\N	1	Frau		Gabriele	Hemetsberger		2015-02-24	1
197	\N	\N	\N	1	Frau			Herbst		2015-02-24	1
199	\N	\N	\N	1	Frau		Christine	Herzig		2015-02-24	1
200	2	39	65	1	Herr		Peter	Herzog		2015-02-24	1
201	\N	\N	\N	1	Frau		Gabriele	Herzog		2015-02-24	1
202	2	33	5	1	Frau		Christine	Hilzensauer		2015-02-24	1
203	2	4	34	1	Herr Bürgermeister		Adolf	Hinterhauser		2015-02-24	1
205	2	42	251	1	Frau		Maria	Hintsteiner		2015-02-24	1
207	\N	\N	\N	1	Herr	Dr.	Franz	Hirnsperger		2015-02-24	1
208	2	28	166	1	Herr		Helfried	Hitsch	Tätigkeit: Waren;Newsletter: nein	2015-02-24	1
209	2	5	211	1	Herr		Franz	Hofbauer	Tätigkeit: Waren	2015-02-24	1
211	\N	\N	\N	1	Frau		Katharina	Hofer		2015-02-24	1
212	2	42	114	1	Frau		Monika	Hoffmeister		2015-02-24	1
213	\N	\N	\N	1	Herr	Dkfm.	Hanspeter	Hofinger		2015-02-24	1
215	2	10	152	1	Frau		Alathea	Hölscher	Newsletter: nein	2015-02-24	1
216	2	10	152	1	Herr		Georg	Hölscher	Newsletter: nein	2015-02-24	1
217	\N	\N	\N	1	Herr	DDr.	Manfred	Holztrattner		2015-02-24	1
219	\N	\N	\N	1	Herr		Bernhard	Höppener		2015-02-24	1
222	\N	\N	\N	1	Frau DSA		Gerlinde	Hörl		2015-02-24	1
223	\N	\N	\N	1	Herr		Bernd	Hörtnagl		2015-02-24	1
225	2	42	13	1	Frau		Johanna	Huber		2015-02-24	1
226	2	28	209	1	Frau		Helga	Huber	Newsletter: ja	2015-02-24	1
227	\N	\N	\N	1	Frau		Andrea	Huber		2015-02-24	1
228	2	18	15	1	Herr	Dr.	Wolfgang	Hübl	Tätigkeit: Waren	2015-02-24	1
229	2	12	72	1	Herr	Dipl.Ing.	Johannes	Hubmann		2015-02-24	1
230	\N	\N	\N	1	Herr		Josef	Humer		2015-02-24	1
231	\N	\N	\N	1	Herr	Dr.	Peter	Humer		2015-02-24	1
234	\N	\N	\N	1	Herr GR	Dr.	Helmut	Hüttinger		2015-02-24	1
235	2	60	202	1	Herr Ök.-Rat		Simon	Illmer		2015-02-24	1
236	\N	\N	\N	1	Pater		Hermann	Imminger		2015-02-24	1
237	2	42	89	1	Herr	Mag.	Michael J. F.	Jansen		2015-02-24	1
240	\N	\N	\N	1	Herr		Edwin	Jung		2015-02-24	1
241	2	6	20	1	Frau		Helga	Jungreithmayr		2015-02-24	1
242	2	13	128	1	Frau		Rosmarie	Jungwirth		2015-02-24	1
243	\N	\N	\N	1	Herr		Andreas	Käfer		2015-02-24	1
244	\N	\N	\N	1	Frau	Dipl.Kauf.	Trude	Kaindl-Hönig		2015-02-24	1
245	\N	\N	\N	1	Frau		Heidi	Karl		2015-02-24	1
249	\N	\N	\N	1	Herr	Dr.	Reinhold	Kelderer		2015-02-24	1
250	\N	\N	\N	1	Herr		Karl	Kern		2015-02-24	1
251	\N	\N	\N	1	Frau		Vanessa	Kern		2015-02-24	1
254	\N	\N	\N	1	Herr	Dr.	Heinrich Dieter	Kiener		2015-02-24	1
255	\N	\N	\N	1	Herr		Martin	Kipman		2015-02-24	1
256	2	18	108	1	Herr und Frau		Robert und Karin	Kirbisch		2015-02-24	1
257	\N	\N	\N	1	Frau		Angela	Kirchgatterer		2015-02-24	1
258	2	42	9	1	Frau	Mag.	Elisabeth	Kislinger-Ziegler		2015-02-24	1
259	2	32	170	1	Herr		Hans	Kitzberger		2015-02-24	1
260	\N	\N	\N	1	Frau		Sylvia	Klabuschnig		2015-02-24	1
261	2	13	178	1	Herr		Hannes	Kletzl		2015-02-24	1
262	2	51	103	1	Frau		Waltraud	Klima		2015-02-24	1
263	\N	\N	\N	1	Frau		Agnes	Knorr		2015-02-24	1
264	2	54	227	1	Frau		Ingrid	Koberger		2015-02-24	1
265	\N	\N	\N	1	Frau			Kogler		2015-02-24	1
268	2	11	224	1	Herr	Mag.	Helmut	Köllensperger		2015-02-24	1
270	2	42	248	1	Herr	Mag.	Reinhold	Kolm		2015-02-24	1
271	\N	\N	\N	1	Frau		Brigitte	Költringer		2015-02-24	1
272	2	42	95	1	Frau		Herma	König	Newsletter: ja	2015-02-24	1
273	\N	\N	\N	1	Herr		Gerd	Konklewski		2015-02-24	1
274	\N	\N	\N	1	Herr		Alexander	Koppensteiner		2015-02-24	1
275	2	42	112	1	Herr		Martin	Koppenwallner		2015-02-24	1
277	\N	\N	\N	1	Frau		Andrea	Krämmer		2015-02-24	1
278	2	59	41	1	Herr Bürgermeister		Friedrich	Kreil		2015-02-24	1
279	\N	\N	\N	1	Frau		Ulrike	Krempler		2015-02-24	1
280	\N	\N	\N	1	Herr		Franz	Kreuzeder		2015-02-24	1
281	\N	\N	\N	1	Herr		Jürgen	Kreuzsaler		2015-02-24	1
285	\N	\N	\N	1	Frau		Gertraud	Kronberger		2015-02-24	1
286	\N	\N	\N	1	Sr.		Brithe	Kröncke		2015-02-24	1
287	2	10	157	1	Herr Medizinalrat	Dr.	Leonhard	Laimböck		2015-02-24	1
288	2	42	232	1	Frau		Lieselotte	Lainer		2015-02-24	1
196	2	42	531	1	Frau	Mag.	Sonja	Henhapl-Röhrich		2015-04-21	1
282	\N	\N	\N	1	Herr		Alexander	Kribus		2015-04-21	0
284	\N	\N	\N	1	Herr		Lars	Kroiss		2015-04-21	0
239	\N	\N	\N	1	Frau			Jost		2015-04-21	0
198	2	42	532	1	Herr und Frau		Hans	Herneth		2015-04-21	1
220	2	42	533	1	Frau		Andrea	Hoppichler		2015-04-21	1
204	2	42	174	1	Herr	Dr.	Jürgen	Hinterwirth		2015-04-21	0
224	2	42	534	1	Frau	Mag.	Nicole	Huber		2015-04-21	1
232	2	42	113	252	Frau	Mag.	Friederike	Hurch		2015-04-21	0
269	2	42	536	1	Herr	Dr.	Karl	Koller	Newsletter: ja	2015-04-21	1
247	2	42	206	1	Frau	Dr.	Ilse	Kartnig		2015-04-21	0
266	2	54	43	1	Frau		Ingrid	Kohl		2015-04-21	0
206	\N	\N	\N	345	Frau		Veronika	Hirnböck	gelöscht	2015-05-14	0
233	\N	\N	\N	345	Frau	Mag.	Andrea	Huttegger	Pressereferentin, Amt für Kommunikation und Öffentlichkeitsarbeit	2015-05-15	1
210	\N	\N	\N	1	Herr			Hofbauer		2015-05-14	0
238	2	42	4	345	Frau	Mag.	Bärbel	Januschewsky	Tätigkeit: Disposition	2015-05-20	1
246	2	42	535	345	Frau		Minni	Karres	Newsletter: ja	2015-08-20	1
194	\N	\N	\N	1	Frau			Hemetsberger		2015-06-23	0
214	\N	\N	\N	1	Schwester		Rita	Höllwerth		2015-08-25	0
290	\N	\N	\N	1	Frau		Petra	Landschützer		2015-02-24	1
291	\N	\N	\N	1	Frau		Alexandra	Landsteiner		2015-02-24	1
292	2	32	228	1	Frau		Erika	Lange		2015-02-24	1
293	\N	\N	\N	1	Frau		Ruth	Langer		2015-02-24	1
294	\N	\N	\N	1	Herr		Hanno	Langer		2015-02-24	1
295	\N	\N	\N	1	Frau	Dr.	Maximiliane	Laserer		2015-02-24	1
296	\N	\N	\N	1	Frau und Herr		Stefan und Elke	Lebesmühlbacher		2015-02-24	1
297	2	10	218	1	Frau		Inge	Lederer		2015-02-24	1
298	\N	\N	\N	1	Herr		Christian	Leeb		2015-02-24	1
299	\N	\N	\N	1	Frau AR-Vorsitzende		Annemarie	Lehner	Aufsichtsrat	2015-02-24	1
300	\N	\N	\N	1	Frau	Dr.	Gertraud	Leimüller		2015-02-24	1
301	\N	\N	\N	1	Herr		Wolfgang	Leitinger	Geschäftsführer	2015-02-24	1
302	2	11	123	1	Frau	Mag.Dr.	Heidemarie	Leitner		2015-02-24	1
303	\N	\N	\N	1	Herr		Klaus	Leitner		2015-02-24	1
304	\N	\N	\N	1	Herr	Mag.	Simon	Lindenthaler		2015-02-24	1
305	2	47	99	1	Frau	Dr.	Andrea	Lindmayr-Brandl		2015-02-24	1
306	\N	\N	\N	1	Frau		Daniela	Linke		2015-02-24	1
307	2	48	185	1	Herr		Hubert	Lixl		2015-02-24	1
308	\N	\N	\N	1	Herr. Dir.		Erich	Lobensommer		2015-02-24	1
309	\N	\N	\N	1	Herr		Janos	Lobos	Logistics Manager DACH	2015-02-24	1
311	\N	\N	\N	1	Herr	Ing.	Karl	Lorentschitsch		2015-02-24	1
312	\N	\N	\N	1	Frau		Bettina	Lotterhos		2015-02-24	1
313	\N	\N	\N	1	Frau	Mag.	Ruzica	Lukic		2015-02-24	1
314	\N	\N	\N	1	Frau	Dr.	Astrid	Lüttich		2015-02-24	1
315	2	48	26	1	Frau	Mag.	Elfriede	Mackinger		2015-02-24	1
317	\N	\N	\N	1	Herr		Mario	Mairhofer		2015-02-24	1
318	2	53	187	1	Herr Bürgermeister		Joachim	Maislinger		2015-02-24	1
321	\N	\N	\N	1	Herr		Martin	Mallinger		2015-02-24	1
322	\N	\N	\N	1	Herr		Roland	Maly		2015-02-24	1
323	\N	\N	\N	1	Frau	Mag.	Natalie	Malzner		2015-02-24	1
324	2	57	74	1	Frau	Mag.	Elisabeth	Mang		2015-02-24	1
325	\N	\N	\N	1	Herr		Walter	Markitz		2015-02-24	1
326	\N	\N	\N	1	Frau		Maria	Marx		2015-02-24	1
329	\N	\N	\N	1	Herr	Mag.		Mayer		2015-02-24	1
331	2	42	80	1	Frau	Mag.	Traudl	Mayr		2015-02-24	1
332	2	51	214	1	Herr		Franz	Mayr		2015-02-24	1
334	\N	\N	\N	1	Herr		Roland	Mayrhofer	Geschäftsführer	2015-02-24	1
335	\N	\N	\N	1	Herr		Manfred	Mayrhofer	Heimleiter	2015-02-24	1
336	\N	\N	\N	1	Herr	Mag.	Martin	Melzer		2015-02-24	1
338	\N	\N	\N	1	Herr		Sebastian	Mettler	Geschäftsführer	2015-02-24	1
339	\N	\N	\N	1	Herr		Rolf Olaf	Meyer	Geschäftsführer	2015-02-24	1
340	\N	\N	\N	1	Herr	Mag.	Herwig	Mikutta		2015-02-24	1
341	\N	\N	\N	1	Herr		Peter	Mitgutsch		2015-02-24	1
342	\N	\N	\N	1	Herr		Josef	Mittermaier		2015-02-24	1
343	2	39	192	1	Herr Präsident		Helmut	Mödlhammer	Newsletter: ja	2015-02-24	1
344	\N	\N	\N	1	Herr		Manfred	Moldan		2015-02-24	1
346	\N	\N	\N	1	Herr Dir.		Kurt	Molterer		2015-02-24	1
348	2	42	139	1	Sr.		Erika	Moser		2015-02-24	1
349	\N	\N	\N	1	Herr		Johann	Mösl		2015-02-24	1
350	2	42	242	1	Herr		Michael	Mrazek	Newsletter: nein	2015-02-24	1
351	2	18	66	1	Herr	Dr.	Alois	Navara		2015-02-24	1
267	2	42	86	1	Frau	Mag.	Veronika	Kois	Newsletter: Ja	2015-02-24	1
352	2	42	182	1	Herr	Dipl.Ing.	Norbert	Nechansky		2015-02-24	1
353	2	42	182	1	Frau	Dr.	Verena	Nechansky		2015-02-24	1
355	2	42	209	1	Frau		Vida	Neugebauer		2015-02-24	1
356	2	59	203	1	Frau LAbg.		Theresia	Neuhofer		2015-02-24	1
357	\N	\N	\N	1	Herr		Günter	Neumann		2015-02-24	1
358	2	42	121	1	Frau	Mag.	Christine	Neurauter		2015-02-24	1
361	2	42	19	1	Frau		Erni	Niederer		2015-02-24	1
362	\N	\N	\N	1	Frau		Anja	Niederreiter		2015-02-24	1
364	\N	\N	\N	1	Frau		Angelika	Noisternigg	Leiterin	2015-02-24	1
365	2	39	246	1	Frau		Brigitte	Nußdorfer		2015-02-24	1
366	\N	\N	\N	1	Frau		Claudia	Oberascher		2015-02-24	1
367	\N	\N	\N	1	Herr	Dr.	Kurt	Oberholzer		2015-02-24	1
368	3	24	171	1	Frau		Cornelia	Oetzlinger		2015-02-24	1
369	\N	\N	\N	1	Frau		Elisabeth	Olsacher		2015-02-24	1
370	\N	\N	\N	1	Herr		Martin	Ölz		2015-02-24	1
373	2	42	247	1	Herr		Wilhelm 	Ortmayr		2015-02-24	1
374	2	45	138	1	Herr	Dipl.Ing.(FH)	Martin	Ortner	PR & Projektkoordination MediaCube	2015-02-24	1
375	2	18	63	1	Frau		Gudrun	Ostermayer		2015-02-24	1
376	\N	\N	\N	1	Herr		Rudi	Ott		2015-02-24	1
380	\N	\N	\N	1	Herr KR		Alexander	Pappas		2015-02-24	1
381	\N	\N	\N	1	Herr		Daniel	Paris		2015-02-24	1
382	2	42	180	1	Familie		Gerhard	Parisot		2015-02-24	1
383	\N	\N	\N	1	Frau		Sabine	Paulitsch		2015-02-24	1
384	2	42	146	1	Frau	Mag.	Claudia	Petschl		2015-02-24	1
333	2	13	110	1	Herr und Frau		Georg und Sabine	Mayrhofer		2015-04-21	1
378	\N	\N	\N	1	Herr Stadtrat		Johann	Padutsch		2015-04-21	0
347	2	42	537	1	Herr		Helfrid	Mooshammer		2015-04-21	1
337	\N	\N	\N	1	Frau		Eva	Mentl		2015-04-21	1
359	2	8	538	1	Herr	MMag.	Michael	Neureiter		2015-04-21	1
363	2	42	539	1	Herr	Mag.	Erwin	Niese		2015-04-21	1
372	2	56	541	1	Herr		Johannes	Orsini-Rosenberg		2015-04-21	1
377	2	42	542	1	Frau		Renate	Ourth		2015-04-21	1
385	2	42	106	1	Herr		Manfred	Petzelsberger		2015-04-21	0
327	\N	\N	\N	345	Pater		Karl	Mauri	gelöscht	2015-05-14	0
328	2	42	497	1	Herr	Mag.	Wolfgang	Mayer		2015-02-24	1
316	\N	\N	\N	1	Herr			Maderthaner		2015-05-14	0
360	\N	\N	\N	1	Herr		Josef	Niederbrucker		2015-05-14	0
310	2	42	88	345	Frau		Bettina	Lorentschitsch, Msc MBA		2015-06-20	1
387	\N	\N	\N	1	Herr		Markus	Pfarrhofer	Geschäftsführer	2015-02-24	1
389	3	24	55	1	Frau		Isolde	Pfingstl	Newsletter: ja	2015-02-24	1
390	\N	\N	\N	1	Herr		Thomas	Pichler		2015-02-24	1
391	\N	\N	\N	1	Herr			Pichlmaier		2015-02-24	1
393	\N	\N	\N	1	Herr		Gerhard	Pirchner		2015-02-24	1
394	\N	\N	\N	1	Herr		Alfred	Plank		2015-02-24	1
395	\N	\N	\N	1	Frau		Elisabeth	Plener		2015-02-24	1
396	\N	\N	\N	1	Herr	Dipl.Ing.(FH)	Gerhard	Pockenauer-Gramiller		2015-02-24	1
398	\N	\N	\N	1	Herr		Helmut	Pointner		2015-02-24	1
399	2	18	38	1	Frau		Karin	Pokorny		2015-02-24	1
400	\N	\N	\N	1	Herr	KR	Hans	Pöll	Geschäftsführer	2015-02-24	1
319	2	\N	\N	252	Frau	Mag.	Petra	Maislinger-Knoll		2016-01-21	1
401	\N	\N	\N	1	Herr		Hannes Christoph	Pöll	Geschäftsführer	2015-02-24	1
402	2	42	197	1	Herr		Johann	Pongruber	Newsletter: ja	2015-02-24	1
403	\N	\N	\N	1	Herr		Gerhard	Porsche		2015-02-24	1
404	\N	\N	\N	1	Frau	Mag.	Kathrin	Prähauser		2015-02-24	1
405	2	48	26	1	Herr		Bruno	Prantl		2015-02-24	1
406	\N	\N	\N	1	Herr Bürgermeister	Dipl.-Ing.	Harald	Preuner		2015-02-24	1
407	\N	\N	\N	1	Frau		Susannne	Prieth		2015-02-24	1
408	2	54	119	1	Frau		Elena	Proksch		2015-02-24	1
409	\N	\N	\N	1	Frau		Rebecca	Promersberger		2015-02-24	1
410	\N	\N	\N	1	Frau		Sabine	Prügger		2015-02-24	1
411	\N	\N	\N	1	Herr		Ernst	Pühringer		2015-02-24	1
413	\N	\N	\N	1	Frau		Helga	Purgstaller		2015-02-24	1
414	\N	\N	\N	1	Frau		Heidi	Püschel		2015-02-24	1
416	\N	\N	\N	1	Frau		Birgit	Radwanovsky		2015-02-24	1
417	\N	\N	\N	1	Frau		Tatjana	Rakovic		2015-02-24	1
418	2	42	57	1	Herr	Dr.	Johann	Rausch		2015-02-24	1
419	\N	\N	\N	1	Frau		Gabriele	Rechberger	Geschäftsführung	2015-02-24	1
420	2	42	156	1	Herr	Dr.	Alexander	Rehrl		2015-02-24	1
421	\N	\N	\N	1	Herr Generaldirektor	Dr.	Günther	Reibersdorfer		2015-02-24	1
422	2	20	21	1	Frau		Ruth	Reichegger		2015-02-24	1
423	\N	\N	\N	1	Herr			Reichl		2015-02-24	1
424	2	42	67	1	Herr	Dr.	Roland	Reichl		2015-02-24	1
425	2	42	225	1	Frau		Elfriede	Reichl		2015-02-24	1
427	\N	\N	\N	1	Frau		Nancy	Reinhardt	Lagerleiterin	2015-02-24	1
428	2	11	204	1	Herr und Frau		Günther und Dorli	Reinthaler		2015-02-24	1
429	\N	\N	\N	1	Herr		Ludwig	Reisinger	Fahrer	2015-02-24	1
433	2	61	69	1	Frau		Ulrike	Reitter		2015-02-24	1
434	2	42	133	1	Frau	Mag.	Helga	Rendl		2015-02-24	1
435	2	14	18	1	Herr	Ing.	Günther	Resch		2015-02-24	1
436	\N	\N	\N	1	Herr		Bernhard	Reschreiter		2015-02-24	1
437	\N	\N	\N	1	Herr		Kurt	Resl		2015-02-24	1
438	\N	\N	\N	1	Frau		Katharina	Rettenbacher		2015-02-24	1
439	\N	\N	\N	1	Herr	Mag.	Gottfried	Rettenegger		2015-02-24	1
440	2	18	122	1	Herr		Landolf	Revertera		2015-02-24	1
442	\N	\N	\N	1	Herr Direktor		Franz	Riedl		2015-02-24	1
444	2	46	36	1	Herr Bürgermeister	Dr.	Emmerich	Riesner		2015-02-24	1
447	\N	\N	\N	1	Herr		Wilfried	Rogler		2015-02-24	1
448	\N	\N	\N	1	Herr		Hannes	Roither	Kontakt über Walter Riezinger	2015-02-24	1
449	2	42	200	1	Herr		Christoph	Rolletschek		2015-02-24	1
450	\N	\N	\N	1	Frau		Madeleine	Rosenlechner		2015-02-24	1
451	\N	\N	\N	1	Herr		Manfred	Roth		2015-02-24	1
452	\N	\N	\N	1	Frau		Caroline	Roth		2015-02-24	1
453	2	65	97	1	Frau		Margit	Sachsenhofer		2015-02-24	1
454	2	10	93	1	Herr		Erich	Sättele		2015-02-24	1
456	\N	\N	\N	1	Frau		Ulrike	Schaffenrath		2015-02-24	1
457	\N	\N	\N	1	Herr	Dr.	Michael	Schaffer		2015-02-24	1
458	\N	\N	\N	1	Herr Prokurist		Peter	Schafleitner		2015-02-24	1
460	2	21	253	1	Frau		Ingeborg	Scheiber		2015-02-24	1
461	2	42	120	1	Frau		Traudl	Scheichl		2015-02-24	1
462	2	42	132	1	Herr		Helmut	Scheliessnig	Kontakt über Walter Riezinger	2015-02-24	1
463	\N	\N	\N	1	Frau		Michaela	Scheließnig	Assistenz Geschäftsleitung	2015-02-24	1
464	\N	\N	\N	1	Frau		Claudia	Scheucher		2015-02-24	1
465	2	42	241	1	Frau		Gerti	Scheuerer		2015-02-24	1
466	\N	\N	\N	1	Herr		Franz	Schindecker		2015-02-24	1
467	\N	\N	\N	1	Frau		Helga	Schinwald		2015-02-24	1
469	\N	\N	\N	1	Herr Präsident		Julius	Schmalz		2015-02-24	1
470	\N	\N	\N	1	Frau		Andrea	Schmid		2015-02-24	1
471	\N	\N	\N	1	Herr		Christian	Schmidhuber		2015-02-24	1
473	\N	\N	\N	1	Herr		Markus	Schmidt	Küchenleiter	2015-02-24	1
474	\N	\N	\N	1	Frau	Dipl.Ing.	Felicitas	Schneider		2015-02-24	1
475	2	42	153	1	Herr	Mag.	Oliver	Schneider		2015-02-24	1
477	2	15	142	1	Frau		Ingrid	Schöchl		2015-02-24	1
478	2	58	244	1	Herr LAbg.	Dr.	Josef	Schöchl		2015-02-24	1
480	\N	\N	\N	1	Frau	Mag.	Renate	Schönmayr		2015-02-24	1
472	\N	\N	\N	1	Frau Stadträtin	Mag.	Claudia	Schmidt		2015-04-21	0
415	2	42	544	1	Frau Präsidentin	Dr.	Helga	Rabl-Stadler		2015-04-21	1
412	2	42	82	1	Frau		Margit	Pum		2015-04-21	0
432	2	42	536	1	Frau		Maria	Reiter	Newsletter: ja	2015-04-21	1
431	2	31	194	1	Frau		Sissy	Reiter		2015-04-21	0
481	2	42	545	1	Herr	Dr.	Eduard	Schöpfer		2015-04-21	1
476	2	42	160	1	Frau		Edith	Schnöll		2015-04-21	0
426	2	39	477	1	Herr	Dr.	Wolfgang	Reiger	Newsletter: ja	2015-02-24	1
445	2	42	28	519	Herr	Mag.	Walter	Riezinger	Tätigkeit: Akquise	2015-06-18	1
397	2	42	56	345	Frau		Monika	Pointner		2015-07-10	1
443	\N	\N	\N	1	Herr			Rieger		2015-06-23	0
430	2	18	583	519	Frau		Sabrina	Reiter	Tätigkeit: Waren	2015-07-15	1
468	2	42	255	345	Frau		Edeltraud	Schirlbauer		2015-08-20	1
441	2	42	584	519	Frau		Brigitte	Ricciotti	Tätigkeit: Mitarbeiter	2015-09-01	1
483	\N	\N	\N	1	Herr	Dipl.-Ing.	Alexander	Schrank	Geschäftsführung	2015-02-24	1
484	2	42	30	1	Frau		Katharina	Schreilechner		2015-02-24	1
485	2	42	193	1	Frau	Dr.	Elisabeth	Schreiner		2015-02-24	1
486	\N	\N	\N	1	Frau	Mag.	Irene	Schulte		2015-02-24	1
488	2	63	118	1	Frau Bürgermeisterin	Mag.	Monika	Schwaiger		2015-02-24	1
489	\N	\N	\N	1	Herr Landesrat	DI Dr.	Josef	Schwaiger		2015-02-24	1
490	2	42	52	1	Herr	Dr.	Wolfgang	Schwaiger		2015-02-24	1
492	\N	\N	\N	1	Herr		Günther	Schwaighofer		2015-02-24	1
493	\N	\N	\N	1	Herr	Mag.	Florian	Schwap	Marketing	2015-02-24	1
494	2	10	163	1	Herr		Manfred	Schwarz		2015-02-24	1
495	\N	\N	\N	1	Frau		Helena	Schwarz		2015-02-24	1
497	2	42	161	1	Frau		Aloisia	Schwertl	Newsletter: nein	2015-02-24	1
386	2	42	590	345	Frau	Mag.	Ulrike	Pfaffenberger		2015-10-29	1
498	\N	\N	\N	1	Herr	DDDr.	Clemens	Sedmak		2015-02-24	1
500	\N	\N	\N	1	Herr Direktor	Dr.	Günther	Signitzer		2015-02-24	1
501	2	2	183	1	Frau		Karin	Siller	Fax 01/5864181-10	2015-02-24	1
504	2	34	73	1	Herr		Christian	Sitte		2015-02-24	1
506	2	35	37	1	Frau		Maria	Slowak		2015-02-24	1
507	\N	\N	\N	1	Frau		Manuela	Sokolt		2015-02-24	1
508	\N	\N	\N	1	Frau		Heidemarie	Spannlang	Assistentin Geschäftsführung	2015-02-24	1
509	2	11	70	1	Herr	Univ.Prof. Dr.	Wolfgang	Sperl		2015-02-24	1
510	\N	\N	\N	1	Herr	Mag.	Bernhard	Spiegel	Pädagogischer Leiter	2015-02-24	1
511	\N	\N	\N	1	Frau	Ing.	Dipl.Päd. Edith	Springl		2015-02-24	1
512	2	31	229	1	Herr und Frau		Werner	Stadler		2015-02-24	1
514	\N	\N	\N	1	Frau	DSA	Josephine	Stainer		2015-02-24	1
518	\N	\N	\N	1	Pater		Provinzial	Steiner		2015-02-24	1
520	2	18	75	1	Herr und Frau		Max und Talin	Steinhofer		2015-02-24	1
521	2	56	234	1	Herr		Georg	Steinitz		2015-02-24	1
524	\N	\N	\N	1	Frau	Mag. (FH)	Christina	Stöger		2015-02-24	1
525	2	42	115	1	Frau		Edith	Stöllinger		2015-02-24	1
526	2	42	115	1	Herr		Engelbert	Stöllinger		2015-02-24	1
528	2	58	83	1	Herr Bgm KR		Johann	Strasser		2015-02-24	1
529	2	28	164	1	Herr		Reiner	Strehl	Tätigkeit: Waren	2015-02-24	1
530	\N	\N	\N	1	Herr		Roman	Strimmer	Koch	2015-02-24	1
531	2	29	148	1	Herr	Dipl.Ing.	Christian	Struber		2015-02-24	1
532	\N	\N	\N	1	Herr		Harald	Sulzer	Küchenlaeiter	2015-02-24	1
533	\N	\N	\N	1	Herr		Gerhard	Sulzer Sen.		2015-02-24	1
535	\N	\N	\N	1	Herr		Andreas	Szigethy		2015-02-24	1
536	\N	\N	\N	1	Frau		Karin	Szvasztics	Pflegedienstleitung	2015-02-24	1
537	2	42	207	1	Frau		Christiane	Teichmann		2015-02-24	1
539	\N	\N	\N	1	Frau		Gabriele	Teufl	Leiterin der Pflege	2015-02-24	1
540	\N	\N	\N	1	Frau		Birgit	Thaler-Haag		2015-02-24	1
541	2	58	14	1	Frau		Monika	Thonhofer		2015-02-24	1
542	\N	\N	\N	1	Herr	Mag.	Thomas	Thöny		2015-02-24	1
544	2	31	256	1	Herr und Frau		Peter und Johanna	Thuswaldner		2015-02-24	1
545	\N	\N	\N	1	Herr		Raimund	Tischler		2015-02-24	1
548	\N	\N	\N	1	Frau	Mag.	Claudia	Trausnitz		2015-02-24	1
551	2	42	90	1	Frau		Caroline	Udvarhelyi		2015-02-24	1
552	2	42	117	1	Frau	Mag.	Michaela	Ullmann		2015-02-24	1
553	2	56	24	1	Herr	Mag.	Alfred	Unterberger		2015-02-24	1
554	\N	\N	\N	1	Frau		Daniela	Vsol		2015-02-24	1
557	2	11	250	1	Frau		Andrea	Waldmann		2015-02-24	1
559	\N	\N	\N	1	Frau Dipl.-Päd.		Daniela	Wallner		2015-02-24	1
560	2	27	11	1	Herr Bürgermeister	Ing.	Simon	Wallner		2015-02-24	1
561	2	42	50	1			Josef	Walser		2015-02-24	1
563	2	42	188	1	Frau		Christine	Wawra		2015-02-24	1
565	2	42	238	1	Frau	Mag.	Verena	Weber		2015-02-24	1
566	\N	\N	\N	1	Herr		Herbert	Weber		2015-02-24	1
567	2	42	64	1	Herr	Dr.	Franz	Weber		2015-02-24	1
568	\N	\N	\N	1	Herr			Weichenberger		2015-02-24	1
569	\N	\N	\N	1	Herr		Heimo	Weilharter		2015-02-24	1
570	\N	\N	\N	1	Herr		Werner	Weinguny		2015-02-24	1
572	2	42	131	1	Frau	Mag.	Eva	Weissenbacher		2015-02-24	1
573	2	18	124	1	Frau		Armella	Wengler		2015-02-24	1
575	2	47	136	1	Frau		Ingrid	Werdenich		2015-02-24	1
577	\N	\N	\N	1	Frau		Adelheid	Widmoser		2015-02-24	1
502	2	42	546	1	Frau		Angela	Simmel		2015-04-21	1
576	\N	\N	\N	1	Frau GR	Dr.	Elisabeth	Werner		2015-04-21	0
499	\N	\N	\N	1	Frau			Seiwald		2015-04-21	0
555	\N	\N	\N	1	Herr	Mag.	Erich	Wagner		2015-04-21	0
487	2	38	181	1	Herr		Peter	Schuster		2015-04-21	0
496	2	42	198	1	Frau		Karoline	Schwendemann		2015-04-21	0
517	2	15	22	1	Frau		Anna	Steiner		2015-04-21	1
513	2	42	149	1	Frau		Sigrid	Stadler		2015-04-21	0
547	2	42	549	1	Herr	Mag.	Volker	Toth		2015-04-21	1
550	\N	\N	\N	1	Herr		Roland	Turbinsky		2015-04-21	0
556	2	26	129	1	Herr	Mag.	Gregor	Waidacher		2015-04-21	0
523	2	42	463	253	Herr		Sebastian	Stiegelmair		2015-04-22	0
515	2	42	497	1	Herr		Nikolaus	Stampfer		2015-02-24	1
538	\N	\N	\N	1	Herr			Terler		2015-05-14	0
562	\N	\N	\N	1	Herr		Georg	Walter		2015-05-14	0
503	\N	\N	\N	1	Herr		Erwin	Simmer		2015-05-14	0
534	\N	\N	\N	1	Herr		Johann	Svager		2015-05-14	0
527	\N	\N	\N	519	Herr Ök.-Rat.		Walter	Strasser		2015-05-18	1
549	\N	15	550	345	Frau	Dipl.Ing.	Tina	Tscherteu		2015-05-20	1
546	2	42	548	345	Herr		Felix	Tomo	Tätigkeit: Waren, Telefon	2015-05-20	1
505	2	42	300	345	Schwester		Joanella	Six		2015-06-21	1
564	2	42	188	345	Herr		Hans-Peter	Wawra		2015-06-21	1
491	\N	\N	\N	252	Herr	Mag.	Christoph	Schwaiger		2015-08-17	1
578	\N	\N	\N	1	Herr		Toni	Wieland		2015-02-24	1
581	\N	55	60	1	Herr		David	Wieser		2015-02-24	1
582	2	58	39	1	Herr Dir.		Karl-Armin	Wieser		2015-02-24	1
583	\N	\N	\N	1	Herr	Mag.	Franz	Wieser, MBA		2015-02-24	1
584	2	10	76	1	Frau		Gudrun	Wilhelm		2015-02-24	1
588	\N	\N	\N	1	Frau		Marianne	Winkler		2015-02-24	1
589	\N	\N	\N	1	Herr	Mag.	Marcus	Winkler		2015-02-24	1
590	\N	\N	\N	1	Herr		Christian	Winzer		2015-02-24	1
591	2	42	169	1	Frau		Elisabeth	Wittich	Tätigkeit: Waren	2015-02-24	1
592	\N	\N	\N	1	Herr	Dr.	Alois	Wittinghofer		2015-02-24	1
593	2	18	219	1	Frau		Irmgard	Wöhrl		2015-02-24	1
594	\N	\N	\N	1	Herr		Erich	Woltsche		2015-02-24	1
596	\N	\N	\N	1	Frau GR		Marlene	Wörndl		2015-02-24	1
597	2	42	162	1	Frau		Maria	Zeppezauer		2015-02-24	1
598	2	42	31	1	Frau	Dipl.Ing.	Jana	Zitta		2015-02-24	1
599	\N	\N	\N	1	Herr		Florian	Zöchling		2015-02-24	1
600	\N	\N	\N	1	Frau		Charlotte	Zöhrer		2015-02-24	1
558	2	51	510	345	Frau		Theresia	Wallerstorfer		2016-01-17	1
601	\N	\N	\N	1	Herr	Mag.	Bernhard	Zoller		2015-02-24	1
603	\N	\N	\N	1	Herr	Mag.	Klaus	Zuckerstätter		2015-02-24	1
1	\N	\N	\N	1	Herr		Matthias	Schnöll		2015-02-20	1
248	2	52	452	252	Herr		Oskar	Kaufmann		2015-04-10	1
606	\N	\N	\N	252	Herr		Manfred	Kiesenhofer		2015-04-10	1
607	6	108	461	252	Frau	Dr.	Tina	Widmann	Stimmt Titel ?	2015-04-10	1
608	\N	\N	\N	252	Frau		Erika	Wimmer		2015-04-10	1
21	\N	\N	\N	252	Herr		Franz	Aschauer		2015-04-10	1
354	\N	\N	\N	1	Frau		Stefanie	Neubauer		2015-04-14	0
609	\N	\N	\N	1	Herr		Florian	Zehner		2015-04-14	1
119	2	42	2	253	Frau	Mag.	Anna	Fratt	Tätigkeit: Öffentlichkeit Tel.	2015-04-15	1
543	\N	\N	\N	1	Herr		Gerhard	Thürridl		2015-04-21	1
610	\N	\N	\N	1	Herr		Roger	Dance		2015-04-21	1
611	\N	\N	\N	1	Herr		Jörg	Weisser		2015-04-21	1
70	\N	\N	\N	1	Herr		Daniel	Chladek		2015-04-21	0
371	2	18	338	1	Herr	Mag.	Stefan	Ornig		2015-04-21	1
283	\N	\N	\N	1	Herr		Franz	Kriechhammer		2015-04-21	0
112	\N	\N	\N	1	Herr	Dipl.Bw.	Gerhard	Feichtinger	Newsletter: nein	2015-04-21	0
612	\N	\N	\N	1	Frau		Manuela	Spießberger		2015-04-21	1
459	\N	\N	\N	1	Herr		Johann	Schallmoser		2015-04-21	0
392	\N	\N	\N	1				Pieper		2015-04-21	0
516	\N	\N	\N	1	Herr	Mag.	Udo	Steckholzer		2015-04-21	0
320	\N	\N	\N	1	Frau AR	Mag.	Karoline	Tanzer	Aufsichtsrat	2015-04-21	1
124	\N	\N	\N	1	Herr GR	Dr.	Christoph	Fuchs		2015-04-21	0
218	\N	\N	\N	1	Frau Bürgermeister		Christine	Homola		2015-04-21	0
455	\N	\N	\N	1	Herr Bürgermeister	Dr.	Heinz	Schaden		2015-04-21	0
482	\N	\N	\N	1	Herr GR	Dr.	Andreas	Schöppl		2015-04-21	0
613	\N	\N	\N	1	Frau		Stephanie	Lorber		2015-04-21	1
614	\N	\N	\N	1	Frau		Nicole	Struber		2015-04-21	1
629	\N	\N	\N	345	Herr	MSc	Andreas	Van-Hametner		2015-05-14	1
379	2	42	195	1	Frau	Dr.	Brigitta	Pallauf	Newsletter: ja	2015-04-21	0
571	2	42	100	1	Herr und Frau	Dr.	Johann und Irene	Weiß		2015-04-21	0
630	\N	\N	\N	345	Herr Bakk.Komm.		Martin	Wautischer		2015-05-14	1
579	2	43	239	1	Herr		Reinfried	Wieser		2015-04-21	0
580	2	42	551	1	Herr KommR		Johann	Wieser		2015-04-21	1
631	\N	\N	\N	345	Frau	Mag.	Dagmar	Köttl		2015-05-14	1
586	2	42	144	1	Frau		Grete	Windhager		2015-04-21	0
605	5	106	460	345	Frau/Herr		Test	Persona	Zuschauer im Testsystem	2015-04-22	0
618	\N	\N	\N	345	Frau		Lisa	Authried		2015-05-14	1
619	\N	\N	\N	345	Herr		Simon	Letsch		2015-05-14	1
620	\N	\N	\N	345	Frau		Lena	Repplinger		2015-05-14	1
621	\N	\N	\N	345	Herr	Prof. Dr.	René	Schmidpeter		2015-05-14	1
622	\N	\N	\N	345	Herr		Peter	Scheließnig		2015-05-14	1
623	\N	\N	\N	345	Frau		Ingrid	Spitaler		2015-05-14	1
624	\N	\N	\N	345	Herr	Dipl. Ing. Dr. 	Gerhard	Jöchtl		2015-05-14	1
625	\N	\N	\N	345	Frau		Sandra	Lagler		2015-05-14	1
626	\N	\N	\N	345	Herr		Roland	Lochmann		2015-05-14	1
627	\N	\N	\N	345	Frau		Bianca	Rieder		2015-05-14	1
595	\N	\N	\N	345	Herr			Reischl		2015-05-14	1
628	\N	\N	\N	345	Frau	Mag.	Christina	Laggner		2015-05-14	1
632	\N	\N	\N	345	Herr	Ing.	Josef	Putz		2015-05-14	1
634	\N	\N	\N	345	Frau President	Dr.	Maria	Ganauser		2015-05-14	1
635	\N	\N	\N	345	Frau		Claudia	Eigenherr-Tschugmell		2015-05-14	1
636	\N	\N	\N	345	Herr		Franz	Müller		2015-05-14	1
639	\N	\N	\N	345	Herr	MBA	Michael	Florian		2015-05-14	1
585	\N	\N	\N	1	Frau		Gertrude	Wind		2015-05-14	0
637	\N	\N	\N	345	Frau		Bernadette	Hawel		2015-05-14	1
638	\N	\N	\N	345	Herr	Mag. (FH)	Duško	Stojaković		2015-05-14	1
640	\N	\N	\N	345	Herr	Mag.	Bernd	Huber		2015-05-14	1
641	\N	\N	\N	345	Herr	Mag.	Helmut	Oszvald		2015-05-15	1
633	\N	\N	\N	345	Frau		Roswitha	Beranek	Assistentin der Geschäftsführung	2015-05-15	1
10	2	42	236	345	Frau		Anna	Ablasser	gelöscht	2015-05-18	0
587	\N	\N	\N	345	Frau		Elisabeth	Windhofer	gelöscht	2015-05-15	0
642	\N	119	572	345	Frau		Lisa	Traubenek	Tätigkeit: Administration, Waren	2015-05-20	1
616	2	56	540	345	Herr		Peter	Nussbaum	Tätigkeit: Waren, Newsletter: ja	2015-05-20	1
645	\N	54	574	345			Leopold	Reichenauer		2015-05-20	1
646	\N	120	575	345	Frau		Elisabeth	Pfeffer		2015-05-20	1
615	2	42	527	519	Herr		Anton	Gietzinger		2015-06-23	1
648	2	121	577	519	Herr	MAS	Kurt	Schiechl		2015-05-23	1
650	\N	\N	\N	345	Frau		Petra	 Ummenberger		2015-06-10	1
617	\N	\N	\N	345	Herr	Ing.	Josef	Bachleitner		2015-06-20	1
651	2	42	581	345	Herr		Bernhard	Rosegger	Newsletter: nein	2015-06-21	1
652	2	124	582	345	Herr	Dr.	Helmut	Leube	Newsletter: ja	2015-06-21	1
221	2	42	272	345	Herr Generaldirektor	Dr.	Johannes	Hörl	Newsletter: nein	2015-06-21	1
653	8	42	587	441	Herr		Stefan	Scherzer		2015-09-09	0
149	2	56	85	441	Frau		Christa	Graf	Tätigkeit: Waren; Newsletter: ja	2015-09-09	1
654	2	77	588	519	Herr		Thomas	Klein		2015-09-10	1
252	3	24	6	253	Frau		Doris	Kiefel	Tätigkeit: Obfrau, Disposition	2015-10-28	1
649	2	126	579	345	Herr	Dr.	Leonhard	Schitter	Newsletter: nein	2015-10-29	1
655	2	127	591	345	Herr	Mag.	Rudolf	Zrost	Newsletter: ja	2015-10-31	1
656	2	42	592	253	Frau		Sabine	Füssl		2015-11-03	1
519	2	42	547	253	Herr		Michael	Steingaßner	Tätigkeit: Waren	2015-11-16	1
657	2	128	594	345	Herr		Josef	Nobis	Newsletter: nein	2015-11-23	1
658	\N	\N	\N	345	Frau		Edith 	Frauscher	Marketing- und Innovationsmanagerin	2015-11-28	1
643	\N	54	586	345	Herr		Hugo	Rohner	Newsletter: ja;	2016-01-17	1
602	2	42	165	345	Frau		Sabine	Zöpfl	Tätigkeit: Waren; Newsletter: ja;	2016-01-17	1
647	2	42	195	345	Frau	Dr.	Brigitta	Pallauf	Newsletter: ja	2016-01-18	1
36	2	53	523	252	Frau Dir. KR		Regina	Bayer-Volkmann		2016-01-20	1
644	\N	42	573	252	Herr	DI Dr.	Alois	Schweiger	Tätigkeit: Waren	2016-02-04	1
659	\N	\N	\N	519	Herr		Florian	Hoffmeister		2015-12-02	1
660	\N	130	597	519	Frau		Sabine	Mayrhofer		2015-12-09	1
522	2	42	220	252	Herr		Bruno	Steinwender		2016-01-04	0
446	2	54	589	253	Frau		Cornelia	Robl	Tätigkeit: Waren	2016-01-10	1
330	2	44	205	252	Frau		Elke	Mayer		2016-01-12	1
661	2	28	598	345	Herr	Dr.	Eduard	Thaler	Newsletter: ja;	2016-01-17	1
574	2	28	42	252	Frau	Mag.	Ulrike	Wenzlhuemer	Tätigkeit: Administration	2016-02-01	1
662	\N	\N	\N	519	Herr			Bruch		2016-02-03	1
663	\N	\N	\N	519	Frau			Lorenzl		2016-02-03	1
664	\N	\N	\N	519	Frau		Manuela	Rauter		2016-02-03	1
253	3	97	462	252	Herr	DI	Albert	Kiefel	Tätigkeit: Administration	2016-02-04	1
665	\N	\N	\N	441	Herr		Mario	Ebner		2016-02-10	1
\.


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 208
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('person_person_id_seq', 665, true);


--
-- TOC entry 3262 (class 0 OID 420674)
-- Dependencies: 214
-- Data for Name: platformuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY platformuser (person_id, permission_id, password, login_email) FROM stdin;
1	1	TdKGOS_A7e7xbF7SViJVch1mHlbOogpaGiOHhIVVCLD7MkFCyDAOA	mschnoell@gmx.net
165	3	lZKhHIlLmLqNab7rs873izruuohNNOIplNXnMxafTGHk1szmq1PjE	irmin.gundl@aon.at
642	2	nbHbeyTorczuCZGtoMTV1sNG663SKpzxJx2uWZQN4VdXPP3laz0lk	lisa_traubenek@yahoo.de
441	1	mKekp7ZAZh9XvX0rgI8u6DuYlviIPym5ZKLDDN-eSuAq6J5DQ3t_g	b.ricciotti@view-salzburg.at
252	1	EIQ4rtcRO9JWOVmAfWca2WcE3x-UJx11rCqIM8bpr0RPDCxZ-o5AY	doris.kiefel@view-salzburg.at
656	3	OQGmZRfKTgieaAQ2aO_OAVOWvaIzhubORAGijNyoiFOJzpRnXNzos	sabine.fuessl@view-salzburg.at
519	1	hcB1egK3bexxM3IcS4n4lg_Dd27r6VTUy2roOMWav5nNQ-kAbT_v0	michael.steingassner@view-salzburg.at
446	3	WgMEni3d_GKdtlfQ9WTk0eHCcfYgPOiZE2jdt8M22X0Hp_PWzbDIw	conny_robl@yahoo.de
602	2	V0ObcglxthAu7Za0JY0MmdwnA1523DaR8yVIUNsdd2_nMfHCIagBQ	sabine.zoepfl@gmx.at
574	2	y4BB3bPNeaw0MMohoK2Soj8ndduAV2DEvn7dAHauC3DfrJnR1-bfU	ulrike.wenzlhuemer@view-salzburg.at
253	1	cwAOMlVjZrCioaZcjBpxfmuL7lPi6DUbVBTQR4P3djk_DukBP9mb4	albert.kiefel@view-salzburg.at
345	1	_esXsNElb3-HzlZ5Im9vmHz0mplLWCMQRQvUtyJGB6CPqHocEkrXI	doina.moldovan@view-salzburg.at
\.


--
-- TOC entry 3263 (class 0 OID 420677)
-- Dependencies: 215
-- Data for Name: relorgcat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relorgcat (organisation_id, category_id) FROM stdin;
\.


--
-- TOC entry 3259 (class 0 OID 420655)
-- Dependencies: 209
-- Data for Name: relorgtype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relorgtype (type_id, organisation_id) FROM stdin;
5	11
6	248
5	18
5	20
5	25
5	31
6	250
5	58
6	132
7	114
5	72
5	86
5	251
6	62
5	252
5	116
5	117
5	130
5	136
5	139
5	140
5	152
5	156
5	157
5	197
5	205
5	206
6	6
6	8
6	9
6	10
6	12
6	15
6	16
6	23
6	24
6	32
6	34
6	36
6	46
6	65
6	74
6	79
6	80
6	83
6	92
6	93
6	95
6	97
6	98
6	101
6	102
6	120
6	122
6	126
6	133
6	134
6	148
6	150
6	153
6	167
6	168
6	169
6	170
6	171
6	172
6	173
6	174
6	175
6	178
6	180
6	181
6	182
6	183
6	184
6	185
6	190
6	196
6	211
6	212
6	218
7	21
7	39
7	49
7	50
7	52
7	59
7	68
7	69
7	85
7	87
7	105
7	111
7	143
7	149
7	199
7	215
7	220
7	203
6	223
6	224
6	225
6	226
5	57
5	13
6	17
6	45
5	60
5	67
7	76
6	81
6	82
6	94
6	96
6	106
6	107
5	109
5	112
6	115
5	119
6	121
7	124
6	131
6	138
5	141
5	145
5	151
7	155
6	160
7	162
5	164
6	177
6	179
6	186
5	189
6	192
6	202
7	207
6	210
6	213
5	214
5	221
6	38
7	233
6	44
7	51
5	53
5	229
7	4
7	227
7	30
7	41
7	42
7	47
7	103
6	63
7	234
7	70
5	90
6	99
5	154
7	238
7	129
6	204
7	200
7	240
6	191
6	165
7	71
5	108
7	123
7	242
7	56
7	239
5	241
6	209
5	246
7	247
6	249
6	253
5	254
5	142
5	256
5	73
6	257
6	258
6	259
5	255
6	100
6	193
5	260
5	261
5	262
\.


--
-- TOC entry 3260 (class 0 OID 420658)
-- Dependencies: 210
-- Data for Name: relpersontype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relpersontype (type_id, person_id) FROM stdin;
1	27
1	140
1	208
1	209
1	228
1	529
1	591
2	13
2	47
2	50
2	70
2	86
2	117
2	130
2	143
2	179
2	250
2	279
2	287
2	300
2	340
2	355
2	373
2	379
2	384
2	439
2	442
2	444
2	463
2	474
2	480
2	485
2	487
2	488
2	489
2	500
2	515
2	559
2	572
2	577
2	583
2	599
3	17
3	27
3	37
3	38
3	51
3	53
3	75
3	80
3	81
3	85
3	94
3	97
3	101
3	107
3	112
3	114
3	135
3	136
3	140
3	141
3	158
3	167
3	177
3	205
3	208
3	209
3	215
3	216
3	225
3	226
3	228
3	229
3	235
3	242
3	258
3	262
3	267
3	268
3	270
3	272
3	292
3	297
3	305
3	307
3	315
3	332
3	343
3	348
3	350
3	351
3	352
3	353
3	356
3	358
3	368
3	375
3	379
3	389
3	399
3	402
3	405
3	418
3	424
3	425
3	426
3	435
3	453
3	454
3	478
3	490
3	497
3	498
3	506
3	525
3	526
3	529
3	531
3	541
3	552
3	557
3	563
3	567
3	573
3	575
3	582
3	598
4	12
4	15
4	20
4	25
4	30
4	33
4	35
4	40
4	48
4	60
4	61
4	63
4	67
4	68
4	73
4	74
4	76
4	79
4	83
4	90
4	91
4	92
4	104
4	105
4	106
4	113
4	115
4	118
4	123
4	124
4	127
4	129
4	142
4	146
4	152
4	153
4	155
4	157
4	161
4	162
4	166
4	173
4	175
4	176
4	178
4	182
4	183
4	186
4	188
4	190
4	192
4	193
4	200
4	201
4	202
4	203
4	204
4	212
4	218
4	234
4	237
4	241
4	247
4	251
4	256
4	259
4	261
4	264
4	265
4	266
4	275
4	278
4	280
4	283
4	288
4	291
4	293
4	299
4	302
4	314
4	318
4	324
4	328
4	329
4	331
4	341
4	342
4	361
4	365
4	374
4	378
4	382
4	385
4	392
4	396
4	404
4	406
4	408
4	411
4	412
4	422
4	423
4	428
4	431
4	433
4	434
4	437
4	440
4	449
4	455
4	459
4	460
4	461
4	465
4	472
4	475
4	476
4	477
4	482
4	483
4	484
4	486
4	494
4	496
4	504
4	508
4	509
4	511
4	512
4	513
4	520
4	521
4	528
4	544
4	550
4	551
4	553
4	556
4	560
4	561
4	565
4	566
4	571
4	576
4	579
4	581
4	584
4	586
4	590
4	592
4	593
4	596
4	597
4	600
4	601
4	603
3	248
3	232
3	185
1	185
4	523
4	543
4	371
4	168
2	612
4	320
1	22
2	69
4	95
4	134
3	145
3	180
3	184
4	196
4	198
4	220
4	224
3	269
2	333
2	347
4	337
3	359
3	363
4	372
4	377
3	415
3	432
2	481
3	502
4	517
4	547
4	580
2	621
4	622
4	623
4	631
4	632
4	634
4	635
4	636
4	28
3	587
4	640
2	233
4	641
4	527
4	549
1	546
1	642
3	100
1	100
1	238
3	238
1	616
3	616
4	645
4	646
4	55
3	445
1	445
3	165
3	148
3	310
3	147
3	651
3	505
3	564
3	652
3	221
3	120
3	121
4	615
4	397
3	430
1	430
4	93
3	246
3	18
1	18
3	468
1	441
3	441
3	44
1	44
3	149
1	149
1	252
3	252
3	386
3	649
4	88
3	655
1	656
1	519
3	519
3	657
4	42
4	522
3	446
1	446
3	330
4	14
3	661
3	558
3	643
1	602
3	602
3	647
3	36
1	574
3	574
3	34
1	34
3	253
1	253
1	345
3	345
1	644
1	665
\.


--
-- TOC entry 3264 (class 0 OID 420680)
-- Dependencies: 216
-- Data for Name: reporting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporting (report_id, date, description, report_file) FROM stdin;
\.


--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 217
-- Name: reporting_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('reporting_report_id_seq', 1, false);


--
-- TOC entry 3266 (class 0 OID 420688)
-- Dependencies: 218
-- Data for Name: telephone; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telephone (telephone_id, person_id, type_id, telephone) FROM stdin;
3	12	11	0662 8072-0
482	28	10	06245/82488
7	19	11	0662/856777-22
483	28	10	0664/73621374
539	165	10	0650/8230081
11	25	11	0662 8072-0
12	27	10	0662/822360
13	27	10	0664/4728421
540	165	10	0662/823008
485	587	11	0699/10030007
16	29	11	0662/882883-0
17	30	11	07748/68767
18	31	11	0662/880402
19	32	11	0662/851377
20	32	11	0664/1813895
22	41	11	05/01451813
23	43	11	0662/850876-0
484	587	11	06245/81700
26	46	11	0662/849373-212
27	47	10	0650/5566335
28	50	11	0662/80474024
29	54	11	0662/661046
30	57	11	0662/853290-13
31	58	11	0662/2455-0
32	58	11	0664/2615574
34	62	11	06245/70719
35	62	11	0699/17071914
36	64	11	0662/4661-0
37	65	11	0049/8681/404-0
38	66	11	06245/84252-13
486	637	11	05/90900-4510
40	71	11	0662/870211-10
41	71	11	0662/870211-12
42	72	11	0662/4478-232
43	78	11	06212/2312-15
44	79	11	0662/853000-0
45	82	11	0662/821829-0
46	84	11	0662/876681
47	87	11	06215/8021-12
49	96	11	0223/6600-2940
50	99	11	0662/459606-0
53	102	11	06246/72780-42
54	103	11	06274/8116
55	104	10	0650/8842432
56	104	10	0662/8047-8064-10
57	109	11	0662/8387
58	110	11	06227/2231-17
59	111	11	06219/8302
60	111	11	0650/4324881
61	112	11	0662/625007
62	112	11	0664/3454489
63	117	10	0676/7205881
487	638	11	06245/87286-0
67	124	11	0662 8072-0
68	126	11	0699/147300-32
69	127	11	0662/8042-2190
70	128	11	0662/432109
71	129	11	0662/8072-0
72	132	11	06229/2777-13
73	133	11	0662/2455-0
74	137	11	0049/8681/404-135
75	138	11	06245/80826
76	139	11	06215/7314
77	140	10	0662/643381
78	140	10	0664/1313134
79	143	11	06412/6355
80	144	11	0662/66999-16
84	150	11	0662/841079
85	151	11	0662/434702
86	154	11	0662/627984
87	154	11	0676/87466619
88	156	11	0662/823274
89	156	11	0664/8394734
90	157	10	0660/7648802
91	163	11	0049/172/8840805
92	163	11	0049/8651/4578
93	164	11	06223/3211-11
96	166	10	06245/21238
97	167	11	0662/434702
488	638	10	0664/6213464
100	170	11	0662/439728
101	171	11	0662/853290-13
102	172	11	06215/8850
103	174	11	06229/3483-0
104	179	10	0676-5927150
105	181	11	0676/88144653
106	183	11	05/7686-261900
110	189	11	0650/8888752
111	191	11	0049/157/82648889
112	195	11	06212/2312-10
113	194	11	06227/2261-14
114	197	11	06589/4216-33
115	199	11	06216/40092
116	199	11	0664/4829921
117	200	10	0676/83220449
118	202	10	0650/5123650
489	639	10	0664/88613469
490	639	11	0662/841079 
121	208	10	0650/7339596
122	209	10	0699/11780107
123	210	11	0662/451180-117
124	211	11	0662/8047-8064-10
125	211	11	0664/1229052
126	213	11	07766/2180
127	214	11	0662/820332-8003
128	214	11	0676/87466581
129	217	11	0662/8886-1540
130	218	11	0662 8072-0
131	219	11	0049/88654/6605-170
132	222	11	0662/849373-212
133	223	11	0662/890916-14
134	227	11	06225/8219-11
136	228	10	0662/628670
137	228	10	0664/3217283
138	230	11	06244/5201-41
141	234	11	0662 8072-0
142	235	10	06468/5386
143	235	10	0664/1110045
146	239	11	0662/8388
147	240	11	06274/425 62
491	640	11	0662/8072-2015 
492	233	11	0662/8047-2020
494	6	11	0662/843629
493	6	11	0664/3951550
495	641	10	0664/6185500
148	240	11	0676/89692600
149	245	11	06225/3281
152	251	11	0676/83878-0
157	255	11	0662/650436-504
158	255	11	0699/11152910
159	257	11	0664/4033008
160	260	11	06245/80427-0
161	261	10	06272/7957
162	261	10	0680/20131191
163	262	11	0664/4532596
164	263	11	0662/642723-16
165	264	10	0664/6402062
167	271	11	06223/2223
168	271	11	0664/2542454
169	273	11	0662/434702
170	274	11	0041/44 808 49 56
173	277	11	06245/80261
174	281	11	0662/854381-1841
175	282	11	0662/8388-9350
176	285	11	06245/70719
177	285	11	0699-17071941
178	286	11	0676/848210-338
180	290	11	0662/4487-154
181	291	11	050330-73713
182	291	11	050330-73713
183	294	11	0664/4421225
184	293	11	0662/626858
185	293	11	0664/2042928
186	296	10	0662/441364
187	296	10	0676/87466569
188	298	11	0662/2455-0
189	301	11	06229/20493
190	303	11	0662/852300-600
191	304	11	06229/3483-0
192	306	11	06245/74379
193	306	11	0664/5464291
194	309	11	0662/88288306
195	311	11	0662/660505-19
196	313	11	0662/870211-10
197	313	11	0662/870211-12
198	316	11	0662/621253-0
199	317	11	0662/880013
201	321	11	07612/76577-166
202	323	11	0662/661172
203	325	11	0662/661046
204	326	11	0662/650436-503
205	326	11	0699/11152909
210	335	11	06216/20333
211	334	11	0662/436383-14
212	336	11	50/800-81551
214	338	11	0662/841079
215	339	11	0662/876681
216	343	10	0662/661957
217	344	11	0664/1029771
220	349	11	06245/90400-915
221	354	11	06245/90400-0
222	355	10	0662/832372
223	357	11	0049/157/77846877
224	357	11	0049/861/9898215
225	360	11	06227/2231-12
226	362	11	0662/834596
227	364	11	0662/823274
228	364	11	0664-1361920
229	365	10	0664/3307029
230	366	11	0662/820984-47
231	369	11	06245/83124
234	373	10	0699/11336666
235	374	10	050/2211-1209
236	376	11	06245/84252-17
237	378	11	0662/8072-0
238	379	10	0664/8565665
239	384	10	0676/82 60 9729
240	385	10	0660/1621866
241	387	11	0662/661046
242	388	11	0662/435541-220
243	390	11	06212/29600-30
244	391	11	06229/39678
245	391	11	0664/1257840
246	392	11	0662/452585
247	393	11	0662/432354-26
248	393	11	0664/4154764
249	394	11	0049/8651/9829-210
250	395	11	0049/8666/1408
251	398	11	08651/7004-1705
252	401	11	06246/8911-0
253	400	11	06245/90400-0
254	406	11	0662/8072-0
255	407	11	0662/636766
256	408	10	0664/2437181
257	409	11	07674/616-727
258	410	11	06272/4359-85
259	410	11	06274/40308
260	410	11	0664/4544191
261	411	11	0662/46946-0
262	412	10	0699/12258012
263	413	11	0662/434702
264	414	11	0662/620135
265	416	11	0662/434702
266	417	11	0662/876681
267	419	11	0662/870211-11
268	422	10	0664/4502247
269	427	11	0662/66 9 11-114
270	429	11	0664/2767951
271	429	11	0676/9551966
274	436	11	05/06021-9205
275	436	11	0664/ 6021-9600
276	438	11	0662/432901-153
277	438	11	0676/87466603
278	440	10	0664/4339166
281	443	11	06227/2261-14
282	444	10	06216/5212-13
283	444	10	0699/10099753
287	447	11	06246/8911-0
288	448	11	0662/468-2260 
289	450	11	06229/3483-0
290	452	11	06247-8543
291	451	11	0662/432171
292	455	11	0662 8072-0
293	458	11	0662/889123600
294	458	11	0664/1619206
295	459	11	0664/41422771
296	459	11	07748/2229-0
297	462	11	0662/843748
298	463	11	0662/820220-551
575	93	11	0662 849373-164
576	491	11	0664/6185046
577	491	11	01/21145-3581
299	464	11	0662/838229-03
300	464	11	0664/6142074
301	466	11	06223/3211-13
302	466	11	0650/3804508
303	467	11	06216/5373-17
304	470	11	0662/908668-200
305	471	11	0664/2444757
306	472	11	0662 8072-0
307	473	11	08651/960140
308	474	11	01/3189900-320
309	479	11	0049/8651/9829-210
310	480	11	0662/80443043
311	482	11	0662 8072-0
312	483	11	0662 8072 3073
313	484	10	0664/2335463
314	487	10	0664/8466369
317	488	10	06212/2308-10
318	488	10	0676/6628007
319	492	11	06246/76562
320	493	11	0662/2455-147
321	495	11	0662/66 9 11-221
322	496	10	0662/870211
323	499	11	0662/8389
324	501	11	01/5864181
325	503	11	0662/438676-210
327	506	11	0662/8886-1540
328	507	11	01/60897839
329	508	11	0662 8072 2319
330	510	11	0662/636766-15
331	510	11	0676/88144663
332	514	11	0662/439728
333	515	10	0662/8698-14
334	515	10	0676/47 61 240
335	518	11	0662/432901-153
336	518	11	0676/87466603
340	529	10	0662/651055
341	529	10	0699/81136749
342	530	11	0662/642723-16
343	532	11	0662/4661-539
344	534	11	0662/636766
345	535	11	0662/834595
346	536	11	06215/8021-26
347	539	11	06225/8219-28
348	540	11	0662/458458-14
349	540	11	0664/4860547
350	542	11	0662/434702
351	545	11	0049/8682/7441
353	550	10	0664/3837372
354	551	10	0662/828531
355	553	10	0664/1213245
356	554	11	06215/5308
357	554	11	0681/20300-345
358	561	10	05/7083613
359	562	11	0662/435541-220
361	565	10	0664/1123361
362	568	11	0662/459606-4
363	569	11	0662/620135
364	570	11	050145-2410
366	576	11	0662 8072-0
367	578	11	06219/6097
368	578	11	0664/5607635
369	581	10	0664/3847613
370	584	10	0699/11850459
371	585	11	0662/423944
372	585	11	0664/4022985
375	589	11	0662/6382-0
376	591	10	0664/8291447
377	594	11	06229/20493
378	594	11	0664/88673808
380	596	11	0662 8072-0
549	148	10	0676/9128020
392	9	11	0662-871163
397	605	11	0220/987654321
398	605	10	0110/123456789
401	248	11	0676/89692604
400	248	11	06274/4256-5
402	606	11	0732792836
403	607	11	06648565777
404	21	11	0049/8666/7427
407	232	10	0662/833069
410	609	11	06245/90400 722
559	147	11	0664/1296575
558	147	11	0662/847898
415	119	10	0664/2281230
416	185	10	0650/2320635
560	651	10	0662/435406
418	610	11	0662/856225-0
419	611	11	0662/856225-0
502	2	11	0662/432354-26
503	2	11	0664/4154764
420	371	10	0662/643579-15
504	633	11	01/2536350 -21
421	168	11	6274/6202-20
561	505	11	0662/874016-12
422	612	11	0662/641996-406
423	613	11	0662/8387-1641
424	614	11	0662/8387-1623
562	564	11	0662/885050
425	22	10	06212/7616
426	22	10	0664/9280220
429	69	10	0650/4414560
432	224	10	0699/10476679
433	269	10	0664/2612008
434	337	10	0650/3334577
567	615	10	0650/4304443
437	372	11	06246/76795
438	432	10	0664/2612008
568	430	10	0650/7469293
442	125	11	0676/7225515
441	125	11	0662/648512
443	11	11	0664/9744340
445	16	11	0662/871400
444	16	11	0662/870737
447	618	11	0662/875685-44
449	187	11	0664/9235431
448	187	11	0662/841607-20
580	18	10	06232/4067
581	18	10	0680/1168895
582	441	10	0664/5411487
583	441	10	0662/441509
584	44	10	0650/5207421
585	44	10	0650/5207421
450	3	11	0664/9235431
451	3	11	0662/841607-20
452	45	11	0049/8652/5313
453	289	11	0049/8652/1739
454	620	10	+49/160/98917218
455	620	11	+49/7121/1494-806 
551	617	11	0662/8698-30
457	621	11	0049/221/931809-835
458	622	10	0662/459915-17
459	623	11	0662/647760-18
460	623	10	0699/19287345
462	327	11	0676/9022643
461	327	11	0662/844576 Pforte
463	624	11	050/2211-1301
464	625	11	050/2211-1322
465	626	11	0662/88912-3670
466	627	11	06245/80826-18 
586	149	10	0664/80020170
467	89	11	0662/820332-8003
590	654	10	01/9246105
468	595	11	0662/480301-0
469	629	11	0662/872266-77
589	654	10	0664/3811647
470	630	10	0650/6246204 
471	630	11	0662/872266-79
472	59	11	0662/623421
473	8	11	0662/623421
513	546	10	0664/1802118
474	632	11	0662/870571-241
476	634	11	0662/439501-10 
514	642	10	0676/4654007
477	635	11	0662/4684-82388 
478	206	11	0662/870737
479	206	11	0662/871400
516	100	10	0662/641453
515	100	10	0650/4152790
517	238	10	0676/3134610
518	238	10	0676/3134610
521	616	10	0664/5946602
522	616	10	06246/75132
527	55	10	0699/11711171
528	648	11	0662/627698
529	650	11	50/800-81551
530	650	10	0664/2566571
531	169	11	0662/849373-201
533	445	10	0662/825617
532	445	10	0680/5024202
592	252	10	0676/3252443
593	252	10	0049/8654/65801
595	656	10	0699 13353211
596	519	10	0699/12054062
597	657	10	0650/6209909
598	658	11	0662/66911-222
601	659	10	0664/80783613
602	659	11	0662/804469-11
603	660	11	06272/7601 
604	446	10	0650/5665474
607	330	11	
608	330	11	
615	14	11	06212/2494-0
617	643	10	0664/88616396
616	643	11	06246/888-2201
618	602	10	0699/10992232
619	647	10	0664/8565665
620	36	10	0664-1800081
621	36	10	0662/833754
623	319	11	06212/2254
624	574	10	0650/4330054
628	662	11	0664/8397755
629	663	11	0049/175/2975511
630	664	11	05574/694-110
631	34	10	0681/20901579
636	253	10	0699/10543869
637	253	10	0049/8651/9058741
635	253	10	0049/151/52527134
639	345	10	0662/646971
638	345	10	0680/3149482
643	644	10	0664/73663498
642	644	10	0662/824550
\.


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 219
-- Name: telephone_telephone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('telephone_telephone_id_seq', 643, true);


--
-- TOC entry 3261 (class 0 OID 420661)
-- Dependencies: 211
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY type (type_id, name) FROM stdin;
2	Unterstützer
1	Mitarbeiter
4	Gast
3	Mitglied
5	Lieferant
6	Kunde
7	Sponsor
10	privat
11	geschäftlich
\.


--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 220
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('type_type_id_seq', 1, false);


--
-- TOC entry 2983 (class 2606 OID 420714)
-- Name: pk_address; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT pk_address PRIMARY KEY (address_id);


--
-- TOC entry 2988 (class 2606 OID 420716)
-- Name: pk_article; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY article
    ADD CONSTRAINT pk_article PRIMARY KEY (article_id);


--
-- TOC entry 3001 (class 2606 OID 420718)
-- Name: pk_category; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT pk_category PRIMARY KEY (category_id);


--
-- TOC entry 3004 (class 2606 OID 420720)
-- Name: pk_city; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT pk_city PRIMARY KEY (city_id);


--
-- TOC entry 3007 (class 2606 OID 420722)
-- Name: pk_country; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT pk_country PRIMARY KEY (country_id);


--
-- TOC entry 3010 (class 2606 OID 420724)
-- Name: pk_delivery_list; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY delivery_list
    ADD CONSTRAINT pk_delivery_list PRIMARY KEY (delivery_list_id);


--
-- TOC entry 3014 (class 2606 OID 420726)
-- Name: pk_email; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY email
    ADD CONSTRAINT pk_email PRIMARY KEY (email_id);


--
-- TOC entry 2993 (class 2606 OID 420728)
-- Name: pk_incoming_article; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY incoming_article
    ADD CONSTRAINT pk_incoming_article PRIMARY KEY (incoming_article_id);


--
-- TOC entry 3020 (class 2606 OID 420730)
-- Name: pk_incoming_delivery; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY incoming_delivery
    ADD CONSTRAINT pk_incoming_delivery PRIMARY KEY (incoming_delivery_id);


--
-- TOC entry 3024 (class 2606 OID 420732)
-- Name: pk_logging; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logging
    ADD CONSTRAINT pk_logging PRIMARY KEY (logging_id);


--
-- TOC entry 3027 (class 2606 OID 420734)
-- Name: pk_organisation; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT pk_organisation PRIMARY KEY (organisation_id);


--
-- TOC entry 3036 (class 2606 OID 420736)
-- Name: pk_orgcontactperson; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgcontactperson
    ADD CONSTRAINT pk_orgcontactperson PRIMARY KEY (person_id, organisation_id);


--
-- TOC entry 2998 (class 2606 OID 420738)
-- Name: pk_outgoing_article; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outgoing_article
    ADD CONSTRAINT pk_outgoing_article PRIMARY KEY (outgoing_article_id);


--
-- TOC entry 3040 (class 2606 OID 420740)
-- Name: pk_outgoing_delivery; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT pk_outgoing_delivery PRIMARY KEY (outgoing_delivery_id);


--
-- TOC entry 3045 (class 2606 OID 420742)
-- Name: pk_permission; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT pk_permission PRIMARY KEY (permission_id);


--
-- TOC entry 3050 (class 2606 OID 420744)
-- Name: pk_person; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT pk_person PRIMARY KEY (person_id);


--
-- TOC entry 3067 (class 2606 OID 420746)
-- Name: pk_platformuser; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY platformuser
    ADD CONSTRAINT pk_platformuser PRIMARY KEY (person_id);


--
-- TOC entry 3071 (class 2606 OID 420748)
-- Name: pk_relorgcat; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relorgcat
    ADD CONSTRAINT pk_relorgcat PRIMARY KEY (organisation_id, category_id);


--
-- TOC entry 3054 (class 2606 OID 420750)
-- Name: pk_relorgtype; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relorgtype
    ADD CONSTRAINT pk_relorgtype PRIMARY KEY (type_id, organisation_id);


--
-- TOC entry 3059 (class 2606 OID 420752)
-- Name: pk_relpersontype; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relpersontype
    ADD CONSTRAINT pk_relpersontype PRIMARY KEY (type_id, person_id);


--
-- TOC entry 3076 (class 2606 OID 420754)
-- Name: pk_reporting; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporting
    ADD CONSTRAINT pk_reporting PRIMARY KEY (report_id);


--
-- TOC entry 3079 (class 2606 OID 420756)
-- Name: pk_telephone; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY telephone
    ADD CONSTRAINT pk_telephone PRIMARY KEY (telephone_id);


--
-- TOC entry 3064 (class 2606 OID 420758)
-- Name: pk_type; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY type
    ADD CONSTRAINT pk_type PRIMARY KEY (type_id);


--
-- TOC entry 2985 (class 2606 OID 420760)
-- Name: unique_constraint_address; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT unique_constraint_address UNIQUE (address);


--
-- TOC entry 2981 (class 1259 OID 420761)
-- Name: address_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX address_pk ON address USING btree (address_id);


--
-- TOC entry 2986 (class 1259 OID 420762)
-- Name: article_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX article_pk ON article USING btree (article_id);


--
-- TOC entry 2999 (class 1259 OID 420763)
-- Name: category_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX category_pk ON category USING btree (category_id);


--
-- TOC entry 3002 (class 1259 OID 420764)
-- Name: city_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX city_pk ON city USING btree (city_id);


--
-- TOC entry 3005 (class 1259 OID 420765)
-- Name: country_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX country_pk ON country USING btree (country_id);


--
-- TOC entry 3017 (class 1259 OID 420766)
-- Name: delivers_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX delivers_fk ON incoming_delivery USING btree (organisation_id);


--
-- TOC entry 3008 (class 1259 OID 420767)
-- Name: delivery_list_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX delivery_list_pk ON delivery_list USING btree (delivery_list_id);


--
-- TOC entry 3012 (class 1259 OID 420768)
-- Name: email_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX email_pk ON email USING btree (email_id);


--
-- TOC entry 2989 (class 1259 OID 420769)
-- Name: inarticle_indelivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX inarticle_indelivery_fk ON incoming_article USING btree (incoming_delivery_id);


--
-- TOC entry 2990 (class 1259 OID 420770)
-- Name: incoming_article_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX incoming_article_pk ON incoming_article USING btree (incoming_article_id);


--
-- TOC entry 3018 (class 1259 OID 420771)
-- Name: incoming_delivery_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX incoming_delivery_pk ON incoming_delivery USING btree (incoming_delivery_id);


--
-- TOC entry 2991 (class 1259 OID 420772)
-- Name: incomingarticle_article_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX incomingarticle_article_fk ON incoming_article USING btree (article_id);


--
-- TOC entry 3022 (class 1259 OID 420773)
-- Name: logging_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX logging_pk ON logging USING btree (logging_id);


--
-- TOC entry 3025 (class 1259 OID 420774)
-- Name: organisation_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX organisation_pk ON organisation USING btree (organisation_id);


--
-- TOC entry 3032 (class 1259 OID 420775)
-- Name: orgcontactperson2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX orgcontactperson2_fk ON orgcontactperson USING btree (organisation_id);


--
-- TOC entry 3033 (class 1259 OID 420776)
-- Name: orgcontactperson_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX orgcontactperson_fk ON orgcontactperson USING btree (person_id);


--
-- TOC entry 3034 (class 1259 OID 420777)
-- Name: orgcontactperson_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX orgcontactperson_pk ON orgcontactperson USING btree (person_id, organisation_id);


--
-- TOC entry 2994 (class 1259 OID 420778)
-- Name: outarticle_outdelivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX outarticle_outdelivery_fk ON outgoing_article USING btree (outgoing_delivery_id);


--
-- TOC entry 3037 (class 1259 OID 420779)
-- Name: outdelivery_deliverylist_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX outdelivery_deliverylist_fk ON outgoing_delivery USING btree (delivery_list_id);


--
-- TOC entry 2995 (class 1259 OID 420780)
-- Name: outgoing_article_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX outgoing_article_pk ON outgoing_article USING btree (outgoing_article_id);


--
-- TOC entry 3038 (class 1259 OID 420781)
-- Name: outgoing_delivery_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX outgoing_delivery_pk ON outgoing_delivery USING btree (outgoing_delivery_id);


--
-- TOC entry 2996 (class 1259 OID 420782)
-- Name: outgoingarticle_article_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX outgoingarticle_article_fk ON outgoing_article USING btree (article_id);


--
-- TOC entry 3043 (class 1259 OID 420783)
-- Name: permission_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX permission_pk ON permission USING btree (permission_id);


--
-- TOC entry 3046 (class 1259 OID 420784)
-- Name: person_city_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX person_city_fk ON person USING btree (city_id);


--
-- TOC entry 3047 (class 1259 OID 420785)
-- Name: person_country_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX person_country_fk ON person USING btree (country_id);


--
-- TOC entry 3048 (class 1259 OID 420786)
-- Name: person_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX person_pk ON person USING btree (person_id);


--
-- TOC entry 3068 (class 1259 OID 420787)
-- Name: platformuser_permission_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX platformuser_permission_fk ON platformuser USING btree (permission_id);


--
-- TOC entry 3069 (class 1259 OID 420788)
-- Name: platformuser_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX platformuser_pk ON platformuser USING btree (person_id);


--
-- TOC entry 3041 (class 1259 OID 420789)
-- Name: receives_delivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX receives_delivery_fk ON outgoing_delivery USING btree (organisation_id);


--
-- TOC entry 3015 (class 1259 OID 420790)
-- Name: relemailtype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relemailtype_fk ON email USING btree (type_id);


--
-- TOC entry 3028 (class 1259 OID 420791)
-- Name: relorgaddress_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgaddress_fk ON organisation USING btree (address_id);


--
-- TOC entry 3072 (class 1259 OID 420792)
-- Name: relorgcat2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcat2_fk ON relorgcat USING btree (category_id);


--
-- TOC entry 3073 (class 1259 OID 420793)
-- Name: relorgcat_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcat_fk ON relorgcat USING btree (organisation_id);


--
-- TOC entry 3074 (class 1259 OID 420794)
-- Name: relorgcat_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX relorgcat_pk ON relorgcat USING btree (organisation_id, category_id);


--
-- TOC entry 3029 (class 1259 OID 420795)
-- Name: relorgcity_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcity_fk ON organisation USING btree (city_id);


--
-- TOC entry 3030 (class 1259 OID 420796)
-- Name: relorgcountry_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcountry_fk ON organisation USING btree (country_id);


--
-- TOC entry 3055 (class 1259 OID 420797)
-- Name: relorgtype2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgtype2_fk ON relorgtype USING btree (organisation_id);


--
-- TOC entry 3056 (class 1259 OID 420798)
-- Name: relorgtype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgtype_fk ON relorgtype USING btree (type_id);


--
-- TOC entry 3057 (class 1259 OID 420799)
-- Name: relorgtype_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX relorgtype_pk ON relorgtype USING btree (type_id, organisation_id);


--
-- TOC entry 3051 (class 1259 OID 420800)
-- Name: relpersonaddress_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersonaddress_fk ON person USING btree (address_id);


--
-- TOC entry 3016 (class 1259 OID 420801)
-- Name: relpersonemail_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersonemail_fk ON email USING btree (person_id);


--
-- TOC entry 3080 (class 1259 OID 420802)
-- Name: relpersontelephone_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersontelephone_fk ON telephone USING btree (person_id);


--
-- TOC entry 3060 (class 1259 OID 420803)
-- Name: relpersontype2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersontype2_fk ON relpersontype USING btree (person_id);


--
-- TOC entry 3061 (class 1259 OID 420804)
-- Name: relpersontype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersontype_fk ON relpersontype USING btree (type_id);


--
-- TOC entry 3062 (class 1259 OID 420805)
-- Name: relpersontype_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX relpersontype_pk ON relpersontype USING btree (type_id, person_id);


--
-- TOC entry 3052 (class 1259 OID 420806)
-- Name: relpersonupdateperson_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersonupdateperson_fk ON person USING btree (per_person_id);


--
-- TOC entry 3081 (class 1259 OID 420807)
-- Name: reltelephonetype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX reltelephonetype_fk ON telephone USING btree (type_id);


--
-- TOC entry 3077 (class 1259 OID 420808)
-- Name: reporting_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX reporting_pk ON reporting USING btree (report_id);


--
-- TOC entry 3082 (class 1259 OID 420809)
-- Name: telephone_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX telephone_pk ON telephone USING btree (telephone_id);


--
-- TOC entry 3065 (class 1259 OID 420810)
-- Name: type_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX type_pk ON type USING btree (type_id);


--
-- TOC entry 3031 (class 1259 OID 420811)
-- Name: updated_organisation_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updated_organisation_fk ON organisation USING btree (person_id);


--
-- TOC entry 3011 (class 1259 OID 420812)
-- Name: updates_deliverylist_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updates_deliverylist_fk ON delivery_list USING btree (person_id);


--
-- TOC entry 3021 (class 1259 OID 420813)
-- Name: updates_incoming_delivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updates_incoming_delivery_fk ON incoming_delivery USING btree (person_id);


--
-- TOC entry 3042 (class 1259 OID 420814)
-- Name: updatesoutgoingdelivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updatesoutgoingdelivery_fk ON outgoing_delivery USING btree (person_id);


--
-- TOC entry 3087 (class 2606 OID 420815)
-- Name: fk_delivery_updates_d_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_list
    ADD CONSTRAINT fk_delivery_updates_d_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3088 (class 2606 OID 420820)
-- Name: fk_email_relemailt_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY email
    ADD CONSTRAINT fk_email_relemailt_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3089 (class 2606 OID 420826)
-- Name: fk_email_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY email
    ADD CONSTRAINT fk_email_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3091 (class 2606 OID 420831)
-- Name: fk_incoming_delivers_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_delivery
    ADD CONSTRAINT fk_incoming_delivers_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3083 (class 2606 OID 420836)
-- Name: fk_incoming_inarticle_incoming; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_article
    ADD CONSTRAINT fk_incoming_inarticle_incoming FOREIGN KEY (incoming_delivery_id) REFERENCES incoming_delivery(incoming_delivery_id) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3084 (class 2606 OID 420841)
-- Name: fk_incoming_incominga_article; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_article
    ADD CONSTRAINT fk_incoming_incominga_article FOREIGN KEY (article_id) REFERENCES article(article_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3090 (class 2606 OID 420846)
-- Name: fk_incoming_updates_i_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_delivery
    ADD CONSTRAINT fk_incoming_updates_i_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3092 (class 2606 OID 420851)
-- Name: fk_organisa_relorgadd_address; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_relorgadd_address FOREIGN KEY (address_id) REFERENCES address(address_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3093 (class 2606 OID 420856)
-- Name: fk_organisa_relorgcit_city; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_relorgcit_city FOREIGN KEY (city_id) REFERENCES city(city_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3094 (class 2606 OID 420861)
-- Name: fk_organisa_relorgcou_country; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_relorgcou_country FOREIGN KEY (country_id) REFERENCES country(country_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3095 (class 2606 OID 420866)
-- Name: fk_organisa_updated_o_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_updated_o_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3096 (class 2606 OID 420871)
-- Name: fk_orgconta_orgcontac_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgcontactperson
    ADD CONSTRAINT fk_orgconta_orgcontac_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3097 (class 2606 OID 420876)
-- Name: fk_orgconta_orgcontac_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgcontactperson
    ADD CONSTRAINT fk_orgconta_orgcontac_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3085 (class 2606 OID 420882)
-- Name: fk_outgoing_outarticl_outgoing; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_article
    ADD CONSTRAINT fk_outgoing_outarticl_outgoing FOREIGN KEY (outgoing_delivery_id) REFERENCES outgoing_delivery(outgoing_delivery_id) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3098 (class 2606 OID 420889)
-- Name: fk_outgoing_outdelive_delivery; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT fk_outgoing_outdelive_delivery FOREIGN KEY (delivery_list_id) REFERENCES delivery_list(delivery_list_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3086 (class 2606 OID 420894)
-- Name: fk_outgoing_outgoinga_article; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_article
    ADD CONSTRAINT fk_outgoing_outgoinga_article FOREIGN KEY (article_id) REFERENCES article(article_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3099 (class 2606 OID 420899)
-- Name: fk_outgoing_receives__organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT fk_outgoing_receives__organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3100 (class 2606 OID 420904)
-- Name: fk_outgoing_updatesou_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT fk_outgoing_updatesou_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3101 (class 2606 OID 420909)
-- Name: fk_person_person_ci_city; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_person_ci_city FOREIGN KEY (city_id) REFERENCES city(city_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3102 (class 2606 OID 420914)
-- Name: fk_person_person_co_country; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_person_co_country FOREIGN KEY (country_id) REFERENCES country(country_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3103 (class 2606 OID 420919)
-- Name: fk_person_relperson_address; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_relperson_address FOREIGN KEY (address_id) REFERENCES address(address_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3104 (class 2606 OID 420924)
-- Name: fk_person_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_relperson_person FOREIGN KEY (per_person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3109 (class 2606 OID 420929)
-- Name: fk_platform_platformu_permissi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platformuser
    ADD CONSTRAINT fk_platform_platformu_permissi FOREIGN KEY (permission_id) REFERENCES permission(permission_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3110 (class 2606 OID 420934)
-- Name: fk_platform_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platformuser
    ADD CONSTRAINT fk_platform_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3111 (class 2606 OID 420939)
-- Name: fk_relorgca_relorgcat_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgcat
    ADD CONSTRAINT fk_relorgca_relorgcat_category FOREIGN KEY (category_id) REFERENCES category(category_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3112 (class 2606 OID 420944)
-- Name: fk_relorgca_relorgcat_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgcat
    ADD CONSTRAINT fk_relorgca_relorgcat_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3105 (class 2606 OID 420949)
-- Name: fk_relorgty_relorgtyp_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgtype
    ADD CONSTRAINT fk_relorgty_relorgtyp_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3106 (class 2606 OID 420954)
-- Name: fk_relorgty_relorgtyp_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgtype
    ADD CONSTRAINT fk_relorgty_relorgtyp_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3107 (class 2606 OID 420959)
-- Name: fk_relperso_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relpersontype
    ADD CONSTRAINT fk_relperso_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3108 (class 2606 OID 420964)
-- Name: fk_relperso_relperson_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relpersontype
    ADD CONSTRAINT fk_relperso_relperson_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3113 (class 2606 OID 420969)
-- Name: fk_telephon_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telephone
    ADD CONSTRAINT fk_telephon_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 3114 (class 2606 OID 420974)
-- Name: fk_telephon_relteleph_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telephone
    ADD CONSTRAINT fk_telephon_relteleph_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2016-02-19 10:52:06

--
-- PostgreSQL database dump complete
--

