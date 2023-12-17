--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.8
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-06-16 18:13:14

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
-- TOC entry 188 (class 1259 OID 241584)
-- Name: address; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address (
    address_id integer NOT NULL,
    address character varying(100) NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 241587)
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4490 (class 0 OID 0)
-- Dependencies: 189
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE address_address_id_seq OWNED BY address.address_id;


--
-- TOC entry 190 (class 1259 OID 241589)
-- Name: article; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE article (
    article_id integer NOT NULL,
    description character varying(1024) NOT NULL,
    packaging_unit character varying(100) NOT NULL,
    weightpu double precision NOT NULL,
    mdd date NOT NULL,
    pricepu numeric(15,2) NOT NULL
);


--
-- TOC entry 191 (class 1259 OID 241595)
-- Name: article_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE article_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4491 (class 0 OID 0)
-- Dependencies: 191
-- Name: article_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE article_article_id_seq OWNED BY article.article_id;


--
-- TOC entry 192 (class 1259 OID 241597)
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
-- TOC entry 193 (class 1259 OID 241600)
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
-- TOC entry 194 (class 1259 OID 241603)
-- Name: totalnumberpuofallincomingarticles; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW totalnumberpuofallincomingarticles AS
 SELECT incoming_article.article_id,
    sum(incoming_article.numberpu) AS totalnumberofpus
   FROM incoming_article
  GROUP BY incoming_article.article_id;


--
-- TOC entry 195 (class 1259 OID 241607)
-- Name: totalnumberpuofalloutgoingarticles; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW totalnumberpuofalloutgoingarticles AS
 SELECT outgoing_article.article_id,
    sum(outgoing_article.numberpu) AS totalnumberofpus
   FROM outgoing_article
  GROUP BY outgoing_article.article_id;


--
-- TOC entry 196 (class 1259 OID 241611)
-- Name: availarticleindepot; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW availarticleindepot AS
 SELECT article_id,
    (COALESCE(inarticle.totalnumberofpus, (0)::bigint) - COALESCE(outarticle.totalnumberofpus, (0)::bigint)) AS availnumberofpus
   FROM (totalnumberpuofallincomingarticles inarticle
     FULL JOIN totalnumberpuofalloutgoingarticles outarticle USING (article_id));


--
-- TOC entry 197 (class 1259 OID 241615)
-- Name: category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE category (
    category_id integer NOT NULL,
    category character varying(100) NOT NULL,
    description character varying(1024)
);


--
-- TOC entry 198 (class 1259 OID 241621)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4492 (class 0 OID 0)
-- Dependencies: 198
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE category_category_id_seq OWNED BY category.category_id;


--
-- TOC entry 199 (class 1259 OID 241623)
-- Name: city; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE city (
    city_id integer NOT NULL,
    zip character varying(5) NOT NULL,
    city character varying(100) NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 241626)
-- Name: city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4493 (class 0 OID 0)
-- Dependencies: 200
-- Name: city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE city_city_id_seq OWNED BY city.city_id;


--
-- TOC entry 201 (class 1259 OID 241628)
-- Name: country; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE country (
    country_id integer NOT NULL,
    country character varying(50) NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 241631)
-- Name: country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4494 (class 0 OID 0)
-- Dependencies: 202
-- Name: country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE country_country_id_seq OWNED BY country.country_id;


--
-- TOC entry 203 (class 1259 OID 241633)
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
-- TOC entry 204 (class 1259 OID 241641)
-- Name: delivery_list_delivery_list_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE delivery_list_delivery_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4495 (class 0 OID 0)
-- Dependencies: 204
-- Name: delivery_list_delivery_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE delivery_list_delivery_list_id_seq OWNED BY delivery_list.delivery_list_id;


--
-- TOC entry 205 (class 1259 OID 241643)
-- Name: email; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE email (
    email_id integer NOT NULL,
    person_id integer,
    type_id integer NOT NULL,
    email character varying(50) NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 241646)
-- Name: email_email_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE email_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4496 (class 0 OID 0)
-- Dependencies: 206
-- Name: email_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE email_email_id_seq OWNED BY email.email_id;


--
-- TOC entry 210 (class 1259 OID 241662)
-- Name: incoming_article_incoming_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE incoming_article_incoming_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4497 (class 0 OID 0)
-- Dependencies: 210
-- Name: incoming_article_incoming_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE incoming_article_incoming_article_id_seq OWNED BY incoming_article.incoming_article_id;


--
-- TOC entry 211 (class 1259 OID 241664)
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
-- TOC entry 212 (class 1259 OID 241672)
-- Name: incoming_delivery_incoming_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE incoming_delivery_incoming_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4498 (class 0 OID 0)
-- Dependencies: 212
-- Name: incoming_delivery_incoming_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE incoming_delivery_incoming_delivery_id_seq OWNED BY incoming_delivery.incoming_delivery_id;


--
-- TOC entry 213 (class 1259 OID 241675)
-- Name: logging; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE logging (
    logging_id integer NOT NULL,
    loggingtext character varying(1000) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    person_id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 241681)
-- Name: logging_logging_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE logging_logging_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4499 (class 0 OID 0)
-- Dependencies: 214
-- Name: logging_logging_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE logging_logging_id_seq OWNED BY logging.logging_id;


--
-- TOC entry 215 (class 1259 OID 241683)
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
-- TOC entry 216 (class 1259 OID 241691)
-- Name: organisation_organisation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organisation_organisation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4500 (class 0 OID 0)
-- Dependencies: 216
-- Name: organisation_organisation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organisation_organisation_id_seq OWNED BY organisation.organisation_id;


--
-- TOC entry 217 (class 1259 OID 241693)
-- Name: orgcontactperson; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE orgcontactperson (
    person_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 241696)
-- Name: outgoing_article_outgoing_article_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outgoing_article_outgoing_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4501 (class 0 OID 0)
-- Dependencies: 218
-- Name: outgoing_article_outgoing_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE outgoing_article_outgoing_article_id_seq OWNED BY outgoing_article.outgoing_article_id;


--
-- TOC entry 219 (class 1259 OID 241698)
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
-- TOC entry 220 (class 1259 OID 241706)
-- Name: outgoing_delivery_outgoing_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE outgoing_delivery_outgoing_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4502 (class 0 OID 0)
-- Dependencies: 220
-- Name: outgoing_delivery_outgoing_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE outgoing_delivery_outgoing_delivery_id_seq OWNED BY outgoing_delivery.outgoing_delivery_id;


--
-- TOC entry 221 (class 1259 OID 241708)
-- Name: permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permission (
    permission_id integer NOT NULL,
    description character varying(1024),
    permission character varying(20) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 241714)
-- Name: permission_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permission_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4503 (class 0 OID 0)
-- Dependencies: 222
-- Name: permission_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE permission_permission_id_seq OWNED BY permission.permission_id;


--
-- TOC entry 207 (class 1259 OID 241648)
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
-- TOC entry 223 (class 1259 OID 241716)
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4504 (class 0 OID 0)
-- Dependencies: 223
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE person_person_id_seq OWNED BY person.person_id;


--
-- TOC entry 224 (class 1259 OID 241718)
-- Name: relorgtype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relorgtype (
    type_id integer NOT NULL,
    organisation_id integer NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 241656)
-- Name: relpersontype; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relpersontype (
    type_id integer NOT NULL,
    person_id integer NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 241659)
-- Name: type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE type (
    type_id integer NOT NULL,
    name character varying(100) NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 241721)
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
-- TOC entry 226 (class 1259 OID 241726)
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
-- TOC entry 227 (class 1259 OID 241731)
-- Name: platformuser; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE platformuser (
    person_id integer NOT NULL,
    permission_id integer NOT NULL,
    password character varying(200) NOT NULL,
    login_email character varying(50) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 241734)
-- Name: relorgcat; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relorgcat (
    organisation_id integer NOT NULL,
    category_id integer NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 241737)
-- Name: reporting; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reporting (
    report_id integer NOT NULL,
    date date NOT NULL,
    description character varying(1024),
    report_file character(1)
);


--
-- TOC entry 230 (class 1259 OID 241743)
-- Name: reporting_report_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reporting_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4505 (class 0 OID 0)
-- Dependencies: 230
-- Name: reporting_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reporting_report_id_seq OWNED BY reporting.report_id;


--
-- TOC entry 231 (class 1259 OID 241745)
-- Name: telephone; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE telephone (
    telephone_id integer NOT NULL,
    person_id integer,
    type_id integer NOT NULL,
    telephone character varying(20) NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 241748)
-- Name: telephone_telephone_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE telephone_telephone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4506 (class 0 OID 0)
-- Dependencies: 232
-- Name: telephone_telephone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE telephone_telephone_id_seq OWNED BY telephone.telephone_id;


--
-- TOC entry 233 (class 1259 OID 241750)
-- Name: type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4507 (class 0 OID 0)
-- Dependencies: 233
-- Name: type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE type_type_id_seq OWNED BY type.type_id;


--
-- TOC entry 4163 (class 2604 OID 241752)
-- Name: address_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY address ALTER COLUMN address_id SET DEFAULT nextval('address_address_id_seq'::regclass);


--
-- TOC entry 4164 (class 2604 OID 241753)
-- Name: article_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY article ALTER COLUMN article_id SET DEFAULT nextval('article_article_id_seq'::regclass);


--
-- TOC entry 4167 (class 2604 OID 241754)
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY category ALTER COLUMN category_id SET DEFAULT nextval('category_category_id_seq'::regclass);


--
-- TOC entry 4168 (class 2604 OID 241755)
-- Name: city_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY city ALTER COLUMN city_id SET DEFAULT nextval('city_city_id_seq'::regclass);


--
-- TOC entry 4169 (class 2604 OID 241756)
-- Name: country_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY country ALTER COLUMN country_id SET DEFAULT nextval('country_country_id_seq'::regclass);


--
-- TOC entry 4172 (class 2604 OID 241757)
-- Name: delivery_list_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_list ALTER COLUMN delivery_list_id SET DEFAULT nextval('delivery_list_delivery_list_id_seq'::regclass);


--
-- TOC entry 4173 (class 2604 OID 241758)
-- Name: email_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY email ALTER COLUMN email_id SET DEFAULT nextval('email_email_id_seq'::regclass);


--
-- TOC entry 4165 (class 2604 OID 241759)
-- Name: incoming_article_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_article ALTER COLUMN incoming_article_id SET DEFAULT nextval('incoming_article_incoming_article_id_seq'::regclass);


--
-- TOC entry 4180 (class 2604 OID 241760)
-- Name: incoming_delivery_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_delivery ALTER COLUMN incoming_delivery_id SET DEFAULT nextval('incoming_delivery_incoming_delivery_id_seq'::regclass);


--
-- TOC entry 4181 (class 2604 OID 241761)
-- Name: logging_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY logging ALTER COLUMN logging_id SET DEFAULT nextval('logging_logging_id_seq'::regclass);


--
-- TOC entry 4184 (class 2604 OID 241762)
-- Name: organisation_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation ALTER COLUMN organisation_id SET DEFAULT nextval('organisation_organisation_id_seq'::regclass);


--
-- TOC entry 4166 (class 2604 OID 241763)
-- Name: outgoing_article_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_article ALTER COLUMN outgoing_article_id SET DEFAULT nextval('outgoing_article_outgoing_article_id_seq'::regclass);


--
-- TOC entry 4187 (class 2604 OID 241764)
-- Name: outgoing_delivery_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery ALTER COLUMN outgoing_delivery_id SET DEFAULT nextval('outgoing_delivery_outgoing_delivery_id_seq'::regclass);


--
-- TOC entry 4188 (class 2604 OID 241765)
-- Name: permission_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission ALTER COLUMN permission_id SET DEFAULT nextval('permission_permission_id_seq'::regclass);


--
-- TOC entry 4176 (class 2604 OID 241766)
-- Name: person_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY person ALTER COLUMN person_id SET DEFAULT nextval('person_person_id_seq'::regclass);


--
-- TOC entry 4189 (class 2604 OID 241767)
-- Name: report_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reporting ALTER COLUMN report_id SET DEFAULT nextval('reporting_report_id_seq'::regclass);


--
-- TOC entry 4190 (class 2604 OID 241768)
-- Name: telephone_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY telephone ALTER COLUMN telephone_id SET DEFAULT nextval('telephone_telephone_id_seq'::regclass);


--
-- TOC entry 4177 (class 2604 OID 241769)
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY type ALTER COLUMN type_id SET DEFAULT nextval('type_type_id_seq'::regclass);


--
-- TOC entry 4445 (class 0 OID 241584)
-- Dependencies: 188
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
99	Ursulinenweg 4
101	Seitenbachweg 14
102	Dr. Richard Hartmann Straße 1
103	Am Hainbach 7
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
\.


--
-- TOC entry 4508 (class 0 OID 0)
-- Dependencies: 189
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('address_address_id_seq', 580, true);


--
-- TOC entry 4447 (class 0 OID 241589)
-- Dependencies: 190
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
25	Vintschgerl	Stk.	0.0800000000000000017	2015-05-18	0.90
219	Diverse Lebensmittel	kg	1	2015-06-11	4.00
220	Diverse Lebensmittel	kg	1	2015-06-11	4.00
\.


--
-- TOC entry 4509 (class 0 OID 0)
-- Dependencies: 191
-- Name: article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('article_article_id_seq', 220, true);


--
-- TOC entry 4451 (class 0 OID 241615)
-- Dependencies: 197
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY category (category_id, category, description) FROM stdin;
\.


--
-- TOC entry 4510 (class 0 OID 0)
-- Dependencies: 198
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('category_category_id_seq', 2, true);


--
-- TOC entry 4453 (class 0 OID 241623)
-- Dependencies: 199
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
\.


--
-- TOC entry 4511 (class 0 OID 0)
-- Dependencies: 200
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('city_city_id_seq', 123, true);


--
-- TOC entry 4455 (class 0 OID 241628)
-- Dependencies: 201
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

COPY country (country_id, country) FROM stdin;
2	Österreich
3	DEUTSCHLAND
4	SCHWEIZ
5	Test-Land
6	Österrreich
7	Deutschland
\.


--
-- TOC entry 4512 (class 0 OID 0)
-- Dependencies: 202
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('country_country_id_seq', 7, true);


--
-- TOC entry 4457 (class 0 OID 241633)
-- Dependencies: 203
-- Data for Name: delivery_list; Type: TABLE DATA; Schema: public; Owner: -
--

COPY delivery_list (delivery_list_id, person_id, name, date, comment, driver, passenger, update_timestamp, archived) FROM stdin;
\.


--
-- TOC entry 4513 (class 0 OID 0)
-- Dependencies: 204
-- Name: delivery_list_delivery_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('delivery_list_delivery_list_id_seq', 6, true);


--
-- TOC entry 4459 (class 0 OID 241643)
-- Dependencies: 205
-- Data for Name: email; Type: TABLE DATA; Schema: public; Owner: -
--

COPY email (email_id, person_id, type_id, email) FROM stdin;
495	6	11	salzburg@franziskaner.at
7	15	11	gemeinde@strasswalchen.at
8	17	10	anna.aminger@gmx.at
9	18	10	ruth.amon@gmx.at
10	19	11	info@gartechnik-anner.com
13	24	10	christian.atanassoff@gmx.at
14	27	10	h.badzong@gmx.at
496	641	11	h_oszvald@at.ibm.com
16	30	11	office@bauer-thuerridl.at
17	32	11	heimleitung@Lbsh-walserfeld.at
18	33	11	cc-salzburg@pfeiffer.at
19	34	11	wolf.baur@view-salzburg.at
20	34	10	wolfbaur@gmx.at
21	35	10	ludwig.bayer@gmx.com
23	39	11	wolfgang.bell@miele.at
24	41	11	stephan.berger@quehenberger.com
25	43	11	kueche@lfs-Klessheim.at
26	44	10	anita.bernhofer@sol.at
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
52	88	10	franz.dusch@wasi.tv
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
69	120	10	claudia.frauenschuh@hotmail.com
70	121	10	frauenschuh@hotmail.com
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
86	147	11	stiftsbaeckerei@aon.at
87	147	10	franz.grabmer@aon.at
88	148	11	marijana.grabovac@stud.sbg.ac.at
91	150	11	grasser@innovationswerkstatt.at
92	151	11	e.grasshof@salzburger.hilfswerk.at
93	153	11	gemeinde@thalgau.at
94	155	11	johann.griessner@lamprechtshausen.at
95	156	11	wh-gruberstrasse@lebenshilfe-salzburg.at
96	157	10	davidgross84@yahoo.de
97	158	11	groetzinger@evangelischeallianz.at
98	159	11	salzburg@bastians-baecker.at
99	161	10	john.grubinger@sol.at
100	165	10	irmin.gundl@aon.at
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
115	189	11	office@essen-und-leben.at
116	190	10	reiniphysio@aon.at
117	191	10	tafel.reichenhall@mail-buero.de
118	192	11	Hemetsberger@oevp-sbg.at
119	194	11	kueche@rettet-das-kind-sbg.at
120	195	11	gabriele.hemetsberger@seekirchen.at
121	193	11	gemeinde@groedig.at
123	197	11	office@anderskompetent.at
124	199	11	swh-koestendorf@sbg.at
501	345	10	moldovandoina@gmail.com
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
140	221	11	hoerl@grossglockner.at
141	223	11	bernd.hoertnagl@sfvertrieb.at
142	225	10	huberjohanna@gmx.net
143	226	10	sv-huber@sbg.at
500	345	11	doina.moldovan@view-salzburg.at
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
511	643	11	Hugo.Rohner@skidata.com
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
206	310	11	bl@lorentschitsch.at
207	311	11	office@lorentschitsch.at
208	312	11	bettina.lotterhos@wiberg.eu
209	313	11	office@verein-viele.at
210	315	11	bruno.prantl@zell-net.at
211	316	11	sh-hellbrunn@stadt-salzburg.at
212	317	11	info@wiff-essen.at
213	318	11	buergermeister@wals-siezenheim.at
214	319	11	petra.knoll@kaesehof.at
215	321	11	martin.mallinger@hipp.de
216	322	11	r.maly@panundco.com
217	323	11	office@clearwhite.com
218	324	11	e.mang@salzburg.co.at
219	326	11	Maria.Marx@neustart.at
220	330	10	elke.mayer@newsclub.at
221	330	11	wh-gruberstrasse@lebenshilfe-salzburg.at
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
272	397	10	m.pointner@espara.com
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
294	430	10	sabrina.reiter@gmx.at
295	435	10	roswitha.resch@gmx.at
296	437	11	k.resl@donauversicherung.at
297	439	11	gottfried.rettenegger@lk-salzburg.at
298	440	10	revertera@gmx.at
299	441	11	b.ricciotti@view-salzburg.at
300	441	10	beggner@yahoo.com
301	442	11	F.Riedl@Wirtschaftsbund-Sbg.at
302	443	11	kueche@rettet-das-kind-sbg.at
303	444	11	riesner@neumarkt.at
304	445	11	walter.riezinger@view-salzburg.at
305	446	10	conny_robl@yahoo.de
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
341	505	10	srjoanellasix@yahoo.de
342	506	10	maria.slowak@sbg.at
343	507	11	manuela.sokolt@unilever.com
344	508	11	heidemarie.spannlang@stadt-salzburg.at
345	510	11	bernhard.spiegel@sos-kinderdorf.at
346	514	11	exit7@caritas-salzburg.at
347	515	11	stampfer@oevp-sbg.at
351	522	10	stb@steinwenderbruno.com
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
385	564	11	wawra@adhurricane.com
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
430	253	11	albert.kiefel@view-salzburg.at
431	253	10	albert.kiefel@gmail.com
432	119	10	anna.fratt@aon.at
433	185	11	greta.hauswiesner@view-salzburg.at
434	185	10	grete.hauswiesner@hotmail.com
437	611	11	j.weisser@commend.com
438	371	11	presse@dm-drogeriemarkt.at 
508	602	10	sabine.zoepfl@gmx.at
439	168	11	gemeinde@lamprechtshausen.at
440	612	10	manuela.spiessberger@heffterhof.at
441	558	10	t.wallerstorfer@inn4you.eu
442	22	10	ilse.asen@sbg.at
443	69	10	v.canaval@aon.at
444	615	10	togi@gmx.at
517	100	10	einzinger.sbg@aon.at
445	145	10	richard.goelzner@aon.at
446	184	10	w.haslauer.priv@hotmail.com
447	196	10	mediaconsulting@a1.net
518	149	11	christa.graf@view-salzburg.at
519	149	11	christa.graf@leube.at
520	238	10	b.januschewsky@gmx.at
449	224	11	nicole.huber@punktlandung-kommunikation.com
521	238	11	baerbel.januschewsky@view-salzburg.at
450	246	10	minni.karres@yahoo.com
451	269	10	reiter.maria@a1.net
452	333	10	sabine@mayrhofer.cc
522	252	11	info@view-salzburg.at
453	347	11	mooshammer@intercargo.at
454	337	11	eva.mentl@stud.sbg.ac.at
455	359	10	michael.neureiter@salzburg.at
523	616	10	p.nussbaum@aon.at
456	363	10	niese@gmx.at
458	415	11	h.rabl@salzburgfestival.at
459	432	10	reiter.maria@a1.net
460	481	10	eduard.schoepfer@gmx.at
524	574	11	ulrike.wenzlhuemer@view-salzburg.at
461	502	11	angela.simmel@rvs.at
525	574	10	ulrike.wenzlhuemer@gmx.at
462	519	10	michael@steingassner.net
463	519	11	michael.steingassner@view-salzburg.at
464	517	10	annamaria.steiner@sol.at
467	580	11	office@absa.at
468	125	11	vfvoffice@web.de
469	11	11	hram@pokrovsbg.ru
470	617	11	bachleitner@sbg-bauernbund.at
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
526	644	10	alois.schwaiger@aon.at
527	647	11	b.pallauf@pms-law.at
528	55	10	info@so-phi
529	648	11	kurt.schiechl@lebenshilfe-salzburg.at
530	649	10	leonhard.schitter@sbg.at
531	650	11	Petra.Ummenberger@miele.at
532	169	11	fluechtlingshaus@caritas-salzburg.at
\.


--
-- TOC entry 4514 (class 0 OID 0)
-- Dependencies: 206
-- Name: email_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_email_id_seq', 532, true);


--
-- TOC entry 4449 (class 0 OID 241597)
-- Dependencies: 192
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
86	27	87	0	37
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
\.


--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 210
-- Name: incoming_article_incoming_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('incoming_article_incoming_article_id_seq', 219, true);


--
-- TOC entry 4465 (class 0 OID 241664)
-- Dependencies: 211
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
41	13	602	0	2015-02-17	WP S 15	2015-06-01	1
42	13	602	0	2015-02-03	WP S 16	2015-06-01	1
15	197	519	0	2015-01-30	WP 1	2015-05-22	1
16	197	519	0	2015-01-28	WP 2	2015-05-22	1
29	197	602	0	2015-02-09	WP S 02	2015-06-01	1
17	156	519	0	2015-01-30	WP M 02	2015-05-23	1
78	13	642	0	2015-03-03	WP L 15	2015-06-04	0
19	108	519	0	2015-01-30	WP M 04	2015-05-23	1
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
27	119	602	0	2015-02-19	WP S 05	2015-06-01	0
28	197	602	0	2015-02-27	WP S 01	2015-06-01	1
80	221	642	0	2015-03-31	WP L 17	2015-06-04	0
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
55	18	574	0	2015-01-09	WP U 04	2015-06-01	0
56	108	574	0	2015-01-09	WP U 05	2015-06-01	1
59	189	574	0	2014-12-31	Original nv	2015-06-02	0
57	206	574	0	2015-01-09	WP U 06	2015-06-02	1
58	119	574	0	2015-01-07	WP U 07	2015-06-02	1
60	13	574	0	2015-01-13	WP U 08	2015-06-02	1
61	197	574	0	2015-01-14	WP U 09	2015-06-02	1
62	13	574	0	2015-01-15	WP U 10	2015-06-02	1
63	108	574	0	2015-01-16	WP U 11	2015-06-02	1
79	13	642	0	2015-03-19	WP L 16	2015-06-04	0
81	221	642	0	2015-03-26	WP L 18	2015-06-04	0
64	13	642	0	2015-03-31	WP L 01	2015-06-04	1
65	108	642	0	2015-03-27	WP L 02	2015-06-04	1
66	13	642	0	2015-03-12	WP L 03	2015-06-04	1
67	108	642	0	2015-03-13	WP L 04	2015-06-04	1
68	197	642	0	2015-03-27	WP L 05	2015-06-04	0
69	197	642	0	2015-03-11	WP L 06	2015-06-04	1
70	157	642	0	2015-03-19	WP L 07	2015-06-04	1
71	119	642	0	2015-03-24	WP L 08	2015-06-04	0
72	18	642	0	2015-03-19	WP L 09	2015-06-04	0
73	119	642	0	2015-03-26	WP L 10	2015-06-04	0
75	206	642	0	2015-03-06	WP L 12	2015-06-04	1
77	119	642	0	2015-03-05	WP L 14	2015-06-04	0
76	18	642	0	2015-03-02	WP L 13	2015-06-04	1
74	31	642	0	2015-03-02	WP L 11	2015-06-04	1
84	241	519	0	2015-01-26	WP 4	2015-06-11	1
14	197	519	0	2015-01-23	WP M 01	2015-05-22	1
83	53	253	0	2015-01-20	WP M 09	2015-06-10	1
82	251	253	0	2015-04-07	WP A 03	2015-06-10	1
85	251	253	0	2015-04-14	WP A 04	2015-06-11	1
86	251	253	0	2015-04-09	WP A 02	2015-06-11	1
\.


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 212
-- Name: incoming_delivery_incoming_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('incoming_delivery_incoming_delivery_id_seq', 86, true);


--
-- TOC entry 4467 (class 0 OID 241675)
-- Dependencies: 213
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
556	[INFO] mschnoell@gmx.net hat sich angemeldet	2015-04-23 05:13:58.728+00	1
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
666	[INFO] Person mit der id 585 gelöscht	2015-05-14 21:08:41.306+00	345
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
748	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2015-05-17 09:38:09.076+00	253
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
950	[INFO] Warenausgang mit der id 70 gespeichert	2015-05-23 16:36:50.393+00	519
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
\.


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 214
-- Name: logging_logging_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('logging_logging_id_seq', 1557, true);


--
-- TOC entry 4469 (class 0 OID 241683)
-- Dependencies: 215
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
62	346	42	2	1	Halleiner Schwestern Franziskanerinnen		2015-02-24	1
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
66	472	42	2	1	Hilfe und Hobby		2015-04-21	1
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
113	425	42	2	1	Michael Neugebauer Edition		2015-02-24	1
116	292	49	2	1	Moderne Gartechnik Anner GmbH	Webseite Ja	2015-02-24	1
117	335	97	3	1	Molkerei-Vertrieb Piding EG		2015-02-24	1
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
172	291	42	2	1	Seniorenheim Hellbrunn		2015-02-24	1
173	286	42	2	1	Seniorenheim Itzling		2015-02-24	1
174	336	42	2	1	Seniorenheim Liefering		2015-02-24	1
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
177	506	42	2	1	Seniorenheim Taxham		2015-04-21	1
179	507	78	2	1	Seniorenwohnhaus Köstendorf		2015-04-21	1
186	508	32	2	1	Seniorenzentrum Bergheim		2015-04-21	1
188	457	62	2	1	SIG Stadt Salzburg Immobilien Gmbh		2015-04-21	1
146	240	62	2	1	Redaktion   “Salzburger Bauer”		2015-04-22	0
99	433	51	2	345	Lebenshilfe Werkstätte		2015-05-15	1
100	365	42	2	345	Lebenshilfe Wohnhaus		2015-05-15	1
154	384	104	2	345	S. SPITZ GmbH		2015-05-15	1
142	295	53	2	345	R&S GOURMET EXPRESS VertriebsGmbH	Webseite Ja	2015-05-15	1
129	371	32	2	345	Palfinger AG	Webseite Ja\nKontakt über Walter Riezinger	2015-05-15	1
165	414	31	2	345	San Helios		2015-05-15	1
235	306	42	\N	345	Kuratorium für Journalistenausbildung		2015-05-20	1
190	401	51	2	1	SOLEart  Straßwalchen		2015-02-24	1
239	497	42	\N	345	Salzburger Seniorenbund		2015-05-20	1
193	512	31	2	345	Sozialwerk Hallein	Selbstabholer	2015-05-20	1
245	568	62	\N	345	Stadt Salzburg - Magistrat 		2015-05-20	1
195	258	42	2	1	SportImPuls Verlags- & Marketing GmbH		2015-02-24	1
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
73	476	42	2	1	Innovationswerkstatt Sebastian Mettler	Fax: 0662/841079; www.innovationserkstatt.at	2015-04-21	1
94	482	54	2	1	LBS - Heim  Wals		2015-04-21	1
96	483	61	2	1	LBS - Heim Obertrum		2015-04-21	1
109	488	87	2	1	McCain foods GmbH	Festnetz: 01/7684524; Email: info.austria@mccain.com\n	2015-04-21	1
141	500	54	2	1	Quehenberger Logistics GmbH Wals	Kontakt über Anna Gross	2015-04-21	1
189	509	42	2	1	Smartfood Vertriebs GmbH		2015-04-21	1
192	511	10	2	1	SOS-Kinderdorf Seekirchen		2015-04-21	1
194	513	42	2	1	SPAR AG		2015-04-21	1
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
236	240	42	\N	345	LK Salzburg		2015-05-15	1
204	273	99	3	345	Traunsteiner Tafel		2015-05-15	1
199	379	90	2	1	Stiegl Getränke & Service GmbH & CO. KG		2015-05-15	0
200	445	90	2	345	Stieglbrauerei zu Salzburg GmbH	Webseite Ja	2015-05-15	1
240	445	90	\N	345	Stiegl Getränke & Service GmbH & Co KG		2015-05-15	1
191	287	42	2	345	SOS-Kinderdorf Clearinghouse		2015-05-15	1
\.


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 216
-- Name: organisation_organisation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('organisation_organisation_id_seq', 251, true);


--
-- TOC entry 4471 (class 0 OID 241693)
-- Dependencies: 217
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
214	62
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
443	150
194	150
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
312	214
164	221
404	187
466	221
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
93	66
321	67
612	228
338	73
150	73
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
42	194
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
364	100
156	100
330	100
632	236
636	237
409	154
617	238
122	142
524	142
495	142
427	142
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
28	193
\.


--
-- TOC entry 4450 (class 0 OID 241600)
-- Dependencies: 193
-- Data for Name: outgoing_article; Type: TABLE DATA; Schema: public; Owner: -
--

COPY outgoing_article (outgoing_article_id, outgoing_delivery_id, article_id, article_nr, numberpu) FROM stdin;
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
371	192	166	0	5
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
445	221	204	3	9
446	221	206	2	12
447	221	203	1	2
448	221	202	0	2
449	210	197	0	11
450	210	203	3	1
451	210	208	4	2
452	210	184	2	2
453	210	87	1	1
461	222	200	1	4
462	222	88	2	1
463	222	210	0	10
464	222	87	3	2
465	209	184	3	23
466	209	197	1	14
467	209	196	0	25
468	209	216	7	3
469	209	202	4	2
470	209	206	5	5
471	209	204	6	2
472	209	87	2	3
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
\.


--
-- TOC entry 4519 (class 0 OID 0)
-- Dependencies: 218
-- Name: outgoing_article_outgoing_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('outgoing_article_outgoing_article_id_seq', 486, true);


--
-- TOC entry 4473 (class 0 OID 241698)
-- Dependencies: 219
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
210	223	642	\N	0	2015-03-11		2015-06-04	1
220	153	642	\N	0	2015-03-06		2015-06-04	1
219	74	642	\N	0	2015-03-06		2015-06-04	1
221	12	642	\N	0	2015-03-06		2015-06-04	1
217	132	642	\N	0	2015-03-02		2015-06-04	1
222	83	642	\N	0	2015-03-03		2015-06-04	1
209	148	253	\N	0	2015-03-09		2015-06-10	1
226	74	519	\N	0	2015-01-27		2015-06-11	1
227	121	519	\N	0	2015-01-27		2015-06-11	1
228	210	519	\N	0	2015-01-27		2015-06-11	1
223	132	519	\N	0	2015-01-26		2015-06-11	1
224	148	519	\N	0	2015-01-26		2015-06-11	1
225	165	519	\N	0	2015-01-26		2015-06-11	1
229	12	253	\N	0	2015-04-18		2015-06-11	1
230	12	253	\N	0	2015-04-09		2015-06-11	1
231	12	253	\N	0	2015-04-07		2015-06-11	1
\.


--
-- TOC entry 4520 (class 0 OID 0)
-- Dependencies: 220
-- Name: outgoing_delivery_outgoing_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('outgoing_delivery_outgoing_delivery_id_seq', 231, true);


--
-- TOC entry 4475 (class 0 OID 241708)
-- Dependencies: 221
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (permission_id, description, permission) FROM stdin;
1		Admin
3		Read
2		ReadWrite
\.


--
-- TOC entry 4521 (class 0 OID 0)
-- Dependencies: 222
-- Name: permission_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('permission_permission_id_seq', 1, false);


--
-- TOC entry 4461 (class 0 OID 241648)
-- Dependencies: 207
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: -
--

COPY person (person_id, country_id, city_id, address_id, per_person_id, salutation, title, first_name, last_name, comment, update_timestamp, active) FROM stdin;
479	\N	\N	\N	1	Frau		Sigrid	Schöndorfer		2015-02-24	1
9	\N	\N	\N	1			Sr. Oberin			2015-02-24	1
13	\N	\N	\N	1	Frau		Gudrun	Albertsmeier		2015-02-24	1
14	\N	\N	\N	1	Frau			Albrecht		2015-02-24	1
15	2	59	125	1	Herr		Wolfgang	Allmann		2015-02-24	1
17	2	64	140	1	Frau		Anna	Aminger		2015-02-24	1
18	2	48	81	1	Frau		Ruth	Amon		2015-02-24	1
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
34	2	17	226	1	Herr		Wolf	Baur	Tätigkeit: Waren	2015-02-24	1
35	2	50	150	1	Herr		Ludwig	Bayer		2015-02-24	1
37	2	42	245	1	Frau		Lydia	Bazanella		2015-02-24	1
38	2	42	58	1	Frau		Gerlinde	Beinsteiner		2015-02-24	1
39	\N	\N	\N	1	Herr		Wolfgang	Bell		2015-02-24	1
40	2	37	111	1	Herr		Hubert	Berger		2015-02-24	1
41	\N	\N	\N	1	Herr		Stephan	Berger		2015-02-24	1
42	\N	\N	\N	1	Frau	Mag.	Nicole	Berkmann		2015-02-24	1
43	\N	\N	\N	1	Herr		Gerold	Berner	Küchenleiter	2015-02-24	1
44	2	31	221	1	Frau		Anita	Bernhofer	Tätigkeit: Waren	2015-02-24	1
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
88	2	54	141	1	Herr	Ing.	Franz	Dusch		2015-02-24	1
90	2	56	173	1	Frau		Doraja	Eberle		2015-02-24	1
91	2	41	51	1	Frau		Wally	Ebner		2015-02-24	1
92	2	42	23	1	Frau	Mag.	Barbara	Ebner		2015-02-24	1
93	\N	\N	\N	1	Frau	Mag.	Ingrid	Ebner		2015-02-24	1
94	2	52	79	1	Frau		Johanna	Ebner		2015-02-24	1
22	2	63	522	1	Frau		Ilse	Asen	Tätigkeit: Waren	2015-04-21	1
52	\N	\N	\N	1	Herr	Dipl. BBW	Konrad	Brand		2015-04-21	0
12	\N	\N	\N	1	Frau GR	Mag.	Dagmar	Aigner		2015-04-21	0
25	\N	\N	\N	1	Herr GR		Bernhard	Auinger		2015-04-21	0
69	2	44	524	1	Frau		Veronika	Canaval		2015-04-21	1
252	3	24	6	345	Frau		Doris	Kiefel	Tätigkeit: Obfrau, Disposition	2015-05-20	1
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
345	2	42	233	345	Frau		Doina	Moldovan	Tätigkeit: Öffentlichkeit	2015-02-24	1
2	\N	\N	\N	345	Schwester		Berta	 		2015-05-15	1
63	2	42	432	1	Herr		Robert	Buggler		2015-04-21	0
55	\N	48	576	345	Frau	Mag. Dr.	Brigitte 	Brandstötter		2015-05-20	1
96	\N	\N	\N	1	Herr		Wolfgang	Eckerl		2015-02-24	1
97	2	42	130	1	Frau		Ingrid	Eder		2015-02-24	1
98	\N	\N	\N	1	Frau	Dr.	Andrea	Eder-Gitschthaler		2015-02-24	1
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
120	2	7	94	1	Frau		Claudia	Frauenschuh		2015-02-24	1
121	2	7	94	1	Herr		Hermann	Frauenschuh		2015-02-24	1
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
147	\N	\N	\N	1	Herr		Franz	Grabmer		2015-02-24	1
148	2	42	77	1	Frau	Bakk.Phil.	Marijana	Grabovac	Newsletter: ja	2015-02-24	1
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
165	2	42	40	1	Herr		Irmin	Gundl		2015-02-24	1
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
149	2	56	85	345	Frau		Christa	Graf	Tätigkeit: Waren; Newsletter: ja	2015-05-20	1
169	\N	\N	\N	519	Frau		Bettina	Haberl		2015-06-11	1
191	\N	\N	\N	1	Herr		Wolfgang	Heitmeier		2015-02-24	1
192	\N	\N	\N	1	Frau		Bettina	Hemetsberger		2015-02-24	1
193	2	56	102	1	Herr Bürgermeister		Richard	Hemetsberger		2015-02-24	1
194	\N	\N	\N	1	Frau			Hemetsberger		2015-02-24	1
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
214	\N	\N	\N	1	Schwester		Rita	Höllwerth		2015-02-24	1
215	2	10	152	1	Frau		Alathea	Hölscher	Newsletter: nein	2015-02-24	1
216	2	10	152	1	Herr		Georg	Hölscher	Newsletter: nein	2015-02-24	1
217	\N	\N	\N	1	Herr	DDr.	Manfred	Holztrattner		2015-02-24	1
219	\N	\N	\N	1	Herr		Bernhard	Höppener		2015-02-24	1
221	\N	\N	\N	1	Herr Generaldirektor	Dr.	Johannes	Hörl	Newsletter: nein	2015-02-24	1
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
253	7	110	462	253	Herr	Dipl.-Ing.	Albert	Kiefel	Tätigkeit: Administration	2015-02-26	1
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
246	2	42	535	1	Frau		Minni	Karres	Newsletter: ja	2015-04-21	1
269	2	42	536	1	Herr	Dr.	Karl	Koller	Newsletter: ja	2015-04-21	1
247	2	42	206	1	Frau	Dr.	Ilse	Kartnig		2015-04-21	0
266	2	54	43	1	Frau		Ingrid	Kohl		2015-04-21	0
206	\N	\N	\N	345	Frau		Veronika	Hirnböck	gelöscht	2015-05-14	0
233	\N	\N	\N	345	Frau	Mag.	Andrea	Huttegger	Pressereferentin, Amt für Kommunikation und Öffentlichkeitsarbeit	2015-05-15	1
210	\N	\N	\N	1	Herr			Hofbauer		2015-05-14	0
238	2	42	4	345	Frau	Mag.	Bärbel	Januschewsky	Tätigkeit: Disposition	2015-05-20	1
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
310	2	42	88	1	Frau	Msc MBA	Bettina	Lorentschitsch		2015-02-24	1
311	\N	\N	\N	1	Herr	Ing.	Karl	Lorentschitsch		2015-02-24	1
312	\N	\N	\N	1	Frau		Bettina	Lotterhos		2015-02-24	1
313	\N	\N	\N	1	Frau	Mag.	Ruzica	Lukic		2015-02-24	1
314	\N	\N	\N	1	Frau	Dr.	Astrid	Lüttich		2015-02-24	1
315	2	48	26	1	Frau	Mag.	Elfriede	Mackinger		2015-02-24	1
317	\N	\N	\N	1	Herr		Mario	Mairhofer		2015-02-24	1
318	2	53	187	1	Herr Bürgermeister		Joachim	Maislinger		2015-02-24	1
319	2	10	179	1	Frau	Mag.	Petra	Maislinger-Knoll		2015-02-24	1
321	\N	\N	\N	1	Herr		Martin	Mallinger		2015-02-24	1
322	\N	\N	\N	1	Herr		Roland	Maly		2015-02-24	1
323	\N	\N	\N	1	Frau	Mag.	Natalie	Malzner		2015-02-24	1
324	2	57	74	1	Frau	Mag.	Elisabeth	Mang		2015-02-24	1
325	\N	\N	\N	1	Herr		Walter	Markitz		2015-02-24	1
326	\N	\N	\N	1	Frau		Maria	Marx		2015-02-24	1
329	\N	\N	\N	1	Herr	Mag.		Mayer		2015-02-24	1
330	2	44	205	1	Frau		Elke	Mayer	Leitern;Lebenshilfe Wohnhaus Franz-Gruber-Straße	2015-02-24	1
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
387	\N	\N	\N	1	Herr		Markus	Pfarrhofer	Geschäftsführer	2015-02-24	1
389	3	24	55	1	Frau		Isolde	Pfingstl	Newsletter: ja	2015-02-24	1
390	\N	\N	\N	1	Herr		Thomas	Pichler		2015-02-24	1
391	\N	\N	\N	1	Herr			Pichlmaier		2015-02-24	1
393	\N	\N	\N	1	Herr		Gerhard	Pirchner		2015-02-24	1
394	\N	\N	\N	1	Herr		Alfred	Plank		2015-02-24	1
395	\N	\N	\N	1	Frau		Elisabeth	Plener		2015-02-24	1
396	\N	\N	\N	1	Herr	Dipl.Ing.(FH)	Gerhard	Pockenauer-Gramiller		2015-02-24	1
397	2	42	56	1	Frau		Monika	Pointner		2015-02-24	1
398	\N	\N	\N	1	Herr		Helmut	Pointner		2015-02-24	1
399	2	18	38	1	Frau		Karin	Pokorny		2015-02-24	1
400	\N	\N	\N	1	Herr	KR	Hans	Pöll	Geschäftsführer	2015-02-24	1
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
430	2	42	237	1	Frau		Sabrina	Reiter	Tätigkeit: Waren	2015-02-24	1
433	2	61	69	1	Frau		Ulrike	Reitter		2015-02-24	1
434	2	42	133	1	Frau	Mag.	Helga	Rendl		2015-02-24	1
435	2	14	18	1	Herr	Ing.	Günther	Resch		2015-02-24	1
436	\N	\N	\N	1	Herr		Bernhard	Reschreiter		2015-02-24	1
437	\N	\N	\N	1	Herr		Kurt	Resl		2015-02-24	1
438	\N	\N	\N	1	Frau		Katharina	Rettenbacher		2015-02-24	1
439	\N	\N	\N	1	Herr	Mag.	Gottfried	Rettenegger		2015-02-24	1
440	2	18	122	1	Herr		Landolf	Revertera		2015-02-24	1
441	2	42	172	1	Frau		Brigitte	Ricciotti	Tätigkeit: Mitarbeiter	2015-02-24	1
442	\N	\N	\N	1	Herr Direktor		Franz	Riedl		2015-02-24	1
443	\N	\N	\N	1	Herr			Rieger		2015-02-24	1
444	2	46	36	1	Herr Bürgermeister	Dr.	Emmerich	Riesner		2015-02-24	1
445	2	42	28	1	Herr	Mag.	Walter	Riezinger	Tätigkeit: Akquise	2015-02-24	1
446	2	42	29	1	Frau		Cornelia	Robl	Tätigkeit: Waren	2015-02-24	1
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
468	2	42	255	1	Frau		Edeltraud	Schirlbauer		2015-02-24	1
469	\N	\N	\N	1	Herr Präsident		Julius	Schmalz		2015-02-24	1
470	\N	\N	\N	1	Frau		Andrea	Schmid		2015-02-24	1
471	\N	\N	\N	1	Herr		Christian	Schmidhuber		2015-02-24	1
473	\N	\N	\N	1	Herr		Markus	Schmidt	Küchenleiter	2015-02-24	1
474	\N	\N	\N	1	Frau	Dipl.Ing.	Felicitas	Schneider		2015-02-24	1
475	2	42	153	1	Herr	Mag.	Oliver	Schneider		2015-02-24	1
477	2	15	142	1	Frau		Ingrid	Schöchl		2015-02-24	1
478	2	58	244	1	Herr LAbg.	Dr.	Josef	Schöchl		2015-02-24	1
480	\N	\N	\N	1	Frau	Mag.	Renate	Schönmayr		2015-02-24	1
386	2	42	543	1	Frau	Mag.	Ulrike	Pfaffenberger		2015-04-21	1
472	\N	\N	\N	1	Frau Stadträtin	Mag.	Claudia	Schmidt		2015-04-21	0
415	2	42	544	1	Frau Präsidentin	Dr.	Helga	Rabl-Stadler		2015-04-21	1
412	2	42	82	1	Frau		Margit	Pum		2015-04-21	0
432	2	42	536	1	Frau		Maria	Reiter	Newsletter: ja	2015-04-21	1
431	2	31	194	1	Frau		Sissy	Reiter		2015-04-21	0
481	2	42	545	1	Herr	Dr.	Eduard	Schöpfer		2015-04-21	1
476	2	42	160	1	Frau		Edith	Schnöll		2015-04-21	0
426	2	39	477	1	Herr	Dr.	Wolfgang	Reiger	Newsletter: ja	2015-02-24	1
483	\N	\N	\N	1	Herr	Dipl.-Ing.	Alexander	Schrank	Geschäftsführung	2015-02-24	1
484	2	42	30	1	Frau		Katharina	Schreilechner		2015-02-24	1
485	2	42	193	1	Frau	Dr.	Elisabeth	Schreiner		2015-02-24	1
486	\N	\N	\N	1	Frau	Mag.	Irene	Schulte		2015-02-24	1
488	2	63	118	1	Frau Bürgermeisterin	Mag.	Monika	Schwaiger		2015-02-24	1
489	\N	\N	\N	1	Herr Landesrat	DI Dr.	Josef	Schwaiger		2015-02-24	1
490	2	42	52	1	Herr	Dr.	Wolfgang	Schwaiger		2015-02-24	1
491	\N	\N	\N	1	Herr		Christoph	Schwaiger		2015-02-24	1
492	\N	\N	\N	1	Herr		Günther	Schwaighofer		2015-02-24	1
493	\N	\N	\N	1	Herr	Mag.	Florian	Schwap	Marketing	2015-02-24	1
494	2	10	163	1	Herr		Manfred	Schwarz		2015-02-24	1
495	\N	\N	\N	1	Frau		Helena	Schwarz		2015-02-24	1
497	2	42	161	1	Frau		Aloisia	Schwertl	Newsletter: nein	2015-02-24	1
498	\N	\N	\N	1	Herr	DDDr.	Clemens	Sedmak		2015-02-24	1
500	\N	\N	\N	1	Herr Direktor	Dr.	Günther	Signitzer		2015-02-24	1
501	2	2	183	1	Frau		Karin	Siller	Fax 01/5864181-10	2015-02-24	1
504	2	34	73	1	Herr		Christian	Sitte		2015-02-24	1
505	\N	\N	\N	1	Schwester		Joanella	Six		2015-02-24	1
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
522	2	42	220	1	Herr		Bruno	Steinwender		2015-02-24	1
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
564	\N	\N	\N	1	Herr		Hans-Peter	Wawra		2015-02-24	1
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
558	\N	51	510	1	Frau		Theresia	Wallerstorfer		2015-04-21	1
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
36	2	53	523	1	Frau Dir. KR		Regina	Bayer-Volkmann		2015-04-21	1
615	2	42	527	1	Herr		Anton	Gietzinger	Tätigkeit: Waren	2015-04-21	1
379	2	42	195	1	Frau	Dr.	Brigitta	Pallauf	Newsletter: ja	2015-04-21	0
519	2	42	547	1	Herr		Michael	Steingaßner	Tätigkeit: Waren	2015-04-21	1
571	2	42	100	1	Herr und Frau	Dr.	Johann und Irene	Weiß		2015-04-21	0
630	\N	\N	\N	345	Herr Bakk.Komm.		Martin	Wautischer		2015-05-14	1
579	2	43	239	1	Herr		Reinfried	Wieser		2015-04-21	0
580	2	42	551	1	Herr KommR		Johann	Wieser		2015-04-21	1
631	\N	\N	\N	345	Frau	Mag.	Dagmar	Köttl		2015-05-14	1
586	2	42	144	1	Frau		Grete	Windhager		2015-04-21	0
605	5	106	460	345	Frau/Herr		Test	Persona	Zuschauer im Testsystem	2015-04-22	0
617	\N	\N	\N	345	Herr	Ing.	Josef	Bachleitner		2015-05-14	1
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
602	2	42	165	519	Frau		Sabine	Zöpfl	Tätigkeit: Waren	2015-05-18	1
643	\N	\N	\N	345	Herr		Hugo	Rohner		2015-05-20	1
642	\N	119	572	345	Frau		Lisa	Traubenek	Tätigkeit: Administration, Waren	2015-05-20	1
616	2	56	540	345	Herr		Peter	Nussbaum	Tätigkeit: Waren, Newsletter: ja	2015-05-20	1
574	2	28	42	345	Frau		Ulrike	Wenzlhuemer	Tätigkeit: Administration	2015-05-20	1
644	\N	42	573	345	Herr	Dr.	Alois	Schweiger	Tätigkeit: Waren	2015-05-20	1
645	\N	54	574	345			Leopold	Reichenauer		2015-05-20	1
646	\N	120	575	345	Frau		Elisabeth	Pfeffer		2015-05-20	1
647	\N	42	195	345	Frau	Dr.	Brigitta	Pallauf	Newsletter: ja	2015-05-20	1
648	2	121	577	519	Herr	MAS	Kurt	Schiechl		2015-05-23	1
649	\N	122	579	345	Herr	Dr.	Leonhard	Schitter	Newsletter: nein	2015-06-10	1
650	\N	\N	\N	345	Frau		Petra	 Ummenberger		2015-06-10	1
\.


--
-- TOC entry 4522 (class 0 OID 0)
-- Dependencies: 223
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('person_person_id_seq', 650, true);


--
-- TOC entry 4479 (class 0 OID 241731)
-- Dependencies: 227
-- Data for Name: platformuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY platformuser (person_id, permission_id, password, login_email) FROM stdin;
1	1	TdKGOS_A7e7xbF7SViJVch1mHlbOogpaGiOHhIVVCLD7MkFCyDAOA	mschnoell@gmx.net
519	1	93GUDHseF3SUa6zjPOvTafC-LBrBKXqSwhKVU09MwR6cmD9QDfrdg	michael.steingassner@view-salzburg.at
345	1	_esXsNElb3-HzlZ5Im9vmHz0mplLWCMQRQvUtyJGB6CPqHocEkrXI	doina.moldovan@view-salzburg.at
602	2	mARrvPezLqDOflGszQ1dBS6P8Fj21xH7EKU_t1B3Se0jf1K9_WxqE	sabine.zoepfl@gmx.at
642	2	EKiDCLgGT8A9r7jp66qFCR8Yid9YiymcKQlZa7zR01WpvDrej_jtc	lisa_traubenek@yahoo.de
252	1	2uQ3GJ6bIWd6apg435HeyKjVf7uGEOJcZ9wvv3TbHt9rCXn-AERUc	info@view-salzburg.at
574	2	y4BB3bPNeaw0MMohoK2Soj8ndduAV2DEvn7dAHauC3DfrJnR1-bfU	ulrike.wenzlhuemer@view-salzburg.at
253	1	cwAOMlVjZrCioaZcjBpxfmuL7lPi6DUbVBTQR4P3djk_DukBP9mb4	albert.kiefel@view-salzburg.at
\.


--
-- TOC entry 4480 (class 0 OID 241734)
-- Dependencies: 228
-- Data for Name: relorgcat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relorgcat (organisation_id, category_id) FROM stdin;
\.


--
-- TOC entry 4478 (class 0 OID 241718)
-- Dependencies: 224
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
6	62
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
5	73
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
5	194
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
6	100
5	154
7	238
5	142
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
6	193
5	241
6	209
5	246
7	247
6	249
\.


--
-- TOC entry 4462 (class 0 OID 241656)
-- Dependencies: 208
-- Data for Name: relpersontype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relpersontype (type_id, person_id) FROM stdin;
1	27
1	34
1	44
1	140
1	208
1	209
1	228
1	430
1	441
1	445
1	446
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
3	34
3	37
3	38
3	44
3	51
3	53
3	75
3	80
3	81
3	85
3	88
3	94
3	97
3	101
3	107
3	112
3	114
3	120
3	121
3	135
3	136
3	140
3	141
3	147
3	148
3	158
3	165
3	167
3	177
3	205
3	208
3	209
3	215
3	216
3	221
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
3	310
3	315
3	330
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
3	397
3	399
3	402
3	405
3	418
3	424
3	425
3	426
3	430
3	435
3	441
3	445
3	446
3	453
3	454
3	478
3	490
3	497
3	498
3	505
3	506
3	522
3	525
3	526
3	529
3	531
3	541
3	552
3	557
3	563
3	564
3	567
3	573
3	575
3	582
3	598
4	12
4	14
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
4	93
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
3	253
1	253
3	185
1	185
4	523
4	543
4	371
4	168
2	612
4	320
3	558
1	22
3	36
2	69
4	95
4	134
1	615
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
3	386
3	415
3	432
2	481
3	502
3	519
1	519
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
1	345
3	345
4	527
1	602
4	643
4	549
1	546
1	642
3	100
1	100
3	149
1	149
1	238
3	238
1	252
3	252
1	616
3	616
3	574
1	574
1	644
4	645
4	646
3	647
4	55
3	649
\.


--
-- TOC entry 4481 (class 0 OID 241737)
-- Dependencies: 229
-- Data for Name: reporting; Type: TABLE DATA; Schema: public; Owner: -
--

COPY reporting (report_id, date, description, report_file) FROM stdin;
\.


--
-- TOC entry 4523 (class 0 OID 0)
-- Dependencies: 230
-- Name: reporting_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('reporting_report_id_seq', 1, false);


--
-- TOC entry 4483 (class 0 OID 241745)
-- Dependencies: 231
-- Data for Name: telephone; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telephone (telephone_id, person_id, type_id, telephone) FROM stdin;
3	12	11	0662 8072-0
4	14	11	06212/2494-0
482	28	10	06245/82488
7	19	11	0662/856777-22
483	28	10	0664/73621374
11	25	11	0662 8072-0
12	27	10	0662/822360
13	27	10	0664/4728421
485	587	11	0699/10030007
16	29	11	0662/882883-0
17	30	11	07748/68767
18	31	11	0662/880402
19	32	11	0662/851377
20	32	11	0664/1813895
21	34	10	0681/20901579
22	41	11	05/01451813
23	43	11	0662/850876-0
24	44	10	0650/5207421
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
81	147	11	0662/847898
82	147	11	0664/1296575
83	148	10	0676/9128020
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
94	165	10	0650/8230081
95	165	10	0662/823008
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
499	345	10	0662/646971
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
200	319	11	06212/2254
201	321	11	07612/76577-166
202	323	11	0662/661172
203	325	11	0662/661046
204	326	11	0662/650436-503
205	326	11	0699/11152909
498	345	10	0680/3149482
208	330	11	0662/823274
209	330	11	0664/8394734
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
273	430	10	0660/4854214
274	436	11	05/06021-9205
275	436	11	0664/ 6021-9600
276	438	11	0662/432901-153
277	438	11	0676/87466603
278	440	10	0664/4339166
279	441	10	0662/441509
280	441	10	0664/5411487
281	443	11	06227/2261-14
282	444	10	06216/5212-13
283	444	10	0699/10099753
284	445	10	0662/7825617
285	445	10	0680/5024202
286	446	10	0650/5665474
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
315	491	11	01/21145-3581
316	491	11	0664/6185046
317	488	10	06212/2308-10
318	488	10	0676/6628007
319	492	11	06246/76562
320	493	11	0662/2455-147
321	495	11	0662/66 9 11-221
322	496	10	0662/870211
323	499	11	0662/8389
324	501	11	01/5864181
325	503	11	0662/438676-210
326	505	11	0662/874016-12
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
360	564	11	0662/885050
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
414	253	10	0049/151/52527134
413	253	10	0043/699/10543869
415	119	10	0664/2281230
416	185	10	0650/2320635
418	610	11	0662/856225-0
419	611	11	0662/856225-0
502	2	11	0662/432354-26
503	2	11	0664/4154764
420	371	10	0662/643579-15
504	633	11	01/2536350 -21
421	168	11	6274/6202-20
422	612	11	0662/641996-406
423	613	11	0662/8387-1641
424	614	11	0662/8387-1623
425	22	10	06212/7616
426	22	10	0664/9280220
428	36	10	0662/833754
427	36	10	0664/401202
429	69	10	0650/4414560
430	615	10	0650/4304443
432	224	10	0699/10476679
433	269	10	0664/2612008
434	337	10	0650/3334577
437	372	11	06246/76795
438	432	10	0664/2612008
439	519	10	0699/12054062
442	125	11	0676/7225515
441	125	11	0662/648512
443	11	11	0664/9744340
445	16	11	0662/871400
444	16	11	0662/870737
446	617	11	0662/8698-30
447	618	11	0662/875685-44
449	187	11	0664/9235431
448	187	11	0662/841607-20
450	3	11	0664/9235431
451	3	11	0662/841607-20
452	45	11	0049/8652/5313
453	289	11	0049/8652/1739
454	620	10	+49/160/98917218
455	620	11	+49/7121/1494-806 
457	621	11	0049/221/931809-835
458	622	10	0662/459915-17
459	623	11	0662/647760-18
460	623	10	0699/19287345
462	327	11	0676/9022643
461	327	11	0662/844576 Pforte
463	624	11	050/2211-1301
509	602	10	0699/10992232
464	625	11	050/2211-1322
465	626	11	0662/88912-3670
466	627	11	06245/80826-18 
467	89	11	0662/820332-8003
468	595	11	0662/480301-0
511	643	11	06246/888-2201
469	629	11	0662/872266-77
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
519	252	10	0049/8654/65801
520	252	10	0676/3252443
521	616	10	0664/5946602
522	616	10	06246/75132
523	574	10	0650/4330054
524	644	10	0662/824550
525	644	10	0664/73663498
526	647	10	0664/8565665
527	55	10	0699/11711171
528	648	11	0662/627698
529	650	11	50/800-81551
530	650	10	0664/2566571
531	169	11	0662/849373-201
\.


--
-- TOC entry 4524 (class 0 OID 0)
-- Dependencies: 232
-- Name: telephone_telephone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('telephone_telephone_id_seq', 531, true);


--
-- TOC entry 4463 (class 0 OID 241659)
-- Dependencies: 209
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
-- TOC entry 4525 (class 0 OID 0)
-- Dependencies: 233
-- Name: type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('type_type_id_seq', 1, false);


--
-- TOC entry 4193 (class 2606 OID 241771)
-- Name: pk_address; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT pk_address PRIMARY KEY (address_id);


--
-- TOC entry 4198 (class 2606 OID 241773)
-- Name: pk_article; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY article
    ADD CONSTRAINT pk_article PRIMARY KEY (article_id);


--
-- TOC entry 4211 (class 2606 OID 241775)
-- Name: pk_category; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT pk_category PRIMARY KEY (category_id);


--
-- TOC entry 4214 (class 2606 OID 241777)
-- Name: pk_city; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT pk_city PRIMARY KEY (city_id);


--
-- TOC entry 4217 (class 2606 OID 241779)
-- Name: pk_country; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT pk_country PRIMARY KEY (country_id);


--
-- TOC entry 4220 (class 2606 OID 241781)
-- Name: pk_delivery_list; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY delivery_list
    ADD CONSTRAINT pk_delivery_list PRIMARY KEY (delivery_list_id);


--
-- TOC entry 4224 (class 2606 OID 241783)
-- Name: pk_email; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY email
    ADD CONSTRAINT pk_email PRIMARY KEY (email_id);


--
-- TOC entry 4203 (class 2606 OID 241785)
-- Name: pk_incoming_article; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY incoming_article
    ADD CONSTRAINT pk_incoming_article PRIMARY KEY (incoming_article_id);


--
-- TOC entry 4245 (class 2606 OID 241787)
-- Name: pk_incoming_delivery; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY incoming_delivery
    ADD CONSTRAINT pk_incoming_delivery PRIMARY KEY (incoming_delivery_id);


--
-- TOC entry 4249 (class 2606 OID 241789)
-- Name: pk_logging; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY logging
    ADD CONSTRAINT pk_logging PRIMARY KEY (logging_id);


--
-- TOC entry 4252 (class 2606 OID 241791)
-- Name: pk_organisation; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT pk_organisation PRIMARY KEY (organisation_id);


--
-- TOC entry 4261 (class 2606 OID 241793)
-- Name: pk_orgcontactperson; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY orgcontactperson
    ADD CONSTRAINT pk_orgcontactperson PRIMARY KEY (person_id, organisation_id);


--
-- TOC entry 4208 (class 2606 OID 241795)
-- Name: pk_outgoing_article; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outgoing_article
    ADD CONSTRAINT pk_outgoing_article PRIMARY KEY (outgoing_article_id);


--
-- TOC entry 4265 (class 2606 OID 241797)
-- Name: pk_outgoing_delivery; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT pk_outgoing_delivery PRIMARY KEY (outgoing_delivery_id);


--
-- TOC entry 4270 (class 2606 OID 241799)
-- Name: pk_permission; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT pk_permission PRIMARY KEY (permission_id);


--
-- TOC entry 4231 (class 2606 OID 241801)
-- Name: pk_person; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT pk_person PRIMARY KEY (person_id);


--
-- TOC entry 4277 (class 2606 OID 241803)
-- Name: pk_platformuser; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY platformuser
    ADD CONSTRAINT pk_platformuser PRIMARY KEY (person_id);


--
-- TOC entry 4281 (class 2606 OID 241805)
-- Name: pk_relorgcat; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relorgcat
    ADD CONSTRAINT pk_relorgcat PRIMARY KEY (organisation_id, category_id);


--
-- TOC entry 4272 (class 2606 OID 241807)
-- Name: pk_relorgtype; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relorgtype
    ADD CONSTRAINT pk_relorgtype PRIMARY KEY (type_id, organisation_id);


--
-- TOC entry 4235 (class 2606 OID 241809)
-- Name: pk_relpersontype; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relpersontype
    ADD CONSTRAINT pk_relpersontype PRIMARY KEY (type_id, person_id);


--
-- TOC entry 4286 (class 2606 OID 241811)
-- Name: pk_reporting; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reporting
    ADD CONSTRAINT pk_reporting PRIMARY KEY (report_id);


--
-- TOC entry 4289 (class 2606 OID 241813)
-- Name: pk_telephone; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY telephone
    ADD CONSTRAINT pk_telephone PRIMARY KEY (telephone_id);


--
-- TOC entry 4240 (class 2606 OID 241815)
-- Name: pk_type; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY type
    ADD CONSTRAINT pk_type PRIMARY KEY (type_id);


--
-- TOC entry 4195 (class 2606 OID 280027)
-- Name: unique_constraint_address; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address
    ADD CONSTRAINT unique_constraint_address UNIQUE (address);


--
-- TOC entry 4191 (class 1259 OID 241816)
-- Name: address_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX address_pk ON address USING btree (address_id);


--
-- TOC entry 4196 (class 1259 OID 241817)
-- Name: article_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX article_pk ON article USING btree (article_id);


--
-- TOC entry 4209 (class 1259 OID 241818)
-- Name: category_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX category_pk ON category USING btree (category_id);


--
-- TOC entry 4212 (class 1259 OID 241819)
-- Name: city_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX city_pk ON city USING btree (city_id);


--
-- TOC entry 4215 (class 1259 OID 241820)
-- Name: country_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX country_pk ON country USING btree (country_id);


--
-- TOC entry 4242 (class 1259 OID 241821)
-- Name: delivers_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX delivers_fk ON incoming_delivery USING btree (organisation_id);


--
-- TOC entry 4218 (class 1259 OID 241822)
-- Name: delivery_list_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX delivery_list_pk ON delivery_list USING btree (delivery_list_id);


--
-- TOC entry 4222 (class 1259 OID 241823)
-- Name: email_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX email_pk ON email USING btree (email_id);


--
-- TOC entry 4199 (class 1259 OID 241824)
-- Name: inarticle_indelivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX inarticle_indelivery_fk ON incoming_article USING btree (incoming_delivery_id);


--
-- TOC entry 4200 (class 1259 OID 241825)
-- Name: incoming_article_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX incoming_article_pk ON incoming_article USING btree (incoming_article_id);


--
-- TOC entry 4243 (class 1259 OID 241826)
-- Name: incoming_delivery_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX incoming_delivery_pk ON incoming_delivery USING btree (incoming_delivery_id);


--
-- TOC entry 4201 (class 1259 OID 241827)
-- Name: incomingarticle_article_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX incomingarticle_article_fk ON incoming_article USING btree (article_id);


--
-- TOC entry 4247 (class 1259 OID 241828)
-- Name: logging_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX logging_pk ON logging USING btree (logging_id);


--
-- TOC entry 4250 (class 1259 OID 241829)
-- Name: organisation_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX organisation_pk ON organisation USING btree (organisation_id);


--
-- TOC entry 4257 (class 1259 OID 241830)
-- Name: orgcontactperson2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX orgcontactperson2_fk ON orgcontactperson USING btree (organisation_id);


--
-- TOC entry 4258 (class 1259 OID 241831)
-- Name: orgcontactperson_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX orgcontactperson_fk ON orgcontactperson USING btree (person_id);


--
-- TOC entry 4259 (class 1259 OID 241832)
-- Name: orgcontactperson_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX orgcontactperson_pk ON orgcontactperson USING btree (person_id, organisation_id);


--
-- TOC entry 4204 (class 1259 OID 241833)
-- Name: outarticle_outdelivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX outarticle_outdelivery_fk ON outgoing_article USING btree (outgoing_delivery_id);


--
-- TOC entry 4262 (class 1259 OID 241834)
-- Name: outdelivery_deliverylist_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX outdelivery_deliverylist_fk ON outgoing_delivery USING btree (delivery_list_id);


--
-- TOC entry 4205 (class 1259 OID 241835)
-- Name: outgoing_article_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX outgoing_article_pk ON outgoing_article USING btree (outgoing_article_id);


--
-- TOC entry 4263 (class 1259 OID 241836)
-- Name: outgoing_delivery_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX outgoing_delivery_pk ON outgoing_delivery USING btree (outgoing_delivery_id);


--
-- TOC entry 4206 (class 1259 OID 241837)
-- Name: outgoingarticle_article_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX outgoingarticle_article_fk ON outgoing_article USING btree (article_id);


--
-- TOC entry 4268 (class 1259 OID 241838)
-- Name: permission_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX permission_pk ON permission USING btree (permission_id);


--
-- TOC entry 4227 (class 1259 OID 241839)
-- Name: person_city_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX person_city_fk ON person USING btree (city_id);


--
-- TOC entry 4228 (class 1259 OID 241840)
-- Name: person_country_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX person_country_fk ON person USING btree (country_id);


--
-- TOC entry 4229 (class 1259 OID 241841)
-- Name: person_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX person_pk ON person USING btree (person_id);


--
-- TOC entry 4278 (class 1259 OID 241842)
-- Name: platformuser_permission_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX platformuser_permission_fk ON platformuser USING btree (permission_id);


--
-- TOC entry 4279 (class 1259 OID 241843)
-- Name: platformuser_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX platformuser_pk ON platformuser USING btree (person_id);


--
-- TOC entry 4266 (class 1259 OID 241844)
-- Name: receives_delivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX receives_delivery_fk ON outgoing_delivery USING btree (organisation_id);


--
-- TOC entry 4225 (class 1259 OID 241845)
-- Name: relemailtype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relemailtype_fk ON email USING btree (type_id);


--
-- TOC entry 4253 (class 1259 OID 241846)
-- Name: relorgaddress_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgaddress_fk ON organisation USING btree (address_id);


--
-- TOC entry 4282 (class 1259 OID 241847)
-- Name: relorgcat2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcat2_fk ON relorgcat USING btree (category_id);


--
-- TOC entry 4283 (class 1259 OID 241848)
-- Name: relorgcat_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcat_fk ON relorgcat USING btree (organisation_id);


--
-- TOC entry 4284 (class 1259 OID 241849)
-- Name: relorgcat_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX relorgcat_pk ON relorgcat USING btree (organisation_id, category_id);


--
-- TOC entry 4254 (class 1259 OID 241850)
-- Name: relorgcity_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcity_fk ON organisation USING btree (city_id);


--
-- TOC entry 4255 (class 1259 OID 241851)
-- Name: relorgcountry_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgcountry_fk ON organisation USING btree (country_id);


--
-- TOC entry 4273 (class 1259 OID 241852)
-- Name: relorgtype2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgtype2_fk ON relorgtype USING btree (organisation_id);


--
-- TOC entry 4274 (class 1259 OID 241853)
-- Name: relorgtype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relorgtype_fk ON relorgtype USING btree (type_id);


--
-- TOC entry 4275 (class 1259 OID 241854)
-- Name: relorgtype_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX relorgtype_pk ON relorgtype USING btree (type_id, organisation_id);


--
-- TOC entry 4232 (class 1259 OID 241855)
-- Name: relpersonaddress_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersonaddress_fk ON person USING btree (address_id);


--
-- TOC entry 4226 (class 1259 OID 241856)
-- Name: relpersonemail_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersonemail_fk ON email USING btree (person_id);


--
-- TOC entry 4290 (class 1259 OID 241857)
-- Name: relpersontelephone_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersontelephone_fk ON telephone USING btree (person_id);


--
-- TOC entry 4236 (class 1259 OID 241858)
-- Name: relpersontype2_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersontype2_fk ON relpersontype USING btree (person_id);


--
-- TOC entry 4237 (class 1259 OID 241859)
-- Name: relpersontype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersontype_fk ON relpersontype USING btree (type_id);


--
-- TOC entry 4238 (class 1259 OID 241860)
-- Name: relpersontype_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX relpersontype_pk ON relpersontype USING btree (type_id, person_id);


--
-- TOC entry 4233 (class 1259 OID 241861)
-- Name: relpersonupdateperson_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX relpersonupdateperson_fk ON person USING btree (per_person_id);


--
-- TOC entry 4291 (class 1259 OID 241862)
-- Name: reltelephonetype_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX reltelephonetype_fk ON telephone USING btree (type_id);


--
-- TOC entry 4287 (class 1259 OID 241863)
-- Name: reporting_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX reporting_pk ON reporting USING btree (report_id);


--
-- TOC entry 4292 (class 1259 OID 241864)
-- Name: telephone_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX telephone_pk ON telephone USING btree (telephone_id);


--
-- TOC entry 4241 (class 1259 OID 241865)
-- Name: type_pk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX type_pk ON type USING btree (type_id);


--
-- TOC entry 4256 (class 1259 OID 241866)
-- Name: updated_organisation_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updated_organisation_fk ON organisation USING btree (person_id);


--
-- TOC entry 4221 (class 1259 OID 241867)
-- Name: updates_deliverylist_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updates_deliverylist_fk ON delivery_list USING btree (person_id);


--
-- TOC entry 4246 (class 1259 OID 241868)
-- Name: updates_incoming_delivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updates_incoming_delivery_fk ON incoming_delivery USING btree (person_id);


--
-- TOC entry 4267 (class 1259 OID 241869)
-- Name: updatesoutgoingdelivery_fk; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX updatesoutgoingdelivery_fk ON outgoing_delivery USING btree (person_id);


--
-- TOC entry 4297 (class 2606 OID 241870)
-- Name: fk_delivery_updates_d_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY delivery_list
    ADD CONSTRAINT fk_delivery_updates_d_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4298 (class 2606 OID 241875)
-- Name: fk_email_relemailt_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY email
    ADD CONSTRAINT fk_email_relemailt_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4299 (class 2606 OID 241880)
-- Name: fk_email_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY email
    ADD CONSTRAINT fk_email_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4306 (class 2606 OID 241885)
-- Name: fk_incoming_delivers_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_delivery
    ADD CONSTRAINT fk_incoming_delivers_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4293 (class 2606 OID 241890)
-- Name: fk_incoming_inarticle_incoming; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_article
    ADD CONSTRAINT fk_incoming_inarticle_incoming FOREIGN KEY (incoming_delivery_id) REFERENCES incoming_delivery(incoming_delivery_id) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4294 (class 2606 OID 241895)
-- Name: fk_incoming_incominga_article; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_article
    ADD CONSTRAINT fk_incoming_incominga_article FOREIGN KEY (article_id) REFERENCES article(article_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4307 (class 2606 OID 241900)
-- Name: fk_incoming_updates_i_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY incoming_delivery
    ADD CONSTRAINT fk_incoming_updates_i_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4308 (class 2606 OID 241905)
-- Name: fk_organisa_relorgadd_address; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_relorgadd_address FOREIGN KEY (address_id) REFERENCES address(address_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4309 (class 2606 OID 241910)
-- Name: fk_organisa_relorgcit_city; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_relorgcit_city FOREIGN KEY (city_id) REFERENCES city(city_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4310 (class 2606 OID 241915)
-- Name: fk_organisa_relorgcou_country; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_relorgcou_country FOREIGN KEY (country_id) REFERENCES country(country_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4311 (class 2606 OID 241920)
-- Name: fk_organisa_updated_o_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organisation
    ADD CONSTRAINT fk_organisa_updated_o_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4312 (class 2606 OID 241925)
-- Name: fk_orgconta_orgcontac_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgcontactperson
    ADD CONSTRAINT fk_orgconta_orgcontac_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4313 (class 2606 OID 241930)
-- Name: fk_orgconta_orgcontac_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY orgcontactperson
    ADD CONSTRAINT fk_orgconta_orgcontac_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4295 (class 2606 OID 241935)
-- Name: fk_outgoing_outarticl_outgoing; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_article
    ADD CONSTRAINT fk_outgoing_outarticl_outgoing FOREIGN KEY (outgoing_delivery_id) REFERENCES outgoing_delivery(outgoing_delivery_id) ON UPDATE RESTRICT ON DELETE RESTRICT DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 4314 (class 2606 OID 241940)
-- Name: fk_outgoing_outdelive_delivery; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT fk_outgoing_outdelive_delivery FOREIGN KEY (delivery_list_id) REFERENCES delivery_list(delivery_list_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4296 (class 2606 OID 241945)
-- Name: fk_outgoing_outgoinga_article; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_article
    ADD CONSTRAINT fk_outgoing_outgoinga_article FOREIGN KEY (article_id) REFERENCES article(article_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4315 (class 2606 OID 241950)
-- Name: fk_outgoing_receives__organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT fk_outgoing_receives__organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4316 (class 2606 OID 241955)
-- Name: fk_outgoing_updatesou_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY outgoing_delivery
    ADD CONSTRAINT fk_outgoing_updatesou_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4300 (class 2606 OID 241960)
-- Name: fk_person_person_ci_city; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_person_ci_city FOREIGN KEY (city_id) REFERENCES city(city_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4301 (class 2606 OID 241965)
-- Name: fk_person_person_co_country; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_person_co_country FOREIGN KEY (country_id) REFERENCES country(country_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4302 (class 2606 OID 241970)
-- Name: fk_person_relperson_address; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_relperson_address FOREIGN KEY (address_id) REFERENCES address(address_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4303 (class 2606 OID 241975)
-- Name: fk_person_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY person
    ADD CONSTRAINT fk_person_relperson_person FOREIGN KEY (per_person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4319 (class 2606 OID 241980)
-- Name: fk_platform_platformu_permissi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platformuser
    ADD CONSTRAINT fk_platform_platformu_permissi FOREIGN KEY (permission_id) REFERENCES permission(permission_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4320 (class 2606 OID 241985)
-- Name: fk_platform_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY platformuser
    ADD CONSTRAINT fk_platform_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4321 (class 2606 OID 241990)
-- Name: fk_relorgca_relorgcat_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgcat
    ADD CONSTRAINT fk_relorgca_relorgcat_category FOREIGN KEY (category_id) REFERENCES category(category_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4322 (class 2606 OID 241995)
-- Name: fk_relorgca_relorgcat_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgcat
    ADD CONSTRAINT fk_relorgca_relorgcat_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4317 (class 2606 OID 242000)
-- Name: fk_relorgty_relorgtyp_organisa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgtype
    ADD CONSTRAINT fk_relorgty_relorgtyp_organisa FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4318 (class 2606 OID 242005)
-- Name: fk_relorgty_relorgtyp_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relorgtype
    ADD CONSTRAINT fk_relorgty_relorgtyp_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4304 (class 2606 OID 242010)
-- Name: fk_relperso_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relpersontype
    ADD CONSTRAINT fk_relperso_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4305 (class 2606 OID 242015)
-- Name: fk_relperso_relperson_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY relpersontype
    ADD CONSTRAINT fk_relperso_relperson_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 4323 (class 2606 OID 242020)
-- Name: fk_telephon_relperson_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telephone
    ADD CONSTRAINT fk_telephon_relperson_person FOREIGN KEY (person_id) REFERENCES person(person_id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- TOC entry 4324 (class 2606 OID 242025)
-- Name: fk_telephon_relteleph_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telephone
    ADD CONSTRAINT fk_telephon_relteleph_type FOREIGN KEY (type_id) REFERENCES type(type_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2015-06-16 18:13:41

--
-- PostgreSQL database dump complete
--

