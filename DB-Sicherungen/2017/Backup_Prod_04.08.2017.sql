--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.4.4
-- Started on 2017-08-04 11:13:21

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
602	Postfach 38
603	Gneiserstraße 62
604	Guttenbrunnstraße 21
605	Eichstraße 14
606	Dietrichsteinstraße 8
607	Nonntaler Hauptstr. 64/9
608	Karl-Böttinger-Straße 35
609	Elsenheimstr. 20
610	Mühlbachstr. 31
611	Industriestrasse 18
612	Faberstraße 18
613	Söllheimer Strasse 16
614	Julius Fritsche Gasse 44
615	Ulrike-Gschwandtner-Straße 5
616	Kaigasse 35 
617	Roland Russ Weg 14 
618	 Bergerbräuhofstrasse 33
619	Siezenheimer Str. 39a
620	Siezenheimer Straße 39a
621	Strubergasse 18/3
622	Chiemseehof
623	Landesberufsschule 5 Erzherzog-Eugen-Str. 15
624	Gymnasium & ART-ORG St. Ursula, Aignerstraße 135
625	Privatgymnasium der Herz-Jesu-Missionare, Schönleitenstraße 1
626	Landesberufsschule 5, Erzherzog-Eugen-Str. 15
627	Erzherzog-Eugen-Str. 15
628	Aignerstraße 135
629	Teichweg 2
630	Merianstr. 13
631	Ziegelstadelstraße 5
632	Matzing 14
633	Möllwaldplatz 5
634	Lacknerweg 5
635	Montforterweg 4
636	Schwarzstraße 17
637	Herrnaugasse 16
638	Gartenauerstraße 8
639	Stubenbastei 5
640	Michael-Pacher-Str. 6 
641	Linzer Bundesstraße 12
642	Lasserstraße 13
643	Rifer Hauptstraße 72
644	Schwarzstr. 17
645	Hochlandstraße 18
646	Linzer Straße 9
647	Pfarrhofstr. 20
648	Erentrudisstraße 24
649	Ganshofstrasse 19
650	Ganshofstraße 19
651	Lamprechtshausener Bundesstraße 8
652	Randersbergweg 383
653	Bergstraße 10
654	Holzegg 1
655	Fischbachstr. 43
656	Lamprechtshausener Bundesstr. 8
657	Beethovenstr. 40
658	Siezenheimer Strasse 39a
659	Sinnhubstraße 15
660	Laufener Str. 62
661	Schießstattgasse 29/6
662	Gewerbepark 1
663	Luitholdgasse 1 a
664	Waldbadstraße 50
665	Robert- Bosch-Str. 44
666	Schumacherstraße 18
667	Regensburgerstr. 14
668	Vogelweiderstraße 78
669	Sterngässchen 1
670	Fischergasse 18
671	Griesgasse 23
672	Hechtstr. 9a
673	Schöndorferplatz 10 
674	Salzburgerstr. 77
675	Wehrstr. 5
676	Mosergutweg 5
677	Siggerwiesen 36
678	Gewerbehofstraße 5
679	Petersbrunnstraße 3
680	Stefan-Fadinger-Platz 34
681	Eschenweg 1 
682	Karolingerstraße 1
683	Salzachtalstraße 88
684	Miller von Aichholz-Straße 50   
685	Itzlinger Hauptstraße 30
686	Eisenhandstraße 15
687	Miller von Aichholz-Straße 50
688	Anton Breitner Straße 8
689	 Jellgutweg 2 
690	Waidach 27
691	Schneibsteinstr. 9
692	Josef Lindndner Str. 4
693	Taxhamgasse 13
694	Mayrmühlweg 21
695	Bergheimerstr. 55
696	Schulstraße 187
\.


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 176
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('address_address_id_seq', 696, true);


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
549	Äpfel	kg	1	\N	3.00
550	Molke	kg	0.5	\N	10.00
551	Dosenfisch	kg	1	\N	8.00
552	Dosenfisch	kg	1	\N	8.00
553	Eistee-Pfirsich Konzentrat	Stk.	3	\N	26.10
554	Getränkepulver Eistee-Zitrone	Stk.	1	\N	4.70
555	Getränkepulver Eistee-Pfirsich	Stk.	1	\N	4.70
556	Light Konzentrat Apfel	Stk.	3	\N	26.10
557	Erfrischungsgetränk Grapefruit	Stk.	3	\N	38.40
558	Getränkepulver Waldbeer	Stk.	1	\N	4.70
559	Kaltschale Erdbeere	Stk.	3	\N	46.20
560	Getränkepulver Zitronentee	Stk.	1	\N	4.70
561	Kaltschale Maracuja	Stk.	3	\N	46.20
562	Getränkepulver Blutorange	Stk.	1	\N	4.90
563	Vintschgerl	Stk	0.0800000000000000017	\N	0.90
564	Milchbrotzopf	Stk	0.400000000000000022	\N	3.90
565	Brioche	Stk	0.0800000000000000017	\N	1.00
566	Brot	kg	1	\N	3.50
567	Brot und Gebäck	kg	1	\N	4.00
568	Brioche	Stk	0.0800000000000000017	\N	1.00
569	Vintschgerl	Stk	0.0800000000000000017	\N	0.90
570	Brot	kg	1	\N	3.50
571	Brot und Gebäck	kg	1	\N	4.00
572	Brot und Gebäck	kg	1	\N	4.00
573	Brot und Gebäck	kg	1	\N	4.00
574	Brot und Gebäck	kg	1	\N	4.00
575	Brot	kg	1	\N	3.50
576	Milchbrotzopf	Stk	0.400000000000000022	\N	3.90
577	Brioche	Stk	0.0800000000000000017	\N	1.00
578	Dosenfisch	Sack	20	\N	120.00
579	Dosenfisch	Sack	20	\N	120.00
580	Dosenfisch	Sack	20	\N	120.00
581	Dosenfisch	Sack	20	\N	120.00
582	Sandwich (belegt)	Karton	5.40000000000000036	\N	54.00
583	Spargelcremesuppe	Eimer	10	2016-03-11	100.00
584	Gulaschsuppe Basis	Stk	3	2016-03-30	38.70
585	Milchmix Vanille	Beutel	1	2016-03-01	7.89
586	Champignon Creme Suppe	Eimer	10	2016-04-09	100.00
587	Zitronen-Pfeffer-Gewürz	Dose	0.800000000000000044	2016-03-03	11.95
588	Milchmix Banane	Beutel	1	2016-03-22	7.89
589	Sauce zum Braten	Stk	0.699999999999999956	2016-03-10	8.33
590	Vegetabile Suppe	Karton	25	2016-03-04	159.25
591	BlumenkohlCremeSuppe	Eimer	10	2016-03-11	100.00
592	Dosenfisch	kg	1	\N	6.00
593	Putenschinken	kg	1	\N	10.00
594	Sulz	kg	1	\N	7.50
595	Streichwurst	kg	1	\N	12.00
596	Schinken	kg	1	\N	10.00
597	Schinken	kg	1	\N	10.00
598	Schinken	kg	1	\N	10.00
599	Eis	kg	1	\N	3.50
600	Torten	Stk	0.699999999999999956	\N	13.00
601	Gebäck	Karton	3	\N	12.00
602	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
603	Brioche	Stk.	0.0800000000000000017	\N	1.00
604	Brot	kg	1	\N	3.50
605	Eier	Stk.	0.149999999999999994	\N	0.23
606	Brot	kg	1	\N	3.50
607	Milchzopf	Stk	0.400000000000000022	\N	3.90
608	Brioche	Stk.	0.0800000000000000017	\N	1.00
609	Brot	kg	1	\N	3.50
610	Milchzopf	Stk.	0.400000000000000022	\N	3.90
611	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
612	Brot	kg	1	\N	3.50
613	Brioche	Stk.	0.0800000000000000017	\N	1.00
614	Backwaren	kg	1	\N	4.00
615	Backwaren	kg	1	\N	4.00
616	Brot	kg	1	\N	3.50
617	Schinken	kg	1	\N	10.00
618	Backwaren	Karton	3	\N	12.00
619	Backwaren	Karton	3	\N	12.00
620	Würfelkäse Bergader	Würfel	0.200000000000000011	\N	1.50
621	Wurst gemischt	kg	1	\N	15.00
622	Backwaren	Karton	3	\N	12.00
623	Backwaren	Karton	3	\N	12.00
624	Wurst gemischt	Karton	20	\N	200.00
625	Hofburger Alpenweichkäse	Karton	4.90000000000000036	\N	39.00
626	Bergbauer Minilaib	Karton á 7 Stk.	2.10000000000000009	\N	22.00
627	Hofburger Alpenweichkäse	Karton á 14 Stk.	4.90000000000000036	\N	39.00
628	Pommes	Karton 	10	\N	12.00
629	Chinagemüse	Karton	6	\N	24.00
630	Couscous	Karton	10	\N	40.00
631	Champignon	Karton	10	\N	20.00
632	Wokmischung	Karton	10	\N	40.00
633	Gourmetprodukte gemischt	kg	1	\N	10.00
634	Gemüsebrühe	Kartons	25	2016-07-21	347.50
635	Schokopudding	Packungen	2.29999999999999982	2016-06-29	23.00
637	Karottensuppe	Kartons	9	2016-07-26	90.00
638	Geflügelsauce	Eimer	9	2016-07-26	107.10
639	Vanillepudding	Packungen	2.5	2016-07-19	23.25
640	Fischfond	Karton	3	2016-07-21	44.70
641	Erfrischungsgetränk Kirsch	Kanister	10	2016-07-08	75.00
642	Zucchini Suppe	Karton	9	2016-07-26	90.00
643	Getränkepulver Blutorange	Stk.	1	2017-09-07	4.70
644	Getränkepulver Mehrfrucht	Stk.	1	2017-07-11	4.70
645	Getränkepulver Blutorange	Stk.	1	2017-09-07	4.70
646	Getränkepulver Maracuja	Stk.	1	2017-07-06	4.70
647	Getränkepulver Lifeline Orange	Stk.	1	2017-09-07	4.70
648	Getränkepulver Blutorange	Stk.	1	2017-02-24	4.70
649	Getränkepulver Tropic	Stk.	1	2017-08-01	4.70
650	Getränkepulver Kirsch	Stk.	1	2017-08-01	4.70
651	Getränkepulver Blutorange	Stk.	1	2016-08-02	4.70
652	Getränkepulver Zitrone	Stk.	1	2017-08-01	4.70
653	Getränkepulver Maracuja	Stk.	1	2016-08-02	4.70
654	Getränkepulver Waldbeer	Stk.	1	2017-09-29	4.70
655	Getränkepulver Zitrone	Stk.	1	2017-01-20	4.70
656	Getränkepulver Apfel	Stk.	1	2016-12-08	4.70
657	Getränkepulver Eistee Zitrone	Stk.	1	2017-09-29	4.70
658	Getränkepulver Eistee Zitrone	Stk.	1	2017-09-29	4.70
659	Getränkepulver Zitrone	Stk.	1	2017-09-11	4.70
660	Getränkepulver Eistee Pfirsich	Stk.	1	2017-09-29	4.70
661	Getränkepulver Himbeere	Stk. 	1	2017-07-11	4.70
662	Getränkepulver Apfel	Stk.	1	2017-08-01	4.70
663	Getränkepulver Orange	Stk. 	1	2017-09-07	4.70
664	Getränkepulver Orange	Stk.	1	2017-09-07	4.70
665	Getränkepulver schwarze Johannisbeere	Stk.	1	2017-09-07	4.70
666	Getränkepulver Tropic	Stk.	1	2017-08-01	4.70
667	Prinzessgemüse	Karton	10	\N	17.56
668	Bohnen	Karton	10	\N	29.80
669	Couscous	Karton	10	\N	40.00
670	Griesspudding	Pkg.	2.29999999999999982	2016-07-27	23.00
671	Gemüsebrühe	Kartons	25	2016-07-21	347.50
672	Erfrischungsgetränk Kirsch	Kanister	10	2016-07-08	75.00
673	Geflügelsauce	Eimer	9	2016-07-26	107.10
674	Schokopudding	Pkg.	2.29999999999999982	2016-06-29	23.00
675	Zucchini Suppe	Karton	9	2016-07-26	90.00
676	Karottensuppe	Kartons	9	2016-07-26	90.00
677	Fischfond	Karton	3	2016-07-21	44.70
678	Vanillepudding	Pkg.	2.5	2016-07-19	23.25
679	Bergbauern Minilaib	Karton à 7 Stk.	2.10000000000000009	2016-06-09	22.00
680	Minitorten mit Knobl	Kartons à 20 Stk.	3	2016-06-20	30.00
681	Almkäse Pfeffer	Kartons à 6 Stk	0.900000000000000022	2016-06-22	9.54
682	Brot und Gebäck	kg	1	\N	4.00
683	Brot	kg	1	\N	3.50
684	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
685	Brot	kg	1	\N	3.50
686	Brioche	Stk.	0.0800000000000000017	\N	1.00
687	Milchzopf	Stk.	0.400000000000000022	\N	3.90
688	Bergader Almkäse	Kartons	3	\N	31.80
689	Weißschimmerlkäse	Kartons	2.39999999999999991	\N	26.28
690	Weißschimmelkäse	Kartons	2.39999999999999991	2016-06-28	26.28
691	Bergader Almkäse	Karton	3	2016-06-28	31.80
692	Tomatensuppe	Eimer	2	2016-08-20	37.00
693	Spargelcremesuppe	Eimer	2	2016-08-20	37.00
694	Heidelbeer Joghurt Dessert	Karton	3	2016-09-08	38.95
695	Tassenpudding Vanille	Beutel	0.0330000000000000016	2016-08-03	0.59
696	Tassenpudding Schoko	Beutel	0.0330000000000000016	2016-08-03	0.59
697	Schokopudding	Pkg.	2.5	2016-08-02	22.25
698	Sauerbratensauce	Karton	10	2016-09-04	0.01
699	Gemüsebrühe	Karton	20	2016-06-21	244.00
700	Tassenpudding Vanillegeschmack	Eimer	2.29999999999999982	2016-08-10	29.90
701	Johannisbeer "Light" Konzentrat	Kanister	5	2016-08-16	37.50
702	Milchsuppe Erdbeer	Pkg.	2.5	2016-10-05	33.95
703	Pfirsich-Mango Kaltschale	Pkg.	3	2016-08-18	46.20
704	Himbeer-Johannisbeer Kaltschale	Pkg.	3	2016-08-18	46.20
705	Rahmsauce	Eimer	2.5	2016-09-15	0.01
706	Birne-Melisse Erfrischungsgetränk	Kanister	10	2016-09-25	128.00
707	Schoko Kouvertüre	Karton	5	\N	49.00
708	Caramelsauce	Karton	10	\N	81.30
709	Bobby-Riegel	Karton à 24 Stk	2	\N	7.20
710	Bergader Almkäse Torten	Kartons à 20 Stk.	3	2016-07-06	30.00
711	Bergader Bergbauernkäse	Karton à 6 Stk.	0.900000000000000022	2016-07-06	10.40
712	Bergader Almkäse Scheiben	Karton à 10 Stk.	1	2016-07-07	10.60
713	Getränkepulver	Karton à 10 Stk.	10	2017-08-01	47.00
714	Vitschgerl	Stk.	0.0800000000000000017	\N	0.90
715	Brot	kg	1	\N	3.50
716	Brioche	Stk.	0.0800000000000000017	\N	1.00
717	Brot	kg	1	\N	4.00
718	Brot	kg	1	\N	4.00
719	Brot	kg	1	\N	4.00
720	Butter	kg	1	\N	7.92
721	Käse (aufgeschnitten)	kg	1	\N	14.45
722	Wurst (aufgeschnitten)	kg	1	\N	16.90
723	Taubenkernöl	Flaschen	1	\N	11.20
724	Chilisoße grün	Flaschen	0.0570000000000000021	\N	6.90
725	Tagliatelle con Spinaci	Schalen	0.25	\N	1.15
726	Vialone Nano Reis	Sack	5	\N	39.80
727	Tilda Reis	Sack	5	\N	22.80
728	Tagliatelle con Spinaci	Schalen	0.25	\N	1.15
729	Vialone Nano Reis	Sack	5	\N	39.80
730	Chilisoße grün	Flaschen	0.0570000000000000021	\N	6.90
731	Tilda Reis	Sack	5	\N	22.80
732	Traubenkernöl	Flaschen	1	\N	11.20
733	Brot und Gebäck	kg	1	\N	4.00
734	Brot und Gebäck	kg	1	\N	4.00
735	Brot und Gebäck	kg	1	\N	4.00
736	Brot und Gebäck	kg	1	\N	4.00
737	Brot	kg	1	\N	3.50
738	Brioche	Stück	0.0800000000000000017	\N	1.00
739	Brot und Gebäck	kg	1	\N	4.00
740	Almkäse Scheiben	Stück	1	2016-07-07	10.00
741	Bergbauernkäse	Stück	0.900000000000000022	2016-07-06	10.00
742	Obst/Gemüse gemischt	kg	1	\N	4.00
743	Obst	Karton	1	\N	2.00
744	div. Musterbeutel	Karton	0.5	\N	20.00
745	Bio Gemüsesuppe	Eimer	15	2016-09-07	13.00
746	Mineralwasser Geschmack	Tray	4.5	\N	4.00
747	Nudeln	Karton	10	\N	16.00
748	Mineralwasser	Tray	3	\N	3.50
749	Energydrink	Paletten	5	\N	13.00
750	Schokosauce	Karton	1	\N	5.00
751	Teigwaren	Karton	10	\N	30.00
752	Mineralwasser Juice	Tray (6er)	4	\N	6.00
753	Mineralwasser Juice	Tray(6er)	4	\N	6.00
754	Teigwaren	Karton	10	\N	30.00
755	Energy Drink	Tray(24er)	6	\N	36.00
756	Teigwaren	Karton	10	\N	30.00
757	Mineralwasser Juice	Tray(6er)	4	\N	6.00
758	Senf	Karton	1	\N	1.00
759	Deo	Karton	1	\N	1.00
760	diverse Süßigkeiten	Karton	2	\N	10.00
761	T-Shirts	Stück	0.200000000000000011	\N	4.00
762	Thunfisch	Karton	1	\N	1.00
763	Capri Sonne	Karton	1	\N	1.00
764	Mineralwasser Juic	Tray(6er)	4.5	\N	6.00
765	Königserbsenschoten	Karton	10	\N	40.00
766	Wokmischung China	Karton	10	2016-08-31	40.00
767	Gourmetprodukte gemischt	kg	1	\N	10.00
768	Thunfisch	Karton	1.80000000000000004	\N	33.00
769	diverse Süßigkeiten	Karton	2	\N	15.00
770	Senf	Karton	14	\N	110.00
771	Deo	Karton	1	\N	20.00
773	Capri Sonne	Karton	2	\N	8.00
772	T-Shirts	Stück	0.200000000000000011	\N	7.00
774	Lebensmittel gemischt	kg	1	\N	3.00
775	Eier	Stück	0.0599999999999999978	\N	0.40
776	Brot und Gebäck	kg	1	\N	4.00
777	Brot und Gebäck	kg	1	\N	4.00
778	Brot und Gebäck	kg	1	\N	4.00
779	Brot	kg	1	\N	3.50
780	Brot	kg	1	\N	3.50
781	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
782	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
783	Brioche	Stk.	0.0800000000000000017	\N	1.00
784	Brot	kg	1	\N	3.50
785	Gebäck	Karton	3	\N	12.00
786	Brot/Gebäck	Karton	3	\N	12.00
787	Brot/Gebäck	Karton	3	\N	12.00
788	Brot/Gebäck	Karton	3	\N	12.00
789	Brot/Gebäck	Karton	3	\N	12.00
790	Brot	kg	1	\N	3.50
791	Brot	kg	1	\N	3.50
792	Brioche	Stk.	0.0800000000000000017	\N	1.00
793	Brot	kg	1	\N	3.50
794	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
795	Brot	kg	1	\N	3.50
796	Brot	kg	1	\N	3.50
797	Brioche	Stk.	0.0800000000000000017	\N	1.00
798	Brot/Gebäck	Karton	3	\N	12.00
799	Brot/Gebäck	Karton	3	\N	12.00
800	Brot/Gebäck	Karton	3	\N	12.00
801	Brot/Gebäck	Karton	3	\N	12.00
802	Vitschgerl	kg	0.400000000000000022	\N	3.90
803	Brioche	kg	0.0800000000000000017	\N	1.00
804	Brot	kg	1	\N	3.50
805	Brioche	kg	0.0800000000000000017	\N	1.00
806	Brot	kg	1	\N	3.50
807	Brot & Gebäck	kg	1	\N	4.00
808	Brot & Gebäck	kg	1	\N	4.00
809	Brot & Gebäck	kg	1	\N	4.00
810	Brot & Gebäck	kg	1	\N	4.00
811	Brot & Gebäck	kg	1	\N	4.00
812	Brot & Gebäck	kg	1	\N	4.00
813	Brot & Gebäck	kg	1	\N	4.00
814	Brot & Gebäck	kg	1	\N	4.00
815	Brot & Gebäck	kg	1	\N	4.00
816	Brot & Gebäck	kg	1	\N	4.00
817	Lebensmittel gemischt	kg	1	\N	10.00
818	Brot & Gebäck	kg	1	\N	4.00
819	Brot & Gebäck	kg	1	\N	4.00
820	Brot & Gebäck	kg	1	\N	4.00
821	Bunte GEmüsemischung	Karton	10	\N	40.00
822	Gemüse	Karton	10	\N	40.00
823	Spinta	Karton	6	\N	24.00
824	Gemüse	Karton	10	\N	40.00
825	Gemüse	Karton	6	\N	24.00
826	Gemüse	Karton	6	\N	24.00
827	Spinat	Karton	6	\N	24.00
828	Gemüse	Karton	10	\N	40.00
829	diverse Lebensmittel	kg	1	\N	4.00
830	Putzmittel	Kanister	10	\N	20.00
831	Waschmittel	Doppelpack	10	\N	55.20
832	Klarspüler	Kanister	10	\N	32.50
833	Klarspüler	Kanister	10	\N	32.50
834	Putzmittel	Kanister	10	\N	20.00
835	Waschmittel	Doppelpack	10	\N	55.20
836	Pizzaschnitten	Karton	4	\N	39.00
837	Butterbrezen	Karton	4	\N	12.00
838	Laugengebäck	Karton	4	\N	12.00
839	Kirsch Ligth-Konzentrat	Kanister	5	\N	37.50
840	Nektar Multivitamin	Kanister	3	\N	17.43
841	Eistee Pfirsich	Kanister	10	\N	120.00
842	Veloute Granulat 	Eimer	8	\N	112.00
843	Birne-Melisse Konzentrat	Kanister	3	\N	40.80
844	Nektar Apfel	Kanister	3	\N	17.43
845	Vollmilchpulver	Beutel	1	\N	10.95
846	Basis Gulaschsuppe	Pkg. 	3	\N	39.95
847	Sweet Chili Dipsauce 	Stk.	1	\N	5.95
848	Kirsch Erfrischungsgetränk	Kanister	10	\N	120.00
849	Grapefruit Erfrischungsgetränk	Pkg.	3	\N	38.40
850	Tassenpudding Griess	Stk.	0.0330000000000000016	\N	0.59
851	Himbeer-Zitrone Ligth	Kanister	5	\N	37.50
852	Rahmsauce	Dose	1.5	\N	20.93
853	Passion Püree-Mix	Pkg.	1	\N	7.69
854	Kochp. Sabayon	Pkg.	2.5	\N	19.75
855	Banana Püree-Mix	Pkg.	1	\N	7.69
856	Hühnersuppe	Eimer	15	\N	94.50
857	Riegel Nougat	Stk.	0.130000000000000004	\N	0.70
858	Riegel Orange	Stk.	0.130000000000000004	\N	0.70
859	Brot	kg	1	\N	4.00
860	Brot/Gebäck	kg	1.5	\N	6.00
861	Brioche	Stk.	0.0800000000000000017	\N	1.00
862	Brot	kg	1	\N	3.50
863	Brot	kg	1	\N	4.00
864	Brot	kg	1	\N	3.50
865	Brioche	Stk.	0.0800000000000000017	\N	1.00
866	Brot	kg	1	\N	3.50
867	Milchzopf	Stk.	0.400000000000000022	\N	3.90
868	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
869	Brot	kg	1	\N	3.50
870	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
871	Brioche	Stk.	0.0800000000000000017	\N	1.00
872	Brioche	Stk.	0.0800000000000000017	\N	1.00
873	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
874	Milchzopf	Stk.	0.400000000000000022	\N	3.90
875	Brot	kg	1	\N	3.50
876	Brot	kg	1	\N	3.50
877	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
878	Milchzopf	Stk.	0.400000000000000022	\N	3.90
879	Brioche	Stk.	0.0800000000000000017	\N	1.00
880	Brot	kg	1	\N	3.50
881	Brioche	Stk.	0.0800000000000000017	\N	1.00
882	Brot	kg	1	\N	3.50
883	Vintschgerl	Stk.	0.0800000000000000017	\N	0.90
884	Brot	kg	1	\N	3.50
885	Mineralwasser	Mineralwasser	1.5	\N	1.00
886	Mineralwasser	Tray	4	\N	4.00
887	Mineralwasser	Tray	4	\N	4.00
888	Butter	Karton	1.60000000000000009	\N	16.00
889	Brioche	Stück	0.0800000000000000017	\N	1.00
890	Brot	kg	1	\N	3.50
891	Vintschgerl	Stück	0.0800000000000000017	\N	0.90
894	Würfelkäse Bergader	Würfel	2.17399999999999993	\N	15.00
892	Brot und Gebäck	Karton	3	\N	12.00
899	Brot und Gebäck	kg	1	\N	4.00
900	Brot und Gebäck	kg	1	\N	4.00
905	Brot und Gebäck	kg	1	\N	4.00
893	Brot und Gebäck	Karton	4	\N	16.00
895	Brotaufstrich	kg	1	\N	10.00
896	Vintschgerl	Stück	0.0800000000000000017	\N	0.90
897	Brot	kg	1	\N	3.50
898	Brioche	Stück	0.0800000000000000017	\N	1.00
901	Brot	kg	1	\N	3.50
902	Milchbrot	Stück	0.400000000000000022	\N	3.90
903	Vintschgerl	Stück	0.0800000000000000017	\N	0.90
904	Brioche	Stück	0.0800000000000000017	\N	1.00
906	Almkäse mild	Karton	1.05000000000000004	2016-07-01	1.50
907	Almkäse würzig	Karton	0.900000000000000022	2016-07-01	1.50
908	Mineralwasser	Tray	4	\N	6.00
909	Getreidebrei	Paket	0.220000000000000001	\N	2.00
910	Garnelen	kg	1	\N	30.00
911	Lebensmittel gemischt	kg	1	\N	15.00
912	Kokosmilch	Dose	0.400000000000000022	\N	2.50
913	Bergbauern mild-nussig	Karton	8	\N	100.00
914	Getränkepulver	Stück	1	2017-02-24	4.90
915	Nektar Mand-Mango	Kanister	5	2017-02-11	30.00
916	div. Säfte	Packung	1	2017-02-14	7.00
917	Saft	Packung	1	\N	7.00
918	BIO Hühnerbouillon	Eimer	4	2017-02-16	61.80
919	BiB Grapefruit Erfrischungsgetränk	Kanister	3	2017-02-24	38.40
920	Magermilchpulver	Beutel	1	2017-02-09	10.45
921	Ananas Erfrischungsgetränk Konz	Kanister	5	2017-03-24	62.00
922	Cranberry Erfrischungsgetränk Konz	Kanister	5	2017-03-10	64.00
923	Apfel Erfrischungsgetränk Konz	Kanister	5	2017-03-23	62.00
924	Eistee Erfrischungsgetränk Konz	Kanister	5	2017-03-14	62.00
925	Himbeer-Zitrone Konzentrat	Kanister	5	\N	62.00
926	Apfel Erfrischungsgetränk Konz	Kanister	5	2017-03-23	62.00
927	Ananas Erfrischungsgetränk Konz	Kanister	5	2017-03-24	62.00
928	Cranberry Erfrischungsgetränk Konz	Kanister	5	2017-03-10	64.00
929	Eistee Erfrischungsgetränk Konz	Kanister	5	2017-03-14	62.00
930	Himbeer-Zitrone Konzentrat	Kanister	5	\N	62.00
931	Eistee Pfirsich	BiB	3	2017-05-16	26.10
932	Tassenpudding Vanille	Eimer	2.29999999999999982	2017-05-02	29.90
933	Kartoffelsuppe	Eimer	2	2017-04-06	37.00
934	Kräuter-Joghurt Salatz.	eimer	5	2017-04-07	20.00
935	Blutorange Erfrischungsgetränk	BiB	3	2017-05-10	38.40
936	Karotten	Kiste	1.5	\N	2.00
937	Brot	kg	1	\N	3.50
938	Brot	kg	0.5	\N	1.75
939	Brot	kg	0.5	\N	1.75
940	Brioche	Stk.	0.0800000000000000017	\N	1.00
941	Brot	kg	0.5	\N	1.75
942	Brioche	Stk.	0.0800000000000000017	\N	1.00
943	Milchzopf	Stk.	0.400000000000000022	\N	3.90
944	Brot/Gebäck	Karton	3	\N	4.00
945	Brot/Gebäck	Karton	3	\N	12.00
946	Brot/Gebäck	Karton	3	\N	12.00
947	Brot/Gebäck	Karton	3	\N	12.00
948	Brot/Gebäck	Karton	3	\N	12.00
949	Brot/Gebäck	Karton	3	\N	12.00
950	Brot/Gebäck	Karton	3	\N	12.00
951	Brot/Gebäck	Karton	3	\N	12.00
952	Brot/Gebäck	Karton	3	\N	12.00
953	Brot	kg	1	\N	4.00
954	Brot	kg	1	\N	4.00
955	Knödelbrot	kg	1	\N	1.00
956	Brot	kg	1	\N	4.00
957	Brot	kg	1	\N	4.00
958	Brot/Gebäck	kg	1	\N	4.00
\.


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 178
-- Name: article_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('article_article_id_seq', 958, true);


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
133	1022 	Wien
134	83395	Freilassing
135	83278	Traunstein
136	5061	Salzburg
137	5164	Seeham
138		Salzburg
139	83329	WAGING AM SEE
140	5162 	Obertrum
141	5205	Holzegg
142	5020	Bergheim
143	5102 	Anthering
144	55129	Mainz
145	94315	Straubin
146	94315	Straubing
147	5101	Salzburg / Bergheim
148	5071 	Wals-Siezenheim
149	1100	Wien
150	5421	Adnet
\.


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 187
-- Name: city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('city_city_id_seq', 150, true);


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
10	19	11	info@gartechnik-anner.com
547	617	11	bachleitner@sbg-bauernbund.at
903	561	10	salzburg@jufa.eu
1102	764	10	stadler@rsnetz.at
496	641	11	h_oszvald@at.ibm.com
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
851	368	10	w.oetzlinger@t-online.de
909	305	11	johannes.brandl@sbg.ac.at
33	57	11	ah-kueche@wals-siezenheim.at
35	62	11	brigitte.buchacher@laube.at
36	67	10	vitaveda@t-online.de
38	70	11	daniel.chladek@credit-suisse.com
39	71	11	office@verein-viele.at
40	72	11	bernhard.denk@daimlerchrysler.com
1103	765	10	stadler@rsnetz.at
802	121	10	frauenschuh@hotmail.com
43	76	10	K.Descho@gmx.at
44	78	11	daniel.dinter@seekirchen.at
803	120	10	claudia.frauenschuh@hotmail.com
47	83	10	arthur.domig@isbb.at
48	84	11	office@salzburg-patisserie.at
853	647	11	brigitta.pallauf@salzburg.gv.at
959	673	10	fr.hurch@aon.at
51	87	11	office@swh-strasswalchen.at
645	330	10	elke.mayer@newsclub.at
910	53	10	johannes.brandl@sbg.ac.at
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
854	389	10	i_pfingstl@hotmail.com
77	137	11	annemarie.geierstanger@bergader.de
78	138	11	info@geisslercosmetics.at
79	139	11	ws-steindorf@lebenshilfe-salzburg.at
1104	766	10	Alexander.Koppensteiner@reckittbenckiser.com
82	143	10	geli.goller@sbg.at
83	144	11	goellner@geislinger.com
85	146	11	antonia.goetzendorfer@salzburg.gv.at
91	150	11	grasser@innovationswerkstatt.at
92	151	11	e.grasshof@salzburger.hilfswerk.at
93	153	11	gemeinde@thalgau.at
94	155	11	johann.griessner@lamprechtshausen.at
95	156	11	wh-gruberstrasse@lebenshilfe-salzburg.at
96	157	10	davidgross84@yahoo.de
855	399	10	karin.pokorny@live.at
98	159	11	salzburg@bastians-baecker.at
99	161	10	john.grubinger@sol.at
104	170	11	exit7@caritas-salzburg.at
105	171	11	ah-kueche@wals-siezenheim.at
106	172	11	christine@glaseritalia.com
107	174	11	office@qimiq.com
108	176	11	info@haltrich-immobilien.at
110	178	11	kanzlei@hanifle.at
111	181	11	rudolf.harner@sos-kinderdorf.at
112	183	11	salzburg@schenker.at
570	615	10	togi@gmx.at
115	189	11	office@essen-und-leben.at
116	190	10	reiniphysio@aon.at
117	191	10	tafel.reichenhall@mail-buero.de
804	136	10	thomas@geierspichler.com
119	194	11	kueche@rettet-das-kind-sbg.at
120	195	11	gabriele.hemetsberger@seekirchen.at
121	193	11	gemeinde@groedig.at
123	197	11	office@anderskompetent.at
124	199	11	swh-koestendorf@sbg.at
571	397	10	m.pointner@espara.com
806	145	10	richard.goelzner@aon.at
591	654	10	thomas.klein@wild-sau.com
125	200	10	stefanie-marie.herzog@aon.at
126	202	10	huizei@sbg.at
127	203	10	hinterhauser@dorfbeuern.salzburg.at
130	211	10	hof.cat@utanet.at
131	213	11	hofinger@ora-international.at
132	213	11	ora@ora-international.at
133	214	11	Schwesterrita@Halleiner-Schwestern.net
808	147	10	franz.grabmer@aon.at
807	147	11	stiftsbaeckerei@aon.at
687	498	11	clemens.sedmak@sbg.ac.at
810	672	11	gerhard@grosschaedl-immo.at
811	158	11	groetzinger@evangelischeallianz.at
812	165	10	irmin.gundl@aon.at
813	167	11	d.gutschi@salzburger.hilfswerk.at
814	177	11	esther.handschin@emk.at
815	184	10	w.haslauer.priv@hotmail.com
138	219	11	kueche@sz-fre.awo-obb.de
139	222	11	fluechtlingshaus@caritas-salzburg.at
141	223	11	bernd.hoertnagl@sfvertrieb.at
904	341	11	Mitgutsch@oevp-sbg.at
856	402	10	johann.pongruber@sbg.at
145	227	11	a.huber@salzburg.gv.at
905	668	10	s.huber55@gmx.de
148	230	11	kueche.sh.golling@salzburg.at
817	215	10	g.hoelscher@aon.at
816	215	10	ginandtonic@aon.at
1023	502	11	angela.simmel@rvs.at
1107	533	10	gsulzer@foto-sulzer.at
157	245	11	office@awh-eugendorf.at
502	633	11	beranek@oekosozial.at 
160	251	11	infra.at@poyry.com
165	257	11	kirchgatterer@swh.kh.abtenau.at
858	415	11	h.rabl@salzburgfestival.at
167	260	11	sklabuschnig@winklhof.at
168	261	10	Hannes.Kletzl@gmx.net
906	721	10	buero@richter-medienservice.de
170	263	11	kindergarten@lebenshilfe-salzburg.at
171	266	10	ikohl@inode.at
961	75	10	g.derler@wasi.tv
175	271	11	brigitte@baeckerei-schmidhuber.at
860	426	11	wolfgang.reiger@ifm.ac
178	274	11	Alexander.Koppensteiner@reckittbenckiser.com
180	277	11	hausmirjam@aon.at
181	278	11	gemeinde@strasswalchen.at
986	734	11	chef@sternbrau.at
183	281	11	juergen.kreuzsaler@quehenberger.com
184	282	11	alexander.kribus@at.ibm.com
185	285	11	gertraud.kronberger@laube.at
186	286	11	winter.nost@caritas-salzburg.at
187	287	10	l.laimboeck@sbg.at
189	290	10	petra.landschuetzer@nuernberger.at
190	291	11	a.landsteiner@donauversicherung.at
861	432	10	reiter.maria@a1.net
192	293	11	ruth.langer@sportimpuls.at
193	295	11	mlaserer@wks.at
862	435	10	roswitha.resch@gmx.at
197	300	10	Gertraud.Leimueller@gmx.net
198	301	11	qm@feinkost-leitinger.at
199	302	10	h.leitner@hcm.at
200	303	11	klaus.leitner@metro.at
201	304	11	office@qimiq.com
203	306	10	danielalinke@hotmail.com
908	701	11	walter.schnitzhofer@spaengler.at 
205	309	11	janos.lobos@innocentdrinks.de
207	311	11	office@lorentschitsch.at
208	312	11	bettina.lotterhos@wiberg.eu
209	313	11	office@verein-viele.at
211	316	11	sh-hellbrunn@stadt-salzburg.at
212	317	11	info@wiff-essen.at
213	318	11	buergermeister@wals-siezenheim.at
215	321	11	martin.mallinger@hipp.de
216	322	11	r.maly@panundco.com
217	323	11	office@clearwhite.com
218	324	11	e.mang@salzburg.co.at
219	326	11	Maria.Marx@neustart.at
998	228	10	wolfgang.huebl@aon.at
820	221	11	hoerl@grossglockner.at
223	334	11	roland.mayrhofer@biofit.at
224	335	11	seniorenwohnhaus@neumarkt.at
225	335	11	mayrhofer@neumarkt.at
226	336	11	martin.melzer@miele.at
512	549	10	tina.tscherteu@sbg.at
228	339	11	office@salzburg-patisserie.at
229	340	11	herwig.mikutta@salzburgerlandwirtschaft.at
865	651	10	bernhard.rosegger@aon.at
232	344	11	office@drink-green.com
235	346	11	kurt.molterer@nuernberger.at
912	552	10	m.ullmann@yahoo.com
238	349	11	johann.moesl@gittis.at
866	453	10	r.sachsenhofer@aon.at
867	649	10	leonhard.schitter@sbg.at
913	28	10	baier.elfi@aon.at
243	354	11	stefanie.neubauer@gittis.at
868	478	11	josef.schoechl@salzburg.gv.at
247	360	11	haus-maria@salzburg.co.at
248	360	11	verwaltung.haus-maria@gemgilgen.at
249	362	11	neuland.salzburg@promenteplus.at
821	225	10	huberjohanna@gmx.net
1075	752	11	Josef.Kendlbacher@schweighofer-fiber.at
251	364	11	wh-gruberstrasse@lebenshilfe-salzburg.at
252	365	10	brigitte.nussdorfer@hotmail.com
254	369	11	vs-hallein-burgfried@salzburg.at
869	490	10	wolfgangschwaiger@gmx.at
259	379	11	b.pallauf@pms-law.at
260	379	11	brigitta.pallauf@salzburg.gv.at
262	383	11	sabine.paulitsch@sos-kinderdorf.at
915	216	10	g.hoelscher@aon.at
264	385	10	e.petzelsberger@gmx.at
914	216	10	ginandtonic@aon.at
266	390	11	tpichler@lp-logistik.at
822	229	10	johannes.hubmann@reflex.at
649	666	11	r.goetz@bonduelle.com
871	505	10	srjoanellasix@yahoo.de
652	255	11	martin.schmidbauer@neustart.at
1078	491	10	christoph.schwaiger@at.ibm.com
872	506	10	maria.slowak@sbg.at
873	525	10	ek.stoellinger@gmx.at
1079	757	11	manuela.rindler@gw-world.com
874	526	10	ek.stoellinger@gmx.at
1080	758	11	t.gassner@gassner-gastronomie.at
875	531	11	c.struber@salzburg-wohnbau.at
268	392	11	office@pieper-biokosmetik.at
269	393	10	g.pirchner@aon.at
270	395	10	kraller@xp8.de
271	396	11	g.pockenauer@gramiller.at
274	401	11	office@schoko.at
277	407	11	susanne.prieth@sos-kinderdorf.at
916	726	10	ransmayr@gmx.at
279	409	11	rebecca.promersberger@spitz.at
281	412	10	m.pum@aon.at
282	413	11	h.purgstaller@salzburger.hilfswerk.at
283	414	11	direktion@inselsalzburg.at
285	416	11	b.radwanovsky@salzburger.hilfswerk.at
286	417	11	office@salzburg-patisserie.at
287	419	11	office@verein-viele.at
917	375	10	gudrun@ostermayer.at
1109	761	10	petra.mitiska@asalis.de
290	427	11	n.reinhardt@gourmet-express.at
291	428	10	reinthalerg@gmx.at
292	429	10	ludwig.reisinger@gmx.at
296	437	11	k.resl@donauversicherung.at
297	439	11	gottfried.rettenegger@lk-salzburg.at
298	440	10	revertera@gmx.at
301	442	11	F.Riedl@Wirtschaftsbund-Sbg.at
302	443	11	kueche@rettet-das-kind-sbg.at
303	444	11	riesner@neumarkt.at
1110	767	10	martin.mayrhofer@netzmuehle.at
306	447	11	office@schoko.at
307	448	11	h.roither@palfinger.com
308	449	10	rcm47@aon.at
309	450	11	madeleine.rosenlechner@qimiq.com
918	692	11	schwaiger@salzburg.gv.at
312	459	11	johann@schallmoser-fleisch.at
313	462	10	scheliessnig@gmx.at
314	463	11	michaela.scheliessnig@salzburg.com
315	464	11	claudia.scheucher@stiegl.at
316	466	11	franz.schindecker@zaltech.com
317	467	11	schinwald@poelzleitner.at
318	470	11	Andrea.Schmid@caritas-salzburg.at
319	473	11	kueche@pwlh.de
919	141	11	silvia@gmachl.at
322	480	11	Renate.Schoenmayr@sbg.ac.at
324	483	11	Alexander.Schrank@stadt-salzburg.at
325	484	10	Kaspanien@hotmail.com
326	485	10	elisabeth.schreiner@tele2.at
327	486	11	I.Schulte@iv-net.at
328	487	10	piti.schuster@a1.net
330	488	11	buergermeisterin@seekirchen.at
331	489	11	schwaiger@salzburg.gv.at
333	493	11	schwap.f@milch.com
334	495	11	h.schwarz@gourmet-express.at
745	691	11	thomas.kerschbaum@salzburg.gv.at  
920	408	10	office@1a-assistentin.at
825	242	10	schafrj@aon.at
339	503	11	erwin.simmer@stadt-salzburg.at
343	507	11	manuela.sokolt@unilever.com
344	508	11	heidemarie.spannlang@stadt-salzburg.at
345	510	11	bernhard.spiegel@sos-kinderdorf.at
346	514	11	exit7@caritas-salzburg.at
922	391	10	pichlmaiers@aon.at
355	528	11	johann.strasser@gem-eugendorf.at
358	530	11	kindergarten@lebenshilfe-salzburg.at
360	532	11	kueche@kolpinghaus-salzburg.at
361	534	11	clearing-house.salzburg@sos-kinderdorf.at
362	535	11	neuland.salzburg@promenteplus.at
363	536	11	office@swh-strasswalchen.at
364	537	11	immo@immobilien-teichmann.at
365	539	11	gabriele.teufl@salzburg.gv.at
366	540	11	office@frauenhaus-salzburg.at
368	542	11	t.thoeny@salzburger.hilfswerk.at
826	246	10	minni.karres@yahoo.com
579	93	11	ingrid.ebner@caritas-salzburg.at
371	548	11	c.trausnitz@adhurricane.com
373	550	10	rturbinsky@aon.at
374	551	10	udvarhel@gmail.com
376	553	10	alfred.unterberger@salzburg.at
377	554	11	familienbuero@strasswalchen.at
378	554	10	leo.kirchtag@gmx.at
381	560	11	buergermeister@obertrum.at
382	559	11	daniela.wallner@lk-salzburg.at
388	568	11	seniorenheim@bergheim.at
389	569	11	direktion@inselsalzburg.at
390	570	11	Werner.Weinguny@quehenberger.com
391	572	10	eva.weissenbacher@utanet.at
394	577	11	adelheid.widmoser@lk-salzburg.at
397	581	10	david_wieser1@hotmail.com
398	583	11	franz.wieser@salzburg.gv.at
399	584	10	gudrun.wilhelm@gmx.at
400	585	11	office@volkshilfe-salzburg.at
402	589	11	info@wiberg.eu
827	248	10	oskar.kaufmann@fcgoe.at
747	693	11	michael.unterberger@salzburg.gv.at
828	258	11	e.kislinger@stahlbau.at
829	262	10	w.klima@sbg.at
830	267	10	veronika.kois@hotmail.com
876	661	10	eh.thaler@aon.at
877	541	10	monika.thonhofer@sbg.at
879	557	10	andrea.waldmann@gmail.com
880	558	10	t.wallerstorfer@gmail.com
881	563	11	ch.wawra@adhurricane.com
882	564	11	wawra@adhurricane.com
883	567	10	weber_franz@hotmail.com
884	575	10	iwerdenich@gmx.at
885	582	10	armin.wieser@sbg.at
886	655	10	rudolf@zrost.eu
890	723	10	stumtner@menschen-leben.at
891	384	11	c.petschl@salzburger.hilfswerk.at
892	515	11	stampfer@oevp-sbg.at
893	30	11	office@bauer-thuerridl.at
894	683	10	paul.lindner@gmx.at
404	592	11	alois.wittinghofer@generali.at
405	594	11	qm@feinkost-leitinger.at
1111	768	10	dmayer@extrabooking.com
411	604	10	testUser@test.test
413	1	10	mschnoell@gmx.net
414	605	11	test.persona@view-salzburg.at
415	605	10	test.persona@gmail.at
748	694	11	isabella.neutatz@nannerl.at
419	606	11	manfred.kiesenhofer@sozialmarkt.at
421	608	10	wimmer.erika@t-online.de
423	21	10	kraller@xp8.de
422	21	11	teisendorfer-tafel@t-online.de
963	405	10	bruno.prantl@zell-net.at
425	232	10	fr.hurch@aon.at
427	609	11	PE@gittis.at
921	591	10	elisabeth.apfelthaler@inode.at
432	119	10	anna.fratt@aon.at
1081	759	11	marion.mueller@teekanne.at
437	611	11	j.weisser@commend.com
438	371	11	presse@dm-drogeriemarkt.at 
439	168	11	gemeinde@lamprechtshausen.at
440	612	10	manuela.spiessberger@heffterhof.at
443	69	10	v.canaval@aon.at
447	196	10	mediaconsulting@a1.net
449	224	11	nicole.huber@punktlandung-kommunikation.com
895	504	10	biggrisi@gmail.com
452	333	10	sabine@mayrhofer.cc
453	347	11	mooshammer@intercargo.at
454	337	11	eva.mentl@stud.sbg.ac.at
896	24	10	christian.atanassoff@gmx.at
460	481	10	eduard.schoepfer@gmx.at
967	315	11	elfriede.mackinger@stiegl.at
968	315	10	
464	517	10	annamaria.steiner@sol.at
467	580	11	office@absa.at
468	125	11	vfvoffice@web.de
469	11	11	hram@pokrovsbg.ru
471	289	10	luise.petry@freenet.de
472	619	11	sletsch@bonduelle.com
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
753	698	11	MErtl@lbs5.salzburg.at 
490	587	11	elisabethallein@gmx.at
491	637	11	bernadette.hawel@wko.at
492	638	11	DStojakovic@werner-mertz.com
493	640	11	bernd.huber@stadt-salzburg.at
898	446	10	conny_robl@yahoo.de
529	648	11	kurt.schiechl@lebenshilfe-salzburg.at
531	650	11	Petra.Ummenberger@miele.at
532	169	11	fluechtlingshaus@caritas-salzburg.at
656	358	10	christl@neurauter.at
987	22	10	ilse.asen@sbg.at
988	44	10	anita.bernhofer@sol.at
754	700	11	lukas.schwingenschuh@herzjesugym.at
831	268	10	helmut@koellensperger.at
755	702	11	jacoby.sonja@jacoby-gm.at
756	703	11	josef.prantler@bodengraf.com
757	707	11	silvia.scherhaufer@boku.ac.at
832	269	10	reiter.maria@a1.net
658	665	10	ebner_mario@hotmail.com
758	192	11	Hemetsberger@oevp-sbg.at
902	643	11	Hugo.Rohner@skidata.com
989	100	10	einzinger.sbg@aon.at
833	270	10	reinhold.kolm@gmx.at
901	643	10	hugorohner@hotmail.com
834	272	10	hermi.koenig@yahoo.de
990	100	11	oskar.einzinger@view-salzburg.at
991	140	10	g.giesswein@a1.net
836	297	10	inge.lederer@aon.at
762	709	10	ankadi@aon.at
763	711	10	claudia.schmidt@ep.europa.eu
837	652	10	drhleube@gmx.net
764	712	10	gudrun.kugler@kairos-pr.com
992	149	11	christa.graf@view-salzburg.at
993	149	11	christa.graf@leube.at
665	670	10	war51@aon.at
765	713	10	w.antosch@antosch.at
766	714	10	c.thoeni@bestofsalzburg.org
995	185	11	
994	185	10	grete.hauswiesner@hotmail.com
667	671	11	office@kinderparties.at  
996	208	10	hhitsch@gmx.at
997	209	10	fmhofbauer@yahoo.de
604	658	11	e.frauscher@gourmet-express.at
605	659	11	unikum@jufa.eu
606	660	11	sabine@mayrhofer.cc
1112	769	10	office@barkinsulation.com
1033	737	11	angela.simmel@rvs.at
1032	737	10	angela.simmel@gmail.com
1113	770	10	office@barkinsulation.com
625	319	11	petra.knoll@kaesehof.at
767	669	10	Anna.Viehhauser@Schoko.at
768	296	11	seelsorge.altenheime@pfarre.kirchen.net
1034	381	11	 christian.subera@spedition-eberl.de
769	376	11	helmut.suhrer@lbsheim-hallein.salzburg.at
923	148	11	marijana.grabovac@stud.sbg.ac.at
840	310	11	bl@lorentschitsch.at
771	240	11	edwin.jung@fcgoe.at
629	34	10	wolfbaur@gmx.at
630	34	11	wolf.baur@view-salzburg.at
924	727	10	sperlw@aon.at
971	680	11	tine@innovationswerkstatt.at
842	343	10	h.moedlhammer@sbg.at
1035	307	10	lixl.hubert@tele2.at
843	348	11	sr.erika@bhs-sbg.at
973	735	11	VGrafinger@qvinstitute.org 
773	410	11	pruegger@oberndorf.salzburg.at
1037	292	10	erika.lange8@gmail.com
774	373	10	wilhelm.ortmayr@drei.at
700	676	11	birgit.schmauss@anderskompetent.at
845	351	11	alois.navara@zobl-bauer.at
701	677	11	monika.stoeckl@sos-kinderdorf.at
775	715	11	daniela.braun@bonduelle.com
776	597	10	maria.zeppezauer@zeppezauer.at
702	675	11	lager-traunstein@bergader.de
846	352	10	nechys@utanet.at
777	628	11	christina.laggner@at.ibm.com
778	705	11	nikolaus.lienbacher@lk-salzburg.at
975	27	10	h.badzong@gmx.at
847	353	10	nechys@utanet.at
642	80	10	johannes.ditz@wwv.at
779	716	10	mariareitinger@live.at
643	226	10	sv-huber@sbg.at
780	717	11	christine.hochholdinger@bmlfuw.gv.at
705	678	11	sabine.wolfsgruber@umweltservicesalzburg.at
848	356	11	neuhofer@oevp-sbg.at
781	718	11	k.katstaller@wirtschaftsbund-sbg.at
1039	738	11	hayat.hallein@menschen-leben.at
782	719	11	c.pucher@wirtschaftsbund-sbg.at
849	359	10	michael.neureiter@salzburg.at
783	720	10	h.weiss@wirtschaftsbund-sbg.at
707	656	10	safu1608@gmail.com
784	545	11	pv-laufen@erzbistum-muenchen.de
1040	739	10	thomas.kletzl@gmx.at
1041	345	10	moldovandoina@gmail.com
710	679	11	dominik@chaka2.com 
786	667	10	elfriede.binder@apupa.at
1042	253	11	albert.kiefel@view-salzburg.at
1043	253	10	albert.kiefel@gmail.com
1045	607	10	tina.widmann@gmail.com
715	681	10	llorentschitsch@yahoo.de
1046	740	10	werner.russ@gmail.com
716	682	10	scheibner.barbara@web.de
1048	644	10	alois.schwaiger@aon.at
719	685	10	tatjana.oppitz@at.ibm.com
791	17	10	anna.aminger@gmx.at
792	36	10	
793	36	10	regina.bayer-volkmann@pappas.at
1050	742	11	rudi.krepper@tkl.at
723	688	11	peter.haber@fh-salzburg.ac.at
1051	744	11	michael.mayerhofer@transgourmet.at
724	686	11	doris.walter@fh-salzburg.ac.at
1052	725	10	elisabeth.hoerl@gmx.net
725	687	11	christine.vallaster@fh-salzburg.ac.at
796	81	10	ingrid.doblinger@a1.net
726	624	11	gerhard.joechtl@fh-salzburg.ac.at
797	85	10	cd@dreyer.at
935	731	10	elisabeth.apfelthaler@inode.at
727	689	11	helga.lmg@gmail.com
728	689	10	helga.frauenlob@aon.at
798	94	10	johanna.ebner@fcg-buermoos.at
1053	745	10	gabriela.moretti-prucher@hyposalzburg.at
936	86	10	wolfgang.duernberger@lk-salzburg.at
799	674	10	office@feichtinger.com
800	674	10	info@feichtinger.com
1055	367	10	koberholzer@wks.at
938	519	11	michael.steingassner@view-salzburg.at
939	519	10	michael@steingassner.net
940	732	10	a_grabner@hotmail.com
1056	746	11	k.hoehn@gourmet-express.at
941	733	10	a_grabner@hotmail.com
1057	747	10	mbg-sbg@aaaberatung.at
1058	748	10	mbg-sbg@aaaberatung.at
943	729	10	r.steinhagen@palfinger.com
1059	743	10	hofer@klartext-pr.at
1060	750	10	Bernhard-Pichler@gmx.at
1061	722	10	j.boeck@menschen-leben.at
945	18	10	ruth.amon@gmx.at
946	424	10	ra.reichl@inode.at
1063	273	11	g.konklewski@salzburger.hilfswerk.at
1064	458	11	peter.schafleitner@gw-world.com
1065	634	10	mganauser@ios-salzburg.com
950	728	10	pribilreini@hotmail.com
1067	749	10	office@menschmayr.at
952	238	10	b.januschewsky@gmx.at
1068	751	11	fischer@gfb-partner.at
954	51	10	brigitte.d@sbg.at
1071	754	11	gmunden@wkooe.at
1072	755	11	heinz.spitzauer@htl-salzburg.ac.at
956	350	11	info@ncm.at
1073	756	11	a.greiner@iv-net.at
957	363	10	niese@gmx.at
1001	252	11	info@view-salzburg.at
1002	252	11	doris.kiefel@view-salzburg.at
1074	753	11	walter.kogler@schweighofer-fiber.at
1005	616	10	p.nussbaum@aon.at
1006	430	10	sabrina.reiter@gmx.at
1082	760	10	strasser-trading@sbg.at
1007	441	10	beggner@yahoo.com
1008	441	11	b.ricciotti@view-salzburg.at
1009	445	11	walter.riezinger@view-salzburg.at
1011	529	10	r.strehl@tele2.at
1012	546	10	tomfe54@gmx.at
1013	642	10	lisa_traubenek@yahoo.de
1014	642	10	lisa_traubenek@yahoo.de
1016	574	10	ulrike.wenzlhuemer@gmx.at
1015	574	11	ulrike.wenzlhuemer@view-salzburg.at
1088	244	11	trude@kaindl-hoenig.com
1087	244	10	
1017	602	10	sabine.zoepfl@gmx.at
1089	241	10	johann@jungreithmair.at
1095	710	10	
1094	710	10	office@dreiseengalerie.at
1097	762	10	m.herbst@xlink.at
1101	763	10	stadler@rsnetz.at
\.


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 193
-- Name: email_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('email_email_id_seq', 1113, true);


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
539	242	540	0	50
540	243	541	2	20
541	243	542	1	24
542	243	543	0	62
543	244	544	0	20
544	245	545	2	2
545	245	546	1	50
546	245	547	0	30
547	246	548	0	8
548	241	549	0	5
549	241	550	1	1
551	247	552	0	300
552	248	553	9	3
553	248	554	1	150
554	248	555	2	38
555	248	556	8	2
556	248	557	7	34
557	248	558	3	18
558	248	559	6	15
559	248	560	0	155
560	248	561	5	19
561	248	562	4	20
562	249	563	1	30
563	249	564	3	2
564	249	565	2	15
565	249	566	0	30
566	250	567	0	10
567	251	568	2	10
568	251	569	1	28
569	251	570	0	14
570	252	571	0	9
571	253	572	0	3
572	254	573	0	3
573	255	574	0	3
574	256	575	0	19
575	256	576	2	1
576	256	577	1	21
577	257	578	0	11
578	258	579	0	21
579	259	580	0	3
580	260	581	0	23
581	261	582	0	30
582	262	583	1	2
583	262	584	0	9
584	262	585	7	4
585	262	586	3	4
586	262	587	4	15
587	262	588	6	55
588	262	589	5	9
589	262	590	8	8
590	262	591	2	4
591	263	592	0	250
592	264	593	0	9
593	264	594	1	12
594	264	595	2	8
595	265	596	0	30
597	267	598	0	30
598	268	599	1	10
599	268	600	0	21
600	269	601	0	3
601	270	602	1	50
602	270	603	2	16
603	270	604	0	34
604	271	605	0	50
605	272	606	0	40
606	273	607	1	10
607	273	608	2	9
608	273	609	0	30
609	274	610	2	3
610	274	611	3	34
611	274	612	0	4
612	274	613	1	27
613	275	614	0	20
614	276	615	0	15
615	277	616	0	30
618	279	619	0	3
621	282	622	0	4
622	283	623	0	3
623	284	624	0	3
624	285	625	0	78
616	278	617	0	69
620	281	621	0	40
626	286	627	1	90
627	287	628	0	51
628	288	629	0	59
629	288	630	1	8
630	288	631	3	7
631	288	632	2	53
632	289	633	0	15
666	292	667	1	2
667	292	668	2	39
668	292	669	0	8
763	326	764	0	145
764	327	765	1	16
765	327	766	0	17
669	290	670	6	2
670	290	671	5	11
671	290	672	2	5
672	290	673	3	18
673	290	674	7	5
674	290	675	1	3
675	290	676	4	4
676	290	677	0	13
677	290	678	8	10
678	293	679	0	100
679	294	680	1	10
680	294	681	0	49
681	295	682	0	20
682	296	683	0	20
683	297	684	3	15
684	297	685	0	31
685	297	686	1	21
686	297	687	2	1
687	298	688	0	160
688	298	689	1	70
689	299	690	0	49
690	300	691	0	170
691	301	692	1	11
692	301	693	2	9
693	301	694	0	5
694	302	695	1	19
695	302	696	0	227
696	303	697	1	18
697	303	698	7	4
698	303	699	9	4
699	303	700	8	2
700	303	701	3	3
701	303	702	4	12
702	303	703	6	7
703	303	704	5	9
704	303	705	0	3
705	303	706	2	2
706	304	707	0	51
707	304	708	2	50
708	304	709	1	19
710	305	711	2	109
711	305	712	0	89
712	306	713	0	27
713	307	714	2	8
714	307	715	0	32
715	307	716	1	10
716	308	717	0	4
718	309	719	0	3
719	310	720	2	19
720	310	721	1	24
721	310	722	0	2
727	311	728	0	108
728	311	729	2	1
729	311	730	1	12
730	311	731	3	1
731	311	732	4	5
733	312	734	0	10
735	313	736	0	15
736	314	737	0	25
737	314	738	1	14
738	315	739	0	9
739	316	740	1	221
740	316	741	0	133
741	317	742	0	70
742	318	743	0	15
743	319	744	1	6
744	319	745	0	8
746	320	747	0	26
745	320	746	1	91
747	320	748	2	117
748	320	749	3	25
749	321	750	0	138
750	322	751	0	5
751	322	752	1	149
752	323	753	2	270
753	323	754	1	6
754	323	755	0	25
755	324	756	1	2
756	324	757	0	135
766	328	767	0	300
767	325	768	0	84
768	325	769	4	3
769	325	770	1	7
770	325	771	2	76
771	325	772	5	700
772	325	773	3	31
773	329	774	0	220
774	329	775	1	210
775	330	776	0	9
776	331	777	0	2
777	332	778	0	10
778	333	779	0	24
779	334	780	0	30
780	334	781	1	33
781	335	782	2	22
782	335	783	1	30
783	335	784	0	30
784	336	785	0	5
785	337	786	0	4
786	338	787	0	4
787	339	788	0	3
788	340	789	0	4
789	341	790	0	26
791	342	792	2	22
792	342	793	0	20
793	342	794	1	18
794	343	795	0	24
795	344	796	0	34
796	344	797	1	20
797	345	798	0	5
798	346	799	0	3
799	347	800	0	7
800	348	801	0	6
801	349	802	2	50
802	349	803	1	30
803	349	804	0	30
804	350	805	1	14
805	350	806	0	17
806	351	807	0	8
809	354	810	0	20
810	355	811	0	15
811	356	812	0	15
812	357	813	0	9
813	358	814	0	15
814	352	815	0	15
815	353	816	0	12
816	359	817	0	100
817	360	818	0	8
818	361	819	0	4
819	362	820	0	6
820	363	821	0	6
625	286	626	0	156
709	305	710	1	186
828	365	829	0	80
825	364	826	1	20
826	364	827	2	5
827	364	828	0	18
832	366	833	1	60
833	366	834	0	60
834	366	835	2	70
835	367	836	0	24
836	367	837	2	3
837	367	838	1	40
838	368	839	0	9
839	368	840	4	1
840	368	841	7	7
841	368	842	5	1
842	368	843	2	1
843	368	844	3	1
844	368	845	6	7
845	368	846	1	17
846	369	847	0	443
847	370	848	0	1
848	370	849	5	5
849	370	850	8	2126
850	370	851	1	9
851	370	852	3	1
852	370	853	7	43
853	370	854	4	35
854	370	855	6	27
855	370	856	2	7
856	371	857	0	910
857	371	858	1	1250
858	372	859	0	30
859	373	860	0	1
860	374	861	0	51
861	374	862	1	20
862	375	863	0	20
863	376	864	0	20
864	376	865	1	19
865	377	866	0	69
866	377	867	2	1
867	377	868	1	35
869	378	870	1	14
868	378	869	0	18
870	379	871	0	20
871	380	872	3	20
872	380	873	1	35
873	380	874	2	1
874	380	875	0	40
875	381	876	0	29
876	382	877	1	38
877	382	878	3	1
878	382	879	2	18
879	382	880	0	15
880	383	881	0	51
881	384	882	0	14
882	385	883	1	14
883	385	884	0	24
886	386	887	0	37
887	387	888	0	34
888	388	889	2	19
889	388	890	0	30
890	388	891	1	39
891	389	892	0	6
892	390	893	0	4
893	280	894	0	299
894	391	895	0	250
895	392	896	2	13
896	392	897	0	7
897	392	898	1	21
898	393	899	0	15
899	394	900	0	15
900	395	901	0	19
901	395	902	3	1
902	395	903	1	8
903	395	904	2	11
904	396	905	0	15
905	397	906	1	1800
906	397	907	0	618
907	398	908	0	426
908	399	909	0	113
909	400	910	0	74
910	401	911	0	30
911	402	912	0	338
912	403	913	0	71
913	404	914	4	67
914	404	915	1	3
915	404	916	3	377
916	404	917	5	17
917	404	918	2	7
918	404	919	0	16
919	404	920	6	45
925	405	926	0	53
926	405	927	4	77
927	405	928	1	3
928	405	929	3	13
929	405	930	2	1
930	406	931	3	1
931	406	932	2	2
932	406	933	1	19
933	406	934	0	2
934	406	935	4	46
935	407	936	0	1
936	408	937	0	30
938	409	939	0	33
939	409	940	1	25
940	410	941	0	33
941	410	942	1	10
942	410	943	2	2
943	411	944	0	3
944	412	945	0	3
945	413	946	0	2
946	414	947	0	3
947	415	948	0	4
948	416	949	0	6
949	417	950	0	3
950	418	951	0	2
951	419	952	0	6
952	420	953	0	100
953	421	954	0	70
954	421	955	1	10
955	422	956	0	40
956	423	957	0	50
957	424	958	0	250
\.


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 194
-- Name: incoming_article_incoming_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('incoming_article_incoming_article_id_seq', 957, true);


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
84	73	519	0	2015-01-26	WP 4	2015-06-11	1
21	73	519	0	2015-01-23	WP M 06	2015-05-23	1
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
238	31	574	0	2016-01-19	WP U 27	2016-02-14	1
235	108	574	0	2016-01-29	WP U 24	2016-02-14	1
243	262	642	0	2015-12-23	WP L 79	2016-02-17	1
244	108	642	0	2015-12-18	WP L 80	2016-02-17	1
245	197	574	0	2016-01-22	WP U 30	2016-02-19	1
241	263	574	0	2015-11-19	WP U 21	2016-02-19	1
249	197	574	0	2015-11-24	WP U 33	2016-03-21	1
246	108	574	0	2016-01-15	WP U 32	2016-03-21	1
250	108	574	0	2016-01-22	WP U 34	2016-03-21	1
247	261	574	0	2015-12-30	WP U 31 (Original LS verloren - DUPLIKAT)	2016-03-21	1
252	108	574	0	2016-02-05	WP U 36	2016-03-21	1
253	108	574	0	2016-02-12	WP U 37	2016-03-21	1
239	262	574	0	2016-01-22	WP U 28	2016-02-14	1
251	197	574	0	2016-02-05	WP U 35	2016-03-21	1
240	221	574	0	2016-01-22	WP U 29 (orininal LS fehlt - Foto v Durchschlag)	2016-04-09	1
248	119	602	0	2016-03-04	WP S 83	2016-03-13	1
237	119	574	0	2016-01-07	WP U 26	2016-02-14	1
254	108	574	0	2016-02-19	WP U 38	2016-03-21	1
256	197	574	0	2016-02-26	WP U 40	2016-03-21	1
255	108	574	0	2016-02-26	WP U 39	2016-03-21	1
257	261	574	0	2016-01-22	WP U 45	2016-04-08	1
259	261	574	0	2016-01-08	WP U 42	2016-04-08	1
258	261	574	0	2016-01-05	WP U 41	2016-04-08	1
303	119	642	0	2016-06-21	WP L 94	2016-07-07	1
262	119	574	0	2016-02-04	WP U 46	2016-04-08	1
260	261	574	0	2016-01-13	WP U 43	2016-04-08	1
261	261	574	0	2016-01-13	WP U 44 korrekter Lieferant Malteser Freilassing	2016-04-08	1
263	261	574	0	2016-02-11	WP U 47	2016-04-08	1
264	221	574	0	2016-02-11	WP U 48	2016-04-08	1
330	108	574	0	2016-04-08	WP U 65	2016-10-08	1
267	221	574	0	2016-02-25	WP U 50	2016-04-08	1
265	221	574	0	2016-02-17	WP U 49	2016-04-08	1
268	156	574	0	2016-03-01	WP U 51	2016-04-08	1
269	108	602	0	2016-03-25	WP S 84	2016-04-20	1
270	197	602	0	2016-03-16	WP S 85	2016-04-20	1
271	265	602	0	2016-04-01	WP S 86	2016-04-21	1
272	197	602	0	2016-04-20	WP S 87	2016-06-07	1
273	197	602	0	2016-04-08	WP S 88	2016-06-07	1
274	197	602	0	2016-04-26	WP S 89	2016-06-07	1
275	108	602	0	2016-04-01	WP S 90	2016-06-07	1
276	108	602	0	2016-04-29	WP S 91	2016-06-07	1
277	11	602	0	2016-04-22	WP S 92	2016-06-07	1
278	221	602	0	2016-04-22	WP S 93	2016-06-07	1
304	157	642	0	2016-06-28	WP L 95	2016-07-21	1
279	108	602	0	2016-04-22	WP S 94	2016-06-07	1
305	18	642	0	2016-06-28	WP L 96	2016-07-21	1
281	221	602	0	2016-04-29	WP S 96	2016-06-07	1
282	108	602	0	2016-05-06	WP S 97	2016-06-07	1
283	108	602	0	2016-05-13	WP S 98	2016-06-07	1
284	221	602	0	2016-03-18	WP S 99	2016-06-07	1
308	108	642	0	2016-05-20	WP L 98	2016-08-14	1
287	266	602	0	2016-05-27	WP S 102	2016-06-07	1
288	229	602	0	2016-05-17	WP S 103	2016-06-07	1
289	142	602	0	2016-05-13	WP S 104	2016-06-07	1
292	229	642	0	2016-06-07	WP L 83	2016-06-28	1
290	119	642	0	2016-06-01	WP L 81	2016-06-28	1
294	18	642	0	2016-06-20	WP L 85	2016-06-29	1
293	18	642	0	2016-06-07	WP L 84	2016-06-29	1
296	197	642	0	2016-06-14	WP L 87	2016-07-07	1
295	108	642	0	2016-06-10	WP L 86	2016-07-07	1
297	197	642	0	2016-06-25	WP L 88	2016-07-07	1
299	267	642	0	2016-06-23	WP L 90	2016-07-07	1
301	119	642	0	2016-06-22	WP L 92	2016-07-07	1
302	119	642	0	2016-06-21	WP L 93	2016-07-07	1
306	119	642	0	2016-06-01	WP L 82	2016-07-29	1
298	267	642	0	2016-06-23	WP L 89	2016-07-07	1
300	267	642	0	2016-06-20	WP L 91	2016-07-07	1
307	197	642	0	2016-06-07	WP L 97	2016-08-14	1
309	108	642	0	2016-04-15	WP L 99	2016-08-14	1
310	271	642	0	2016-03-29	WP L 100	2016-08-14	1
311	142	642	0	2016-06-10	WP L 101	2016-08-14	1
312	108	574	0	2016-07-01	WP U 52	2016-09-23	1
313	108	574	0	2016-07-08	WP U 53	2016-09-23	1
314	197	574	0	2016-07-12	WP U 54	2016-09-23	1
315	108	574	0	2016-07-15	WP U 55	2016-09-23	1
316	18	574	0	2016-07-01	WP U 56	2016-09-23	1
317	142	602	0	2016-08-23	WP S 105	2016-09-26	1
318	142	602	0	2016-09-05	WP S 106	2016-09-26	1
319	119	602	0	2016-09-05	WP S 107	2016-09-26	1
320	73	602	0	2016-08-09	WP S 108	2016-09-26	1
322	73	574	0	2016-07-15	WP U 57	2016-10-02	1
323	73	574	0	2016-07-19	WP U 58	2016-10-02	1
324	73	574	0	2016-07-26	WP U 59	2016-10-02	1
327	229	574	0	2016-07-27	WP U 62	2016-10-02	1
328	142	574	0	2016-07-18	WP U 63	2016-10-02	1
333	197	602	0	2016-10-21	WP S 110	2017-01-03	1
326	73	574	0	2016-07-26	WP U 60	2016-10-02	1
325	269	574	0	2016-07-28	WP U 61	2016-10-07	1
329	282	574	0	2016-07-06	WP U 64; Lieferant Fam Brüggler, Wagrain	2016-10-07	1
332	108	574	0	2016-07-22	WP U 67	2016-10-08	1
331	108	574	0	2016-05-27	WP U 66	2016-10-08	1
334	197	602	0	2016-10-05	WP S 111	2017-01-03	1
335	197	602	0	2016-09-02	WP S 112	2017-01-03	1
336	108	602	0	2016-10-14	WP S 113	2017-01-03	1
337	108	602	0	2016-10-21	WP S 114	2017-01-03	1
340	108	602	0	2016-09-24	WP S 117	2017-01-03	1
339	108	602	0	2016-09-23	WP S 116	2017-01-03	1
338	108	602	0	2016-10-08	WP S 115	2017-01-03	1
341	197	602	0	2016-10-29	WP S 118	2017-01-03	1
342	197	602	0	2016-08-06	WP S 119	2017-01-03	1
343	197	602	0	2016-10-27	WP S 120	2017-01-03	1
344	197	602	0	2016-08-05	WP S 121	2017-01-03	1
345	108	602	0	2016-08-05	WP S 122	2017-01-03	1
346	108	602	0	2016-10-28	WP S 123	2017-01-03	1
348	108	602	0	2016-09-17	WP S 125	2017-01-03	1
347	108	602	0	2016-06-25	WP S 124	2017-01-03	1
349	197	642	0	2016-11-11	WP L 102	2017-01-28	1
350	197	642	0	2016-12-07	WP L 103	2017-01-28	1
280	18	574	0	2016-04-22	WP S 95	2017-03-14	1
351	108	642	0	2016-11-12	WP L 104	2017-01-28	1
354	108	642	0	2016-12-10	WP L 107	2017-01-28	1
355	108	642	0	2016-12-02	WP L 108	2017-01-28	1
356	108	642	0	2016-11-04	WP L 109	2017-01-28	1
357	108	642	0	2016-12-16	WO L 110	2017-01-28	1
358	108	642	0	2016-11-11	WP L 111	2017-01-28	1
353	108	642	0	2016-12-09	WP L 106	2017-01-28	1
352	108	642	0	2016-11-18	WP L 105	2017-01-28	1
360	108	642	0	2016-07-29	WP L 113	2017-01-28	1
359	142	642	0	2016-12-01	WP L 112	2017-01-28	1
367	286	642	0	2016-11-10	WP L 121	2017-01-28	1
366	141	574	0	2016-12-15	WP L 120 (von Fa.Werner&Mertz)	2017-04-18	1
362	108	642	0	2016-10-07	WP L 116	2017-01-28	1
361	108	642	0	2016-08-12	WP L 115	2017-01-28	1
363	229	642	0	2016-11-09	WP L 117	2017-01-28	1
365	285	642	0	2016-12-29	WP L 119	2017-01-28	1
364	229	642	0	2016-12-13	WP L 118	2017-01-28	1
413	108	602	0	2017-03-31	WP S 152	2017-06-12	1
372	11	602	0	2016-08-31		2017-02-01	1
373	108	602	0	2016-03-11	WP S 132	2017-02-02	1
374	197	602	0	2016-06-16	WP S 133	2017-02-02	1
375	11	602	0	2016-07-08	WP S 134	2017-02-02	1
376	197	602	0	2016-07-05	WP S 135	2017-02-02	1
377	197	602	0	2016-06-09	WP S 136	2017-02-02	1
378	197	602	0	2016-07-02	WP S 136	2017-02-02	1
379	197	602	0	2016-05-10	WP S 138	2017-02-02	1
414	108	602	0	2017-04-28	WP S 153	2017-06-12	1
321	157	602	0	2016-09-19	WP S 109	2016-09-26	1
285	18	602	0	2016-05-30	WP S 100	2016-06-07	1
286	18	602	0	2016-06-03	WP S 101	2016-06-07	1
381	197	602	0	2016-06-09	WP S 140	2017-02-02	1
380	197	602	0	2016-05-10	WP S 139	2017-02-02	1
382	197	602	0	2016-12-01	WP S 141	2017-02-02	1
385	197	602	0	2016-10-19	WP S 144	2017-02-02	1
384	197	602	0	2016-10-11	WP S 143	2017-02-02	1
383	197	602	0	2016-07-26	WP S 142	2017-02-02	1
368	119	602	0	2016-10-27	WP S 126	2017-02-01	0
370	119	602	0	2016-09-20	WP S 129	2017-02-01	0
369	119	602	0	2016-10-21	WP S 128	2017-02-01	1
415	108	602	0	2017-04-14	WP S 154	2017-06-12	1
386	73	574	0	2016-10-24	WP U 68	2017-02-28	1
387	189	574	0	2017-01-11	WP U 69	2017-03-08	1
388	197	574	0	2017-01-25	WP U 70	2017-03-08	1
389	108	574	0	2017-01-28	WP U 71	2017-03-08	1
390	108	574	0	2017-02-03	WP U 72	2017-03-08	1
416	108	602	0	2017-04-08	WP S 155	2017-06-12	1
391	282	574	0	2016-09-13	WP U 73 Lieferant "Messezentrum"	2017-03-15	1
392	197	574	0	2016-12-20	WP U 74	2017-03-15	1
393	108	574	0	2016-12-24	WP U 75	2017-03-15	1
394	108	574	0	2017-01-13	WP U 76	2017-03-15	1
395	197	574	0	2017-01-14	WP U 77	2017-03-15	1
396	108	574	0	2017-01-20	WP U 78	2017-03-15	1
397	18	519	0	2016-06-28	WP M	2017-03-20	1
399	57	574	0	2017-01-18	WP U 80	2017-03-20	1
398	73	574	0	2017-01-17	WP U 79	2017-03-20	1
371	288	602	0	2016-09-01	WP S 127	2017-02-01	1
400	142	574	0	3017-02-07	WP U 81	2017-03-27	1
401	142	574	0	2017-03-03	WP U 82	2017-03-27	1
403	18	574	0	2017-02-02	WP U 84	2017-03-27	1
402	142	574	0	2017-01-31	WP U 83	2017-03-27	1
405	119	574	0	2017-03-06	WP U 86	2017-04-18	1
404	119	574	0	2017-02-06	WP U 85	2017-03-28	1
406	119	602	0	2017-03-23	WP S 145	2017-06-12	0
407	142	602	0	2017-04-14	WP S 146	2017-06-12	1
408	197	602	0	2017-04-07	WP S 147	2017-06-12	1
409	197	602	0	2017-04-05	WP S 148	2017-06-12	1
410	197	602	0	2017-03-08	WP S 149	2017-06-12	1
411	108	602	0	2017-03-10	WP S 150	2017-06-12	1
412	108	602	0	2017-03-17	WP S 151	2017-06-12	1
417	108	602	0	2017-04-07	WP S 156	2017-06-12	1
418	108	602	0	2017-03-24	WP S 157	2017-06-12	1
419	108	602	0	2017-03-04	WP S 158	2017-06-12	1
420	11	602	0	2017-03-08	WP S 159	2017-06-12	1
421	11	602	0	2017-04-06	WP S 160	2017-06-12	1
422	11	602	0	2017-03-28	WP S 161	2017-06-12	1
423	11	602	0	2017-04-14	WP S 162	2017-06-12	1
424	294	602	0	2017-04-26	WP S 163	2017-06-12	1
\.


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 196
-- Name: incoming_delivery_incoming_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('incoming_delivery_incoming_delivery_id_seq', 424, true);


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
3287	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-19 10:52:04.05+00	519
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
3278	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-02-19 10:11:59.131+00	253
3279	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-02-19 10:12:03.959+00	253
3282	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-02-19 10:23:37.327+00	253
3283	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-19 10:25:24.518+00	519
3286	[INFO] Warenausgang mit der id 586 gelöscht	2016-02-19 10:50:29.767+00	574
3288	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-19 10:52:16.508+00	519
3295	[INFO] Warenausgang mit der id 594 gespeichert	2016-02-19 11:00:18.19+00	574
3296	[INFO] Wareneingang mit der id 241 auf Archivierungsstatus 1 gesetzt	2016-02-19 11:00:29.92+00	574
3297	[INFO] Warenausgang mit der id 594 auf Archivierungsstatus 1 gesetzt	2016-02-19 11:00:38.539+00	574
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
3280	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-02-19 10:16:41.399+00	253
3281	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-02-19 10:22:06.895+00	253
3284	[INFO] Organisation mit der id 263 gespeichert. organisationId: 263, name: Österreichische Gesellschaft für Dekubitusprävention (APUPA), comment: , updateTimestamp: Fri Feb 19 10:28:55 UTC 2016, active: 1	2016-02-19 10:28:55.793+00	519
3285	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-19 10:50:06.084+00	574
3291	[INFO] Organisation mit der id 263 gespeichert. organisationId: 263, name: Österreichische Gesellschaft für Dekubitusprävention (APUPA), comment: , updateTimestamp: Fri Feb 19 10:53:34 UTC 2016, active: 1	2016-02-19 10:53:34.383+00	519
3292	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-19 10:55:12.58+00	519
3293	[INFO] Wareneingang mit der id 241 gespeichert	2016-02-19 10:55:21.645+00	574
3294	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-19 10:55:40.038+00	519
3300	[INFO] Warenausgang mit der id 595 gespeichert	2016-02-19 11:06:50.59+00	574
3301	[INFO] Warenausgang mit der id 596 gespeichert	2016-02-19 11:07:34.805+00	574
3302	[INFO] Warenausgang mit der id 595 auf Archivierungsstatus 1 gesetzt	2016-02-19 11:08:30.91+00	574
3303	[INFO] Warenausgang mit der id 596 auf Archivierungsstatus 1 gesetzt	2016-02-19 11:08:37.915+00	574
3177	[INFO] Warenausgang mit der id 566 gespeichert	2016-02-12 10:27:48.098+00	574
3178	[INFO] Warenausgang mit der id 566 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:32:39.117+00	574
3179	[INFO] Wareneingang mit der id 232 auf Archivierungsstatus 1 gesetzt	2016-02-12 10:32:49.162+00	574
3182	[INFO] Warenausgang mit der id 568 gespeichert	2016-02-12 10:44:21.55+00	574
3185	[INFO] Warenausgang mit der id 569 gespeichert	2016-02-12 10:50:29.827+00	574
3243	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-02-16 14:11:21.649+00	519
3244	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-02-17 10:21:03.156+00	519
3275	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-02-19 09:54:22.361+00	253
3276	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-02-19 10:05:51.745+00	253
3277	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-02-19 10:09:35.472+00	253
3289	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-02-19 10:52:53.729+00	574
3290	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-02-19 10:53:10.332+00	574
3298	[INFO] Wareneingang mit der id 247 gespeichert	2016-02-19 11:05:34.372+00	574
3299	[INFO] Wareneingang mit der id 247 gespeichert	2016-02-19 11:05:56.586+00	574
3304	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-02-19 11:53:01.819+00	574
3305	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-02-22 08:40:31.702+00	252
3306	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-02-24 07:59:24.724+00	441
3307	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-02-29 14:03:35.717+00	252
3308	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-03-01 21:07:11.981+00	519
3309	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-03-02 18:36:21.349+00	345
3310	[INFO] Person mit der id 28 gespeichert. personId: 28, salutation: Frau, title: , firstName: Elfi, lastName: Baier, comment: Newslatter: ja, updateTimestamp: 2016-03-02, active: 1	2016-03-02 18:37:24.599+00	345
3311	[INFO] Person mit der id 80 gespeichert. personId: 80, salutation: Herr, title: Dr., firstName: Johannes, lastName: Ditz, comment: , updateTimestamp: 2016-03-02, active: 1	2016-03-02 18:38:13.235+00	345
3312	[INFO] Person mit der id 101 gespeichert. personId: 101, salutation: Herr Landesrat a. D., title: , firstName: Sepp, lastName: Eisl, comment: , updateTimestamp: 2016-03-02, active: 1	2016-03-02 18:38:38.118+00	345
3313	[INFO] Person mit der id 107 gespeichert. personId: 107, salutation: Herr, title: , firstName: Fritz, lastName: Eybl, comment: , updateTimestamp: 2016-03-02, active: 1	2016-03-02 18:39:04.345+00	345
3314	[INFO] Person mit der id 226 gespeichert. personId: 226, salutation: Frau, title: , firstName: Helga, lastName: Huber, comment: Newsletter: ja, updateTimestamp: 2016-03-02, active: 1	2016-03-02 18:39:32.092+00	345
3315	[INFO] Person mit der id 235 gespeichert. personId: 235, salutation: Herr Ök.-Rat, title: , firstName: Simon, lastName: Illmer, comment: , updateTimestamp: 2016-03-02, active: 1	2016-03-02 18:40:30.126+00	345
3316	[INFO] Person mit der id 330 gespeichert. personId: 330, salutation: Frau, title: , firstName: Elke, lastName: Mayer, comment: , updateTimestamp: 2016-03-02, active: 1	2016-03-02 18:41:00.813+00	345
3317	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-03-02 18:42:36.94+00	345
3318	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-03-02 20:22:24.118+00	574
3319	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-03-02 20:35:18.896+00	574
3320	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-03-03 16:52:41.866+00	642
3321	[INFO] Warenausgang mit der id 476 gespeichert	2016-03-03 17:06:41.248+00	642
3322	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-03-03 17:06:52.189+00	642
3323	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-03-04 08:54:16.795+00	252
3324	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-03-04 08:57:14.011+00	252
3325	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-03-04 09:57:56.735+00	519
3326	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-03-04 10:11:31.607+00	519
3327	[INFO] conny_robl@yahoo.de hat sich angemeldet	2016-03-09 20:24:28.407+00	446
3328	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-03-10 18:41:15.047+00	253
3329	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: Tätigkeit: Disposition, updateTimestamp: 2016-03-10, active: 1	2016-03-10 18:41:40.211+00	253
3330	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-03-10 18:46:38.731+00	253
3331	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-03-10 19:00:50.571+00	519
3332	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2016-03-13 17:58:59.975+00	602
3333	[INFO] Wareneingang mit der id 248 gespeichert	2016-03-13 18:06:25.789+00	602
3334	[INFO] Warenausgang mit der id 597 gespeichert	2016-03-13 18:07:31.764+00	602
3335	[INFO] Warenausgang mit der id 597 gespeichert	2016-03-13 18:08:30.029+00	602
3336	[INFO] Warenausgang mit der id 597 auf Archivierungsstatus 1 gesetzt	2016-03-13 18:08:44.537+00	602
3337	[INFO] Warenausgang mit der id 598 gespeichert	2016-03-13 18:09:59.644+00	602
3338	[INFO] Warenausgang mit der id 598 auf Archivierungsstatus 1 gesetzt	2016-03-13 18:10:06.373+00	602
3339	[INFO] Warenausgang mit der id 599 gespeichert	2016-03-13 18:11:54.094+00	602
3340	[INFO] Warenausgang mit der id 599 auf Archivierungsstatus 1 gesetzt	2016-03-13 18:12:00.062+00	602
3341	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-03-21 11:48:49.204+00	574
3342	[INFO] Wareneingang mit der id 246 gespeichert	2016-03-21 12:02:01.96+00	574
3343	[INFO] Warenausgang mit der id 593 gespeichert	2016-03-21 12:03:12.101+00	574
3344	[INFO] Warenausgang mit der id 600 gespeichert	2016-03-21 12:25:18.265+00	574
3345	[INFO] Warenausgang mit der id 600 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:25:38.136+00	574
3346	[INFO] Warenausgang mit der id 601 gespeichert	2016-03-21 12:26:46.718+00	574
3347	[INFO] Warenausgang mit der id 601 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:26:54.205+00	574
3348	[INFO] Wareneingang mit der id 249 gespeichert	2016-03-21 12:32:46.523+00	574
3349	[INFO] Wareneingang mit der id 247 gespeichert	2016-03-21 12:36:10.52+00	574
3350	[INFO] Wareneingang mit der id 249 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:42:20.402+00	574
3351	[INFO] Wareneingang mit der id 247 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:42:29.155+00	574
3352	[INFO] Wareneingang mit der id 250 gespeichert	2016-03-21 12:43:50.191+00	574
3353	[INFO] Warenausgang mit der id 602 gespeichert	2016-03-21 12:47:19.14+00	574
3354	[INFO] Warenausgang mit der id 602 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:47:27.828+00	574
3355	[INFO] Wareneingang mit der id 250 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:47:42.294+00	574
3356	[INFO] Wareneingang mit der id 251 gespeichert	2016-03-21 12:49:39.244+00	574
3357	[INFO] Warenausgang mit der id 603 gespeichert	2016-03-21 12:51:04.092+00	574
3358	[INFO] Warenausgang mit der id 603 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:52:08.474+00	574
3359	[INFO] Warenausgang mit der id 604 gespeichert	2016-03-21 12:54:46.997+00	574
3360	[INFO] Warenausgang mit der id 605 gespeichert	2016-03-21 12:56:09.746+00	574
3361	[INFO] Warenausgang mit der id 604 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:56:26.608+00	574
3362	[INFO] Warenausgang mit der id 605 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:56:30.847+00	574
3363	[INFO] Warenausgang mit der id 606 gespeichert	2016-03-21 12:57:57.658+00	574
3364	[INFO] Warenausgang mit der id 606 auf Archivierungsstatus 1 gesetzt	2016-03-21 12:58:50.867+00	574
3365	[INFO] Wareneingang mit der id 252 gespeichert	2016-03-21 13:02:49.339+00	574
3366	[INFO] Wareneingang mit der id 252 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:02:57.6+00	574
3367	[INFO] Warenausgang mit der id 607 gespeichert	2016-03-21 13:03:41.766+00	574
3368	[INFO] Warenausgang mit der id 607 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:03:49.391+00	574
3369	[INFO] Wareneingang mit der id 253 gespeichert	2016-03-21 13:11:46.136+00	574
3370	[INFO] Wareneingang mit der id 253 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:11:52.549+00	574
3371	[INFO] Warenausgang mit der id 608 gespeichert	2016-03-21 13:12:27.65+00	574
3372	[INFO] Warenausgang mit der id 608 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:12:44.739+00	574
3373	[INFO] Wareneingang mit der id 254 gespeichert	2016-03-21 13:14:10.319+00	574
3374	[INFO] Wareneingang mit der id 254 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:14:26.633+00	574
3375	[INFO] Warenausgang mit der id 609 gespeichert	2016-03-21 13:14:56.224+00	574
3376	[INFO] Wareneingang mit der id 255 gespeichert	2016-03-21 13:16:47.637+00	574
3377	[INFO] Wareneingang mit der id 255 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:17:05.188+00	574
3378	[INFO] Warenausgang mit der id 610 gespeichert	2016-03-21 13:17:37.942+00	574
3379	[INFO] Warenausgang mit der id 610 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:17:45.192+00	574
3380	[INFO] Warenausgang mit der id 609 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:17:48.847+00	574
3381	[INFO] Wareneingang mit der id 256 gespeichert	2016-03-21 13:19:30.738+00	574
3382	[INFO] Wareneingang mit der id 256 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:19:41.343+00	574
3383	[INFO] Warenausgang mit der id 611 gespeichert	2016-03-21 13:20:52.187+00	574
3384	[INFO] Warenausgang mit der id 612 gespeichert	2016-03-21 13:21:38.784+00	574
3385	[INFO] Warenausgang mit der id 611 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:21:48.534+00	574
3386	[INFO] Warenausgang mit der id 612 auf Archivierungsstatus 1 gesetzt	2016-03-21 13:21:55.917+00	574
3387	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-03-21 13:22:05.664+00	574
3388	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-03-22 07:01:29.343+00	253
3389	[INFO] Person mit der id 666 gespeichert. personId: 666, salutation: Frau, title: , firstName: Ramona, lastName: Götz, comment: , updateTimestamp: 2016-03-22, active: 1	2016-03-22 07:05:22.93+00	253
3390	[INFO] Person mit der id 666 gespeichert. personId: 666, salutation: Frau, title: , firstName: Ramona, lastName: Götz, comment: , updateTimestamp: 2016-03-22, active: 1	2016-03-22 07:06:21.839+00	253
3391	[INFO] Organisation mit der id 229 gespeichert. organisationId: 229, name: Bonduelle Deutschland GmbH, comment: Webseite: Ja, updateTimestamp: Tue Mar 22 07:06:54 UTC 2016, active: 1	2016-03-22 07:06:54.943+00	253
3392	[INFO] Organisation mit der id 264 gespeichert. organisationId: 264, name: Pfarre Morzg, comment: , updateTimestamp: Tue Mar 22 07:09:51 UTC 2016, active: 1	2016-03-22 07:09:52.009+00	253
3393	[INFO] Person mit der id 667 gespeichert. personId: 667, salutation: Frau, title: , firstName: Elfriede, lastName: Binder, comment: , updateTimestamp: 2016-03-22, active: 1	2016-03-22 07:13:56.259+00	253
3394	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-03-22 07:31:29.869+00	253
3395	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-03-22 08:36:00.748+00	252
3396	[INFO] Person mit der id 255 gespeichert. personId: 255, salutation: Herr, title: , firstName: Martin, lastName: Schmidbauer , comment: , updateTimestamp: 2016-03-22, active: 1	2016-03-22 08:41:38.926+00	252
3397	[INFO] Person mit der id 255 gespeichert. personId: 255, salutation: Herr, title: , firstName: Martin, lastName: Schmidbauer , comment: , updateTimestamp: 2016-03-22, active: 1	2016-03-22 08:41:42.797+00	252
3398	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-03-22 08:42:08.967+00	252
3399	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-03-22 17:05:54.798+00	345
3400	[INFO] Person mit der id 668 gespeichert. personId: 668, salutation: Herr, title: , firstName: Siegfried, lastName: Huber    , comment: , updateTimestamp: 2016-03-22, active: 1	2016-03-22 17:13:18.789+00	345
3401	[INFO] Organisation mit der id 226 gespeichert. organisationId: 226, name: Freilassinger Tafel, comment: Adresse ergänzen, updateTimestamp: Tue Mar 22 17:13:56 UTC 2016, active: 1	2016-03-22 17:13:56.807+00	345
3402	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-03-22 17:14:32.755+00	345
3403	[INFO] conny_robl@yahoo.de hat sich angemeldet	2016-03-30 19:46:32.828+00	446
3404	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-03-31 06:03:38.516+00	519
3405	[INFO] Person mit der id 591 gespeichert. personId: 591, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler (Wittich), comment: Tätigkeit: Waren, updateTimestamp: 2016-03-31, active: 1	2016-03-31 06:06:02.193+00	519
3406	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-04-01 08:20:50.876+00	441
3407	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-04-04 19:47:11.728+00	574
3408	[INFO] Warenausgang mit der id 613 gespeichert	2016-04-04 20:08:56.385+00	574
3409	[INFO] Warenausgang mit der id 613 auf Archivierungsstatus 1 gesetzt	2016-04-04 20:10:14.807+00	574
3410	[INFO] Wareneingang mit der id 239 auf Archivierungsstatus 1 gesetzt	2016-04-04 20:14:06.799+00	574
3411	[INFO] Wareneingang mit der id 251 auf Archivierungsstatus 1 gesetzt	2016-04-04 20:16:22.152+00	574
3412	[INFO] Wareneingang mit der id 240 gespeichert	2016-04-04 20:17:29.238+00	574
3413	[INFO] Wareneingang mit der id 240 auf Archivierungsstatus 1 gesetzt	2016-04-04 20:17:52.054+00	574
3414	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-07 10:15:18.968+00	519
3415	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-07 15:12:25.178+00	519
3416	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-04-08 07:35:32.434+00	574
3417	[INFO] Wareneingang mit der id 257 gespeichert	2016-04-08 08:07:46.157+00	574
3418	[INFO] Wareneingang mit der id 257 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:07:53.642+00	574
3419	[INFO] Warenausgang mit der id 581 gespeichert	2016-04-08 08:08:20.189+00	574
3420	[INFO] Warenausgang mit der id 581 gespeichert	2016-04-08 08:08:36.916+00	574
3421	[INFO] Warenausgang mit der id 581 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:08:43.225+00	574
3422	[INFO] Warenausgang mit der id 585 gespeichert	2016-04-08 08:09:12.3+00	574
3423	[INFO] Warenausgang mit der id 585 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:09:18.124+00	574
3424	[INFO] Wareneingang mit der id 258 gespeichert	2016-04-08 08:18:09.85+00	574
3425	[INFO] Warenausgang mit der id 614 gespeichert	2016-04-08 08:19:00.355+00	574
3426	[INFO] Warenausgang mit der id 614 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:19:38.046+00	574
3427	[INFO] Warenausgang mit der id 615 gespeichert	2016-04-08 08:20:15.362+00	574
3428	[INFO] Warenausgang mit der id 615 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:20:26.911+00	574
3429	[INFO] Warenausgang mit der id 616 gespeichert	2016-04-08 08:21:00.901+00	574
3430	[INFO] Warenausgang mit der id 616 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:21:24.313+00	574
3431	[INFO] Wareneingang mit der id 259 gespeichert	2016-04-08 08:22:23.644+00	574
3432	[INFO] Warenausgang mit der id 617 gespeichert	2016-04-08 08:23:43.112+00	574
3433	[INFO] Warenausgang mit der id 617 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:24:05.892+00	574
3434	[INFO] Warenausgang mit der id 618 gespeichert	2016-04-08 08:25:50.801+00	574
3435	[INFO] Warenausgang mit der id 618 gespeichert	2016-04-08 08:26:20.321+00	574
3436	[INFO] Wareneingang mit der id 259 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:28:53.138+00	574
3437	[INFO] Wareneingang mit der id 258 auf Archivierungsstatus 1 gesetzt	2016-04-08 08:29:38.298+00	574
3438	[INFO] Wareneingang mit der id 260 gespeichert	2016-04-08 08:30:46.304+00	574
3439	[INFO] Wareneingang mit der id 261 gespeichert	2016-04-08 08:36:05.047+00	574
3440	[INFO] Warenausgang mit der id 619 gespeichert	2016-04-08 08:37:31.089+00	574
3441	[INFO] Wareneingang mit der id 262 gespeichert	2016-04-08 09:08:35.086+00	574
3442	[INFO] Warenausgang mit der id 620 gespeichert	2016-04-08 09:12:22.84+00	574
3443	[INFO] Warenausgang mit der id 621 gespeichert	2016-04-08 09:17:17.317+00	574
3444	[INFO] Warenausgang mit der id 621 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:17:44.011+00	574
3445	[INFO] Warenausgang mit der id 622 gespeichert	2016-04-08 09:19:04.482+00	574
3446	[INFO] Warenausgang mit der id 623 gespeichert	2016-04-08 09:21:15.585+00	574
3447	[INFO] Warenausgang mit der id 621 gespeichert	2016-04-08 09:22:04.274+00	574
3448	[INFO] Warenausgang mit der id 620 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:22:39.431+00	574
3449	[INFO] Warenausgang mit der id 622 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:22:43.282+00	574
3450	[INFO] Warenausgang mit der id 623 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:22:46.713+00	574
3451	[INFO] Warenausgang mit der id 618 gespeichert	2016-04-08 09:25:47.64+00	574
3452	[INFO] Warenausgang mit der id 618 gespeichert	2016-04-08 09:26:32.063+00	574
3453	[INFO] Warenausgang mit der id 618 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:27:29.439+00	574
3454	[INFO] Wareneingang mit der id 261 gespeichert	2016-04-08 09:28:19.574+00	574
3455	[INFO] Wareneingang mit der id 261 gespeichert	2016-04-08 09:29:28.912+00	574
3456	[INFO] Wareneingang mit der id 261 gespeichert	2016-04-08 09:30:15.862+00	574
3457	[INFO] Warenausgang mit der id 624 gespeichert	2016-04-08 09:32:03.226+00	574
3458	[INFO] Warenausgang mit der id 619 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:32:16.602+00	574
3459	[INFO] Warenausgang mit der id 625 gespeichert	2016-04-08 09:33:04.896+00	574
3460	[INFO] Warenausgang mit der id 626 gespeichert	2016-04-08 09:34:00.751+00	574
3461	[INFO] Warenausgang mit der id 627 gespeichert	2016-04-08 09:34:52.797+00	574
3462	[INFO] Warenausgang mit der id 628 gespeichert	2016-04-08 09:35:29.102+00	574
3463	[INFO] Warenausgang mit der id 628 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:35:48.419+00	574
3464	[INFO] Warenausgang mit der id 627 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:35:53.805+00	574
3465	[INFO] Warenausgang mit der id 625 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:36:03.061+00	574
3466	[INFO] Warenausgang mit der id 626 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:36:19.167+00	574
3467	[INFO] Wareneingang mit der id 262 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:40:37.841+00	574
3468	[INFO] Wareneingang mit der id 260 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:40:44.6+00	574
3469	[INFO] Wareneingang mit der id 261 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:40:49.45+00	574
3470	[INFO] Wareneingang mit der id 263 gespeichert	2016-04-08 09:43:32.606+00	574
3471	[INFO] Warenausgang mit der id 629 gespeichert	2016-04-08 09:47:05.751+00	574
3472	[INFO] Warenausgang mit der id 630 gespeichert	2016-04-08 09:47:51.366+00	574
3473	[INFO] Warenausgang mit der id 630 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:48:21.912+00	574
3474	[INFO] Wareneingang mit der id 263 auf Archivierungsstatus 1 gesetzt	2016-04-08 09:48:40.111+00	574
3475	[INFO] Wareneingang mit der id 264 gespeichert	2016-04-08 10:01:47.283+00	574
3476	[INFO] Warenausgang mit der id 631 gespeichert	2016-04-08 10:03:24.673+00	574
3477	[INFO] Warenausgang mit der id 631 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:05:01.161+00	574
3478	[INFO] Wareneingang mit der id 264 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:05:15.092+00	574
3479	[INFO] Wareneingang mit der id 265 gespeichert	2016-04-08 10:07:15.791+00	574
3480	[INFO] Warenausgang mit der id 632 gespeichert	2016-04-08 10:08:13.727+00	574
3481	[INFO] Warenausgang mit der id 632 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:08:41.256+00	574
3482	[INFO] Wareneingang mit der id 266 gespeichert	2016-04-08 10:10:28.419+00	574
3483	[INFO] Wareneingang mit der id 267 gespeichert	2016-04-08 10:10:28.608+00	574
3484	[INFO] Wareneingang mit der id 266 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:10:35.545+00	574
3485	[INFO] Wareneingang mit der id 266 gelöscht	2016-04-08 10:11:26.319+00	574
3486	[INFO] Warenausgang mit der id 633 gespeichert	2016-04-08 10:12:14.186+00	574
3487	[INFO] Warenausgang mit der id 633 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:12:21.976+00	574
3488	[INFO] Wareneingang mit der id 267 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:12:56.042+00	574
3489	[INFO] Wareneingang mit der id 265 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:13:02.351+00	574
3490	[INFO] Wareneingang mit der id 268 gespeichert	2016-04-08 10:38:59.424+00	574
3491	[INFO] Warenausgang mit der id 634 gespeichert	2016-04-08 10:40:20.722+00	574
3492	[INFO] Warenausgang mit der id 635 gespeichert	2016-04-08 10:41:01.34+00	574
3493	[INFO] Warenausgang mit der id 634 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:41:06.87+00	574
3494	[INFO] Warenausgang mit der id 635 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:41:10.475+00	574
3495	[INFO] Wareneingang mit der id 268 auf Archivierungsstatus 1 gesetzt	2016-04-08 10:41:19.514+00	574
3496	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-04-08 11:27:05.88+00	574
3497	[INFO] Warenausgang mit der id 624 gespeichert	2016-04-08 11:28:40.679+00	574
3498	[INFO] Warenausgang mit der id 629 gespeichert	2016-04-08 11:29:08.386+00	574
3499	[INFO] Warenausgang mit der id 629 auf Archivierungsstatus 1 gesetzt	2016-04-08 11:29:15.553+00	574
3500	[INFO] Warenausgang mit der id 624 auf Archivierungsstatus 1 gesetzt	2016-04-08 11:29:18.785+00	574
3501	[INFO] Warenausgang mit der id 574 auf Archivierungsstatus 1 gesetzt	2016-04-08 11:29:59.611+00	574
3502	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-04-08 11:30:06.84+00	574
3503	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-04-09 10:35:57.133+00	574
3504	[INFO] Wareneingang mit der id 240 gespeichert	2016-04-09 10:37:36.29+00	574
3505	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-04-09 10:42:40.114+00	574
3506	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-11 08:36:59.731+00	252
3507	[INFO] Person mit der id 358 gespeichert. personId: 358, salutation: Frau, title: Mag., firstName: Christine, lastName: Neurauter, comment: , updateTimestamp: 2016-04-11, active: 1	2016-04-11 08:40:41.458+00	252
3508	[INFO] Person mit der id 358 gespeichert. personId: 358, salutation: Frau, title: Mag., firstName: Christine, lastName: Neurauter, comment: , updateTimestamp: 2016-04-11, active: 1	2016-04-11 08:40:45.094+00	252
3509	[INFO] Person mit der id 665 gespeichert. personId: 665, salutation: Herr, title: , firstName: Mario, lastName: Ebner, comment: , updateTimestamp: 2016-04-11, active: 1	2016-04-11 08:43:02.398+00	252
3510	[INFO] Person mit der id 665 gespeichert. personId: 665, salutation: Herr, title: , firstName: Mario, lastName: Ebner, comment: , updateTimestamp: 2016-04-11, active: 1	2016-04-11 08:43:07.526+00	252
3511	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-11 08:44:29.563+00	252
3512	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-04-11 09:52:22.2+00	441
3513	[INFO] Person mit der id 591 gespeichert. personId: 591, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler (Wittich), comment: Tätigkeit: Waren, updateTimestamp: 2016-04-11, active: 1	2016-04-11 09:53:36.462+00	441
3514	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-04-11 09:56:48.155+00	441
3515	[INFO] Alle Personen als CSV exportiert.	2016-04-11 09:57:28.068+00	441
3516	[INFO] Alle Personen als CSV exportiert.	2016-04-11 09:57:30.512+00	441
3517	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-11 10:44:21.273+00	252
3518	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-04-11 12:29:44.941+00	253
3519	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-12 15:01:14.136+00	519
3520	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-12 15:08:26.01+00	519
3521	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-13 16:45:46.066+00	519
3522	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-13 21:06:00.077+00	252
3523	[INFO] Person mit der id 652 gespeichert. personId: 652, salutation: Herr, title: Dr., firstName: Helmut, lastName: Leube, comment: Newsletter: ja, updateTimestamp: 2016-04-13, active: 1	2016-04-13 21:08:14.672+00	252
3524	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-13 21:11:21.407+00	252
3525	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-15 06:31:22.633+00	252
3526	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-04-15 12:50:15.071+00	345
3527	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-04-15 16:40:16.274+00	441
3528	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: Tätigkeit: Waren, updateTimestamp: 2016-04-15, active: 1	2016-04-15 16:41:36.215+00	441
3529	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-04-16 14:56:04.347+00	345
3530	[INFO] Person mit der id 75 gespeichert. personId: 75, salutation: Herr, title: , firstName: Günther, lastName: Derler, comment: , updateTimestamp: 2016-04-16, active: 1	2016-04-16 14:56:50.272+00	345
3531	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: Tätigkeit: Disposition, updateTimestamp: 2016-04-16, active: 1	2016-04-16 14:59:01.645+00	345
3532	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-04-16 15:01:10.096+00	345
3533	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-17 10:11:43.033+00	252
3534	[INFO] Organisation mit der id 157 gespeichert. organisationId: 157, name: Salzburg Schokolade GmbH, comment: , updateTimestamp: Sun Apr 17 10:12:34 UTC 2016, active: 1	2016-04-17 10:12:34.794+00	252
3535	[INFO] Organisation mit der id 157 gespeichert. organisationId: 157, name: Salzburg Schokolade GmbH, comment: , updateTimestamp: Sun Apr 17 10:12:37 UTC 2016, active: 1	2016-04-17 10:12:37.946+00	252
3536	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-17 10:12:47.026+00	252
3537	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-17 15:47:38.961+00	252
3538	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-17 15:54:06.031+00	252
3539	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-17 16:25:37.352+00	252
3540	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-17 16:26:35.135+00	252
3541	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-18 16:44:59.559+00	519
3542	[INFO] Person mit der id 669 gespeichert. personId: 669, salutation: Frau , title: , firstName: Anna , lastName: Viehhauser, comment: , updateTimestamp: 2016-04-18, active: 1	2016-04-18 16:47:26.301+00	519
3543	[INFO] Person mit der id 447 gelöscht	2016-04-18 16:47:38.057+00	519
3544	[INFO] Organisation mit der id 157 gespeichert. organisationId: 157, name: Salzburg Schokolade GmbH, comment: , updateTimestamp: Mon Apr 18 16:48:01 UTC 2016, active: 1	2016-04-18 16:48:01.716+00	519
3545	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-18 16:56:45.171+00	519
3546	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-04-18 18:18:20.993+00	345
3547	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-04-18 18:18:47.977+00	345
3548	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-04-18 18:20:53.676+00	345
3549	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-04-18 18:24:15.716+00	345
3550	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-20 08:45:00.879+00	252
3551	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-20 08:46:02.825+00	252
3552	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-04-20 17:29:21.123+00	345
3553	[INFO] Person mit der id 642 gespeichert. personId: 642, salutation: Frau, title: , firstName: Lisa, lastName: Traubenek, comment: Tätigkeit: Administration, Waren, updateTimestamp: 2016-04-20, active: 1	2016-04-20 17:30:33.908+00	345
3554	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-04-20 17:30:43.932+00	345
3555	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-20 19:30:00.828+00	519
3556	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-20 19:31:39.969+00	519
3557	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2016-04-20 20:03:06.332+00	602
3558	[INFO] Warenausgang mit der id 636 gespeichert	2016-04-20 20:13:31.43+00	602
3559	[INFO] Warenausgang mit der id 636 auf Archivierungsstatus 1 gesetzt	2016-04-20 20:13:36.274+00	602
3560	[INFO] Wareneingang mit der id 269 gespeichert	2016-04-20 20:18:32.374+00	602
3561	[INFO] Wareneingang mit der id 269 auf Archivierungsstatus 1 gesetzt	2016-04-20 20:18:44.283+00	602
3562	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-20 20:19:10.098+00	519
3563	[INFO] Warenausgang mit der id 637 gespeichert	2016-04-20 20:19:11.708+00	602
3564	[INFO] Warenausgang mit der id 637 auf Archivierungsstatus 1 gesetzt	2016-04-20 20:19:24.979+00	602
3565	[INFO] Wareneingang mit der id 270 gespeichert	2016-04-20 20:21:43.674+00	602
3566	[INFO] Wareneingang mit der id 270 auf Archivierungsstatus 1 gesetzt	2016-04-20 20:21:56.242+00	602
3567	[INFO] Warenausgang mit der id 638 gespeichert	2016-04-20 20:22:53.055+00	602
3568	[INFO] Warenausgang mit der id 638 auf Archivierungsstatus 1 gesetzt	2016-04-20 20:23:02.139+00	602
3569	[INFO] Person mit der id 670 gespeichert. personId: 670, salutation: Herr, title: , firstName:  Wilfried , lastName: Rogler, comment: , updateTimestamp: 2016-04-20, active: 1	2016-04-20 20:23:06.428+00	519
3570	[INFO] Warenausgang mit der id 639 gespeichert	2016-04-20 20:24:11.006+00	602
3571	[INFO] Warenausgang mit der id 639 auf Archivierungsstatus 1 gesetzt	2016-04-20 20:24:23.008+00	602
3572	[INFO] Person mit der id 400 gelöscht	2016-04-20 20:24:58.426+00	519
3573	[INFO] Person mit der id 401 gelöscht	2016-04-20 20:25:05.156+00	519
3574	[INFO] Warenausgang mit der id 640 gespeichert	2016-04-20 20:25:07.58+00	602
3575	[INFO] Warenausgang mit der id 640 auf Archivierungsstatus 1 gesetzt	2016-04-20 20:25:17.921+00	602
3576	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-20 20:29:47.038+00	519
3577	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-21 06:15:00.504+00	519
3578	[INFO] Organisation mit der id 265 gespeichert. organisationId: 265, name:  Kiddy Event GmbH, comment: Kinderfeste & Parties, updateTimestamp: Thu Apr 21 06:17:31 UTC 2016, active: 1	2016-04-21 06:17:31.154+00	519
3579	[INFO] Person mit der id 671 gespeichert. personId: 671, salutation: Frau , title: , firstName: Sarah, lastName: Feiersinger, comment: www.kinderparties.at, updateTimestamp: 2016-04-21, active: 1	2016-04-21 06:20:34.141+00	519
3580	[INFO] Organisation mit der id 265 gespeichert. organisationId: 265, name:  Kiddy Event GmbH, comment: Kinderfeste & Parties, www.kinderparties.at  , updateTimestamp: Thu Apr 21 06:21:38 UTC 2016, active: 1	2016-04-21 06:21:38.394+00	519
3581	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-21 06:22:21.918+00	519
3582	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2016-04-21 12:07:33.283+00	602
3583	[INFO] Wareneingang mit der id 271 gespeichert	2016-04-21 12:09:59.177+00	602
3584	[INFO] Wareneingang mit der id 271 auf Archivierungsstatus 1 gesetzt	2016-04-21 12:10:06.855+00	602
3585	[INFO] Warenausgang mit der id 641 gespeichert	2016-04-21 12:11:12.687+00	602
3586	[INFO] Warenausgang mit der id 641 auf Archivierungsstatus 1 gesetzt	2016-04-21 12:11:18.617+00	602
3587	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2016-04-21 12:13:01+00	602
3588	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-21 15:12:13.471+00	519
3589	[INFO] Person mit der id 671 gespeichert. personId: 671, salutation: Frau , title: , firstName: Sarah, lastName: Feiersinger, comment: , updateTimestamp: 2016-04-21, active: 1	2016-04-21 15:12:55.332+00	519
3590	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-21 15:13:27.641+00	519
3591	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-22 16:26:07.202+00	252
3592	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schweiger, comment: Tätigkeit: Waren, updateTimestamp: 2016-04-22, active: 1	2016-04-22 16:28:05.509+00	252
3593	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-22 16:29:19.865+00	252
3594	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-04-23 14:02:06.14+00	345
3595	[INFO] Person mit der id 656 gespeichert. personId: 656, salutation: Frau, title: , firstName: Sabine, lastName: Füssl, comment: , updateTimestamp: 2016-04-23, active: 1	2016-04-23 14:03:35.609+00	345
3596	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-04-23 14:03:42.961+00	345
3597	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-25 09:12:58.911+00	519
3598	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-25 09:23:51.764+00	519
3599	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-26 13:41:26.363+00	252
3600	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-26 13:42:33.036+00	252
3601	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-27 06:19:02.069+00	252
3602	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-27 06:20:04.079+00	252
3603	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-04-28 13:48:41.511+00	253
3604	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-04-28 15:28:03.334+00	253
3605	[INFO] Passwort für Person mit Id 252 zurückgesetzt.	2016-04-28 15:28:52.158+00	253
3606	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: Tätigkeit: Obfrau, Disposition, updateTimestamp: 2016-04-28, active: 1	2016-04-28 15:28:58.966+00	253
3607	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-28 15:29:03.947+00	253
3608	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-28 15:29:14.316+00	252
3609	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-28 15:29:16.545+00	252
3610	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-28 17:33:14.056+00	252
3611	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schwaiger, comment: Tätigkeit: Waren, updateTimestamp: 2016-04-28, active: 1	2016-04-28 17:34:02.684+00	252
3612	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schwaiger, comment: Tätigkeit: Waren, updateTimestamp: 2016-04-28, active: 1	2016-04-28 17:34:06.949+00	252
3613	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-28 17:34:11.771+00	252
3614	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-04-28 18:38:40.508+00	441
3643	[INFO] Person mit der id 656 gespeichert. personId: 656, salutation: Frau, title: , firstName: Sabine, lastName: Füssl, comment: Tätigkeit: Administration, updateTimestamp: 2016-05-02, active: 1	2016-05-02 10:24:43.971+00	519
3644	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-02 10:50:29.083+00	519
3615	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-28 22:42:01.819+00	252
3616	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-28 22:46:34.089+00	252
3617	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-04-29 06:42:51.512+00	253
3618	[INFO] Person mit der id 44 gespeichert. personId: 44, salutation: Frau, title: , firstName: Anita, lastName: Bernhofer, comment: Tätigkeit: Waren, updateTimestamp: 2016-04-29, active: 1	2016-04-29 06:44:03.66+00	253
3619	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-04-29 06:47:44.341+00	253
3620	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-29 07:27:11.283+00	252
3621	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-04-29 10:43:07.913+00	519
3622	[INFO] Person mit der id 642 gespeichert. personId: 642, salutation: Frau, title: , firstName: Lisa, lastName: Traubenek, comment: Tätigkeit: Administration, Waren, updateTimestamp: 2016-04-29, active: 1	2016-04-29 10:43:53.117+00	519
3623	[INFO] Person mit der id 574 gespeichert. personId: 574, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Wenzlhuemer, comment: Tätigkeit: Administration, updateTimestamp: 2016-04-29, active: 1	2016-04-29 10:44:14.164+00	519
3624	[INFO] Person mit der id 602 gespeichert. personId: 602, salutation: Frau, title: , firstName: Sabine, lastName: Zöpfl, comment: Tätigkeit: Waren; Newsletter: ja;, updateTimestamp: 2016-04-29, active: 1	2016-04-29 10:44:33.263+00	519
3625	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-04-29 10:54:18.459+00	519
3626	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-04-29 11:00:22.502+00	656
3627	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-04-29 21:34:19.778+00	441
3628	[INFO] Person mit der id 602 gespeichert. personId: 602, salutation: Frau, title: , firstName: Sabine, lastName: Zöpfl, comment: Tätigkeit: Waren; Newsletter: ja;, updateTimestamp: 2016-04-29, active: 1	2016-04-29 21:35:36.984+00	441
3629	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-04-30 06:43:45.109+00	574
3630	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-04-30 06:44:57.184+00	574
3631	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-04-30 15:15:04.343+00	252
3632	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-01 18:24:00.254+00	519
3633	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-05-01 18:24:42.311+00	519
3634	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-01 18:36:22.23+00	519
3635	[INFO] Person mit der id 672 gespeichert. personId: 672, salutation: Herr, title: , firstName: Gerhard, lastName: Grosschädel, comment: Newsletter: ja, updateTimestamp: 2016-05-01, active: 1	2016-05-01 18:41:51.456+00	519
3636	[INFO] Person mit der id 672 gespeichert. personId: 672, salutation: Herr, title: , firstName: Gerhard, lastName: Grosschädel, comment: Newsletter: ja, updateTimestamp: 2016-05-01, active: 1	2016-05-01 18:42:37.801+00	519
3637	[INFO] Person mit der id 672 gespeichert. personId: 672, salutation: Herr, title: , firstName: Gerhard, lastName: Grosschädel, comment: Newsletter: ja, updateTimestamp: 2016-05-01, active: 1	2016-05-01 18:43:04.576+00	519
3638	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-05-01 18:45:01.035+00	519
3639	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-05-02 08:30:57.371+00	656
3640	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-05-02 09:58:07.118+00	252
3641	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-02 09:58:39.231+00	252
3642	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-02 10:04:22.008+00	519
3645	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-02 16:02:00.643+00	519
3646	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-05-08 19:10:19.103+00	441
3647	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-05-09 09:01:48.448+00	252
3648	[INFO] Person mit der id 564 gespeichert. personId: 564, salutation: Herr, title: , firstName: Hans-Peter, lastName: Wawra, comment: Ehrenmitglied, updateTimestamp: 2016-05-09, active: 1	2016-05-09 09:03:17.501+00	252
3649	[INFO] Person mit der id 498 gespeichert. personId: 498, salutation: Herr, title: DDDr., firstName: Clemens, lastName: Sedmak, comment: Ehrenmitglied, updateTimestamp: 2016-05-09, active: 1	2016-05-09 09:04:20.367+00	252
3650	[INFO] Person mit der id 652 gespeichert. personId: 652, salutation: Herr, title: Dr., firstName: Helmut, lastName: Leube, comment: Newsletter: ja, updateTimestamp: 2016-05-09, active: 1	2016-05-09 09:05:23.735+00	252
3651	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-09 09:05:38.12+00	252
3652	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-05-09 10:39:11.663+00	656
3653	[INFO] Alle Personen als CSV exportiert.	2016-05-09 10:39:44.462+00	656
3654	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-05-13 13:06:03.919+00	656
3655	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-05-13 13:07:16.557+00	656
3656	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-05-16 16:23:19.049+00	345
3657	[INFO] Person mit der id 17 gespeichert. personId: 17, salutation: Frau, title: , firstName: Anna, lastName: Aminger, comment: , updateTimestamp: 2016-05-16, active: 1	2016-05-16 16:24:57.669+00	345
3658	[INFO] Person mit der id 17 gespeichert. personId: 17, salutation: Frau, title: , firstName: Anna, lastName: Aminger, comment: , updateTimestamp: 2016-05-16, active: 1	2016-05-16 16:25:07.639+00	345
3659	[INFO] Person mit der id 591 gespeichert. personId: 591, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler (Wittich), comment: Tätigkeit: Waren, updateTimestamp: 2016-05-16, active: 1	2016-05-16 16:28:14.946+00	345
3660	[INFO] Person mit der id 591 gespeichert. personId: 591, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler (Wittich), comment: Tätigkeit: Waren, updateTimestamp: 2016-05-16, active: 1	2016-05-16 16:28:23.115+00	345
3661	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-05-16 19:13:17.876+00	345
3662	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-05-16 19:15:28.55+00	345
3663	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-05-16 19:19:34.324+00	345
3664	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-05-16 19:20:24.043+00	345
3665	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-05-18 18:14:17.853+00	345
3666	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schwaiger, comment: Tätigkeit: Waren; Newsletter: ja;, updateTimestamp: 2016-05-18, active: 1	2016-05-18 18:15:32.299+00	345
3667	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schwaiger, comment: Tätigkeit: Waren; Newsletter: ja;, updateTimestamp: 2016-05-18, active: 1	2016-05-18 18:15:47.118+00	345
3668	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-05-18 18:16:56.23+00	345
3669	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-05-18 18:38:20.683+00	345
3670	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-05-18 18:42:42.215+00	345
3671	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-24 05:36:10.543+00	519
3672	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-24 05:50:33.34+00	519
3673	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-05-24 05:51:08.155+00	519
3674	[INFO] elisabeth.apfelthaler@inode.at hat sich angemeldet	2016-05-24 16:17:15.972+00	591
3675	[INFO] Alle Personen als CSV exportiert.	2016-05-24 16:20:39.888+00	591
3676	[INFO] Passwort für Person mit Id 591 geändert.	2016-05-24 16:23:49.553+00	591
3677	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-05-24 20:43:04.571+00	252
3678	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-24 20:43:54.328+00	252
3679	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-05-25 18:19:33.56+00	345
3680	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-05-25 19:15:16.643+00	345
3681	[INFO] Person mit der id 673 gespeichert. personId: 673, salutation: Frau, title: Mag., firstName: Friederike, lastName: Hurch, comment: , updateTimestamp: 2016-05-25, active: 1	2016-05-25 19:17:03.975+00	345
3682	[INFO] Person mit der id 674 gespeichert. personId: 674, salutation: Herr, title: Dipl.Bw., firstName: Gerhard, lastName: Feichtinger, comment: Newsletter: nein, updateTimestamp: 2016-05-25, active: 1	2016-05-25 19:23:01.713+00	345
3683	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-05-25 19:23:09.801+00	345
3684	[INFO] sabine.fuessl@view-salzburg.at hat sich angemeldet	2016-05-27 09:58:40.8+00	656
3685	[INFO] Alle Personen als CSV exportiert.	2016-05-27 09:59:11.869+00	656
3686	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-30 06:05:44.107+00	253
3687	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-30 06:06:34.227+00	253
3688	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-31 13:36:57.028+00	253
3689	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-31 13:38:22.484+00	253
3690	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-31 13:51:32.641+00	253
3691	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-31 17:14:42.721+00	253
3692	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-31 17:14:46.333+00	253
3693	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-31 17:24:27.791+00	253
3694	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-31 17:24:34.004+00	253
3695	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-31 17:24:37.978+00	253
3696	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-31 17:24:53.081+00	253
3697	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-31 17:30:17.904+00	253
3698	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-31 17:30:24.195+00	253
3699	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-05-31 17:30:31.078+00	253
3700	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-05-31 17:30:35.44+00	253
3701	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-06-01 06:35:05.886+00	253
3702	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-06-01 06:35:09.04+00	253
3703	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-06-06 10:58:00.331+00	253
3704	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-06-06 11:00:29.893+00	253
3705	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2016-06-07 16:10:41.705+00	602
3706	[INFO] Wareneingang mit der id 272 gespeichert	2016-06-07 16:15:08.762+00	602
3707	[INFO] Wareneingang mit der id 272 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:15:30.013+00	602
3708	[INFO] Warenausgang mit der id 642 gespeichert	2016-06-07 16:16:09.274+00	602
3709	[INFO] Warenausgang mit der id 643 gespeichert	2016-06-07 16:16:42.608+00	602
3710	[INFO] Warenausgang mit der id 644 gespeichert	2016-06-07 16:17:11.606+00	602
3711	[INFO] Warenausgang mit der id 645 gespeichert	2016-06-07 16:17:54.607+00	602
3712	[INFO] Warenausgang mit der id 642 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:18:08.802+00	602
3713	[INFO] Warenausgang mit der id 643 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:18:12.508+00	602
3714	[INFO] Warenausgang mit der id 644 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:18:17.001+00	602
3715	[INFO] Warenausgang mit der id 645 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:18:20.695+00	602
3716	[INFO] Wareneingang mit der id 273 gespeichert	2016-06-07 16:20:29.745+00	602
3717	[INFO] Wareneingang mit der id 273 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:20:38.88+00	602
3718	[INFO] Warenausgang mit der id 646 gespeichert	2016-06-07 16:21:32.487+00	602
3719	[INFO] Warenausgang mit der id 647 gespeichert	2016-06-07 16:22:06.101+00	602
3720	[INFO] Warenausgang mit der id 646 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:22:11.15+00	602
3721	[INFO] Warenausgang mit der id 647 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:22:15.27+00	602
3722	[INFO] Wareneingang mit der id 274 gespeichert	2016-06-07 16:24:55.487+00	602
3723	[INFO] Wareneingang mit der id 274 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:25:07.549+00	602
3724	[INFO] Warenausgang mit der id 648 gespeichert	2016-06-07 16:35:01.066+00	602
3725	[INFO] Warenausgang mit der id 649 gespeichert	2016-06-07 16:35:47.628+00	602
3726	[INFO] Warenausgang mit der id 648 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:36:19+00	602
3727	[INFO] Warenausgang mit der id 649 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:36:22.479+00	602
3728	[INFO] Wareneingang mit der id 275 gespeichert	2016-06-07 16:38:18.489+00	602
3729	[INFO] Wareneingang mit der id 275 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:38:23.101+00	602
3730	[INFO] Warenausgang mit der id 650 gespeichert	2016-06-07 16:38:51.166+00	602
3731	[INFO] Warenausgang mit der id 650 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:39:01.515+00	602
3732	[INFO] Wareneingang mit der id 276 gespeichert	2016-06-07 16:39:55.941+00	602
3733	[INFO] Warenausgang mit der id 651 gespeichert	2016-06-07 16:40:28.432+00	602
3734	[INFO] Warenausgang mit der id 651 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:40:32.552+00	602
3735	[INFO] Wareneingang mit der id 276 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:40:40.33+00	602
3736	[INFO] Wareneingang mit der id 277 gespeichert	2016-06-07 16:41:53.854+00	602
3737	[INFO] Wareneingang mit der id 277 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:42:02.553+00	602
3738	[INFO] Warenausgang mit der id 652 gespeichert	2016-06-07 16:42:30.625+00	602
3739	[INFO] Warenausgang mit der id 652 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:42:54.238+00	602
3740	[INFO] Wareneingang mit der id 278 gespeichert	2016-06-07 16:44:26.249+00	602
3741	[INFO] Wareneingang mit der id 278 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:44:31.368+00	602
3742	[INFO] Warenausgang mit der id 653 gespeichert	2016-06-07 16:45:00.744+00	602
3746	[INFO] Wareneingang mit der id 279 auf Archivierungsstatus 0 gesetzt	2016-06-07 16:47:45.756+00	602
3747	[INFO] Wareneingang mit der id 279 gespeichert	2016-06-07 16:48:01.533+00	602
3749	[INFO] Warenausgang mit der id 654 gespeichert	2016-06-07 16:48:46.161+00	602
3751	[INFO] Wareneingang mit der id 280 gespeichert	2016-06-07 16:56:53.217+00	602
3753	[INFO] Warenausgang mit der id 655 gespeichert	2016-06-07 16:57:46.885+00	602
3768	[INFO] Wareneingang mit der id 282 gespeichert	2016-06-07 17:22:50.051+00	602
3769	[INFO] Wareneingang mit der id 282 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:23:00.004+00	602
3770	[INFO] Warenausgang mit der id 661 gespeichert	2016-06-07 17:23:40.855+00	602
3772	[INFO] Wareneingang mit der id 283 gespeichert	2016-06-07 17:25:10.187+00	602
3773	[INFO] Wareneingang mit der id 283 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:25:18.884+00	602
3774	[INFO] Warenausgang mit der id 662 gespeichert	2016-06-07 17:26:03.718+00	602
3776	[INFO] Warenausgang mit der id 663 gespeichert	2016-06-07 17:33:33.702+00	602
3788	[INFO] Warenausgang mit der id 663 gespeichert	2016-06-07 17:47:21.591+00	602
3790	[INFO] Wareneingang mit der id 285 gespeichert	2016-06-07 17:56:18.603+00	602
3793	[INFO] Warenausgang mit der id 669 gespeichert	2016-06-07 17:59:24.129+00	602
3795	[INFO] Warenausgang mit der id 671 gespeichert	2016-06-07 18:00:36.44+00	602
3796	[INFO] Warenausgang mit der id 672 gespeichert	2016-06-07 18:02:15.533+00	602
3809	[INFO] Warenausgang mit der id 675 gespeichert	2016-06-07 18:21:41.318+00	602
3812	[INFO] Warenausgang mit der id 678 gespeichert	2016-06-07 18:24:10.796+00	602
3813	[INFO] Warenausgang mit der id 678 gespeichert	2016-06-07 18:24:34.359+00	602
3814	[INFO] Warenausgang mit der id 679 gespeichert	2016-06-07 18:25:24.204+00	602
3743	[INFO] Warenausgang mit der id 653 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:45:09.349+00	602
3748	[INFO] Wareneingang mit der id 279 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:48:07.011+00	602
3750	[INFO] Warenausgang mit der id 654 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:48:51.511+00	602
3752	[INFO] Wareneingang mit der id 280 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:57:04.013+00	602
3754	[INFO] Warenausgang mit der id 656 gespeichert	2016-06-07 16:58:19.319+00	602
3757	[INFO] Artikelverteilung für Artikel mit der Id 620 geändert	2016-06-07 17:02:00.705+00	602
3758	[INFO] Warenausgang mit der id 659 gespeichert	2016-06-07 17:02:47.577+00	602
3771	[INFO] Warenausgang mit der id 661 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:23:47.549+00	602
3775	[INFO] Warenausgang mit der id 662 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:28:51.035+00	602
3781	[INFO] Wareneingang mit der id 284 gespeichert	2016-06-07 17:40:47.128+00	602
3808	[INFO] Wareneingang mit der id 286 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:19:36.898+00	602
3810	[INFO] Warenausgang mit der id 676 gespeichert	2016-06-07 18:22:29.453+00	602
3811	[INFO] Warenausgang mit der id 677 gespeichert	2016-06-07 18:23:25.792+00	602
3816	[INFO] Warenausgang mit der id 681 gespeichert	2016-06-07 18:27:09.389+00	602
3832	[INFO] Warenausgang mit der id 686 gespeichert	2016-06-07 18:39:44.255+00	602
3744	[INFO] Wareneingang mit der id 279 gespeichert	2016-06-07 16:46:54.453+00	602
3745	[INFO] Wareneingang mit der id 279 auf Archivierungsstatus 1 gesetzt	2016-06-07 16:47:03.414+00	602
3755	[INFO] Warenausgang mit der id 657 gespeichert	2016-06-07 16:58:50.973+00	602
3756	[INFO] Warenausgang mit der id 658 gespeichert	2016-06-07 16:59:45.559+00	602
3777	[INFO] Warenausgang mit der id 664 gespeichert	2016-06-07 17:36:12.833+00	602
3778	[INFO] Warenausgang mit der id 664 gespeichert	2016-06-07 17:37:16.572+00	602
3779	[INFO] Warenausgang mit der id 663 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:37:20.829+00	602
3780	[INFO] Warenausgang mit der id 664 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:37:25.318+00	602
3782	[INFO] Wareneingang mit der id 284 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:40:51.355+00	602
3783	[INFO] Warenausgang mit der id 665 gespeichert	2016-06-07 17:42:26.01+00	602
3784	[INFO] Warenausgang mit der id 666 gespeichert	2016-06-07 17:43:26.233+00	602
3787	[INFO] Warenausgang mit der id 664 gespeichert	2016-06-07 17:46:36.927+00	602
3789	[INFO] Wareneingang mit der id 248 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:48:12.699+00	602
3791	[INFO] Warenausgang mit der id 667 gespeichert	2016-06-07 17:57:51.28+00	602
3792	[INFO] Warenausgang mit der id 668 gespeichert	2016-06-07 17:58:47.284+00	602
3797	[INFO] Warenausgang mit der id 673 gespeichert	2016-06-07 18:02:47.233+00	602
3828	[INFO] Wareneingang mit der id 287 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:37:36.867+00	602
3833	[INFO] Warenausgang mit der id 687 gespeichert	2016-06-07 18:40:09.683+00	602
3834	[INFO] Warenausgang mit der id 686 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:42:15.694+00	602
3835	[INFO] Warenausgang mit der id 687 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:42:20.413+00	602
3836	[INFO] Warenausgang mit der id 685 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:42:23.217+00	602
3837	[INFO] Warenausgang mit der id 683 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:42:27.145+00	602
3838	[INFO] Warenausgang mit der id 684 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:42:30.427+00	602
3841	[INFO] Warenausgang mit der id 688 gespeichert	2016-06-07 18:58:53.533+00	602
3843	[INFO] Warenausgang mit der id 690 gespeichert	2016-06-07 19:01:56.299+00	602
3853	[INFO] Wareneingang mit der id 286 auf Archivierungsstatus 0 gesetzt	2016-06-07 19:11:27.05+00	602
3854	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2016-06-07 19:11:58.446+00	602
3759	[INFO] Warenausgang mit der id 655 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:03:04.835+00	602
3760	[INFO] Warenausgang mit der id 656 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:03:10.239+00	602
3761	[INFO] Warenausgang mit der id 659 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:03:13.811+00	602
3762	[INFO] Warenausgang mit der id 657 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:03:18.033+00	602
3763	[INFO] Warenausgang mit der id 658 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:03:21.396+00	602
3764	[INFO] Wareneingang mit der id 281 gespeichert	2016-06-07 17:05:50.966+00	602
3765	[INFO] Wareneingang mit der id 281 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:06:00.927+00	602
3766	[INFO] Warenausgang mit der id 660 gespeichert	2016-06-07 17:06:35.861+00	602
3767	[INFO] Warenausgang mit der id 660 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:06:47.575+00	602
3785	[INFO] Warenausgang mit der id 666 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:43:31.106+00	602
3786	[INFO] Warenausgang mit der id 665 auf Archivierungsstatus 1 gesetzt	2016-06-07 17:43:34.559+00	602
3794	[INFO] Warenausgang mit der id 670 gespeichert	2016-06-07 18:00:02.052+00	602
3798	[INFO] Warenausgang mit der id 674 gespeichert	2016-06-07 18:07:40.409+00	602
3799	[INFO] Warenausgang mit der id 674 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:06.416+00	602
3800	[INFO] Warenausgang mit der id 672 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:11.252+00	602
3801	[INFO] Warenausgang mit der id 667 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:13.975+00	602
3802	[INFO] Warenausgang mit der id 673 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:16.995+00	602
3803	[INFO] Warenausgang mit der id 671 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:20.354+00	602
3804	[INFO] Warenausgang mit der id 669 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:23.601+00	602
3805	[INFO] Warenausgang mit der id 668 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:27.847+00	602
3806	[INFO] Warenausgang mit der id 670 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:08:31.736+00	602
3807	[INFO] Wareneingang mit der id 286 gespeichert	2016-06-07 18:16:53.421+00	602
3815	[INFO] Warenausgang mit der id 680 gespeichert	2016-06-07 18:26:10.819+00	602
3817	[INFO] Warenausgang mit der id 682 gespeichert	2016-06-07 18:27:48.822+00	602
3818	[INFO] Warenausgang mit der id 675 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:02.093+00	602
3819	[INFO] Warenausgang mit der id 678 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:05.896+00	602
3820	[INFO] Warenausgang mit der id 677 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:09.29+00	602
3821	[INFO] Warenausgang mit der id 680 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:12.027+00	602
3822	[INFO] Warenausgang mit der id 681 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:15.853+00	602
3823	[INFO] Warenausgang mit der id 682 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:18.995+00	602
3824	[INFO] Warenausgang mit der id 676 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:22.867+00	602
3825	[INFO] Warenausgang mit der id 679 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:28:26.362+00	602
3826	[INFO] Organisation mit der id 266 gespeichert. organisationId: 266, name: Öller Brandstätter, comment: , updateTimestamp: Tue Jun 07 18:31:56 UTC 2016, active: 1	2016-06-07 18:31:56.757+00	602
3827	[INFO] Wareneingang mit der id 287 gespeichert	2016-06-07 18:37:19.039+00	602
3829	[INFO] Warenausgang mit der id 683 gespeichert	2016-06-07 18:38:14.188+00	602
3830	[INFO] Warenausgang mit der id 684 gespeichert	2016-06-07 18:38:43.801+00	602
3831	[INFO] Warenausgang mit der id 685 gespeichert	2016-06-07 18:39:14.692+00	602
3839	[INFO] Wareneingang mit der id 288 gespeichert	2016-06-07 18:57:40.153+00	602
3840	[INFO] Wareneingang mit der id 288 auf Archivierungsstatus 1 gesetzt	2016-06-07 18:57:56.893+00	602
3842	[INFO] Warenausgang mit der id 689 gespeichert	2016-06-07 19:01:00.972+00	602
3844	[INFO] Warenausgang mit der id 691 gespeichert	2016-06-07 19:03:51.539+00	602
3845	[INFO] Warenausgang mit der id 688 auf Archivierungsstatus 1 gesetzt	2016-06-07 19:03:58.49+00	602
3846	[INFO] Warenausgang mit der id 690 auf Archivierungsstatus 1 gesetzt	2016-06-07 19:04:01.986+00	602
3847	[INFO] Warenausgang mit der id 689 auf Archivierungsstatus 1 gesetzt	2016-06-07 19:04:05.041+00	602
3848	[INFO] Warenausgang mit der id 691 auf Archivierungsstatus 1 gesetzt	2016-06-07 19:04:08.173+00	602
3849	[INFO] Wareneingang mit der id 289 gespeichert	2016-06-07 19:09:57.476+00	602
3850	[INFO] Wareneingang mit der id 289 auf Archivierungsstatus 1 gesetzt	2016-06-07 19:10:02.441+00	602
3851	[INFO] Warenausgang mit der id 692 gespeichert	2016-06-07 19:10:45.449+00	602
3852	[INFO] Warenausgang mit der id 692 auf Archivierungsstatus 1 gesetzt	2016-06-07 19:10:50.693+00	602
3855	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-06-10 06:28:49.288+00	519
3856	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-06-12 10:22:44.058+00	519
3857	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-06-13 06:30:17.337+00	519
3858	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-06-13 11:11:08.013+00	253
3859	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-06-13 11:11:17.15+00	253
3860	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-06-15 05:33:39.543+00	519
3861	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-06-20 08:19:54.542+00	441
3862	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-06-23 07:22:13.679+00	253
3863	[INFO] Organisation mit der id 267 gespeichert. organisationId: 267, name: Bergader Lager TS, comment: , updateTimestamp: Thu Jun 23 07:24:04 UTC 2016, active: 1	2016-06-23 07:24:04.944+00	253
3864	[INFO] Person mit der id 675 gespeichert. personId: 675, salutation: Herr, title: , firstName: Christian, lastName: Greim, comment: , updateTimestamp: 2016-06-23, active: 1	2016-06-23 07:25:40.804+00	253
3865	[INFO] Person mit der id 675 gespeichert. personId: 675, salutation: Herr, title: , firstName: Christian, lastName: Greim, comment: , updateTimestamp: 2016-06-23, active: 1	2016-06-23 07:26:35.197+00	253
3866	[INFO] Organisation mit der id 267 gespeichert. organisationId: 267, name: Bergader Lager TS, comment: , updateTimestamp: Thu Jun 23 07:27:14 UTC 2016, active: 1	2016-06-23 07:27:14.694+00	253
3867	[INFO] Person mit der id 197 gelöscht	2016-06-23 07:29:09.425+00	253
3868	[INFO] Person mit der id 676 gespeichert. personId: 676, salutation: Frau, title: , firstName: Birgit, lastName: Schmauss, comment: , updateTimestamp: 2016-06-23, active: 1	2016-06-23 07:29:56.794+00	253
3869	[INFO] Person mit der id 677 gespeichert. personId: 677, salutation: Frau, title: , firstName: Monika, lastName: Stöckl, comment: , updateTimestamp: 2016-06-23, active: 1	2016-06-23 07:30:32.043+00	253
3870	[INFO] Person mit der id 675 gespeichert. personId: 675, salutation: Herr, title: , firstName: Christian, lastName: Greim, comment: , updateTimestamp: 2016-06-23, active: 1	2016-06-23 07:30:45.491+00	253
3871	[INFO] Organisation mit der id 9 gespeichert. organisationId: 9, name: anderskompetent Gmbh, comment: , updateTimestamp: Thu Jun 23 07:31:32 UTC 2016, active: 1	2016-06-23 07:31:32.622+00	253
3872	[INFO] Organisation mit der id 191 gespeichert. organisationId: 191, name: SOS-Kinderdorf Clearinghouse, comment: , updateTimestamp: Thu Jun 23 07:31:57 UTC 2016, active: 1	2016-06-23 07:31:57.223+00	253
3873	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-06-23 07:33:25.462+00	253
3874	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-06-23 11:46:49.843+00	253
3875	[INFO] Person mit der id 407 gelöscht	2016-06-23 11:47:13.99+00	253
3876	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-06-23 11:49:14.497+00	253
3877	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-06-27 17:55:07.264+00	345
3878	[INFO] Person mit der id 678 gespeichert. personId: 678, salutation: Frau, title: Mag., firstName: Sabine, lastName: Wolfsgruber, comment: , updateTimestamp: 2016-06-27, active: 1	2016-06-27 17:59:20.429+00	345
3879	[INFO] Organisation mit der id 268 gespeichert. organisationId: 268, name: Umwelt Service Salzburg, comment: Unterstützer, updateTimestamp: Mon Jun 27 18:01:56 UTC 2016, active: 1	2016-06-27 18:01:56.312+00	345
3880	[INFO] Person mit der id 678 gespeichert. personId: 678, salutation: Frau, title: Mag., firstName: Sabine, lastName: Wolfsgruber, comment: , updateTimestamp: 2016-06-27, active: 1	2016-06-27 18:02:48.507+00	345
3881	[INFO] Person mit der id 678 gespeichert. personId: 678, salutation: Frau, title: Mag., firstName: Sabine, lastName: Wolfsgruber, comment: Geschäftsführerin, updateTimestamp: 2016-06-27, active: 1	2016-06-27 18:07:31.985+00	345
3882	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-06-27 18:08:20.633+00	345
3883	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-06-28 09:14:13.54+00	642
3884	[INFO] Wareneingang mit der id 290 gespeichert	2016-06-28 09:49:08.152+00	642
3885	[INFO] Wareneingang mit der id 291 gespeichert	2016-06-28 09:59:54.17+00	642
3886	[INFO] Warenausgang mit der id 693 gespeichert	2016-06-28 10:01:51.144+00	642
3887	[INFO] Warenausgang mit der id 694 gespeichert	2016-06-28 10:03:50.52+00	642
3888	[INFO] Warenausgang mit der id 695 gespeichert	2016-06-28 10:04:39.797+00	642
3889	[INFO] Warenausgang mit der id 696 gespeichert	2016-06-28 10:06:50.023+00	642
3890	[INFO] Warenausgang mit der id 695 auf Archivierungsstatus 1 gesetzt	2016-06-28 10:07:19.423+00	642
3891	[INFO] Warenausgang mit der id 694 auf Archivierungsstatus 1 gesetzt	2016-06-28 10:07:22.032+00	642
3892	[INFO] Warenausgang mit der id 693 auf Archivierungsstatus 1 gesetzt	2016-06-28 10:07:24.37+00	642
3893	[INFO] Warenausgang mit der id 696 auf Archivierungsstatus 1 gesetzt	2016-06-28 10:07:26.631+00	642
3894	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-06-28 11:13:04.013+00	642
3895	[INFO] Wareneingang mit der id 292 gespeichert	2016-06-28 11:29:47.15+00	642
3896	[INFO] Warenausgang mit der id 697 gespeichert	2016-06-28 11:30:30.622+00	642
3897	[INFO] Warenausgang mit der id 698 gespeichert	2016-06-28 11:31:35.658+00	642
3898	[INFO] Warenausgang mit der id 699 gespeichert	2016-06-28 11:32:32.609+00	642
3899	[INFO] Warenausgang mit der id 697 auf Archivierungsstatus 1 gesetzt	2016-06-28 11:32:41.001+00	642
3900	[INFO] Warenausgang mit der id 698 auf Archivierungsstatus 1 gesetzt	2016-06-28 11:32:44.639+00	642
3901	[INFO] Warenausgang mit der id 699 auf Archivierungsstatus 1 gesetzt	2016-06-28 11:32:48.577+00	642
3902	[INFO] Wareneingang mit der id 292 auf Archivierungsstatus 1 gesetzt	2016-06-28 11:32:55.266+00	642
3903	[INFO] Wareneingang mit der id 290 gespeichert	2016-06-28 11:50:21.773+00	642
3904	[INFO] Warenausgang mit der id 695 auf Archivierungsstatus 0 gesetzt	2016-06-28 11:50:44.731+00	642
3905	[INFO] Warenausgang mit der id 693 auf Archivierungsstatus 0 gesetzt	2016-06-28 11:50:51.815+00	642
3906	[INFO] Warenausgang mit der id 693 auf Archivierungsstatus 1 gesetzt	2016-06-28 11:51:03.858+00	642
3907	[INFO] Warenausgang mit der id 693 auf Archivierungsstatus 0 gesetzt	2016-06-28 11:51:12.577+00	642
3908	[INFO] Warenausgang mit der id 694 auf Archivierungsstatus 0 gesetzt	2016-06-28 11:51:27.081+00	642
3909	[INFO] Warenausgang mit der id 695 gelöscht	2016-06-28 11:51:56.759+00	642
3910	[INFO] Warenausgang mit der id 693 gelöscht	2016-06-28 11:52:01.842+00	642
3911	[INFO] Warenausgang mit der id 694 gelöscht	2016-06-28 11:52:06.399+00	642
3912	[INFO] Artikel mit der Id 636 für alle Wareneingänge und Warenausgänge gelöscht	2016-06-28 11:52:41.845+00	642
3913	[INFO] Warenausgang mit der id 698 auf Archivierungsstatus 0 gesetzt	2016-06-28 11:54:16.477+00	642
3914	[INFO] Warenausgang mit der id 696 auf Archivierungsstatus 0 gesetzt	2016-06-28 11:54:26.92+00	642
3915	[INFO] Warenausgang mit der id 698 gelöscht	2016-06-28 11:55:01.879+00	642
3916	[INFO] Warenausgang mit der id 696 gelöscht	2016-06-28 11:55:09.27+00	642
3917	[INFO] Wareneingang mit der id 290 gespeichert	2016-06-28 11:56:33.128+00	642
3918	[INFO] Warenausgang mit der id 700 gespeichert	2016-06-28 11:57:33.171+00	642
3919	[INFO] Warenausgang mit der id 701 gespeichert	2016-06-28 11:58:30.569+00	642
3920	[INFO] Warenausgang mit der id 702 gespeichert	2016-06-28 11:59:14.351+00	642
3921	[INFO] Warenausgang mit der id 703 gespeichert	2016-06-28 12:00:29.53+00	642
3922	[INFO] Warenausgang mit der id 704 gespeichert	2016-06-28 12:01:39.573+00	642
3923	[INFO] Warenausgang mit der id 703 auf Archivierungsstatus 1 gesetzt	2016-06-28 12:02:02.576+00	642
3924	[INFO] Warenausgang mit der id 704 auf Archivierungsstatus 1 gesetzt	2016-06-28 12:02:10.672+00	642
3925	[INFO] Warenausgang mit der id 700 auf Archivierungsstatus 1 gesetzt	2016-06-28 12:02:17.908+00	642
3926	[INFO] Warenausgang mit der id 701 auf Archivierungsstatus 1 gesetzt	2016-06-28 12:02:23.504+00	642
3927	[INFO] Warenausgang mit der id 702 auf Archivierungsstatus 1 gesetzt	2016-06-28 12:03:41.191+00	642
3928	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-06-28 12:03:52.007+00	642
3929	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-06-28 12:04:02.022+00	642
3930	[INFO] Wareneingang mit der id 290 auf Archivierungsstatus 1 gesetzt	2016-06-28 12:04:11.291+00	642
3931	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-06-28 12:04:15.249+00	642
3932	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-06-29 08:08:43.822+00	441
3933	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-06-29 08:44:53.705+00	642
3934	[INFO] Wareneingang mit der id 293 gespeichert	2016-06-29 08:49:29.461+00	642
3935	[INFO] Warenausgang mit der id 705 gespeichert	2016-06-29 08:52:20.723+00	642
3936	[INFO] Warenausgang mit der id 706 gespeichert	2016-06-29 08:53:56.903+00	642
3938	[INFO] Warenausgang mit der id 706 gespeichert	2016-06-29 09:07:07.74+00	642
3937	[INFO] Warenausgang mit der id 707 gespeichert	2016-06-29 09:06:08.019+00	642
3939	[INFO] Warenausgang mit der id 707 gespeichert	2016-06-29 09:08:00.023+00	642
3940	[INFO] Warenausgang mit der id 708 gespeichert	2016-06-29 09:09:33.241+00	642
3941	[INFO] Wareneingang mit der id 294 gespeichert	2016-06-29 09:20:08.169+00	642
3942	[INFO] Warenausgang mit der id 709 gespeichert	2016-06-29 09:20:57.56+00	642
3943	[INFO] Warenausgang mit der id 709 auf Archivierungsstatus 1 gesetzt	2016-06-29 09:21:04.022+00	642
3944	[INFO] Warenausgang mit der id 710 gespeichert	2016-06-29 09:21:35.401+00	642
3945	[INFO] Warenausgang mit der id 710 auf Archivierungsstatus 1 gesetzt	2016-06-29 09:21:45.304+00	642
3946	[INFO] Warenausgang mit der id 711 gespeichert	2016-06-29 09:22:54.393+00	642
3947	[INFO] Wareneingang mit der id 294 auf Archivierungsstatus 1 gesetzt	2016-06-29 09:23:46.39+00	642
3948	[INFO] Wareneingang mit der id 293 auf Archivierungsstatus 1 gesetzt	2016-06-29 09:24:22.363+00	642
3949	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-06-29 09:26:02.116+00	642
3950	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-07-04 11:24:21.543+00	519
3951	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-07-04 11:27:34.561+00	519
3952	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-07-07 07:13:33.139+00	642
3953	[INFO] Wareneingang mit der id 295 gespeichert	2016-07-07 07:16:21.84+00	642
3954	[INFO] Wareneingang mit der id 296 gespeichert	2016-07-07 07:17:08.321+00	642
3955	[INFO] Wareneingang mit der id 297 gespeichert	2016-07-07 07:19:02.817+00	642
3956	[INFO] Warenausgang mit der id 712 gespeichert	2016-07-07 07:19:44.996+00	642
3957	[INFO] Warenausgang mit der id 712 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:19:50.968+00	642
3958	[INFO] Warenausgang mit der id 713 gespeichert	2016-07-07 07:20:28.12+00	642
3959	[INFO] Warenausgang mit der id 714 gespeichert	2016-07-07 07:22:21.901+00	642
3960	[INFO] Warenausgang mit der id 713 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:22:33.102+00	642
3961	[INFO] Warenausgang mit der id 714 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:22:36.468+00	642
3962	[INFO] Warenausgang mit der id 715 gespeichert	2016-07-07 07:23:09.058+00	642
3963	[INFO] Warenausgang mit der id 716 gespeichert	2016-07-07 07:23:41.272+00	642
3964	[INFO] Warenausgang mit der id 717 gespeichert	2016-07-07 07:24:19.94+00	642
3965	[INFO] Warenausgang mit der id 715 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:24:29.781+00	642
3966	[INFO] Warenausgang mit der id 716 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:24:33.306+00	642
3967	[INFO] Warenausgang mit der id 717 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:24:36.91+00	642
3968	[INFO] Wareneingang mit der id 296 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:24:45.586+00	642
3969	[INFO] Wareneingang mit der id 295 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:24:48.332+00	642
3970	[INFO] Wareneingang mit der id 297 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:24:51.166+00	642
3971	[INFO] Wareneingang mit der id 298 gespeichert	2016-07-07 07:53:23.702+00	642
3972	[INFO] Warenausgang mit der id 718 gespeichert	2016-07-07 07:53:48.414+00	642
3973	[INFO] Warenausgang mit der id 719 gespeichert	2016-07-07 07:54:17.2+00	642
3974	[INFO] Warenausgang mit der id 720 gespeichert	2016-07-07 07:54:45.94+00	642
3975	[INFO] Warenausgang mit der id 718 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:54:49.513+00	642
3976	[INFO] Warenausgang mit der id 719 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:54:52.91+00	642
3977	[INFO] Warenausgang mit der id 720 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:54:55.719+00	642
3978	[INFO] Warenausgang mit der id 721 gespeichert	2016-07-07 07:55:19.457+00	642
3979	[INFO] Warenausgang mit der id 722 gespeichert	2016-07-07 07:55:39.497+00	642
3980	[INFO] Warenausgang mit der id 721 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:55:45.763+00	642
3981	[INFO] Warenausgang mit der id 722 auf Archivierungsstatus 1 gesetzt	2016-07-07 07:55:55.271+00	642
3982	[INFO] Wareneingang mit der id 299 gespeichert	2016-07-07 08:10:41.927+00	642
3983	[INFO] Wareneingang mit der id 300 gespeichert	2016-07-07 08:11:50.304+00	642
3984	[INFO] Warenausgang mit der id 723 gespeichert	2016-07-07 08:12:20.42+00	642
3985	[INFO] Warenausgang mit der id 724 gespeichert	2016-07-07 08:13:26.409+00	642
3986	[INFO] Warenausgang mit der id 723 auf Archivierungsstatus 1 gesetzt	2016-07-07 08:13:30.566+00	642
3987	[INFO] Warenausgang mit der id 724 auf Archivierungsstatus 1 gesetzt	2016-07-07 08:13:33.543+00	642
3988	[INFO] Warenausgang mit der id 725 gespeichert	2016-07-07 08:13:54.193+00	642
3989	[INFO] Warenausgang mit der id 725 auf Archivierungsstatus 1 gesetzt	2016-07-07 08:13:58.304+00	642
3990	[INFO] Warenausgang mit der id 726 gespeichert	2016-07-07 08:14:18.362+00	642
3991	[INFO] Warenausgang mit der id 726 auf Archivierungsstatus 1 gesetzt	2016-07-07 08:14:22.439+00	642
3992	[INFO] Warenausgang mit der id 727 gespeichert	2016-07-07 08:14:40.502+00	642
3993	[INFO] Warenausgang mit der id 727 auf Archivierungsstatus 1 gesetzt	2016-07-07 08:14:45.003+00	642
3994	[INFO] Wareneingang mit der id 299 auf Archivierungsstatus 1 gesetzt	2016-07-07 08:16:04.139+00	642
3995	[INFO] Wareneingang mit der id 301 gespeichert	2016-07-07 08:20:02.598+00	642
3996	[INFO] Wareneingang mit der id 302 gespeichert	2016-07-07 08:21:45.643+00	642
3997	[INFO] Wareneingang mit der id 303 gespeichert	2016-07-07 08:28:34.48+00	642
3998	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-07-07 08:47:09.751+00	642
3999	[INFO] Warenausgang mit der id 728 gespeichert	2016-07-07 08:49:31.485+00	642
4000	[INFO] Warenausgang mit der id 729 gespeichert	2016-07-07 08:51:41.557+00	642
4001	[INFO] Warenausgang mit der id 728 gespeichert	2016-07-07 08:52:14.134+00	642
4002	[INFO] Warenausgang mit der id 729 gespeichert	2016-07-07 08:52:38.368+00	642
4003	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-07-09 14:56:02.54+00	253
4004	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-07-11 12:08:31.959+00	441
4005	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-07-12 15:36:08.003+00	345
4006	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-07-12 15:40:22.079+00	345
4007	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-07-14 10:05:24.633+00	441
4008	[INFO] Person mit der id 656 gespeichert. personId: 656, salutation: Frau, title: , firstName: Sabine, lastName: Füssl, comment: Tätigkeit: Administration, updateTimestamp: 2016-07-14, active: 1	2016-07-14 10:06:52.357+00	441
4009	[INFO] Person mit der id 656 gespeichert. personId: 656, salutation: Frau, title: , firstName: Sabine, lastName: Füssl, comment: , updateTimestamp: 2016-07-14, active: 1	2016-07-14 10:07:38.7+00	441
4010	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-07-14 10:09:10.874+00	441
4011	[INFO] Alle Personen als CSV exportiert.	2016-07-14 10:17:02.261+00	441
4012	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-07-17 13:23:37.006+00	253
4013	[INFO] Passwort für Person mit Id 252 zurückgesetzt.	2016-07-17 13:24:48.555+00	253
4014	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: Tätigkeit: Obfrau, Disposition, updateTimestamp: 2016-07-17, active: 1	2016-07-17 13:24:52.118+00	253
4015	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-07-17 13:24:59.146+00	253
4016	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-07-17 13:25:07.722+00	252
4017	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-07-17 13:25:12.025+00	252
4018	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-07-21 08:53:41.634+00	642
4019	[INFO] Warenausgang mit der id 729 gespeichert	2016-07-21 09:04:11.009+00	642
4020	[INFO] Warenausgang mit der id 730 gespeichert	2016-07-21 09:10:07.726+00	642
4021	[INFO] Warenausgang mit der id 728 gespeichert	2016-07-21 09:11:02.271+00	642
4022	[INFO] Wareneingang mit der id 301 auf Archivierungsstatus 1 gesetzt	2016-07-21 09:12:34.528+00	642
4023	[INFO] Wareneingang mit der id 304 gespeichert	2016-07-21 09:36:10.322+00	642
4024	[INFO] Warenausgang mit der id 731 gespeichert	2016-07-21 09:39:35.528+00	642
4025	[INFO] Warenausgang mit der id 732 gespeichert	2016-07-21 09:40:10.644+00	642
4026	[INFO] Warenausgang mit der id 733 gespeichert	2016-07-21 09:40:48.468+00	642
4027	[INFO] Warenausgang mit der id 734 gespeichert	2016-07-21 09:41:17.665+00	642
4028	[INFO] Warenausgang mit der id 735 gespeichert	2016-07-21 09:43:37.784+00	642
4029	[INFO] Wareneingang mit der id 302 auf Archivierungsstatus 1 gesetzt	2016-07-21 09:43:49.35+00	642
4030	[INFO] Wareneingang mit der id 305 gespeichert	2016-07-21 09:59:27.63+00	642
4031	[INFO] Warenausgang mit der id 736 gespeichert	2016-07-21 10:00:13.155+00	642
4032	[INFO] Warenausgang mit der id 737 gespeichert	2016-07-21 10:01:06.475+00	642
4033	[INFO] Warenausgang mit der id 738 gespeichert	2016-07-21 10:01:35.786+00	642
4034	[INFO] Warenausgang mit der id 739 gespeichert	2016-07-21 10:02:06.524+00	642
4035	[INFO] Warenausgang mit der id 740 gespeichert	2016-07-21 10:02:39.983+00	642
4036	[INFO] Warenausgang mit der id 741 gespeichert	2016-07-21 10:03:06.736+00	642
4037	[INFO] Warenausgang mit der id 742 gespeichert	2016-07-21 10:03:33.5+00	642
4038	[INFO] Warenausgang mit der id 743 gespeichert	2016-07-21 10:03:53.349+00	642
4039	[INFO] Warenausgang mit der id 741 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:04.974+00	642
4040	[INFO] Warenausgang mit der id 742 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:09.301+00	642
4041	[INFO] Warenausgang mit der id 743 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:14.066+00	642
4042	[INFO] Warenausgang mit der id 736 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:17.47+00	642
4043	[INFO] Warenausgang mit der id 737 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:22.786+00	642
4044	[INFO] Warenausgang mit der id 738 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:26.678+00	642
4045	[INFO] Warenausgang mit der id 740 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:30.624+00	642
4046	[INFO] Warenausgang mit der id 739 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:36.753+00	642
4047	[INFO] Wareneingang mit der id 305 auf Archivierungsstatus 1 gesetzt	2016-07-21 10:04:54.343+00	642
4048	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-07-21 10:05:40.482+00	642
4049	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-07-22 08:04:30.51+00	345
4050	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-07-22 08:06:51.752+00	345
4051	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-07-22 08:27:24.869+00	253
4052	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-07-22 08:27:30.517+00	253
4053	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-07-22 09:06:20.669+00	345
4054	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-07-22 09:08:13.215+00	345
4055	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-07-24 19:20:41.876+00	441
4056	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-07-29 15:38:37.677+00	642
4057	[INFO] Warenausgang mit der id 707 gelöscht	2016-07-29 15:40:54.169+00	642
4058	[INFO] Warenausgang mit der id 708 gelöscht	2016-07-29 15:41:49.64+00	642
4059	[INFO] Warenausgang mit der id 711 gelöscht	2016-07-29 15:42:49.89+00	642
4060	[INFO] Warenausgang mit der id 703 auf Archivierungsstatus 0 gesetzt	2016-07-29 15:44:04.764+00	642
4061	[INFO] Warenausgang mit der id 703 gespeichert	2016-07-29 15:44:37.664+00	642
4062	[INFO] Wareneingang mit der id 291 gelöscht	2016-07-29 15:44:51.266+00	642
4063	[INFO] Wareneingang mit der id 306 gespeichert	2016-07-29 15:50:22.517+00	642
4064	[INFO] Warenausgang mit der id 703 gespeichert	2016-07-29 15:50:59.277+00	642
4065	[INFO] Warenausgang mit der id 703 auf Archivierungsstatus 1 gesetzt	2016-07-29 15:51:10.941+00	642
4066	[INFO] Warenausgang mit der id 744 gespeichert	2016-07-29 15:52:10.441+00	642
4067	[INFO] Warenausgang mit der id 744 auf Archivierungsstatus 1 gesetzt	2016-07-29 15:52:53.845+00	642
4068	[INFO] Warenausgang mit der id 745 gespeichert	2016-07-29 15:55:08.318+00	642
4069	[INFO] Warenausgang mit der id 745 gespeichert	2016-07-29 15:55:40.944+00	642
4070	[INFO] Warenausgang mit der id 746 gespeichert	2016-07-29 15:56:57.55+00	642
4071	[INFO] Warenausgang mit der id 745 auf Archivierungsstatus 1 gesetzt	2016-07-29 15:57:16.801+00	642
4072	[INFO] Warenausgang mit der id 746 gespeichert	2016-07-29 15:57:51.849+00	642
4073	[INFO] Warenausgang mit der id 746 auf Archivierungsstatus 1 gesetzt	2016-07-29 15:58:09.616+00	642
4074	[INFO] Wareneingang mit der id 306 auf Archivierungsstatus 1 gesetzt	2016-07-29 15:59:45.466+00	642
4075	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-07-29 16:00:20.795+00	642
4076	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-01 16:49:37.032+00	345
4077	[INFO] Organisation mit der id 269 gespeichert. organisationId: 269, name: Chaka2, comment: Webseite:ja, updateTimestamp: Mon Aug 01 16:51:05 UTC 2016, active: 1	2016-08-01 16:51:05.901+00	345
4078	[INFO] Person mit der id 679 gespeichert. personId: 679, salutation: Herr, title: , firstName: Dominik, lastName: Teubi, comment: Projektmanager, updateTimestamp: 2016-08-01, active: 1	2016-08-01 16:53:00.413+00	345
4079	[INFO] Organisation mit der id 269 gespeichert. organisationId: 269, name: Chaka2, comment: Webseite:ja, updateTimestamp: Mon Aug 01 16:53:28 UTC 2016, active: 1	2016-08-01 16:53:28.683+00	345
4557	[INFO] Organisation mit der id 170 gelöscht	2016-09-26 16:42:58.829+00	519
4080	[INFO] Person mit der id 680 gespeichert. personId: 680, salutation: Frau, title: Mag., firstName: Christine , lastName: Mettler-Dornhofer, comment: , updateTimestamp: 2016-08-01, active: 1	2016-08-01 16:56:06.312+00	345
4081	[INFO] Organisation mit der id 73 gespeichert. organisationId: 73, name: Innovationswerkstatt Sebastian Mettler, comment: Fax: 0662/841079; www.innovationserkstatt.at, updateTimestamp: Mon Aug 01 16:57:01 UTC 2016, active: 1	2016-08-01 16:57:01.493+00	345
4082	[INFO] Person mit der id 680 gespeichert. personId: 680, salutation: Frau, title: Mag., firstName: Christine , lastName: Mettler-Dornhofer, comment: , updateTimestamp: 2016-08-01, active: 1	2016-08-01 17:02:19.47+00	345
4083	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-08-01 17:03:47.791+00	345
4084	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-08-05 11:25:26.493+00	574
4085	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-08-14 13:34:59.87+00	642
4086	[INFO] Organisation mit der id 270 gespeichert. organisationId: 270, name: Freie Christengemeinde Bürmoos, comment: , updateTimestamp: Sun Aug 14 13:47:04 UTC 2016, active: 1	2016-08-14 13:47:04.595+00	642
4087	[INFO] Warenausgang mit der id 747 gespeichert	2016-08-14 13:47:29.893+00	642
4088	[INFO] Warenausgang mit der id 748 gespeichert	2016-08-14 13:48:13.989+00	642
4089	[INFO] Warenausgang mit der id 748 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:48:36.876+00	642
4090	[INFO] Warenausgang mit der id 747 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:48:44.029+00	642
4091	[INFO] Warenausgang mit der id 706 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:48:50.608+00	642
4092	[INFO] Warenausgang mit der id 705 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:48:56.104+00	642
4093	[INFO] Wareneingang mit der id 298 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:49:19.863+00	642
4094	[INFO] Wareneingang mit der id 300 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:49:24.053+00	642
4095	[INFO] Warenausgang mit der id 730 gespeichert	2016-08-14 13:55:22.803+00	642
4096	[INFO] Warenausgang mit der id 749 gespeichert	2016-08-14 13:56:54.917+00	642
4097	[INFO] Warenausgang mit der id 732 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:57:48.781+00	642
4098	[INFO] Warenausgang mit der id 733 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:57:53.538+00	642
4099	[INFO] Warenausgang mit der id 734 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:57:56.837+00	642
4100	[INFO] Warenausgang mit der id 735 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:58:00.162+00	642
4101	[INFO] Warenausgang mit der id 729 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:58:03.487+00	642
4102	[INFO] Warenausgang mit der id 728 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:58:06.49+00	642
4103	[INFO] Warenausgang mit der id 731 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:58:09.588+00	642
4104	[INFO] Warenausgang mit der id 730 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:58:12.617+00	642
4105	[INFO] Warenausgang mit der id 749 auf Archivierungsstatus 1 gesetzt	2016-08-14 13:58:16.505+00	642
4106	[INFO] Warenausgang mit der id 750 gespeichert	2016-08-14 14:11:30.129+00	642
4107	[INFO] Warenausgang mit der id 750 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:12:18.701+00	642
4108	[INFO] Wareneingang mit der id 307 gespeichert	2016-08-14 14:19:27.881+00	642
4109	[INFO] Warenausgang mit der id 751 gespeichert	2016-08-14 14:20:45.567+00	642
4110	[INFO] Warenausgang mit der id 752 gespeichert	2016-08-14 14:21:15.683+00	642
4111	[INFO] Warenausgang mit der id 751 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:21:19.732+00	642
4112	[INFO] Warenausgang mit der id 752 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:21:22.428+00	642
4113	[INFO] Wareneingang mit der id 307 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:21:34.398+00	642
4114	[INFO] Wareneingang mit der id 303 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:21:37.296+00	642
4115	[INFO] Wareneingang mit der id 308 gespeichert	2016-08-14 14:22:28.332+00	642
4116	[INFO] Wareneingang mit der id 309 gespeichert	2016-08-14 14:23:13.236+00	642
4117	[INFO] Wareneingang mit der id 308 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:23:19+00	642
4118	[INFO] Wareneingang mit der id 308 auf Archivierungsstatus 0 gesetzt	2016-08-14 14:23:28.549+00	642
4119	[INFO] Wareneingang mit der id 309 gespeichert	2016-08-14 14:23:46.011+00	642
4120	[INFO] Warenausgang mit der id 753 gespeichert	2016-08-14 14:24:08.23+00	642
4121	[INFO] Warenausgang mit der id 753 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:24:21.574+00	642
4122	[INFO] Warenausgang mit der id 754 gespeichert	2016-08-14 14:24:37.631+00	642
4123	[INFO] Warenausgang mit der id 754 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:24:42.613+00	642
4124	[INFO] Wareneingang mit der id 308 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:25:04.292+00	642
4125	[INFO] Wareneingang mit der id 309 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:25:08.213+00	642
4126	[INFO] Organisation mit der id 271 gespeichert. organisationId: 271, name: ARGE Beisl - ABC Gastronomie GmbH, comment: , updateTimestamp: Sun Aug 14 14:30:19 UTC 2016, active: 1	2016-08-14 14:30:19.135+00	642
4127	[INFO] Organisation mit der id 271 gespeichert. organisationId: 271, name: ARGE Beisl - ABC Gastronomie GmbH, comment: , updateTimestamp: Sun Aug 14 14:31:23 UTC 2016, active: 1	2016-08-14 14:31:23.079+00	642
4128	[INFO] Wareneingang mit der id 310 gespeichert	2016-08-14 14:39:13.5+00	642
4129	[INFO] Warenausgang mit der id 755 gespeichert	2016-08-14 14:39:50.769+00	642
4130	[INFO] Warenausgang mit der id 756 gespeichert	2016-08-14 14:40:32.341+00	642
4131	[INFO] Warenausgang mit der id 755 gespeichert	2016-08-14 14:41:20.464+00	642
4132	[INFO] Warenausgang mit der id 755 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:41:36.87+00	642
4133	[INFO] Warenausgang mit der id 756 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:41:43.326+00	642
4134	[INFO] Wareneingang mit der id 310 auf Archivierungsstatus 1 gesetzt	2016-08-14 14:41:55.361+00	642
4135	[INFO] Wareneingang mit der id 311 gespeichert	2016-08-14 15:00:09.614+00	642
4136	[INFO] Wareneingang mit der id 311 gespeichert	2016-08-14 15:01:55.903+00	642
4137	[INFO] Warenausgang mit der id 757 gespeichert	2016-08-14 15:02:36.577+00	642
4138	[INFO] Warenausgang mit der id 757 auf Archivierungsstatus 1 gesetzt	2016-08-14 15:02:42.56+00	642
4139	[INFO] Wareneingang mit der id 311 auf Archivierungsstatus 1 gesetzt	2016-08-14 15:03:00.053+00	642
4140	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-08-14 15:05:05.035+00	642
4141	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-17 16:40:16.973+00	345
4142	[INFO] Organisation mit der id 255 gespeichert. organisationId: 255, name: Bodengraf GmbH, comment: IXSO, updateTimestamp: Wed Aug 17 16:49:38 UTC 2016, active: 1	2016-08-17 16:49:38.761+00	345
4143	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-17 18:30:57.929+00	345
4144	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-18 15:45:43.652+00	345
4145	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-18 16:58:11.602+00	345
4146	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-18 18:12:04.445+00	345
4158	[INFO] elisabeth.apfelthaler@inode.at hat sich angemeldet	2016-08-24 18:59:23.534+00	591
4147	[INFO] Organisation mit der id 157 gespeichert. organisationId: 157, name: Salzburg Schokolade GmbH, comment: Webseite: ja, updateTimestamp: Thu Aug 18 18:12:39 UTC 2016, active: 1	2016-08-18 18:12:39.418+00	345
4148	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-19 18:08:14.411+00	345
4149	[INFO] Organisation mit der id 109 gespeichert. organisationId: 109, name: McCain foods GmbH, comment: Festnetz: 01/7684524; Email: info.austria@mccain.com; Webseite:ja;\n, updateTimestamp: Fri Aug 19 18:30:53 UTC 2016, active: 1	2016-08-19 18:30:53.177+00	345
4150	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2016-08-20 09:50:52.463+00	642
4151	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2016-08-20 09:55:19.166+00	642
4152	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-08-22 06:07:55.635+00	519
4153	[INFO] Person mit der id 668 gespeichert. personId: 668, salutation: Herr, title: , firstName: Siegfried, lastName: Huber    , comment: , updateTimestamp: 2016-08-22, active: 1	2016-08-22 06:10:37.67+00	519
4154	[INFO] Person mit der id 681 gespeichert. personId: 681, salutation: Frau, title: , firstName: Leona, lastName: Lorentschitsch, comment: , updateTimestamp: 2016-08-22, active: 1	2016-08-22 06:12:57.925+00	519
4155	[INFO] Person mit der id 681 gespeichert. personId: 681, salutation: Frau, title: , firstName: Leona, lastName: Lorentschitsch, comment: , updateTimestamp: 2016-08-22, active: 1	2016-08-22 06:19:31.934+00	519
4156	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-22 16:44:46.12+00	345
4157	[INFO] elisabeth.apfelthaler@inode.at hat sich angemeldet	2016-08-24 18:46:21.162+00	591
4161	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-08-25 17:20:42.841+00	345
4162	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-02 07:27:20.096+00	519
4164	[INFO] Passwort für Person mit Id 252 zurückgesetzt.	2016-09-02 14:05:00.151+00	253
4165	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-02 14:05:04.175+00	253
4166	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-02 14:05:24.264+00	252
4167	[INFO] Passwort für Person mit Id 252 geändert.	2016-09-02 14:05:47.826+00	252
4168	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-02 14:05:50.031+00	252
4169	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-02 14:06:05.948+00	252
4170	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-02 14:08:12.928+00	252
4171	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-04 21:21:57.128+00	252
4174	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-06 05:31:53.801+00	519
4178	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-07 06:23:03.794+00	252
4159	[INFO] elisabeth.apfelthaler@inode.at hat sich abgemeldet	2016-08-24 19:10:52.758+00	591
4160	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-08-25 17:08:48.704+00	345
4163	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-09-02 14:04:26.32+00	253
4172	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-04 21:25:27.27+00	252
4173	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-05 06:44:36.239+00	519
4175	[INFO] Alle Personen als CSV exportiert.	2016-09-06 05:32:40.073+00	519
4176	[INFO] Person mit der id 682 gespeichert. personId: 682, salutation: Frau, title: Mag, firstName: Barbara, lastName: Scheibner, comment: , updateTimestamp: 2016-09-06, active: 1	2016-09-06 05:53:24.609+00	519
4177	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-06 07:24:55.941+00	519
4179	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-07 06:31:17.535+00	252
4180	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-07 06:41:59.731+00	252
4181	[INFO] Person mit der id 2 gespeichert. personId: 2, salutation: Schwester, title: , firstName: Berta, lastName:  , comment: , updateTimestamp: 2016-09-07, active: 1	2016-09-07 06:43:25.525+00	252
4182	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-07 07:14:37.431+00	252
4183	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-07 07:25:53.252+00	519
4184	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-09-07 07:53:08.924+00	441
4185	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-08 10:38:46.994+00	519
4186	[INFO] Person mit der id 683 gespeichert. personId: 683, salutation: , title: Mag., firstName: Paul , lastName: Lindner, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 10:48:23.548+00	519
4187	[INFO] Organisation mit der id 193 gespeichert. organisationId: 193, name: Sozialwerk Hallein, comment: zu löschen, updateTimestamp: Thu Sep 08 10:54:33 UTC 2016, active: 1	2016-09-08 10:54:33.557+00	519
4188	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-09-08 10:58:38.203+00	253
4189	[INFO] Organisation mit der id 193 gelöscht	2016-09-08 11:06:47.933+00	519
4190	[INFO] Organisation mit der id 13 gespeichert. organisationId: 13, name: Bastian’s  im Designer Outlet Salzburg, comment: nicht mehr aktuell, zu löschen, updateTimestamp: Thu Sep 08 11:08:02 UTC 2016, active: 1	2016-09-08 11:08:02.712+00	519
4191	[INFO] Person mit der id 159 gelöscht	2016-09-08 11:08:44.693+00	519
4192	[INFO] Organisation mit der id 185 gespeichert. organisationId: 185, name: Seniorenwohnheim St. Gilgen, comment: nicht mehr aktiv, zu löschen\n, updateTimestamp: Thu Sep 08 11:10:20 UTC 2016, active: 1	2016-09-08 11:10:20.639+00	519
4193	[INFO] Organisation mit der id 13 gespeichert. organisationId: 13, name: Bastian’s  im Designer Outlet Salzburg, comment: nicht mehr aktuell, löschen?, updateTimestamp: Thu Sep 08 11:10:41 UTC 2016, active: 1	2016-09-08 11:10:41.261+00	519
4194	[INFO] Organisation mit der id 185 gespeichert. organisationId: 185, name: Seniorenwohnheim St. Gilgen, comment: nicht mehr aktuell, löschen?\n, updateTimestamp: Thu Sep 08 11:10:55 UTC 2016, active: 1	2016-09-08 11:10:55.8+00	519
4195	[INFO] Organisation mit der id 97 gespeichert. organisationId: 97, name: Lebenshilfe GmbH, comment: nicht mehr aktuell, löschen?, updateTimestamp: Thu Sep 08 11:12:09 UTC 2016, active: 1	2016-09-08 11:12:09.705+00	519
4196	[INFO] Person mit der id 366 gespeichert. personId: 366, salutation: Frau, title: , firstName: Claudia, lastName: Oberascher, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:12:38.261+00	519
4197	[INFO] Organisation mit der id 99 gespeichert. organisationId: 99, name: Lebenshilfe Straßwalchen, comment: , updateTimestamp: Thu Sep 08 11:13:43 UTC 2016, active: 1	2016-09-08 11:13:43.126+00	519
4198	[INFO] Organisation mit der id 205 gespeichert. organisationId: 205, name: Ultrafrisch Salzburg GmbH, comment: nicht mehr aktuell, löschen?, updateTimestamp: Thu Sep 08 11:14:25 UTC 2016, active: 1	2016-09-08 11:14:25.673+00	519
4199	[INFO] Person mit der id 594 gelöscht	2016-09-08 11:15:00.156+00	519
4200	[INFO] Person mit der id 301 gelöscht	2016-09-08 11:15:14.298+00	519
4201	[INFO] Organisation mit der id 241 gespeichert. organisationId: 241, name: Stadtlesen VeranstaltungsGmbH, comment: keine Post - richtige Organisation ist Innovationswerkstatt, updateTimestamp: Thu Sep 08 11:16:36 UTC 2016, active: 1	2016-09-08 11:16:36.652+00	519
4202	[INFO] Person mit der id 507 gelöscht	2016-09-08 11:16:51.972+00	519
4203	[INFO] Person mit der id 469 gelöscht	2016-09-08 11:19:21.667+00	519
4204	[INFO] Person mit der id 684 gespeichert. personId: 684, salutation: Präsident, title: KommR, firstName: Konrad , lastName: Steindl , comment:  , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:20:41.436+00	519
4205	[INFO] Organisation mit der id 220 gespeichert. organisationId: 220, name: Wirtschaftskammer Salzburg, comment: , updateTimestamp: Thu Sep 08 11:21:09 UTC 2016, active: 1	2016-09-08 11:21:09.698+00	519
4206	[INFO] Person mit der id 684 gespeichert. personId: 684, salutation: Präsident, title: KommR, firstName: Konrad , lastName: Steindl , comment:  , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:21:54.16+00	519
4207	[INFO] Person mit der id 685 gespeichert. personId: 685, salutation: , title: Mag., firstName: Tatjana, lastName: Oppitz, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:23:29.408+00	519
4208	[INFO] Organisation mit der id 234 gespeichert. organisationId: 234, name: IBM Austria, comment: , updateTimestamp: Thu Sep 08 11:23:53 UTC 2016, active: 1	2016-09-08 11:23:53.206+00	519
4209	[INFO] Person mit der id 685 gespeichert. personId: 685, salutation: Frau, title: Mag., firstName: Tatjana, lastName: Oppitz, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:24:20.919+00	519
4210	[INFO] Person mit der id 684 gespeichert. personId: 684, salutation: Herr Präsident, title: KommR, firstName: Konrad , lastName: Steindl , comment:  , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:25:12.164+00	519
4211	[INFO] Person mit der id 686 gespeichert. personId: 686, salutation: Frau, title: Mag. Dr., firstName: Doris, lastName: Walter, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:29:10.621+00	519
4212	[INFO] Person mit der id 687 gespeichert. personId: 687, salutation: Frau, title: Dr. , firstName: Christine , lastName: Vallaster, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:30:35.03+00	519
4213	[INFO] Person mit der id 624 gespeichert. personId: 624, salutation: Herr, title: Dipl. Ing. Dr. , firstName: Gerhard, lastName: Jöchtl, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:31:46.232+00	519
4214	[INFO] Person mit der id 688 gespeichert. personId: 688, salutation: Herr , title: DI (FH) DI , firstName: Peter , lastName: Haber, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:32:56.112+00	519
4215	[INFO] Person mit der id 686 gespeichert. personId: 686, salutation: Frau, title: Mag. Dr., firstName: Doris, lastName: Walter, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:33:14.406+00	519
4216	[INFO] Person mit der id 687 gespeichert. personId: 687, salutation: Frau, title: Dr. , firstName: Christine , lastName: Vallaster, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:33:25.862+00	519
4217	[INFO] Organisation mit der id 233 gespeichert. organisationId: 233, name: Fachhochschule Salzburg GmbH, comment: , updateTimestamp: Thu Sep 08 11:34:50 UTC 2016, active: 1	2016-09-08 11:34:50.257+00	519
4218	[INFO] Person mit der id 624 gespeichert. personId: 624, salutation: Herr, title: DI Dr. , firstName: Gerhard, lastName: Jöchtl, comment: , updateTimestamp: 2016-09-08, active: 1	2016-09-08 11:35:40.387+00	519
4219	[INFO] Organisation mit der id 214 gespeichert. organisationId: 214, name: Wiberg GmbH, comment: nicht mehr aktuell, löschen?, updateTimestamp: Thu Sep 08 11:37:58 UTC 2016, active: 1	2016-09-08 11:37:58.29+00	519
4220	[INFO] Person mit der id 589 gelöscht	2016-09-08 11:38:23.528+00	519
4221	[INFO] Person mit der id 312 gelöscht	2016-09-08 11:38:30.318+00	519
4222	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-08 15:15:39.734+00	519
4223	[INFO] Organisation mit der id 9 gespeichert. organisationId: 9, name: anderskompetent Gmbh, comment: HFA ok, updateTimestamp: Thu Sep 08 15:16:51 UTC 2016, active: 1	2016-09-08 15:16:51.325+00	519
4224	[INFO] Organisation mit der id 12 gespeichert. organisationId: 12, name: Barmherzige Schwestern, comment: HFA ok, updateTimestamp: Thu Sep 08 15:20:46 UTC 2016, active: 1	2016-09-08 15:20:46.666+00	519
4225	[INFO] Organisation mit der id 23 gespeichert. organisationId: 23, name: Caritas Altenpension, comment: HFA ok, updateTimestamp: Thu Sep 08 15:21:22 UTC 2016, active: 1	2016-09-08 15:21:22.36+00	519
4270	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-09-08 17:06:12.865+00	519
4271	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-09-12 11:34:00.764+00	253
4281	[INFO] Alle Organisationen als CSV exportiert.	2016-09-12 11:42:17.38+00	253
4282	[INFO] Alle Personen als CSV exportiert.	2016-09-12 11:42:39.679+00	519
4283	[INFO] Alle Personen als CSV exportiert.	2016-09-12 11:42:49.134+00	253
4284	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-09-12 11:43:26.266+00	519
4285	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-12 11:43:32.956+00	519
4226	[INFO] Organisation mit der id 16 gespeichert. organisationId: 16, name: Benediktinerabtei Michaelbeuern, comment: HFA ok, updateTimestamp: Thu Sep 08 15:23:08 UTC 2016, active: 1	2016-09-08 15:23:08.983+00	519
4227	[INFO] Organisation mit der id 24 gespeichert. organisationId: 24, name: Caritas Flüchtlingshaus, comment: HFA ok, updateTimestamp: Thu Sep 08 15:24:08 UTC 2016, active: 1	2016-09-08 15:24:08.659+00	519
4228	[INFO] Organisation mit der id 32 gespeichert. organisationId: 32, name: Ehrenamtliches Team Obertrum, comment: HFA ok, updateTimestamp: Thu Sep 08 15:24:40 UTC 2016, active: 1	2016-09-08 15:24:40.334+00	519
4229	[INFO] Organisation mit der id 44 gespeichert. organisationId: 44, name: Franziskaner Kloster Salzburg, comment: HFA ok, updateTimestamp: Thu Sep 08 15:35:49 UTC 2016, active: 1	2016-09-08 15:35:49.15+00	519
4230	[INFO] Organisation mit der id 45 gespeichert. organisationId: 45, name: Frauenhaus Hallein - Haus Mirjam, comment: HFA ok, updateTimestamp: Thu Sep 08 15:38:31 UTC 2016, active: 1	2016-09-08 15:38:31.872+00	519
4231	[INFO] Organisation mit der id 46 gespeichert. organisationId: 46, name: Frauenhaus Salzburg GmbH, comment: HFA ok, updateTimestamp: Thu Sep 08 15:39:04 UTC 2016, active: 1	2016-09-08 15:39:04.287+00	519
4232	[INFO] Organisation mit der id 63 gespeichert. organisationId: 63, name: HBLA Ursprung, comment: HFA ok, updateTimestamp: Thu Sep 08 15:41:03 UTC 2016, active: 1	2016-09-08 15:41:03.278+00	519
4233	[INFO] Organisation mit der id 65 gespeichert. organisationId: 65, name: Heilpädagogisches Zentrum BGL, comment: HFA ok, updateTimestamp: Thu Sep 08 15:41:25 UTC 2016, active: 1	2016-09-08 15:41:25.673+00	519
4234	[INFO] Organisation mit der id 74 gespeichert. organisationId: 74, name: INSEL - Haus der Jugend, comment: HFA ok, updateTimestamp: Thu Sep 08 15:44:11 UTC 2016, active: 1	2016-09-08 15:44:11.423+00	519
4235	[INFO] Organisation mit der id 38 gespeichert. organisationId: 38, name: Jugend-Notschlafstelle Exit 7, comment: HFA ok, updateTimestamp: Thu Sep 08 15:44:32 UTC 2016, active: 1	2016-09-08 15:44:32.581+00	519
4236	[INFO] Organisation mit der id 81 gespeichert. organisationId: 81, name: Kolpinghaus Salzburg, comment: HFA ok, updateTimestamp: Thu Sep 08 15:45:03 UTC 2016, active: 1	2016-09-08 15:45:03.724+00	519
4237	[INFO] Organisation mit der id 82 gespeichert. organisationId: 82, name: Konradinum Eugendorf, comment: HFA ok, updateTimestamp: Thu Sep 08 15:45:29 UTC 2016, active: 1	2016-09-08 15:45:29.86+00	519
4238	[INFO] Organisation mit der id 83 gespeichert. organisationId: 83, name: Konvent der Franziskanerinnen, comment: HFA ok, updateTimestamp: Thu Sep 08 15:47:08 UTC 2016, active: 1	2016-09-08 15:47:08.364+00	519
4239	[INFO] Organisation mit der id 92 gespeichert. organisationId: 92, name: Laube Sozial-Psychiatrische Aktivitäten GmbH, comment: HFA ok, updateTimestamp: Thu Sep 08 15:47:30 UTC 2016, active: 1	2016-09-08 15:47:30.205+00	519
4240	[INFO] Organisation mit der id 95 gespeichert. organisationId: 95, name: LBS - Heim Hallein, comment: HFA ok, updateTimestamp: Thu Sep 08 15:47:55 UTC 2016, active: 1	2016-09-08 15:47:55.476+00	519
4241	[INFO] Organisation mit der id 96 gespeichert. organisationId: 96, name: LBS - Heim Obertrum, comment: HFA ok, updateTimestamp: Thu Sep 08 15:48:12 UTC 2016, active: 1	2016-09-08 15:48:12.011+00	519
4242	[INFO] Organisation mit der id 94 gespeichert. organisationId: 94, name: LBS - Heim  Wals, comment: HFA ok, updateTimestamp: Thu Sep 08 15:48:30 UTC 2016, active: 1	2016-09-08 15:48:30.226+00	519
4243	[INFO] Organisation mit der id 98 gespeichert. organisationId: 98, name: Lebenshilfe Kindergarten, comment: HFA ok, updateTimestamp: Thu Sep 08 15:51:53 UTC 2016, active: 1	2016-09-08 15:51:53.937+00	519
4244	[INFO] Organisation mit der id 249 gespeichert. organisationId: 249, name: Lebenshilfe Oberndorf, comment: HFA ok, updateTimestamp: Thu Sep 08 15:52:12 UTC 2016, active: 1	2016-09-08 15:52:12.266+00	519
4245	[INFO] Organisation mit der id 99 gespeichert. organisationId: 99, name: Lebenshilfe Straßwalchen, comment: HFA ok, updateTimestamp: Thu Sep 08 15:52:34 UTC 2016, active: 1	2016-09-08 15:52:34.246+00	519
4246	[INFO] Organisation mit der id 248 gespeichert. organisationId: 248, name: Lebenshilfe Wagingerstraße, comment: HFA ok, updateTimestamp: Thu Sep 08 15:53:33 UTC 2016, active: 1	2016-09-08 15:53:33.34+00	519
4247	[INFO] Organisation mit der id 250 gespeichert. organisationId: 250, name: Lebenshilfe Wals, comment: HFA ok, updateTimestamp: Thu Sep 08 15:53:59 UTC 2016, active: 1	2016-09-08 15:53:59.417+00	519
4248	[INFO] Organisation mit der id 100 gespeichert. organisationId: 100, name: Lebenshilfe Wohnhaus, comment: HFA ok, updateTimestamp: Thu Sep 08 15:54:18 UTC 2016, active: 1	2016-09-08 15:54:18.952+00	519
4249	[INFO] Organisation mit der id 101 gespeichert. organisationId: 101, name: Lebensküche GmbH, comment: HFA ok, updateTimestamp: Thu Sep 08 15:55:24 UTC 2016, active: 1	2016-09-08 15:55:24.838+00	519
4250	[INFO] Organisation mit der id 132 gespeichert. organisationId: 132, name: Lebensmittelbrücke / Pfarre Wals, comment: vormals Pfarre Wals oder Vinzitisch / nur Zustelladresse - Postadresse siehe VinziTisch\nHFA ok, updateTimestamp: Thu Sep 08 15:55:47 UTC 2016, active: 1	2016-09-08 15:55:47.578+00	519
4251	[INFO] Organisation mit der id 106 gespeichert. organisationId: 106, name: Loreto Kloster, comment: HFA ok, updateTimestamp: Thu Sep 08 15:56:14 UTC 2016, active: 1	2016-09-08 15:56:15+00	519
4252	[INFO] Organisation mit der id 115 gespeichert. organisationId: 115, name: Missionshaus Liefering, comment: HFA ok, updateTimestamp: Thu Sep 08 15:56:54 UTC 2016, active: 1	2016-09-08 15:56:54.463+00	519
4253	[INFO] Organisation mit der id 121 gespeichert. organisationId: 121, name: Neustart Saftladen, comment: HFA ok, updateTimestamp: Thu Sep 08 15:57:13 UTC 2016, active: 1	2016-09-08 15:57:13.685+00	519
4254	[INFO] Organisation mit der id 122 gespeichert. organisationId: 122, name: Notschlafstelle der Caritas, comment: Festnetz: 0662/629786\nEmail: Notschlafstelle@caritas-salzburg.at\nHFA ok, updateTimestamp: Thu Sep 08 15:57:41 UTC 2016, active: 1	2016-09-08 15:57:41.934+00	519
4255	[INFO] Organisation mit der id 138 gespeichert. organisationId: 138, name: pro mente plus Neuland, comment: HFA ok, updateTimestamp: Thu Sep 08 15:59:30 UTC 2016, active: 1	2016-09-08 15:59:30.438+00	519
4256	[INFO] Organisation mit der id 148 gespeichert. organisationId: 148, name: Reichenhaller Tafel, comment: HFA ok, updateTimestamp: Thu Sep 08 15:59:55 UTC 2016, active: 1	2016-09-08 15:59:55.921+00	519
4257	[INFO] Organisation mit der id 150 gespeichert. organisationId: 150, name: Rettet das Kind - BAZ St. Gilgen, comment: HFA ok, updateTimestamp: Thu Sep 08 16:00:18 UTC 2016, active: 1	2016-09-08 16:00:18.043+00	519
4258	[INFO] Organisation mit der id 153 gespeichert. organisationId: 153, name: Russisch-Orthodoxe Kirche, comment: HFA ok, updateTimestamp: Thu Sep 08 16:00:45 UTC 2016, active: 1	2016-09-08 16:00:45.617+00	519
4259	[INFO] Organisation mit der id 160 gespeichert. organisationId: 160, name: Salzburger Hilfswerk, comment: HFA ok, updateTimestamp: Thu Sep 08 16:01:05 UTC 2016, active: 1	2016-09-08 16:01:05.687+00	519
4260	[INFO] Organisation mit der id 165 gespeichert. organisationId: 165, name: San Helios, comment: HFA ok, updateTimestamp: Thu Sep 08 16:01:33 UTC 2016, active: 1	2016-09-08 16:01:33.51+00	519
4261	[INFO] Organisation mit der id 175 gespeichert. organisationId: 175, name: Seniorenheim Seekirchen, comment: HFA ok, updateTimestamp: Thu Sep 08 16:02:12 UTC 2016, active: 1	2016-09-08 16:02:12.202+00	519
4262	[INFO] Organisation mit der id 190 gespeichert. organisationId: 190, name: SOLEart  Straßwalchen, comment: HFA ok, updateTimestamp: Thu Sep 08 16:06:32 UTC 2016, active: 1	2016-09-08 16:06:32.828+00	519
4263	[INFO] Organisation mit der id 191 gespeichert. organisationId: 191, name: SOS-Kinderdorf Clearinghouse, comment: HFA ok, updateTimestamp: Thu Sep 08 16:08:05 UTC 2016, active: 1	2016-09-08 16:08:05.946+00	519
4264	[INFO] Organisation mit der id 192 gespeichert. organisationId: 192, name: SOS-Kinderdorf Seekirchen, comment: HFA ok, updateTimestamp: Thu Sep 08 16:08:30 UTC 2016, active: 1	2016-09-08 16:08:30.114+00	519
4265	[INFO] Organisation mit der id 223 gespeichert. organisationId: 223, name: Sozialer Lieferservice Bürmoos, comment: HFA ok, updateTimestamp: Thu Sep 08 16:08:50 UTC 2016, active: 1	2016-09-08 16:08:50.856+00	519
4266	[INFO] Organisation mit der id 209 gespeichert. organisationId: 209, name: Viele-Verein für interkulturellen Ansatz, comment: HFA ok, updateTimestamp: Thu Sep 08 16:09:30 UTC 2016, active: 1	2016-09-08 16:09:30.715+00	519
4267	[INFO] Organisation mit der id 210 gespeichert. organisationId: 210, name: VinziTisch Salzburg, comment: HFA ok, updateTimestamp: Thu Sep 08 16:09:51 UTC 2016, active: 1	2016-09-08 16:09:51.972+00	519
4268	[INFO] Organisation mit der id 213 gespeichert. organisationId: 213, name: Wärmestube, comment: HFA ok, updateTimestamp: Thu Sep 08 16:10:18 UTC 2016, active: 1	2016-09-08 16:10:18.17+00	519
4269	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-08 16:40:31.261+00	519
4272	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-12 11:34:29.412+00	519
4273	[INFO] Organisation mit der id 13 gelöscht	2016-09-12 11:34:32.361+00	253
4274	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-12 11:36:25.71+00	253
4275	[INFO] Organisation mit der id 97 gelöscht	2016-09-12 11:36:30.174+00	519
4276	[INFO] Organisation mit der id 185 gelöscht	2016-09-12 11:36:41.707+00	519
4277	[INFO] Organisation mit der id 205 gelöscht	2016-09-12 11:36:47.914+00	519
4278	[INFO] Organisation mit der id 214 gelöscht	2016-09-12 11:36:56.544+00	519
4279	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-09-12 11:38:37.936+00	253
4280	[INFO] Alle Organisationen als CSV exportiert.	2016-09-12 11:40:59.152+00	519
4286	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-09-12 11:44:30.412+00	519
4287	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-12 11:45:03.701+00	253
4288	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-13 08:45:18.695+00	519
4289	[INFO] elisabeth.apfelthaler@inode.at hat sich angemeldet	2016-09-13 11:47:00.928+00	591
4290	[INFO] Alle Personen als CSV exportiert.	2016-09-13 11:51:53.902+00	591
4291	[INFO] elisabeth.apfelthaler@inode.at hat sich abgemeldet	2016-09-13 12:04:51.707+00	591
4292	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-13 20:04:28.702+00	252
4293	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-13 20:08:06.068+00	252
4294	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-14 07:02:57.929+00	519
4295	[INFO] Organisation mit der id 272 gespeichert. organisationId: 272, name: Last Minute Grace Ministries, comment: , updateTimestamp: Wed Sep 14 07:04:17 UTC 2016, active: 1	2016-09-14 07:04:17.814+00	519
4296	[INFO] Person mit der id 689 gespeichert. personId: 689, salutation: Frau, title: DI, firstName: Helga , lastName: Frauenlob, comment: , updateTimestamp: 2016-09-14, active: 1	2016-09-14 07:06:36.248+00	519
4297	[INFO] Organisation mit der id 272 gespeichert. organisationId: 272, name: Last Minute Grace Ministries, comment: , updateTimestamp: Wed Sep 14 07:07:17 UTC 2016, active: 1	2016-09-14 07:07:17.065+00	519
4298	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-17 14:56:50.679+00	519
4299	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-18 09:07:29.888+00	252
4300	[INFO] Person mit der id 310 gespeichert. personId: 310, salutation: Frau, title: , firstName: Bettina, lastName: Lorentschitsch, Msc MBA, comment: , updateTimestamp: 2016-09-18, active: 1	2016-09-18 09:09:15.528+00	252
4301	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-18 09:21:06.959+00	252
4302	[INFO] Person mit der id 148 gespeichert. personId: 148, salutation: Frau, title: , firstName: Marijana , lastName: Grabovac, Bakk.Phil., comment: Newsletter: ja, updateTimestamp: 2016-09-18, active: 1	2016-09-18 09:22:26.17+00	252
4303	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-18 11:08:02.211+00	252
4304	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-09-18, active: 1	2016-09-18 11:08:57.746+00	252
4305	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-09-18, active: 1	2016-09-18 11:09:01.248+00	252
4306	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-18 11:09:54.138+00	252
4307	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-18 12:36:58.728+00	252
4308	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-18 12:38:58.857+00	252
4309	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-19 15:24:55.129+00	519
4310	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-19 18:27:15.582+00	519
4311	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-09-19 18:38:08.507+00	519
4312	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-19 18:38:12.608+00	519
4313	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-19 19:19:49.414+00	519
4314	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-19 19:35:20.77+00	519
4315	[INFO] Person mit der id 505 gespeichert. personId: 505, salutation: Sr., title: , firstName: Joanella, lastName: Six, comment: , updateTimestamp: 2016-09-19, active: 1	2016-09-19 19:35:39.388+00	519
4316	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-20 08:18:50.144+00	252
4317	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-20 08:19:38.888+00	252
4318	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-20 08:55:01.574+00	519
4319	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-20 11:40:35.121+00	252
4320	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-20 11:41:56.623+00	252
4321	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-20 12:28:59.889+00	252
4322	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: , updateTimestamp: 2016-09-20, active: 1	2016-09-20 12:30:06.16+00	252
4323	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: , updateTimestamp: 2016-09-20, active: 1	2016-09-20 12:31:26.585+00	252
4324	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: , updateTimestamp: 2016-09-20, active: 1	2016-09-20 12:31:30.119+00	252
4325	[INFO] Person mit der id 446 gespeichert. personId: 446, salutation: Frau, title: , firstName: Cornelia, lastName: Robl, comment: , updateTimestamp: 2016-09-20, active: 1	2016-09-20 12:33:02.127+00	252
4326	[INFO] Person mit der id 446 gespeichert. personId: 446, salutation: Frau, title: , firstName: Cornelia, lastName: Robl, comment: , updateTimestamp: 2016-09-20, active: 1	2016-09-20 12:33:05.666+00	252
4327	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-20 12:34:09.007+00	252
4328	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-21 06:30:57.359+00	252
4329	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-09-21, active: 1	2016-09-21 06:32:15.236+00	252
4330	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: , updateTimestamp: 2016-09-21, active: 1	2016-09-21 06:32:18.93+00	252
4331	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-21 06:32:26.71+00	252
4332	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-22 08:55:20.856+00	252
4333	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-22 09:08:47.58+00	252
4334	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-22 16:45:26.39+00	345
4335	[INFO] Alle Personen als CSV exportiert.	2016-09-22 16:46:18.609+00	345
4336	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-09-22 17:13:30.259+00	345
4337	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-22 18:29:07.618+00	345
4338	[INFO] Alle Personen als CSV exportiert.	2016-09-22 18:29:32.237+00	345
4339	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-09-23 07:03:14.935+00	574
4340	[INFO] Warenausgang mit der id 758 gespeichert	2016-09-23 07:06:41.416+00	574
4341	[INFO] Wareneingang mit der id 237 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:06:52.874+00	574
4342	[INFO] Wareneingang mit der id 312 gespeichert	2016-09-23 07:39:12.964+00	574
4343	[INFO] Wareneingang mit der id 312 gespeichert	2016-09-23 07:39:35.276+00	574
4344	[INFO] Warenausgang mit der id 759 gespeichert	2016-09-23 07:41:15.488+00	574
4345	[INFO] Warenausgang mit der id 759 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:42:03.308+00	574
4346	[INFO] Warenausgang mit der id 758 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:42:07.756+00	574
4347	[INFO] Wareneingang mit der id 313 gespeichert	2016-09-23 07:43:29.618+00	574
4348	[INFO] Wareneingang mit der id 312 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:43:37.505+00	574
4349	[INFO] Wareneingang mit der id 313 gespeichert	2016-09-23 07:43:52.64+00	574
4350	[INFO] Warenausgang mit der id 760 gespeichert	2016-09-23 07:44:33.106+00	574
4351	[INFO] Warenausgang mit der id 760 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:44:51.44+00	574
4352	[INFO] Wareneingang mit der id 313 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:45:06.329+00	574
4353	[INFO] Wareneingang mit der id 314 gespeichert	2016-09-23 07:47:18.885+00	574
4354	[INFO] Warenausgang mit der id 761 gespeichert	2016-09-23 07:48:25.467+00	574
4355	[INFO] Warenausgang mit der id 761 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:48:49.093+00	574
4356	[INFO] Wareneingang mit der id 314 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:49:03.166+00	574
4357	[INFO] Wareneingang mit der id 315 gespeichert	2016-09-23 07:49:55.515+00	574
4358	[INFO] Warenausgang mit der id 762 gespeichert	2016-09-23 07:50:30.859+00	574
4359	[INFO] Warenausgang mit der id 762 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:51:26.982+00	574
4360	[INFO] Wareneingang mit der id 315 auf Archivierungsstatus 1 gesetzt	2016-09-23 07:51:40.874+00	574
4361	[INFO] Wareneingang mit der id 316 gespeichert	2016-09-23 08:14:53.762+00	574
4362	[INFO] Warenausgang mit der id 763 gespeichert	2016-09-23 08:16:19.494+00	574
4363	[INFO] Warenausgang mit der id 764 gespeichert	2016-09-23 08:17:11.424+00	574
4364	[INFO] Warenausgang mit der id 765 gespeichert	2016-09-23 08:17:59.574+00	574
4365	[INFO] Warenausgang mit der id 766 gespeichert	2016-09-23 08:18:42.046+00	574
4366	[INFO] Warenausgang mit der id 767 gespeichert	2016-09-23 08:19:34.803+00	574
4367	[INFO] Warenausgang mit der id 768 gespeichert	2016-09-23 08:20:13.586+00	574
4368	[INFO] Warenausgang mit der id 763 auf Archivierungsstatus 1 gesetzt	2016-09-23 08:21:28.893+00	574
4369	[INFO] Warenausgang mit der id 764 auf Archivierungsstatus 1 gesetzt	2016-09-23 08:21:32.473+00	574
4370	[INFO] Warenausgang mit der id 765 auf Archivierungsstatus 1 gesetzt	2016-09-23 08:21:35.803+00	574
4371	[INFO] Warenausgang mit der id 766 auf Archivierungsstatus 1 gesetzt	2016-09-23 08:21:39.386+00	574
4372	[INFO] Warenausgang mit der id 767 auf Archivierungsstatus 1 gesetzt	2016-09-23 08:21:42.921+00	574
4373	[INFO] Warenausgang mit der id 768 auf Archivierungsstatus 1 gesetzt	2016-09-23 08:21:46.577+00	574
4374	[INFO] Wareneingang mit der id 316 auf Archivierungsstatus 1 gesetzt	2016-09-23 08:22:01.387+00	574
4375	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-09-23 10:41:34.732+00	441
4376	[INFO] Alle Personen als CSV exportiert.	2016-09-23 10:42:38.516+00	441
4377	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-24 10:53:16.342+00	252
4378	[INFO] Person mit der id 13 gespeichert. personId: 13, salutation: Frau, title: , firstName: Gudrun, lastName: Albertsmeier, comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 10:54:27.444+00	252
4379	[INFO] Person mit der id 13 gespeichert. personId: 13, salutation: Frau, title: , firstName: Gudrun, lastName: Albertsmeier, comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 10:54:30.983+00	252
4380	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-24 10:55:41.374+00	252
4381	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-24 11:07:41.838+00	252
4382	[INFO] Organisation mit der id 118 gespeichert. organisationId: 118, name: Nähr-Engel GmbH, comment: , updateTimestamp: Sat Sep 24 11:11:04 UTC 2016, active: 1	2016-09-24 11:11:04.935+00	252
4383	[INFO] Organisation mit der id 118 gespeichert. organisationId: 118, name: Nähr-Engel GmbH, comment: , updateTimestamp: Sat Sep 24 11:11:47 UTC 2016, active: 1	2016-09-24 11:11:47.554+00	252
4384	[INFO] Organisation mit der id 243 gespeichert. organisationId: 243, name: Österreichisch-Amerikanische Gesellschaft, comment: , updateTimestamp: Sat Sep 24 11:18:51 UTC 2016, active: 1	2016-09-24 11:18:51.381+00	252
4385	[INFO] Organisation mit der id 243 gespeichert. organisationId: 243, name: Österreichisch-Amerikanische Gesellschaft, comment: , updateTimestamp: Sat Sep 24 11:18:54 UTC 2016, active: 1	2016-09-24 11:18:54.377+00	252
4386	[INFO] Organisation mit der id 219 gespeichert. organisationId: 219, name: Wirtschaftsbund Salzburg, comment: , updateTimestamp: Sat Sep 24 11:21:37 UTC 2016, active: 1	2016-09-24 11:21:37.923+00	252
4387	[INFO] Person mit der id 588 gespeichert. personId: 588, salutation: Frau, title: , firstName: Marianne, lastName: Winkler, comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 11:25:07.415+00	252
4388	[INFO] Person mit der id 588 gespeichert. personId: 588, salutation: Frau, title: , firstName: Marianne, lastName: Winkler, comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 11:25:11.385+00	252
4389	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-24 11:34:59.626+00	252
4390	[INFO] Organisation mit der id 6 gespeichert. organisationId: 6, name: Aktion Leben, comment: , updateTimestamp: Sat Sep 24 11:36:36 UTC 2016, active: 1	2016-09-24 11:36:36.705+00	252
4391	[INFO] Person mit der id 154 gespeichert. personId: 154, salutation: Frau, title: Mag. , firstName: Brigitta, lastName: Grießl, comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 11:37:31.373+00	252
4392	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-24 17:20:57.265+00	345
4393	[INFO] Organisation mit der id 270 gespeichert. organisationId: 270, name: Freie Christengemeinde Bürmoos, comment: , updateTimestamp: Sat Sep 24 17:22:57 UTC 2016, active: 1	2016-09-24 17:22:57.153+00	345
4394	[INFO] Organisation mit der id 270 gespeichert. organisationId: 270, name: Freie Christengemeinde Bürmoos, comment: Webseite: Ja, updateTimestamp: Sat Sep 24 17:23:17 UTC 2016, active: 1	2016-09-24 17:23:17.708+00	345
4395	[INFO] Organisation mit der id 47 gelöscht	2016-09-24 17:23:38.41+00	345
4396	[INFO] Organisation mit der id 18 gespeichert. organisationId: 18, name: Bergader Privatkäserei GmbH, comment: , updateTimestamp: Sat Sep 24 17:26:27 UTC 2016, active: 1	2016-09-24 17:26:27.035+00	345
4397	[INFO] Organisation mit der id 267 gelöscht	2016-09-24 17:26:50.472+00	345
4398	[INFO] Person mit der id 690 gespeichert. personId: 690, salutation: Frau, title: , firstName: Beatrice , lastName: Kress , comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 17:33:36.078+00	345
4399	[INFO] Organisation mit der id 18 gespeichert. organisationId: 18, name: Bergader Privatkäserei GmbH, comment: , updateTimestamp: Sat Sep 24 17:35:43 UTC 2016, active: 1	2016-09-24 17:35:43.018+00	345
4400	[INFO] Person mit der id 9 gespeichert. personId: 9, salutation: , title: , firstName: Sr. Oberin, lastName:  , comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 17:42:42.618+00	345
4401	[INFO] Person mit der id 9 gespeichert. personId: 9, salutation: , title: , firstName: Sr. Oberin, lastName:  , comment: , updateTimestamp: 2016-09-24, active: 1	2016-09-24 17:43:25.243+00	345
4402	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-24 18:30:37.042+00	345
4403	[INFO] Organisation mit der id 106 gespeichert. organisationId: 106, name: Loretto Kloster, comment: HFA ok, updateTimestamp: Sat Sep 24 18:31:02 UTC 2016, active: 1	2016-09-24 18:31:02.302+00	345
4404	[INFO] Organisation mit der id 106 gespeichert. organisationId: 106, name: Loretto St Maria Frauenkloster, comment: HFA ok, updateTimestamp: Sat Sep 24 18:31:38 UTC 2016, active: 1	2016-09-24 18:31:38.379+00	345
4405	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-09-24 18:52:20.891+00	345
4406	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-24 20:34:25.437+00	252
4407	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-24 20:35:25.321+00	252
4408	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-24 20:37:10.396+00	252
4409	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-24 20:52:41.201+00	252
4410	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-25 07:51:48.438+00	252
4411	[INFO] Organisation mit der id 6 gespeichert. organisationId: 6, name: Aktion Leben, comment: , updateTimestamp: Sun Sep 25 07:55:14 UTC 2016, active: 1	2016-09-25 07:55:14.169+00	252
4412	[INFO] Organisation mit der id 6 gespeichert. organisationId: 6, name: Aktion Leben, comment: , updateTimestamp: Sun Sep 25 07:55:17 UTC 2016, active: 1	2016-09-25 07:55:17.724+00	252
4413	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-25 08:50:20.873+00	252
4414	[INFO] Organisation mit der id 66 gespeichert. organisationId: 66, name: Freiwilligenzentrum Salzburg, comment: , updateTimestamp: Sun Sep 25 08:52:25 UTC 2016, active: 1	2016-09-25 08:52:25.191+00	252
4415	[INFO] Organisation mit der id 66 gespeichert. organisationId: 66, name: Freiwilligenzentrum Salzburg, comment: , updateTimestamp: Sun Sep 25 08:52:28 UTC 2016, active: 1	2016-09-25 08:52:28.374+00	252
4416	[INFO] Organisation mit der id 159 gespeichert. organisationId: 159, name: Salzburger Bildungswerk, comment: , updateTimestamp: Sun Sep 25 08:59:28 UTC 2016, active: 1	2016-09-25 08:59:28.251+00	252
4417	[INFO] Organisation mit der id 158 gespeichert. organisationId: 158, name: Salzburger Agrarmarketing, comment: , updateTimestamp: Sun Sep 25 09:26:11 UTC 2016, active: 1	2016-09-25 09:26:11.146+00	252
4418	[INFO] Organisation mit der id 158 gespeichert. organisationId: 158, name: Salzburger Agrarmarketing, comment: , updateTimestamp: Sun Sep 25 09:26:14 UTC 2016, active: 1	2016-09-25 09:26:14.299+00	252
4419	[INFO] Organisation mit der id 243 gespeichert. organisationId: 243, name: Österreichisch-Amerikanische Gesellschaft, comment: , updateTimestamp: Sun Sep 25 09:29:01 UTC 2016, active: 1	2016-09-25 09:29:01.249+00	252
4420	[INFO] Person mit der id 634 gespeichert. personId: 634, salutation: Frau Präsident, title: Dr., firstName: Maria, lastName: Ganauser, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 09:29:44.901+00	252
4421	[INFO] Organisation mit der id 217 gespeichert. organisationId: 217, name: winnovation consulting gmbh, comment: , updateTimestamp: Sun Sep 25 09:31:46 UTC 2016, active: 1	2016-09-25 09:31:46.707+00	252
4422	[INFO] Organisation mit der id 217 gespeichert. organisationId: 217, name: winnovation consulting gmbh, comment: , updateTimestamp: Sun Sep 25 09:31:50 UTC 2016, active: 1	2016-09-25 09:31:50.108+00	252
4423	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-09-25 14:02:59.11+00	253
4424	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-25 14:06:19.9+00	252
4425	[INFO] Person mit der id 691 gespeichert. personId: 691, salutation: Herr, title: Mag., firstName: Thomas, lastName: Kerschbaum, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:08:50.061+00	253
4426	[INFO] Person mit der id 692 gespeichert. personId: 692, salutation: Herr Landesrat, title: Dipl.-Ing. Dr., firstName: Josef, lastName: Schwaiger, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:10:48.941+00	253
4427	[INFO] Person mit der id 693 gespeichert. personId: 693, salutation: Herr, title: , firstName: Michael, lastName: Unterberger, MA, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:13:09.824+00	253
4428	[INFO] Person mit der id 694 gespeichert. personId: 694, salutation: Frau, title: , firstName: Isabella, lastName: Neutatz, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:14:21.488+00	253
4429	[INFO] Organisation mit der id 119 gespeichert. organisationId: 119, name: Nannerl Gmbh & Co KG, comment: Webseite Ja, updateTimestamp: Sun Sep 25 14:15:20 UTC 2016, active: 1	2016-09-25 14:15:20.251+00	253
4430	[INFO] Organisation mit der id 263 gespeichert. organisationId: 263, name: Österreichische Gesellschaft für Dekubitusprävention (APUPA), comment: , updateTimestamp: Sun Sep 25 14:15:51 UTC 2016, active: 1	2016-09-25 14:15:51.531+00	253
4431	[INFO] Organisation mit der id 142 gespeichert. organisationId: 142, name: R&S GOURMET EXPRESS VertriebsGmbH, comment: Webseite Ja, updateTimestamp: Sun Sep 25 14:18:07 UTC 2016, active: 1	2016-09-25 14:18:07.815+00	253
4432	[INFO] Person mit der id 695 gespeichert. personId: 695, salutation: Frau, title: , firstName: Daniela, lastName: Wietzke, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:18:42.798+00	253
4433	[INFO] Person mit der id 696 gespeichert. personId: 696, salutation: Herr, title: Mag., firstName: Manfred, lastName: Kröswang, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:18:57.825+00	253
4601	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-29 21:38:09.115+00	252
4890	[INFO] Warenausgang mit der id 796 gespeichert	2016-10-08 18:30:16.737+00	574
4434	[INFO] Organisation mit der id 142 gespeichert. organisationId: 142, name: R&S GOURMET EXPRESS VertriebsGmbH, comment: Webseite Ja, updateTimestamp: Sun Sep 25 14:19:58 UTC 2016, active: 1	2016-09-25 14:19:58.78+00	253
4435	[INFO] Organisation mit der id 71 gespeichert. organisationId: 71, name: Industriellenvereinigung, comment: , updateTimestamp: Sun Sep 25 14:20:48 UTC 2016, active: 1	2016-09-25 14:20:48.07+00	253
4436	[INFO] Person mit der id 697 gespeichert. personId: 697, salutation: Herr, title: Dr., firstName: Peter, lastName: Unterkofler, comment: Päsident, updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:21:42.214+00	253
4437	[INFO] Organisation mit der id 71 gespeichert. organisationId: 71, name: Industriellenvereinigung, comment: , updateTimestamp: Sun Sep 25 14:22:01 UTC 2016, active: 1	2016-09-25 14:22:01.935+00	253
4438	[INFO] Person mit der id 698 gespeichert. personId: 698, salutation: Herr, title: Mag., firstName: Markus, lastName: Ertl, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:23:18.823+00	253
4481	[INFO] Alle Personen als CSV exportiert.	2016-09-25 18:27:03.918+00	345
4482	[INFO] Alle Personen als CSV exportiert.	2016-09-25 18:29:10.242+00	345
4483	[INFO] Alle Organisationen als CSV exportiert.	2016-09-25 18:37:43.312+00	345
4484	[INFO] Alle Personen als CSV exportiert.	2016-09-25 19:03:16.284+00	345
4485	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-26 05:28:15.745+00	519
4486	[INFO] Organisation mit der id 276 gespeichert. organisationId: 276, name: JACOBY GM PHARMA GMBH, comment: , updateTimestamp: Mon Sep 26 05:31:04 UTC 2016, active: 1	2016-09-26 05:31:04.271+00	519
4487	[INFO] Person mit der id 630 gelöscht	2016-09-26 05:33:12.984+00	519
4488	[INFO] Person mit der id 629 gelöscht	2016-09-26 05:33:32.949+00	519
4489	[INFO] Organisation mit der id 277 gespeichert. organisationId: 277, name: Gymnasium St. Ursula, comment: , updateTimestamp: Mon Sep 26 05:34:54 UTC 2016, active: 1	2016-09-26 05:34:54.462+00	519
4490	[INFO] Organisation mit der id 277 gelöscht	2016-09-26 05:35:06.487+00	519
4491	[INFO] Organisation mit der id 278 gespeichert. organisationId: 278, name: Bankhaus Carl Spängler & Co. AG, comment: , updateTimestamp: Mon Sep 26 05:36:50 UTC 2016, active: 1	2016-09-26 05:36:50.227+00	519
4508	[INFO] Warenausgang mit der id 769 auf Archivierungsstatus 1 gesetzt	2016-09-26 15:50:43.565+00	602
4510	[INFO] Warenausgang mit der id 770 gespeichert	2016-09-26 15:53:35.903+00	602
4511	[INFO] Warenausgang mit der id 770 auf Archivierungsstatus 1 gesetzt	2016-09-26 15:53:57.324+00	602
4517	[INFO] Warenausgang mit der id 772 gespeichert	2016-09-26 16:03:37.309+00	602
4519	[INFO] Wareneingang mit der id 320 gespeichert	2016-09-26 16:09:36.589+00	602
4521	[INFO] Artikelverteilung für Artikel mit der Id 746 geändert	2016-09-26 16:11:52.072+00	602
4525	[INFO] Wareneingang mit der id 321 gespeichert	2016-09-26 16:22:09.048+00	602
4529	[INFO] Warenausgang mit der id 776 gespeichert	2016-09-26 16:24:02.514+00	602
4532	[INFO] Warenausgang mit der id 779 gespeichert	2016-09-26 16:25:49.421+00	602
4610	[INFO] Organisation mit der id 212 gelöscht	2016-09-30 09:20:43.213+00	253
4611	[INFO] Organisation mit der id 196 gelöscht	2016-09-30 09:21:08.218+00	253
4612	[INFO] Person mit der id 106 gelöscht	2016-09-30 09:22:05.805+00	253
4613	[INFO] Person mit der id 118 gelöscht	2016-09-30 09:22:32.841+00	253
4614	[INFO] Person mit der id 369 gelöscht	2016-09-30 09:22:45.622+00	253
4615	[INFO] Person mit der id 382 gelöscht	2016-09-30 09:22:57.912+00	253
4616	[INFO] Person mit der id 449 gelöscht	2016-09-30 09:23:10.736+00	253
4617	[INFO] Person mit der id 434 gelöscht	2016-09-30 09:23:21.555+00	253
4618	[INFO] Person mit der id 500 gelöscht	2016-09-30 09:23:32.669+00	253
4619	[INFO] Person mit der id 521 gelöscht	2016-09-30 09:23:43.79+00	253
4620	[INFO] Person mit der id 21 gelöscht	2016-09-30 09:29:25.991+00	253
4439	[INFO] Person mit der id 699 gespeichert. personId: 699, salutation: Frau, title: Mag., firstName: Karin, lastName: Krassler, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:24:23.295+00	253
4440	[INFO] Person mit der id 700 gespeichert. personId: 700, salutation: Herr, title: Mag.art., firstName: Lukas, lastName: Schwingenschuh, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:25:36.892+00	253
4441	[INFO] Person mit der id 698 gespeichert. personId: 698, salutation: Herr, title: Mag., firstName: Markus, lastName: Ertl, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:26:23.837+00	253
4442	[INFO] Person mit der id 701 gespeichert. personId: 701, salutation: Herr, title: Mag., firstName: Walter, lastName: Schnitzhofer, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:29:39.475+00	253
4443	[INFO] Person mit der id 698 gespeichert. personId: 698, salutation: Herr, title: Mag., firstName: Markus, lastName: Ertl, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:29:58.392+00	253
4444	[INFO] Person mit der id 699 gespeichert. personId: 699, salutation: Frau, title: Mag., firstName: Karin, lastName: Krassler, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:30:18.645+00	253
4445	[INFO] Person mit der id 700 gespeichert. personId: 700, salutation: Herr, title: Mag.art., firstName: Lukas, lastName: Schwingenschuh, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:30:32.202+00	253
4446	[INFO] Person mit der id 702 gespeichert. personId: 702, salutation: Frau, title: Mag. pharm. Dr., firstName: Sonja, lastName: Jacoby, PhD, MbA-HSG,, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:31:41.443+00	253
4447	[INFO] Person mit der id 703 gespeichert. personId: 703, salutation: Herr, title: , firstName: Josef, lastName: Prantler, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:32:30.601+00	253
4448	[INFO] Organisation mit der id 273 gespeichert. organisationId: 273, name: Landesberufsschule 5, comment: , updateTimestamp: Sun Sep 25 14:33:27 UTC 2016, active: 1	2016-09-25 14:33:27.787+00	253
4449	[INFO] Organisation mit der id 274 gespeichert. organisationId: 274, name: Gymnasium & ART-ORG St. Ursula, comment: , updateTimestamp: Sun Sep 25 14:34:03 UTC 2016, active: 1	2016-09-25 14:34:03.366+00	253
4450	[INFO] Organisation mit der id 275 gespeichert. organisationId: 275, name: Privatgymnasium der Herz-Jesu-Missionare, comment: , updateTimestamp: Sun Sep 25 14:34:29 UTC 2016, active: 1	2016-09-25 14:34:29.122+00	253
4451	[INFO] Organisation mit der id 276 gespeichert. organisationId: 276, name: JACOBY GM PHARMA GMBH, comment: , updateTimestamp: Sun Sep 25 14:35:02 UTC 2016, active: 1	2016-09-25 14:35:02.104+00	253
4452	[INFO] Organisation mit der id 255 gespeichert. organisationId: 255, name: Bodengraf GmbH & Co. KG, comment: IXSO, updateTimestamp: Sun Sep 25 14:35:44 UTC 2016, active: 1	2016-09-25 14:35:44.889+00	253
4453	[INFO] Organisation mit der id 236 gespeichert. organisationId: 236, name: Landwirtschaftskammer Salzburg, comment: , updateTimestamp: Sun Sep 25 14:36:58 UTC 2016, active: 1	2016-09-25 14:36:58.911+00	253
4454	[INFO] Person mit der id 704 gespeichert. personId: 704, salutation: Herr Präsident, title: , firstName: Franz, lastName: Eßl, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:38:24.035+00	253
4455	[INFO] Person mit der id 705 gespeichert. personId: 705, salutation: Herr, title: Dipl.-Ing. Dr., firstName: Nikolaus, lastName: Lienbacher, MBA, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:39:08.676+00	253
4456	[INFO] Organisation mit der id 236 gelöscht	2016-09-25 14:39:49.294+00	253
4457	[INFO] Organisation mit der id 91 gespeichert. organisationId: 91, name: Landwirtschaftskammer Salzburg, comment: , updateTimestamp: Sun Sep 25 14:40:36 UTC 2016, active: 1	2016-09-25 14:40:36.751+00	253
4458	[INFO] Person mit der id 705 gespeichert. personId: 705, salutation: Herr Direktor, title: Dipl.-Ing. Dr., firstName: Nikolaus, lastName: Lienbacher, MBA, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:40:57.669+00	253
4459	[INFO] Person mit der id 706 gespeichert. personId: 706, salutation: Frau, title: DI, firstName: Gudrun, lastName: Obersteiner, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:41:35.446+00	253
4460	[INFO] Person mit der id 707 gespeichert. personId: 707, salutation: Frau, title: DI (FH), firstName: Silvia, lastName: Scherhaufer, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:42:05.975+00	253
4461	[INFO] Organisation mit der id 75 gespeichert. organisationId: 75, name: Institut für Abfallwirtschaft, comment: , updateTimestamp: Sun Sep 25 14:42:44 UTC 2016, active: 1	2016-09-25 14:42:44.671+00	253
4462	[INFO] Person mit der id 708 gespeichert. personId: 708, salutation: Herr Direktor, title: DI, firstName: Richard, lastName: Breschar, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:43:44.821+00	253
4463	[INFO] Organisation mit der id 128 gelöscht	2016-09-25 14:44:16.095+00	253
4464	[INFO] Person mit der id 192 gespeichert. personId: 192, salutation: Frau, title: , firstName: Bettina, lastName: Hemetsberger, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:44:52.077+00	253
4465	[INFO] Person mit der id 341 gespeichert. personId: 341, salutation: Herr, title: , firstName: Peter, lastName: Mitgutsch, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:45:35.678+00	253
4466	[INFO] Organisation mit der id 159 gespeichert. organisationId: 159, name: Salzburger Bildungswerk, comment: , updateTimestamp: Sun Sep 25 14:45:59 UTC 2016, active: 1	2016-09-25 14:45:59.468+00	253
4467	[INFO] Person mit der id 704 gespeichert. personId: 704, salutation: Herr Präsident, title: Abg. z. NR Ök.-Rat, firstName: Franz, lastName: Eßl, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:47:22.638+00	253
4468	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-25 14:48:36.595+00	253
4469	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-25 14:52:37.897+00	252
4470	[INFO] Person mit der id 709 gespeichert. personId: 709, salutation: Herr, title: Mag., firstName: Andreas, lastName: Kadi, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:54:24.409+00	252
4471	[INFO] Person mit der id 709 gespeichert. personId: 709, salutation: Herr, title: Mag., firstName: Andreas, lastName: Kadi, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:54:58.974+00	252
4472	[INFO] Person mit der id 710 gespeichert. personId: 710, salutation: Herr, title: , firstName: Otmar, lastName: Wimmer, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:56:27.039+00	252
4473	[INFO] Person mit der id 709 gespeichert. personId: 709, salutation: Herr, title: Mag., firstName: Andreas, lastName: Kadi, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:57:22.744+00	252
4474	[INFO] Person mit der id 711 gespeichert. personId: 711, salutation: Frau, title: Mag., firstName: Claudia, lastName: Schmidt, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 14:59:35.832+00	252
4475	[INFO] Person mit der id 712 gespeichert. personId: 712, salutation: Frau , title: Dr. , firstName: Gudrun, lastName: Kugler, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 15:00:58.553+00	252
4476	[INFO] Person mit der id 713 gespeichert. personId: 713, salutation: Herr, title: Dr., firstName: Walter, lastName: Antosch, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 15:02:30.282+00	252
4477	[INFO] Person mit der id 714 gespeichert. personId: 714, salutation: Frau , title: Mag., firstName: Cornelia , lastName: Thöni, comment: , updateTimestamp: 2016-09-25, active: 1	2016-09-25 15:04:02.52+00	252
4478	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-25 17:54:44.162+00	345
4479	[INFO] Alle Personen als CSV exportiert.	2016-09-25 18:06:13.468+00	345
4480	[INFO] Alle Organisationen als CSV exportiert.	2016-09-25 18:07:21.372+00	345
4492	[INFO] Organisation mit der id 71 gespeichert. organisationId: 71, name: Industriellenvereinigung, comment: , updateTimestamp: Mon Sep 26 05:40:27 UTC 2016, active: 1	2016-09-26 05:40:27.172+00	519
4493	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-09-26 05:42:28.087+00	519
4494	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-26 14:28:09.928+00	252
4495	[INFO] Organisation mit der id 160 gespeichert. organisationId: 160, name: Salzburger Hilfswerk, comment: HFA ok, updateTimestamp: Mon Sep 26 14:32:51 UTC 2016, active: 1	2016-09-26 14:32:51.151+00	252
4496	[INFO] Organisation mit der id 165 gespeichert. organisationId: 165, name: San Helios, comment: HFA ok, updateTimestamp: Mon Sep 26 14:33:34 UTC 2016, active: 1	2016-09-26 14:33:34.054+00	252
4497	[INFO] Organisation mit der id 190 gespeichert. organisationId: 190, name: SOLEart  Straßwalchen, comment: HFA ok, updateTimestamp: Mon Sep 26 14:34:52 UTC 2016, active: 1	2016-09-26 14:34:52.464+00	252
4498	[INFO] Person mit der id 669 gespeichert. personId: 669, salutation: Frau , title: Mag., firstName: Anna , lastName: Viehhauser, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 14:36:59.134+00	252
4499	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-26 14:41:42.674+00	252
4500	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-26 15:01:45.491+00	252
4501	[INFO] Organisation mit der id 95 gespeichert. organisationId: 95, name: LBS - Heim Hallein, comment: HFA ok, updateTimestamp: Mon Sep 26 15:07:56 UTC 2016, active: 1	2016-09-26 15:07:56.285+00	252
4502	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-26 15:32:51.624+00	345
4503	[INFO] Person mit der id 55 gespeichert. personId: 55, salutation: Frau, title: Mag. Dr., firstName: Brigitte , lastName: Brandstötter, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 15:36:38.143+00	345
4504	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2016-09-26 15:45:18.586+00	602
4505	[INFO] Wareneingang mit der id 317 gespeichert	2016-09-26 15:49:13.894+00	602
4506	[INFO] Wareneingang mit der id 317 auf Archivierungsstatus 1 gesetzt	2016-09-26 15:50:09.142+00	602
4507	[INFO] Warenausgang mit der id 769 gespeichert	2016-09-26 15:50:38.945+00	602
4509	[INFO] Wareneingang mit der id 318 gespeichert	2016-09-26 15:53:11.739+00	602
4512	[INFO] Wareneingang mit der id 318 auf Archivierungsstatus 1 gesetzt	2016-09-26 15:54:10.646+00	602
4513	[INFO] Warenausgang mit der id 771 gespeichert	2016-09-26 15:55:07.409+00	602
4514	[INFO] Warenausgang mit der id 771 auf Archivierungsstatus 1 gesetzt	2016-09-26 15:55:12.45+00	602
4515	[INFO] Wareneingang mit der id 319 gespeichert	2016-09-26 15:58:58.113+00	602
4516	[INFO] Wareneingang mit der id 319 auf Archivierungsstatus 1 gesetzt	2016-09-26 15:59:03.383+00	602
4518	[INFO] Warenausgang mit der id 772 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:03:45.112+00	602
4520	[INFO] Warenausgang mit der id 773 gespeichert	2016-09-26 16:10:52.802+00	602
4522	[INFO] Artikelverteilung für Artikel mit der Id 748 geändert	2016-09-26 16:12:29.212+00	602
4523	[INFO] Artikelverteilung für Artikel mit der Id 749 geändert	2016-09-26 16:12:52.512+00	602
4524	[INFO] Wareneingang mit der id 320 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:13:02.376+00	602
4526	[INFO] Warenausgang mit der id 773 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:22:18.434+00	602
4527	[INFO] Warenausgang mit der id 774 gespeichert	2016-09-26 16:22:52.224+00	602
4528	[INFO] Warenausgang mit der id 775 gespeichert	2016-09-26 16:23:35.428+00	602
4530	[INFO] Warenausgang mit der id 777 gespeichert	2016-09-26 16:24:44.818+00	602
4531	[INFO] Warenausgang mit der id 778 gespeichert	2016-09-26 16:25:10.82+00	602
4533	[INFO] Warenausgang mit der id 780 gespeichert	2016-09-26 16:26:23.117+00	602
4534	[INFO] Warenausgang mit der id 774 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:26:37.344+00	602
4535	[INFO] Warenausgang mit der id 776 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:26:39.878+00	602
4536	[INFO] Warenausgang mit der id 780 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:26:43.007+00	602
4537	[INFO] Warenausgang mit der id 779 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:26:45.625+00	602
4538	[INFO] Warenausgang mit der id 778 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:26:51.504+00	602
4539	[INFO] Warenausgang mit der id 777 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:26:57.757+00	602
4540	[INFO] Warenausgang mit der id 775 auf Archivierungsstatus 1 gesetzt	2016-09-26 16:27:14.677+00	602
4541	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2016-09-26 16:29:39.268+00	602
4542	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-26 16:29:45.249+00	345
4543	[INFO] Person mit der id 73 gespeichert. personId: 73, salutation: Frau, title: , firstName: Brigitte, lastName: Derkits, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 16:30:08.095+00	345
4544	[INFO] Person mit der id 233 gespeichert. personId: 233, salutation: Frau, title: Mag., firstName: Andrea, lastName: Huttegger, comment: Pressereferentin, Amt für Kommunikation und Öffentlichkeitsarbeit, updateTimestamp: 2016-09-26, active: 1	2016-09-26 16:31:10.05+00	345
4545	[INFO] Person mit der id 296 gespeichert. personId: 296, salutation: Frau und Herr, title: , firstName: Stefan und Elke, lastName: Lebesmühlbacher, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 16:33:55.403+00	345
4546	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-26 16:39:47.371+00	519
4547	[INFO] Organisation mit der id 8 gelöscht	2016-09-26 16:40:09.12+00	519
4548	[INFO] Organisation mit der id 15 gelöscht	2016-09-26 16:40:24.767+00	519
4549	[INFO] Organisation mit der id 34 gelöscht	2016-09-26 16:40:41.437+00	519
4550	[INFO] Organisation mit der id 80 gelöscht	2016-09-26 16:40:50.639+00	519
4551	[INFO] Organisation mit der id 107 gelöscht	2016-09-26 16:41:05.184+00	519
4552	[INFO] Person mit der id 260 gelöscht	2016-09-26 16:41:22.583+00	519
4553	[INFO] Organisation mit der id 202 gelöscht	2016-09-26 16:42:07.282+00	519
4554	[INFO] Organisation mit der id 17 gelöscht	2016-09-26 16:42:19.102+00	519
4555	[INFO] Organisation mit der id 211 gelöscht	2016-09-26 16:42:28.992+00	519
4556	[INFO] Organisation mit der id 150 gelöscht	2016-09-26 16:42:46.774+00	519
4558	[INFO] Person mit der id 376 gespeichert. personId: 376, salutation: Herr, title: , firstName: Helmut, lastName: Suhrer, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 16:44:37.15+00	519
4559	[INFO] Organisation mit der id 95 gespeichert. organisationId: 95, name: LBS - Heim Hallein, comment: HFA ok, updateTimestamp: Mon Sep 26 16:45:23 UTC 2016, active: 1	2016-09-26 16:45:23.51+00	519
4560	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-26 17:27:55.072+00	345
4561	[INFO] Person mit der id 88 gespeichert. personId: 88, salutation: Herr, title: Ing., firstName: Franz, lastName: Dusch, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 17:28:14.598+00	345
4562	[INFO] Person mit der id 474 gespeichert. personId: 474, salutation: Frau, title: Dipl.Ing., firstName: Felicitas, lastName: Schneider, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 17:28:52.693+00	345
4563	[INFO] Person mit der id 500 gespeichert. personId: 500, salutation: Herr, title: Dr., firstName: Günther, lastName: Signitzer, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 17:34:55.928+00	345
4564	[INFO] Person mit der id 708 gespeichert. personId: 708, salutation: Herr Direktor, title: DI, firstName: Richard, lastName: Breschar, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 17:36:01.082+00	345
4565	[INFO] Person mit der id 492 gespeichert. personId: 492, salutation: Herr, title: , firstName: Günther, lastName: Schwaighofer, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 17:42:42.494+00	345
4566	[INFO] Person mit der id 240 gespeichert. personId: 240, salutation: Herr, title: , firstName: Edwin, lastName: Jung, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 17:51:19.467+00	345
4567	[INFO] Person mit der id 666 gelöscht	2016-09-26 17:59:00.653+00	345
4568	[INFO] Person mit der id 501 gespeichert. personId: 501, salutation: Frau, title: , firstName: Karin, lastName: Siller, comment: Fax 01/5864181-10, updateTimestamp: 2016-09-26, active: 1	2016-09-26 18:14:26.326+00	345
4569	[INFO] Person mit der id 279 gespeichert. personId: 279, salutation: Frau, title: , firstName: Ulrike, lastName: Krempler, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 18:15:00.735+00	345
4570	[INFO] Person mit der id 286 gelöscht	2016-09-26 18:17:01.705+00	345
4571	[INFO] Person mit der id 373 gespeichert. personId: 373, salutation: Herr, title: , firstName: Wilhelm , lastName: Ortmayr, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 18:17:36.934+00	345
4572	[INFO] Person mit der id 708 gespeichert. personId: 708, salutation: Herr Direktor, title: DI, firstName: Richard, lastName: Breschar, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 18:19:23.291+00	345
4573	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-26 19:46:23.627+00	252
4574	[INFO] Person mit der id 410 gespeichert. personId: 410, salutation: Frau, title: , firstName: Sabine, lastName: Prügger, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 19:53:00.602+00	252
4575	[INFO] Person mit der id 410 gespeichert. personId: 410, salutation: Frau, title: , firstName: Sabine, lastName: Prügger, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 19:53:04.004+00	252
4576	[INFO] Person mit der id 597 gespeichert. personId: 597, salutation: Frau, title: , firstName: Maria, lastName: Zeppezauer, comment: , updateTimestamp: 2016-09-26, active: 1	2016-09-26 20:08:25.751+00	252
4577	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-26 20:08:39.822+00	252
4578	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-26 20:13:41.762+00	252
4579	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-27 08:16:41.352+00	519
4580	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-28 13:21:39.214+00	252
4581	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-29 16:18:35.59+00	345
4582	[INFO] Person mit der id 373 gespeichert. personId: 373, salutation: Herr, title: , firstName: Wilhelm , lastName: Ortmayr, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:19:07.845+00	345
4583	[INFO] Person mit der id 279 gelöscht	2016-09-29 16:20:28.251+00	345
4584	[INFO] Person mit der id 715 gespeichert. personId: 715, salutation: Frau, title: , firstName: Daniela, lastName: Braun, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:21:30.759+00	345
4585	[INFO] Organisation mit der id 229 gespeichert. organisationId: 229, name: Bonduelle Deutschland GmbH, comment: Webseite: Ja, updateTimestamp: Thu Sep 29 16:22:00 UTC 2016, active: 1	2016-09-29 16:22:00.868+00	345
4586	[INFO] Person mit der id 437 gelöscht	2016-09-29 16:24:06.648+00	345
4587	[INFO] Person mit der id 150 gelöscht	2016-09-29 16:24:36.336+00	345
4588	[INFO] Person mit der id 597 gespeichert. personId: 597, salutation: Frau, title: , firstName: Maria, lastName: Zeppezauer, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:25:22.693+00	345
4589	[INFO] Person mit der id 628 gespeichert. personId: 628, salutation: Frau, title: Mag., firstName: Christina, lastName: Laggner, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:26:26.863+00	345
4590	[INFO] Person mit der id 705 gespeichert. personId: 705, salutation: Herr Direktor, title: Dipl.-Ing. Dr., firstName: Nikolaus, lastName: Lienbacher, MBA, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:27:27.091+00	345
4591	[INFO] Person mit der id 716 gespeichert. personId: 716, salutation: Frau, title: , firstName: Maria, lastName: Reitinger  , comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:29:34.424+00	345
4592	[INFO] Person mit der id 717 gespeichert. personId: 717, salutation: Frau, title: Mag., firstName: Christine, lastName: Hochholdinger, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:31:11.382+00	345
4593	[INFO] Organisation mit der id 279 gespeichert. organisationId: 279, name: BMLFUW Abteilung V/6, comment: , updateTimestamp: Thu Sep 29 16:34:13 UTC 2016, active: 1	2016-09-29 16:34:13.527+00	345
4594	[INFO] Person mit der id 442 gelöscht	2016-09-29 16:35:17.048+00	345
4595	[INFO] Person mit der id 718 gespeichert. personId: 718, salutation: Herr Direktor, title: , firstName: Kurt, lastName: Katstaller, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:36:48.362+00	345
4596	[INFO] Organisation mit der id 219 gespeichert. organisationId: 219, name: Wirtschaftsbund Salzburg, comment: , updateTimestamp: Thu Sep 29 16:37:19 UTC 2016, active: 1	2016-09-29 16:37:19.461+00	345
4597	[INFO] Person mit der id 719 gespeichert. personId: 719, salutation: Herr, title: Mag., firstName: Christian, lastName: Pucher, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:38:51.276+00	345
4598	[INFO] Person mit der id 720 gespeichert. personId: 720, salutation: Frau, title: , firstName: Helene, lastName: Weiss MA, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 16:40:37.646+00	345
4599	[INFO] Organisation mit der id 219 gespeichert. organisationId: 219, name: Wirtschaftsbund Salzburg, comment: , updateTimestamp: Thu Sep 29 16:41:22 UTC 2016, active: 1	2016-09-29 16:41:22.424+00	345
4600	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-29 21:33:51.326+00	252
4602	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-29 21:42:10.529+00	252
4603	[INFO] Person mit der id 545 gespeichert. personId: 545, salutation: Herr, title: Dr., firstName: Raimund, lastName: Tischler, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 21:48:26.862+00	252
4604	[INFO] Person mit der id 544 gespeichert. personId: 544, salutation: Herr , title: DI, firstName: Peter , lastName: Thuswaldner, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 21:54:43.646+00	252
4605	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-29 22:09:50.39+00	252
4606	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-09-29 22:14:53.336+00	252
4607	[INFO] Person mit der id 721 gespeichert. personId: 721, salutation: Herr , title: , firstName: Gerhard , lastName: Richter, comment: , updateTimestamp: 2016-09-29, active: 1	2016-09-29 22:17:36.841+00	252
4608	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-29 22:18:17.302+00	252
4609	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-09-30 09:20:14.767+00	253
4621	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-09-30 09:29:41.552+00	253
4622	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-09-30 13:22:43.376+00	345
4623	[INFO] Person mit der id 667 gespeichert. personId: 667, salutation: Frau, title: , firstName: Elfriede, lastName: Binder, comment: , updateTimestamp: 2016-09-30, active: 1	2016-09-30 13:26:02.682+00	345
4624	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-09-30 18:54:58.292+00	519
4625	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-01 15:54:25.792+00	252
4626	[INFO] Person mit der id 17 gespeichert. personId: 17, salutation: Frau, title: , firstName: Anna, lastName: Aminger, comment: , updateTimestamp: 2016-10-01, active: 1	2016-10-01 15:55:55.797+00	252
4627	[INFO] Person mit der id 17 gespeichert. personId: 17, salutation: Frau, title: , firstName: Anna, lastName: Aminger, comment: 21. 5. 2010, updateTimestamp: 2016-10-01, active: 1	2016-10-01 15:58:52.804+00	252
4628	[INFO] Person mit der id 17 gespeichert. personId: 17, salutation: Frau, title: , firstName: Anna, lastName: Aminger, comment: 21. 5. 2010, updateTimestamp: 2016-10-01, active: 1	2016-10-01 15:59:02.705+00	252
4629	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-01 15:59:46.674+00	252
4630	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-10-02 18:33:24.392+00	574
4631	[INFO] Wareneingang mit der id 322 gespeichert	2016-10-02 18:47:04.544+00	574
4632	[INFO] Warenausgang mit der id 781 gespeichert	2016-10-02 18:49:20.337+00	574
4633	[INFO] Warenausgang mit der id 782 gespeichert	2016-10-02 18:50:04.615+00	574
4634	[INFO] Warenausgang mit der id 783 gespeichert	2016-10-02 18:50:45.967+00	574
4635	[INFO] Warenausgang mit der id 784 gespeichert	2016-10-02 18:51:15.978+00	574
4636	[INFO] Warenausgang mit der id 781 auf Archivierungsstatus 1 gesetzt	2016-10-02 18:51:25.214+00	574
4637	[INFO] Warenausgang mit der id 782 auf Archivierungsstatus 1 gesetzt	2016-10-02 18:51:29.434+00	574
4638	[INFO] Warenausgang mit der id 784 auf Archivierungsstatus 1 gesetzt	2016-10-02 18:51:33.011+00	574
4639	[INFO] Warenausgang mit der id 783 auf Archivierungsstatus 1 gesetzt	2016-10-02 18:51:36.829+00	574
4640	[INFO] Wareneingang mit der id 322 auf Archivierungsstatus 1 gesetzt	2016-10-02 18:52:13.744+00	574
4641	[INFO] Wareneingang mit der id 323 gespeichert	2016-10-02 18:57:18.064+00	574
4642	[INFO] Warenausgang mit der id 785 gespeichert	2016-10-02 19:07:04.78+00	574
4643	[INFO] Warenausgang mit der id 786 gespeichert	2016-10-02 19:07:58.89+00	574
4644	[INFO] Warenausgang mit der id 785 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:08:09.254+00	574
4645	[INFO] Warenausgang mit der id 786 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:08:14.258+00	574
4646	[INFO] Wareneingang mit der id 323 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:08:24.692+00	574
4647	[INFO] Wareneingang mit der id 324 gespeichert	2016-10-02 19:10:08.844+00	574
4648	[INFO] Warenausgang mit der id 787 gespeichert	2016-10-02 19:12:07.011+00	574
4649	[INFO] Warenausgang mit der id 788 gespeichert	2016-10-02 19:13:04.416+00	574
4650	[INFO] Warenausgang mit der id 787 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:16:04.453+00	574
4651	[INFO] Warenausgang mit der id 788 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:16:08.963+00	574
4652	[INFO] Wareneingang mit der id 324 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:16:23.678+00	574
4653	[INFO] Wareneingang mit der id 325 gespeichert	2016-10-02 19:21:54.459+00	574
4654	[INFO] Wareneingang mit der id 326 gespeichert	2016-10-02 19:33:33.196+00	574
4655	[INFO] Wareneingang mit der id 327 gespeichert	2016-10-02 19:37:02.748+00	574
4656	[INFO] Warenausgang mit der id 789 gespeichert	2016-10-02 19:39:58.423+00	574
4657	[INFO] Warenausgang mit der id 790 gespeichert	2016-10-02 19:40:50.281+00	574
4658	[INFO] Warenausgang mit der id 789 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:40:56.595+00	574
4659	[INFO] Warenausgang mit der id 790 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:41:00.265+00	574
4660	[INFO] Wareneingang mit der id 327 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:41:11.104+00	574
4661	[INFO] Wareneingang mit der id 328 gespeichert	2016-10-02 19:49:53.969+00	574
4662	[INFO] Warenausgang mit der id 791 gespeichert	2016-10-02 19:51:06.382+00	574
4663	[INFO] Warenausgang mit der id 791 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:52:05.84+00	574
4664	[INFO] Wareneingang mit der id 328 auf Archivierungsstatus 1 gesetzt	2016-10-02 19:53:05.942+00	574
4665	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-10-02 19:53:32.176+00	574
4666	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-02 20:55:38.004+00	252
4667	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-02 20:56:40.73+00	252
4668	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-03 05:20:16.033+00	519
4669	[INFO] Organisation mit der id 241 gelöscht	2016-10-03 05:22:35.552+00	519
4670	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-04 09:08:37.571+00	519
4671	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: 25.03.2014, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:11:38.826+00	519
4672	[INFO] Person mit der id 17 gespeichert. personId: 17, salutation: Frau, title: , firstName: Anna, lastName: Aminger, comment: 21.05.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:11:58.364+00	519
4673	[INFO] Person mit der id 36 gespeichert. personId: 36, salutation: Frau Dir. KR, title: , firstName: Regina, lastName: Bayer-Volkmann, comment: 23.01.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:13:49.835+00	519
4886	[INFO] Wareneingang mit der id 330 auf Archivierungsstatus 1 gesetzt	2016-10-08 18:28:08.27+00	574
4674	[INFO] Person mit der id 37 gespeichert. personId: 37, salutation: Frau, title: , firstName: Lydia, lastName: Bazanella, comment: 12.12.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:14:54.116+00	519
4675	[INFO] Person mit der id 38 gespeichert. personId: 38, salutation: Frau, title: , firstName: Gerlinde, lastName: Beinsteiner, comment: 27.01.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:15:29.308+00	519
4676	[INFO] Person mit der id 51 gespeichert. personId: 51, salutation: Frau, title: , firstName: Brigitte, lastName: Borbely, comment: 02.11.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:16:05.516+00	519
4677	[INFO] Person mit der id 53 gespeichert. personId: 53, salutation: Herr, title: Dr., firstName: Johannes, lastName: Brandl, comment: 15.07.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:16:38.117+00	519
4678	[INFO] Person mit der id 75 gespeichert. personId: 75, salutation: Herr, title: , firstName: Günther, lastName: Derler, comment: 17.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:17:02.323+00	519
4679	[INFO] Person mit der id 81 gespeichert. personId: 81, salutation: Frau, title: , firstName: Ingrid, lastName: Doblinger, comment: 28.07.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:17:19.649+00	519
4680	[INFO] Person mit der id 85 gespeichert. personId: 85, salutation: Herr, title: Dipl.Ing., firstName: Christian, lastName: Dreyer, comment: 24.02.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:17:51.423+00	519
4681	[INFO] Person mit der id 94 gespeichert. personId: 94, salutation: Frau, title: , firstName: Johanna, lastName: Ebner, comment: 13.11.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:19:57.584+00	519
4682	[INFO] Person mit der id 97 gespeichert. personId: 97, salutation: Frau, title: , firstName: Ingrid, lastName: Eder, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:20:22.786+00	519
4683	[INFO] Person mit der id 674 gespeichert. personId: 674, salutation: Herr, title: Dipl.Bw., firstName: Gerhard, lastName: Feichtinger, comment: Newsletter: nein, 03.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:20:55.888+00	519
4684	[INFO] Person mit der id 114 gespeichert. personId: 114, salutation: Frau, title: , firstName: Ina, lastName: Fischinger, comment: Newsletter: nein, 05.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:21:36.616+00	519
4685	[INFO] Person mit der id 114 gespeichert. personId: 114, salutation: Frau, title: , firstName: Ina, lastName: Fischinger, comment: Newsletter: nein, 05.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:22:00.19+00	519
4686	[INFO] Person mit der id 121 gespeichert. personId: 121, salutation: Herr, title: , firstName: Hermann, lastName: Frauenschuh, comment: 20.01.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:22:51.776+00	519
4687	[INFO] Person mit der id 121 gespeichert. personId: 121, salutation: Herr, title: , firstName: Hermann, lastName: Frauenschuh, comment: 21.01.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:23:15.184+00	519
4688	[INFO] Person mit der id 120 gespeichert. personId: 120, salutation: Frau, title: , firstName: Claudia, lastName: Frauenschuh, comment: 20.01.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:23:51.058+00	519
4689	[INFO] Person mit der id 135 gespeichert. personId: 135, salutation: Frau, title: , firstName: Gudrun, lastName: Gebetsroither, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:28:13.419+00	519
4690	[INFO] Person mit der id 136 gespeichert. personId: 136, salutation: Herr, title: , firstName: Thomas, lastName: Geierspichler, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:28:36.233+00	519
4691	[INFO] Person mit der id 141 gespeichert. personId: 141, salutation: Frau, title: , firstName: Silvia, lastName: Gmachl, comment: 18.05.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:29:00.432+00	519
4692	[INFO] Person mit der id 145 gespeichert. personId: 145, salutation: Frau, title: , firstName: Christine, lastName: Gölzner, comment: 24.10.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:29:18.728+00	519
4693	[INFO] Person mit der id 147 gespeichert. personId: 147, salutation: Herr, title: , firstName: Franz, lastName: Grabmer, comment: 11.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:29:41.105+00	519
4694	[INFO] Person mit der id 148 gespeichert. personId: 148, salutation: Frau, title: , firstName: Marijana , lastName: Grabovac, Bakk.Phil., comment: Newsletter: ja, 24.06.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:29:56.731+00	519
4695	[INFO] Person mit der id 672 gespeichert. personId: 672, salutation: Herr, title: , firstName: Gerhard, lastName: Grosschädel, comment: Newsletter: ja, 27.05.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:30:23.097+00	519
4696	[INFO] Person mit der id 158 gespeichert. personId: 158, salutation: Herr, title: , firstName: Christoph, lastName: Grötzinger, comment: 24.08.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:30:47.046+00	519
4697	[INFO] Person mit der id 165 gespeichert. personId: 165, salutation: Herr, title: , firstName: Irmin, lastName: Gundl, comment: 14.01.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:31:23.713+00	519
4698	[INFO] Person mit der id 167 gespeichert. personId: 167, salutation: Frau, title: Mag., firstName: Daniela, lastName: Gutschi, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:31:45.794+00	519
4699	[INFO] Person mit der id 177 gespeichert. personId: 177, salutation: Frau, title: Mag., firstName: Esther, lastName: Handschin, comment: 30.03.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:32:06.472+00	519
4700	[INFO] Person mit der id 180 gespeichert. personId: 180, salutation: Herr, title: , firstName: Reinhold, lastName: Harfmann, comment: 02.11.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:32:27.472+00	519
4701	[INFO] Person mit der id 184 gespeichert. personId: 184, salutation: Herr Landeshauptmann, title: Dr., firstName: Wilfried, lastName: Haslauer, comment: 20.05.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:32:53.783+00	519
4702	[INFO] Person mit der id 205 gespeichert. personId: 205, salutation: Frau, title: , firstName: Maria, lastName: Hintsteiner, comment: 20.11.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:34:29.279+00	519
4703	[INFO] Person mit der id 215 gespeichert. personId: 215, salutation: Frau, title: , firstName: Alathea, lastName: Hölscher, comment: Newsletter: nein, 12.03.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:35:05.861+00	519
4704	[INFO] Person mit der id 216 gespeichert. personId: 216, salutation: Herr, title: , firstName: Georg, lastName: Hölscher, comment: Newsletter: nein, 12.03.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:35:15.26+00	519
4705	[INFO] Person mit der id 221 gespeichert. personId: 221, salutation: Herr Generaldirektor, title: Dr., firstName: Johannes, lastName: Hörl, comment: Newsletter: nein, 28.05.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:35:46.685+00	519
4706	[INFO] Person mit der id 225 gespeichert. personId: 225, salutation: Frau, title: , firstName: Johanna, lastName: Huber, comment: 12.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:36:10.098+00	519
4707	[INFO] Person mit der id 229 gespeichert. personId: 229, salutation: Herr, title: Dipl.Ing., firstName: Johannes, lastName: Hubmann, comment: 18.10.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:36:34.511+00	519
4708	[INFO] Person mit der id 673 gespeichert. personId: 673, salutation: Frau, title: Mag., firstName: Friederike, lastName: Hurch, comment: 02.04.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:36:59.538+00	519
4709	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: 15.01.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:37:27.088+00	519
4710	[INFO] Person mit der id 242 gespeichert. personId: 242, salutation: Frau, title: , firstName: Rosmarie, lastName: Jungwirth, comment: 07.03.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:37:49.225+00	519
4711	[INFO] Person mit der id 246 gespeichert. personId: 246, salutation: Frau, title: , firstName: Minni, lastName: Karres, comment: Newsletter: ja, 19.02.2014, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:42:43.258+00	519
4712	[INFO] Person mit der id 248 gespeichert. personId: 248, salutation: Herr, title: , firstName: Oskar, lastName: Kaufmann, comment: 10.11.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:43:01.163+00	519
4713	[INFO] Person mit der id 258 gespeichert. personId: 258, salutation: Frau, title: Mag., firstName: Elisabeth, lastName: Kislinger-Ziegler, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:43:17.56+00	519
4714	[INFO] Person mit der id 262 gespeichert. personId: 262, salutation: Frau, title: , firstName: Waltraud, lastName: Klima, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:43:38.403+00	519
4715	[INFO] Person mit der id 267 gespeichert. personId: 267, salutation: Frau, title: Mag., firstName: Veronika, lastName: Kois, comment: Newsletter: Ja, 08.02.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:43:55.787+00	519
4716	[INFO] Person mit der id 268 gespeichert. personId: 268, salutation: Herr, title: Mag., firstName: Helmut, lastName: Köllensperger, comment: 01.08.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:44:12.195+00	519
4717	[INFO] Person mit der id 269 gespeichert. personId: 269, salutation: Herr, title: Dr., firstName: Karl, lastName: Koller, comment: Newsletter: ja, 24.02.2014, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:44:31.719+00	519
4718	[INFO] Person mit der id 270 gespeichert. personId: 270, salutation: Herr, title: Mag., firstName: Reinhold, lastName: Kolm, comment: 09.02.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:44:49.854+00	519
4719	[INFO] Person mit der id 272 gespeichert. personId: 272, salutation: Frau, title: , firstName: Herma, lastName: König, comment: Newsletter: ja, 03.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:45:11.596+00	519
4720	[INFO] Person mit der id 292 gespeichert. personId: 292, salutation: Frau, title: , firstName: Erika, lastName: Lange, comment: 06.12.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:45:30.61+00	519
4721	[INFO] Person mit der id 297 gespeichert. personId: 297, salutation: Frau, title: , firstName: Inge, lastName: Lederer, comment: 19.01.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:45:49.659+00	519
4722	[INFO] Person mit der id 652 gespeichert. personId: 652, salutation: Herr, title: Dr., firstName: Helmut, lastName: Leube, comment: Newsletter: ja, 30.05.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:46:25.456+00	519
4723	[INFO] Person mit der id 305 gespeichert. personId: 305, salutation: Frau, title: Dr., firstName: Andrea, lastName: Lindmayr-Brandl, comment: 05.08.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:46:55.219+00	519
4799	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-07 09:23:02.292+00	519
4816	[INFO] Warenausgang mit der id 794 gespeichert	2016-10-07 10:43:34.842+00	574
4817	[INFO] Wareneingang mit der id 329 gespeichert	2016-10-07 10:44:21.853+00	574
4818	[INFO] Warenausgang mit der id 794 gespeichert	2016-10-07 10:44:43.325+00	574
4819	[INFO] Warenausgang mit der id 794 auf Archivierungsstatus 1 gesetzt	2016-10-07 10:45:14.74+00	574
4825	[INFO] Person mit der id 30 gespeichert. personId: 30, salutation: Herr, title: , firstName: Hans, lastName: Bauer, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 14:24:02.384+00	345
4847	[INFO] Organisation mit der id 158 gespeichert. organisationId: 158, name: Salzburger Agrarmarketing, comment: , updateTimestamp: Fri Oct 07 15:18:02 UTC 2016, active: 1	2016-10-07 15:18:02.221+00	345
4848	[INFO] Organisation mit der id 178 gespeichert. organisationId: 178, name: Seniorenheim Wals, comment: , updateTimestamp: Fri Oct 07 15:18:14 UTC 2016, active: 1	2016-10-07 15:18:14.448+00	345
4724	[INFO] Person mit der id 307 gespeichert. personId: 307, salutation: Herr, title: , firstName: Hubert, lastName: Lixl, comment: 20.02.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:47:21.807+00	519
4725	[INFO] Person mit der id 310 gespeichert. personId: 310, salutation: Frau, title: , firstName: Bettina, lastName: Lorentschitsch, Msc MBA, comment: 23.01.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:47:42.124+00	519
4726	[INFO] Person mit der id 315 gespeichert. personId: 315, salutation: Frau, title: Mag., firstName: Elfriede, lastName: Mackinger, comment: 20.01.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:48:00.593+00	519
4727	[INFO] Person mit der id 332 gespeichert. personId: 332, salutation: Herr, title: , firstName: Franz, lastName: Mayr, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 09:48:24.845+00	519
4728	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-04 12:12:20.747+00	519
4729	[INFO] Person mit der id 343 gespeichert. personId: 343, salutation: Herr Präsident, title: , firstName: Helmut, lastName: Mödlhammer, comment: Newsletter: ja, 25.09.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:12:36.926+00	519
4730	[INFO] Person mit der id 348 gespeichert. personId: 348, salutation: Sr., title: , firstName: Erika, lastName: Moser, comment: 15.07.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:12:54.104+00	519
4731	[INFO] Person mit der id 350 gespeichert. personId: 350, salutation: Herr, title: , firstName: Michael, lastName: Mrazek, comment: Newsletter: nein, 04.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:13:20.499+00	519
4732	[INFO] Person mit der id 351 gespeichert. personId: 351, salutation: Herr, title: Dr., firstName: Alois, lastName: Navara, comment: 23.01.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:13:36.139+00	519
4733	[INFO] Person mit der id 352 gespeichert. personId: 352, salutation: Herr, title: Dipl.Ing., firstName: Norbert, lastName: Nechansky, comment: 12.03.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:14:00.732+00	519
4734	[INFO] Person mit der id 353 gespeichert. personId: 353, salutation: Frau, title: Dr., firstName: Verena, lastName: Nechansky, comment: 12.03.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:14:10.14+00	519
4735	[INFO] Person mit der id 356 gespeichert. personId: 356, salutation: Frau LAbg., title: , firstName: Theresia, lastName: Neuhofer, comment: 25.06.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:14:28.951+00	519
4736	[INFO] Person mit der id 359 gespeichert. personId: 359, salutation: Herr, title: MMag., firstName: Michael, lastName: Neureiter, comment: 15.10.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:14:44.282+00	519
4737	[INFO] Person mit der id 363 gespeichert. personId: 363, salutation: Herr, title: Mag., firstName: Erwin, lastName: Niese, comment: 30.07.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:14:58.779+00	519
4738	[INFO] Person mit der id 657 gespeichert. personId: 657, salutation: Herr, title: , firstName: Josef, lastName: Nobis, comment: Newsletter: nein, 22.12.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:15:18.669+00	519
4739	[INFO] Person mit der id 368 gespeichert. personId: 368, salutation: Frau, title: , firstName: Cornelia, lastName: Oetzlinger, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:16:04.173+00	519
4740	[INFO] Person mit der id 375 gespeichert. personId: 375, salutation: Frau, title: , firstName: Gudrun, lastName: Ostermayer, comment: 02.02.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:16:19.562+00	519
4741	[INFO] Person mit der id 647 gespeichert. personId: 647, salutation: Frau, title: Dr., firstName: Brigitta, lastName: Pallauf, comment: Newsletter: ja, 25.01.2014, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:16:35.177+00	519
4742	[INFO] Person mit der id 386 gespeichert. personId: 386, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Pfaffenberger, comment: 24.02.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:16:53.338+00	519
4743	[INFO] Person mit der id 389 gespeichert. personId: 389, salutation: Frau, title: , firstName: Isolde, lastName: Pfingstl, comment: Newsletter: ja, 22.11.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:17:11.278+00	519
4744	[INFO] Person mit der id 399 gespeichert. personId: 399, salutation: Frau, title: , firstName: Karin, lastName: Pokorny, comment: 01.01.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:17:29.523+00	519
4745	[INFO] Person mit der id 402 gespeichert. personId: 402, salutation: Herr, title: , firstName: Johann, lastName: Pongruber, comment: Newsletter: ja, 03.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:17:46.062+00	519
4746	[INFO] Person mit der id 405 gespeichert. personId: 405, salutation: Herr, title: , firstName: Bruno, lastName: Prantl, comment: 19.01.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:18:02.488+00	519
4747	[INFO] Person mit der id 415 gespeichert. personId: 415, salutation: Frau Präsidentin, title: Dr., firstName: Helga, lastName: Rabl-Stadler, comment: 17.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:18:16.085+00	519
4748	[INFO] Person mit der id 418 gespeichert. personId: 418, salutation: Herr, title: Dr., firstName: Johann, lastName: Rausch, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:18:35.501+00	519
4749	[INFO] Person mit der id 425 gespeichert. personId: 425, salutation: Frau, title: , firstName: Elfriede, lastName: Reichl, comment: 05.01.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:18:53.437+00	519
4750	[INFO] Person mit der id 424 gespeichert. personId: 424, salutation: Herr, title: Dr., firstName: Roland, lastName: Reichl, comment: 05.01.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:19:03.3+00	519
4751	[INFO] Person mit der id 426 gespeichert. personId: 426, salutation: Herr, title: Dr., firstName: Wolfgang, lastName: Reiger, comment: Newsletter: ja, 05.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:19:27.03+00	519
4752	[INFO] Person mit der id 432 gespeichert. personId: 432, salutation: Frau, title: , firstName: Maria, lastName: Reiter, comment: Newsletter: ja, 24.02.2014, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:19:56.442+00	519
4753	[INFO] Person mit der id 435 gespeichert. personId: 435, salutation: Herr, title: Ing., firstName: Günther, lastName: Resch, comment: 18.07.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:20:13.092+00	519
4754	[INFO] Person mit der id 643 gespeichert. personId: 643, salutation: Herr, title: , firstName: Hugo, lastName: Rohner, comment: Newsletter: ja; 18.08.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:20:28.333+00	519
4755	[INFO] Person mit der id 651 gespeichert. personId: 651, salutation: Herr, title: , firstName: Bernhard, lastName: Rosegger, comment: Newsletter: nein, 28.05.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:20:47.962+00	519
4756	[INFO] Person mit der id 453 gespeichert. personId: 453, salutation: Frau, title: , firstName: Margit, lastName: Sachsenhofer, comment: 14.03.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:21:06.335+00	519
4887	[INFO] Wareneingang mit der id 304 auf Archivierungsstatus 1 gesetzt	2016-10-08 18:28:48.862+00	574
4757	[INFO] Person mit der id 454 gespeichert. personId: 454, salutation: Herr, title: , firstName: Erich, lastName: Sättele, comment: 03.03.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:21:22.362+00	519
4758	[INFO] Person mit der id 468 gespeichert. personId: 468, salutation: Frau, title: , firstName: Edeltraud, lastName: Schirlbauer, comment: 08.04.2014, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:21:38.404+00	519
4759	[INFO] Person mit der id 649 gespeichert. personId: 649, salutation: Herr, title: Dr., firstName: Leonhard, lastName: Schitter, comment: Newsletter: nein, 20.05.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:21:56.138+00	519
4760	[INFO] Person mit der id 478 gespeichert. personId: 478, salutation: Herr LAbg., title: Dr., firstName: Josef, lastName: Schöchl, comment: 21.05.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:22:39.319+00	519
4761	[INFO] Person mit der id 490 gespeichert. personId: 490, salutation: Herr, title: Dr., firstName: Wolfgang, lastName: Schwaiger, comment: 21.05.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:23:18.328+00	519
4762	[INFO] Person mit der id 497 gespeichert. personId: 497, salutation: Frau, title: , firstName: Aloisia, lastName: Schwertl, comment: Newsletter: nein, 08.12.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:23:36.346+00	519
4763	[INFO] Person mit der id 502 gespeichert. personId: 502, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:23:53.364+00	519
4764	[INFO] Person mit der id 505 gespeichert. personId: 505, salutation: Sr., title: , firstName: Joanella, lastName: Six, comment: 08.11.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:24:08.843+00	519
4765	[INFO] Person mit der id 506 gespeichert. personId: 506, salutation: Frau, title: , firstName: Maria, lastName: Slowak, comment: 09.08.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:24:27.6+00	519
4766	[INFO] Person mit der id 525 gespeichert. personId: 525, salutation: Frau, title: , firstName: Edith, lastName: Stöllinger, comment: 18.05.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:24:48.84+00	519
4767	[INFO] Person mit der id 526 gespeichert. personId: 526, salutation: Herr, title: , firstName: Engelbert, lastName: Stöllinger, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:24:56.519+00	519
4768	[INFO] Person mit der id 531 gespeichert. personId: 531, salutation: Herr, title: Dipl.Ing., firstName: Christian, lastName: Struber, comment: 23.02.2012, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:25:22.101+00	519
4769	[INFO] Person mit der id 661 gespeichert. personId: 661, salutation: Herr, title: Dr., firstName: Eduard, lastName: Thaler, comment: Newsletter: ja; 31.12.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:25:43.155+00	519
4770	[INFO] Person mit der id 541 gespeichert. personId: 541, salutation: Frau, title: , firstName: Monika, lastName: Thonhofer, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:25:59.665+00	519
4771	[INFO] Person mit der id 552 gespeichert. personId: 552, salutation: Frau, title: Mag., firstName: Michaela, lastName: Ullmann, comment: 12.03.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:26:14.795+00	519
4772	[INFO] Person mit der id 557 gespeichert. personId: 557, salutation: Frau, title: , firstName: Andrea, lastName: Waldmann, comment: 18.09.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:26:27.561+00	519
4773	[INFO] Person mit der id 558 gespeichert. personId: 558, salutation: Frau, title: , firstName: Theresia, lastName: Wallerstorfer, comment: 10.04.2013, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:26:50.547+00	519
4774	[INFO] Person mit der id 563 gespeichert. personId: 563, salutation: Frau, title: , firstName: Christine, lastName: Wawra, comment: 19.05.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:27:09.047+00	519
4775	[INFO] Person mit der id 564 gespeichert. personId: 564, salutation: Herr, title: , firstName: Hans-Peter, lastName: Wawra, comment: Ehrenmitglied, 20.09.2011, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:27:23.048+00	519
4776	[INFO] Person mit der id 567 gespeichert. personId: 567, salutation: Herr, title: Dr., firstName: Franz, lastName: Weber, comment: 30.06.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:27:43.13+00	519
4777	[INFO] Person mit der id 573 gespeichert. personId: 573, salutation: Frau, title: , firstName: Armella, lastName: Wengler, comment: 22.01.2009, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:28:01.106+00	519
4778	[INFO] Person mit der id 575 gespeichert. personId: 575, salutation: Frau, title: , firstName: Ingrid, lastName: Werdenich, comment: 03.02.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:28:17.773+00	519
4779	[INFO] Person mit der id 582 gespeichert. personId: 582, salutation: Herr Dir., title: , firstName: Karl-Armin, lastName: Wieser, comment: 23.01.2008, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:28:35.889+00	519
4780	[INFO] Person mit der id 598 gespeichert. personId: 598, salutation: Frau, title: Dipl.Ing., firstName: Jana, lastName: Zitta, comment: 31.01.2010, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:28:47.003+00	519
4781	[INFO] Person mit der id 655 gespeichert. personId: 655, salutation: Herr, title: Mag., firstName: Rudolf, lastName: Zrost, comment: Newsletter: ja, 27.05.2015, updateTimestamp: 2016-10-04, active: 1	2016-10-04 12:29:00.324+00	519
4782	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-04 16:20:35.097+00	519
4783	[INFO] Organisation mit der id 280 gespeichert. organisationId: 280, name: Verein menschen.leben Hayat Schallmoos, comment: HFA ok, updateTimestamp: Tue Oct 04 16:26:10 UTC 2016, active: 1	2016-10-04 16:26:10.309+00	519
4784	[INFO] Person mit der id 722 gespeichert. personId: 722, salutation: Frau, title: , firstName: Julia, lastName: Böck, comment: , updateTimestamp: 2016-10-04, active: 1	2016-10-04 16:27:15.905+00	519
4785	[INFO] Organisation mit der id 280 gespeichert. organisationId: 280, name: Verein menschen.leben Hayat Schallmoos, comment: HFA ok, updateTimestamp: Tue Oct 04 16:30:02 UTC 2016, active: 1	2016-10-04 16:30:02.626+00	519
4786	[INFO] Organisation mit der id 280 gespeichert. organisationId: 280, name: Verein menschen.leben Hayat Schallmoos, comment: HFA ok, updateTimestamp: Tue Oct 04 16:30:15 UTC 2016, active: 1	2016-10-04 16:30:15.106+00	519
4787	[INFO] Organisation mit der id 281 gespeichert. organisationId: 281, name: Verein menschen.leben, comment: , updateTimestamp: Tue Oct 04 16:30:57 UTC 2016, active: 1	2016-10-04 16:30:57.623+00	519
4788	[INFO] Person mit der id 723 gespeichert. personId: 723, salutation: Frau, title: Mag.a, firstName: Nina, lastName: Stumtner, comment: , updateTimestamp: 2016-10-04, active: 1	2016-10-04 16:32:18.292+00	519
4789	[INFO] Organisation mit der id 281 gespeichert. organisationId: 281, name: Verein menschen.leben, comment: , updateTimestamp: Tue Oct 04 16:32:38 UTC 2016, active: 1	2016-10-04 16:32:38.459+00	519
4790	[INFO] Person mit der id 723 gespeichert. personId: 723, salutation: Frau, title: Mag, firstName: Nina, lastName: Stumtner, comment: , updateTimestamp: 2016-10-04, active: 1	2016-10-04 16:33:17.042+00	519
4888	[INFO] Warenausgang mit der id 795 gespeichert	2016-10-08 18:29:35.902+00	574
4791	[INFO] Person mit der id 723 gespeichert. personId: 723, salutation: Frau, title: Mag., firstName: Nina, lastName: Stumtner, comment: , updateTimestamp: 2016-10-04, active: 1	2016-10-04 16:36:15.923+00	519
4792	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-10-04 16:46:34.505+00	519
4793	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-05 07:12:37.596+00	252
4794	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-05 07:13:48.561+00	252
4795	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-05 10:20:15.036+00	519
4796	[INFO] Organisation mit der id 281 gespeichert. organisationId: 281, name: Verein menschen.leben, comment: , updateTimestamp: Wed Oct 05 10:20:46 UTC 2016, active: 1	2016-10-05 10:20:46.048+00	519
4797	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-10-05 10:20:57.862+00	519
4798	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-06 13:45:36.969+00	252
4800	[INFO] Person mit der id 395 gelöscht	2016-10-07 09:24:11.968+00	519
4801	[INFO] Person mit der id 20 gelöscht	2016-10-07 09:26:41.823+00	519
4802	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-10-07 09:28:33.447+00	574
4803	[INFO] Wareneingang mit der id 325 gespeichert	2016-10-07 10:07:50.852+00	574
4804	[INFO] Warenausgang mit der id 771 gespeichert	2016-10-07 10:27:29.317+00	574
4805	[INFO] Warenausgang mit der id 792 gespeichert	2016-10-07 10:29:11.629+00	574
4806	[INFO] Warenausgang mit der id 792 auf Archivierungsstatus 1 gesetzt	2016-10-07 10:31:04.258+00	574
4807	[INFO] Wareneingang mit der id 325 gespeichert	2016-10-07 10:32:03.684+00	574
4808	[INFO] Wareneingang mit der id 326 auf Archivierungsstatus 1 gesetzt	2016-10-07 10:32:17.448+00	574
4809	[INFO] Wareneingang mit der id 325 auf Archivierungsstatus 1 gesetzt	2016-10-07 10:32:32.92+00	574
4810	[INFO] Warenausgang mit der id 793 gespeichert	2016-10-07 10:34:07.6+00	574
4811	[INFO] Warenausgang mit der id 793 auf Archivierungsstatus 1 gesetzt	2016-10-07 10:35:18.853+00	574
4812	[INFO] Organisation mit der id 282 gespeichert. organisationId: 282, name: Einmaliger Lieferant, comment: dieser Lieferant wurde für Warenbuchhaltung angelegt, wenn keine weiteren Lieferungen zu erwarten sind, updateTimestamp: Fri Oct 07 10:37:43 UTC 2016, active: 1	2016-10-07 10:37:43.12+00	574
4813	[INFO] Organisation mit der id 282 gespeichert. organisationId: 282, name: zzz Einmaliger Lieferant zzz, comment: dieser Lieferant wurde für Warenbuchhaltung angelegt, wenn keine weiteren Lieferungen zu erwarten sind, updateTimestamp: Fri Oct 07 10:38:33 UTC 2016, active: 1	2016-10-07 10:38:33.826+00	574
4814	[INFO] Organisation mit der id 282 gespeichert. organisationId: 282, name: zzz anderer Lieferant zzz, comment: dieser Lieferant wurde für Warenbuchhaltung angelegt, wenn keine weiteren Lieferungen zu erwarten sind, updateTimestamp: Fri Oct 07 10:39:49 UTC 2016, active: 1	2016-10-07 10:39:49.327+00	574
4815	[INFO] Wareneingang mit der id 329 gespeichert	2016-10-07 10:42:37.903+00	574
4820	[INFO] Wareneingang mit der id 329 auf Archivierungsstatus 1 gesetzt	2016-10-07 10:45:26.55+00	574
4821	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-10-07 10:45:39.982+00	574
4822	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-10-07 13:54:59.162+00	345
4823	[INFO] Person mit der id 384 gespeichert. personId: 384, salutation: Frau, title: Mag., firstName: Claudia, lastName: Petschl, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 14:15:35.409+00	345
4824	[INFO] Person mit der id 515 gespeichert. personId: 515, salutation: Herr, title: , firstName: Nikolaus, lastName: Stampfer, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 14:16:07.126+00	345
4826	[INFO] Person mit der id 683 gespeichert. personId: 683, salutation: Herr, title: Mag., firstName: Paul , lastName: Lindner, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 14:51:25.392+00	345
4827	[INFO] Person mit der id 504 gespeichert. personId: 504, salutation: Herr, title: , firstName: Christian, lastName: Sitte, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 14:57:56.897+00	345
4828	[INFO] Person mit der id 645 gespeichert. personId: 645, salutation: Herr, title: , firstName: Leopold, lastName: Reichenauer, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 14:58:58.851+00	345
4829	[INFO] Person mit der id 645 gespeichert. personId: 645, salutation: Herr, title: , firstName: Leopold, lastName: Reichenauer, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 14:59:48.141+00	345
4830	[INFO] Person mit der id 24 gespeichert. personId: 24, salutation: Herr, title: , firstName: Christian, lastName: Atanassoff, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:00:01.492+00	345
4831	[INFO] Person mit der id 88 gespeichert. personId: 88, salutation: Herr, title: Ing., firstName: Franz, lastName: Dusch, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:00:14.353+00	345
4832	[INFO] Person mit der id 264 gespeichert. personId: 264, salutation: Frau, title: , firstName: Ingrid, lastName: Koberger, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:00:27.436+00	345
4833	[INFO] Person mit der id 408 gespeichert. personId: 408, salutation: Frau, title: , firstName: Elena, lastName: Proksch, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:00:49.891+00	345
4834	[INFO] Person mit der id 446 gespeichert. personId: 446, salutation: Frau, title: , firstName: Cornelia, lastName: Robl, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:01:04.318+00	345
4835	[INFO] Person mit der id 643 gespeichert. personId: 643, salutation: Herr, title: , firstName: Hugo, lastName: Rohner, comment: Newsletter: ja; 18.08.2015, updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:01:17.745+00	345
4836	[INFO] Person mit der id 643 gespeichert. personId: 643, salutation: Herr, title: , firstName: Hugo, lastName: Rohner, comment: Newsletter: ja; 18.08.2015, updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:01:33.315+00	345
4837	[INFO] Person mit der id 561 gespeichert. personId: 561, salutation: Herr, title: , firstName: Josef, lastName: Walser, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:02:16.029+00	345
4838	[INFO] Person mit der id 198 gespeichert. personId: 198, salutation: Herr, title: , firstName: Hans, lastName: Herneth, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:02:52.953+00	345
4839	[INFO] Person mit der id 9 gespeichert. personId: 9, salutation: Schwester, title: , firstName: Oberin, lastName:  , comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:12:05.393+00	345
4840	[INFO] Organisation mit der id 22 gespeichert. organisationId: 22, name: C+C Pfeiffer Salzburg, comment: , updateTimestamp: Fri Oct 07 15:15:51 UTC 2016, active: 1	2016-10-07 15:15:51.556+00	345
4841	[INFO] Organisation mit der id 94 gespeichert. organisationId: 94, name: LBS - Heim  Wals, comment: HFA ok, updateTimestamp: Fri Oct 07 15:16:04 UTC 2016, active: 1	2016-10-07 15:16:04.468+00	345
4889	[INFO] Warenausgang mit der id 795 auf Archivierungsstatus 1 gesetzt	2016-10-08 18:29:43.591+00	574
4842	[INFO] Organisation mit der id 250 gespeichert. organisationId: 250, name: Lebenshilfe Wals, comment: HFA ok, updateTimestamp: Fri Oct 07 15:16:15 UTC 2016, active: 1	2016-10-07 15:16:15.928+00	345
4843	[INFO] Organisation mit der id 102 gespeichert. organisationId: 102, name: LFS Klessheim, comment: , updateTimestamp: Fri Oct 07 15:16:27 UTC 2016, active: 1	2016-10-07 15:16:27.633+00	345
4844	[INFO] Organisation mit der id 112 gespeichert. organisationId: 112, name: Metro Cash & Carry Österrreich GmbH, comment: Webseite Ja, updateTimestamp: Fri Oct 07 15:16:40 UTC 2016, active: 1	2016-10-07 15:16:40.971+00	345
4845	[INFO] Organisation mit der id 114 gespeichert. organisationId: 114, name: MIELE Gesellschaft m.b.H., comment: , updateTimestamp: Fri Oct 07 15:16:53 UTC 2016, active: 1	2016-10-07 15:16:53.802+00	345
4846	[INFO] Organisation mit der id 141 gespeichert. organisationId: 141, name: Quehenberger Logistics GmbH Wals, comment: Kontakt über Anna Gross, updateTimestamp: Fri Oct 07 15:17:09 UTC 2016, active: 1	2016-10-07 15:17:09.704+00	345
4849	[INFO] Organisation mit der id 116 gespeichert. organisationId: 116, name: Moderne Gartechnik Anner GmbH, comment: Webseite Ja, updateTimestamp: Fri Oct 07 15:19:34 UTC 2016, active: 1	2016-10-07 15:19:34.598+00	345
4850	[INFO] Organisation mit der id 266 gespeichert. organisationId: 266, name: Öller Brandstätter, comment: , updateTimestamp: Fri Oct 07 15:21:53 UTC 2016, active: 1	2016-10-07 15:21:53.544+00	345
4851	[INFO] Organisation mit der id 175 gespeichert. organisationId: 175, name: Seniorenheim Seekirchen, comment: HFA ok, updateTimestamp: Fri Oct 07 15:22:04 UTC 2016, active: 1	2016-10-07 15:22:04.785+00	345
4852	[INFO] Organisation mit der id 192 gespeichert. organisationId: 192, name: SOS-Kinderdorf Seekirchen, comment: HFA ok, updateTimestamp: Fri Oct 07 15:22:17 UTC 2016, active: 1	2016-10-07 15:22:17.038+00	345
4853	[INFO] Organisation mit der id 18 gespeichert. organisationId: 18, name: Bergader Privatkäserei GmbH, comment: , updateTimestamp: Fri Oct 07 15:24:41 UTC 2016, active: 1	2016-10-07 15:24:41.63+00	345
4854	[INFO] Person mit der id 166 gespeichert. personId: 166, salutation: Herr, title: , firstName: Sören, lastName: Guth, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:38:16.477+00	345
4855	[INFO] Person mit der id 198 gespeichert. personId: 198, salutation: Herr und Frau, title: , firstName: Hans, lastName: Herneth, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:40:48.018+00	345
4856	[INFO] Person mit der id 341 gespeichert. personId: 341, salutation: Herr, title: , firstName: Peter, lastName: Mitgutsch, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:41:44.108+00	345
4857	[INFO] Person mit der id 668 gespeichert. personId: 668, salutation: Herr, title: , firstName: Siegfried, lastName: Huber    , comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:44:40.176+00	345
4858	[INFO] Person mit der id 721 gespeichert. personId: 721, salutation: Herr , title: , firstName: Gerhard , lastName: Richter, comment: , updateTimestamp: 2016-10-07, active: 1	2016-10-07 15:44:51.589+00	345
4859	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-08 06:55:35.098+00	252
4860	[INFO] Organisation mit der id 283 gespeichert. organisationId: 283, name: Bankhaus Carl Spängler & Co. AG, comment: , updateTimestamp: Sat Oct 08 07:39:35 UTC 2016, active: 1	2016-10-08 07:39:35.841+00	252
4861	[INFO] Organisation mit der id 284 gespeichert. organisationId: 284, name: Bankhaus Carl Spängler & Co. AG, comment: , updateTimestamp: Sat Oct 08 07:39:40 UTC 2016, active: 1	2016-10-08 07:39:40.438+00	252
4862	[INFO] Organisation mit der id 283 gespeichert. organisationId: 283, name: Bankhaus Carl Spängler & Co. AG, comment: , updateTimestamp: Sat Oct 08 07:40:07 UTC 2016, active: 1	2016-10-08 07:40:07.279+00	252
4863	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-08 07:41:45.108+00	252
4864	[INFO] Person mit der id 701 gespeichert. personId: 701, salutation: Herr, title: Mag., firstName: Walter, lastName: Schnitzhofer, comment: , updateTimestamp: 2016-10-08, active: 1	2016-10-08 07:42:53.349+00	252
4865	[INFO] Person mit der id 701 gespeichert. personId: 701, salutation: Herr, title: Mag., firstName: Walter, lastName: Schnitzhofer, comment: , updateTimestamp: 2016-10-08, active: 1	2016-10-08 07:42:57.531+00	252
4866	[INFO] Person mit der id 724 gespeichert. personId: 724, salutation: Herr KommR, title: , firstName: Heinrich , lastName: Spängler, comment: , updateTimestamp: 2016-10-08, active: 1	2016-10-08 07:43:48.439+00	252
4867	[INFO] Organisation mit der id 283 gespeichert. organisationId: 283, name: Bankhaus Carl Spängler & Co. AG, comment: , updateTimestamp: Sat Oct 08 07:45:33 UTC 2016, active: 1	2016-10-08 07:45:33.135+00	252
4868	[INFO] Organisation mit der id 283 gespeichert. organisationId: 283, name: Bankhaus Carl Spängler & Co. AG, comment: , updateTimestamp: Sat Oct 08 07:45:58 UTC 2016, active: 1	2016-10-08 07:45:58.333+00	252
4869	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-10-08 09:55:13.737+00	441
4870	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-08 13:00:30.501+00	252
4871	[INFO] Person mit der id 578 gespeichert. personId: 578, salutation: Herr, title: , firstName: Toni, lastName: Wieland, comment: , updateTimestamp: 2016-10-08, active: 1	2016-10-08 13:31:04.194+00	252
4872	[INFO] Organisation mit der id 32 gespeichert. organisationId: 32, name: Ehrenamtliches Team Obertrum, comment: HFA ok, updateTimestamp: Sat Oct 08 13:31:52 UTC 2016, active: 1	2016-10-08 13:31:52.322+00	252
4873	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-08 13:40:22.579+00	252
4874	[INFO] Person mit der id 305 gespeichert. personId: 305, salutation: Frau, title: Univ.Prof. Dr. Mag., firstName: Andrea, lastName: Lindmayr-Brandl, comment: 05.08.2011, updateTimestamp: 2016-10-08, active: 1	2016-10-08 13:41:25.315+00	252
4875	[INFO] Person mit der id 53 gespeichert. personId: 53, salutation: Herr, title: Ass.-Prof. Dr., firstName: Johannes, lastName: Brandl, comment: 15.07.2010, updateTimestamp: 2016-10-08, active: 1	2016-10-08 13:44:46.623+00	252
4876	[INFO] Organisation mit der id 190 gespeichert. organisationId: 190, name: SOLEart  Straßwalchen, comment: HFA ok, updateTimestamp: Sat Oct 08 13:53:31 UTC 2016, active: 1	2016-10-08 13:53:31.17+00	252
4877	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-08 14:45:04.397+00	252
4878	[INFO] Person mit der id 657 gespeichert. personId: 657, salutation: Herr, title: , firstName: Josef, lastName: Nobis, comment: Newsletter: nein, 22.12.2015, updateTimestamp: 2016-10-08, active: 1	2016-10-08 14:47:51.063+00	252
4879	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-08 14:48:10.493+00	252
4880	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2016-10-08 18:20:28.559+00	574
4881	[INFO] Wareneingang mit der id 330 gespeichert	2016-10-08 18:26:15.218+00	574
4882	[INFO] Wareneingang mit der id 331 gespeichert	2016-10-08 18:27:03.059+00	574
4883	[INFO] Wareneingang mit der id 332 gespeichert	2016-10-08 18:27:48.716+00	574
4884	[INFO] Wareneingang mit der id 332 auf Archivierungsstatus 1 gesetzt	2016-10-08 18:27:56.855+00	574
4885	[INFO] Wareneingang mit der id 331 auf Archivierungsstatus 1 gesetzt	2016-10-08 18:28:03.907+00	574
4891	[INFO] Warenausgang mit der id 796 auf Archivierungsstatus 1 gesetzt	2016-10-08 18:30:22.2+00	574
4892	[INFO] Warenausgang mit der id 797 gespeichert	2016-10-08 18:30:54.055+00	574
4893	[INFO] Warenausgang mit der id 797 auf Archivierungsstatus 1 gesetzt	2016-10-08 18:31:01.618+00	574
4894	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2016-10-08 18:31:43.878+00	574
4895	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-08 21:22:30.345+00	252
4896	[INFO] Person mit der id 552 gespeichert. personId: 552, salutation: Frau, title: Mag., firstName: Michaela, lastName: Ullmann, comment: 12.03.2008, updateTimestamp: 2016-10-08, active: 1	2016-10-08 21:23:27.613+00	252
4897	[INFO] Person mit der id 552 gespeichert. personId: 552, salutation: Frau, title: Mag., firstName: Michaela, lastName: Ullmann, comment: , updateTimestamp: 2016-10-08, active: 1	2016-10-08 21:23:48.915+00	252
4898	[INFO] Organisation mit der id 96 gespeichert. organisationId: 96, name: Landesberufsschulheim Obertrum , comment: HFA ok, updateTimestamp: Sat Oct 08 21:25:21 UTC 2016, active: 1	2016-10-08 21:25:21.439+00	252
4899	[INFO] Organisation mit der id 95 gespeichert. organisationId: 95, name: Landesberufsschulheim Hallein , comment: HFA ok, updateTimestamp: Sat Oct 08 21:26:02 UTC 2016, active: 1	2016-10-08 21:26:02.459+00	252
4900	[INFO] Organisation mit der id 94 gespeichert. organisationId: 94, name: Landesberufsschulheim Wals, comment: HFA ok, updateTimestamp: Sat Oct 08 21:26:44 UTC 2016, active: 1	2016-10-08 21:26:44.421+00	252
4901	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-08 21:26:54.851+00	252
4902	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-09 15:30:44.815+00	252
4908	[INFO] Person mit der id 28 gespeichert. personId: 28, salutation: Frau, title: , firstName: Elfi, lastName: Baier, comment: Newslatter: ja, 01.11.2015, updateTimestamp: 2016-10-09, active: 1	2016-10-09 16:04:44.657+00	519
4909	[INFO] Person mit der id 216 gespeichert. personId: 216, salutation: Herr, title: , firstName: Georg, lastName: Hölscher, comment: Newsletter: nein, 13.03.2010, updateTimestamp: 2016-10-09, active: 1	2016-10-09 16:07:37.34+00	519
4910	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-10-09 17:26:45.616+00	345
4911	[INFO] Organisation mit der id 190 gespeichert. organisationId: 190, name: SOLEart  Straßwalchen, comment: HFA ok, updateTimestamp: Sun Oct 09 17:59:38 UTC 2016, active: 1	2016-10-09 17:59:38.911+00	345
4913	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-10-10 16:45:16.576+00	345
4918	[INFO] Organisation mit der id 36 gespeichert. organisationId: 36, name: Essen und Leben, comment: , updateTimestamp: Mon Oct 10 20:24:48 UTC 2016, active: 1	2016-10-10 20:24:48.607+00	252
4919	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-11 07:58:18.304+00	252
4903	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-09 15:31:19.561+00	252
4904	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-09 15:40:35.608+00	252
4905	[INFO] Person mit der id 725 gespeichert. personId: 725, salutation: Frau , title: , firstName: Elisabeth , lastName: Hörl, comment: , updateTimestamp: 2016-10-09, active: 1	2016-10-09 15:41:39.514+00	252
4906	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-09 15:48:34.003+00	252
4907	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-09 16:02:08.732+00	519
4912	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-09 18:17:56.1+00	252
4914	[INFO] Organisation mit der id 284 gelöscht	2016-10-10 17:33:04.861+00	345
4915	[INFO] Organisation mit der id 278 gespeichert. organisationId: 278, name: Bankhaus Carl Spängler & Co. AG, comment: , updateTimestamp: Mon Oct 10 17:36:06 UTC 2016, active: 1	2016-10-10 17:36:06.533+00	345
4916	[INFO] Organisation mit der id 283 gelöscht	2016-10-10 17:36:16.572+00	345
4917	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-10 20:24:06.286+00	252
4920	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-11 07:58:24.255+00	252
4921	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-11 08:08:07.264+00	252
4922	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-11 08:09:11.748+00	252
4923	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-10-11 13:26:17.371+00	441
4924	[INFO] Person mit der id 386 gespeichert. personId: 386, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Pfaffenberger, comment: 24.02.2012, updateTimestamp: 2016-10-11, active: 1	2016-10-11 13:27:57.307+00	441
4925	[INFO] Person mit der id 386 gespeichert. personId: 386, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Pfaffenberger, comment: 24.02.2012, updateTimestamp: 2016-10-11, active: 1	2016-10-11 13:28:36.426+00	441
4926	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-12 12:53:47.452+00	252
4927	[INFO] Person mit der id 724 gespeichert. personId: 724, salutation: Herr KommR, title: , firstName: Heinrich , lastName: Spängler, comment: , updateTimestamp: 2016-10-12, active: 1	2016-10-12 12:57:44.154+00	252
4928	[INFO] Person mit der id 724 gespeichert. personId: 724, salutation: Herr KommR, title: , firstName: Heinrich , lastName: Spängler, comment: , updateTimestamp: 2016-10-12, active: 1	2016-10-12 12:57:56.845+00	252
4929	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-12 13:05:24.768+00	252
4930	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-12 13:20:58.272+00	252
4931	[INFO] Organisation mit der id 129 gespeichert. organisationId: 129, name: Palfinger AG, comment: Webseite Ja\nKontakt über Walter Riezinger, updateTimestamp: Wed Oct 12 13:22:21 UTC 2016, active: 1	2016-10-12 13:22:21.885+00	252
4932	[INFO] Organisation mit der id 91 gespeichert. organisationId: 91, name: Landwirtschaftskammer Salzburg, comment: , updateTimestamp: Wed Oct 12 13:23:09 UTC 2016, active: 1	2016-10-12 13:23:09.992+00	252
4933	[INFO] Organisation mit der id 91 gespeichert. organisationId: 91, name: Landwirtschaftskammer Salzburg, comment: , updateTimestamp: Wed Oct 12 13:23:16 UTC 2016, active: 1	2016-10-12 13:23:16.157+00	252
4934	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-12 13:25:39.197+00	252
4935	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-12 15:12:34.224+00	252
4936	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-12 15:13:29.586+00	252
4937	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-12 15:20:09.524+00	252
4938	[INFO] Person mit der id 726 gespeichert. personId: 726, salutation: Herr, title: Dr., firstName: Peter, lastName: Ransmayr, comment: , updateTimestamp: 2016-10-12, active: 1	2016-10-12 15:22:09.106+00	252
4939	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-12 15:22:32.237+00	252
4940	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-12 16:13:26.939+00	252
4941	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-12 16:14:12.393+00	252
4942	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-12 16:16:15.857+00	252
4943	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-10-12 16:23:28.559+00	345
4944	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-12 16:59:46.168+00	252
4945	[INFO] Person mit der id 375 gespeichert. personId: 375, salutation: Frau, title: , firstName: Gudrun, lastName: Ostermayer, comment: Vereinsaustritt 12. 10. 2016, updateTimestamp: 2016-10-12, active: 1	2016-10-12 17:00:54.515+00	252
4946	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-12 17:01:27.266+00	252
4947	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-13 06:19:25.613+00	252
4948	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-13 08:39:14.151+00	519
4949	[INFO] Person mit der id 692 gespeichert. personId: 692, salutation: Herr Landesrat, title: Dipl.-Ing. Dr., firstName: Josef, lastName: Schwaiger, comment: , updateTimestamp: 2016-10-13, active: 1	2016-10-13 08:45:25.903+00	519
4950	[INFO] Person mit der id 489 gelöscht	2016-10-13 08:45:38.235+00	519
4951	[INFO] Organisation mit der id 143 gespeichert. organisationId: 143, name: Raiffeisenverband Salzburg, comment: , updateTimestamp: Thu Oct 13 08:46:29 UTC 2016, active: 1	2016-10-13 08:46:29.847+00	519
4952	[INFO] Person mit der id 141 gespeichert. personId: 141, salutation: Frau, title: , firstName: Silvia, lastName: Gmachl, comment: 18.05.2010, updateTimestamp: 2016-10-13, active: 1	2016-10-13 08:47:00.384+00	519
4953	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-18 07:37:10.386+00	519
4954	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-18 08:27:44.455+00	252
4955	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-18 16:58:13.902+00	252
4956	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-19 14:13:43.926+00	252
4957	[INFO] Person mit der id 408 gespeichert. personId: 408, salutation: Frau, title: , firstName: Elena, lastName: Proksch, comment: , updateTimestamp: 2016-10-19, active: 1	2016-10-19 14:14:33.18+00	252
4958	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-19 14:14:57.001+00	252
4959	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-19 16:32:15.465+00	519
4960	[INFO] Person mit der id 591 gespeichert. personId: 591, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler (Wittich), comment: Tätigkeit: Waren, updateTimestamp: 2016-10-19, active: 1	2016-10-19 17:46:52.188+00	519
4961	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-20 06:49:18.622+00	252
4962	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-20 06:50:29.635+00	252
4963	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-20 08:07:55.048+00	519
4964	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-10-20 08:26:15.469+00	519
4965	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-20 14:42:59.203+00	252
4966	[INFO] Organisation mit der id 235 gespeichert. organisationId: 235, name: Kuratorium für Journalistenausbildung, comment: , updateTimestamp: Thu Oct 20 14:43:56 UTC 2016, active: 1	2016-10-20 14:43:56.676+00	252
4967	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-10-20 16:08:52.741+00	345
4968	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-21 07:51:05.894+00	519
4969	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-21 21:41:12.056+00	252
4993	[INFO] Organisation mit der id 77 gelöscht	2016-11-12 17:42:55.984+00	345
4998	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-13 21:06:01.896+00	252
4970	[INFO] Organisation mit der id 213 gespeichert. organisationId: 213, name: Wärmestube, comment: HFA ok, updateTimestamp: Fri Oct 21 21:47:51 UTC 2016, active: 1	2016-10-21 21:47:51.904+00	252
4971	[INFO] Organisation mit der id 213 gespeichert. organisationId: 213, name: Wärmestube, comment: HFA ok, updateTimestamp: Fri Oct 21 21:47:55 UTC 2016, active: 1	2016-10-21 21:47:55.63+00	252
4972	[INFO] Person mit der id 391 gespeichert. personId: 391, salutation: Herr, title: , firstName: Edi, lastName: Pichlmaier, comment: , updateTimestamp: 2016-10-21, active: 1	2016-10-21 21:48:35.093+00	252
4973	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-21 21:49:19.431+00	252
4974	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-22 08:30:40.666+00	252
4980	[INFO] Organisation mit der id 164 gespeichert. organisationId: 164, name: SalzburgMilch GmbH, comment: Webseite Ja, updateTimestamp: Mon Oct 24 12:22:56 UTC 2016, active: 1	2016-10-24 12:22:56.732+00	252
4981	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-24 12:23:30.851+00	252
4982	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-27 15:02:19.554+00	519
4991	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-11 10:05:00.532+00	252
4992	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-11-12 17:41:35.333+00	345
4975	[INFO] Person mit der id 148 gespeichert. personId: 148, salutation: Frau, title: , firstName: Marijana , lastName: Barisic, Bakk.Phil., comment: Newsletter: ja, 24.06.2013, hieß früher: Grabovac, updateTimestamp: 2016-10-22, active: 1	2016-10-22 08:31:57.03+00	252
4976	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-22 08:32:30.033+00	252
4977	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-23 21:38:24.172+00	252
4978	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-10-23 21:44:34.124+00	252
4979	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-10-24 12:22:18.053+00	252
4983	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-10-28 15:59:28.048+00	519
4984	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-04 17:36:43.524+00	252
4985	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-07 14:38:19.191+00	252
4986	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-07 14:40:01.526+00	252
4987	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-11-07 15:05:12.512+00	519
4988	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-10 15:25:21.434+00	252
4989	[INFO] Organisation mit der id 156 gespeichert. organisationId: 156, name: Salzburg Patisserie GmbH, comment: Webseite Ja, updateTimestamp: Thu Nov 10 15:28:08 UTC 2016, active: 1	2016-11-10 15:28:08.65+00	252
4990	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-11 10:02:49.948+00	252
4994	[INFO] Person mit der id 162 gelöscht	2016-11-12 17:43:22.28+00	345
4995	[INFO] Person mit der id 190 gelöscht	2016-11-12 17:44:03.221+00	345
4996	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-11-12 17:48:28.048+00	345
4997	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-13 21:02:24.418+00	252
4999	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-16 13:51:50.946+00	252
5000	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-16 14:03:14.708+00	252
5001	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-16 16:41:23.666+00	252
5002	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-16 16:42:18.672+00	252
5003	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-11-19 14:32:59.285+00	253
5004	[INFO] Person mit der id 727 gespeichert. personId: 727, salutation: Herr, title: Prim. Univ.Prof. Dr., firstName: Wolfgang, lastName: Sperl, comment: , updateTimestamp: 2016-11-19, active: 1	2016-11-19 14:35:45.748+00	253
5005	[INFO] Person mit der id 509 gelöscht	2016-11-19 14:36:16.906+00	253
5006	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-19 14:40:53.502+00	253
5007	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-11-23 10:42:50.411+00	519
5008	[INFO] Person mit der id 728 gespeichert. personId: 728, salutation: Herr, title: , firstName: Reinhard, lastName: Pribil, comment: Newsletter ja, updateTimestamp: 2016-11-23, active: 1	2016-11-23 10:45:37.335+00	519
5009	[INFO] Person mit der id 728 gespeichert. personId: 728, salutation: Herr, title: , firstName: Reinhard, lastName: Pribil, comment: Newsletter ja, Mitglied seit 22.11.2016, updateTimestamp: 2016-11-23, active: 1	2016-11-23 10:46:57.065+00	519
5010	[INFO] Person mit der id 728 gespeichert. personId: 728, salutation: Herr, title: , firstName: Reinhard, lastName: Pribil, comment: Newsletter: ja, Mitglied seit 22.11.2016, updateTimestamp: 2016-11-23, active: 1	2016-11-23 10:47:39.132+00	519
5011	[INFO] Person mit der id 728 gespeichert. personId: 728, salutation: Herr, title: , firstName: Reinhard, lastName: Pribil, comment: Newsletter: ja, 22.11.2016, updateTimestamp: 2016-11-23, active: 1	2016-11-23 10:48:07.654+00	519
5012	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-11-23 10:48:16.848+00	519
5013	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-23 12:00:53.712+00	252
5014	[INFO] Person mit der id 729 gespeichert. personId: 729, salutation: Frau, title: , firstName: Regina, lastName: Steinhagen , comment: , updateTimestamp: 2016-11-23, active: 1	2016-11-23 12:02:33.068+00	252
5015	[INFO] Person mit der id 729 gespeichert. personId: 729, salutation: Frau, title: , firstName: Regina, lastName: Steinhagen , comment: , updateTimestamp: 2016-11-23, active: 1	2016-11-23 12:03:12.54+00	252
5016	[INFO] Organisation mit der id 129 gespeichert. organisationId: 129, name: Palfinger AG, comment: Webseite Ja\nKontakt über Walter Riezinger, updateTimestamp: Wed Nov 23 12:04:09 UTC 2016, active: 1	2016-11-23 12:04:09.403+00	252
5017	[INFO] Organisation mit der id 129 gespeichert. organisationId: 129, name: Palfinger AG, comment: Webseite Ja\nKontakt über Walter Riezinger, updateTimestamp: Wed Nov 23 12:04:13 UTC 2016, active: 1	2016-11-23 12:04:13.103+00	252
5018	[INFO] Person mit der id 729 gespeichert. personId: 729, salutation: Frau, title: , firstName: Regina, lastName: Steinhagen , comment: , updateTimestamp: 2016-11-23, active: 1	2016-11-23 12:05:22.911+00	252
5019	[INFO] Person mit der id 729 gespeichert. personId: 729, salutation: Frau, title: , firstName: Regina, lastName: Steinhagen , comment: , updateTimestamp: 2016-11-23, active: 1	2016-11-23 12:05:26.807+00	252
5020	[INFO] Person mit der id 729 gespeichert. personId: 729, salutation: Frau, title: , firstName: Regina, lastName: Steinhagen , comment: , updateTimestamp: 2016-11-23, active: 1	2016-11-23 12:06:15.554+00	252
5021	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-23 12:06:24.851+00	252
5022	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-11-23 17:45:09.873+00	345
5023	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-24 17:16:21.911+00	252
5024	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-24 17:17:43.456+00	252
5025	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-11-26 08:16:05.659+00	441
5026	[INFO] Person mit der id 591 gelöscht	2016-11-26 08:17:04.51+00	441
5027	[INFO] Person mit der id 730 gespeichert. personId: 730, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler, comment: , updateTimestamp: 2016-11-26, active: 1	2016-11-26 08:18:54.398+00	441
5028	[INFO] Person mit der id 730 gelöscht	2016-11-26 08:19:25.329+00	441
5029	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2016-11-26 08:22:37.226+00	441
5030	[INFO] Person mit der id 731 gespeichert. personId: 731, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler, comment: , updateTimestamp: 2016-11-26, active: 1	2016-11-26 08:23:27.859+00	441
5031	[INFO] Person mit der id 731 gespeichert. personId: 731, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler, comment: , updateTimestamp: 2016-11-26, active: 1	2016-11-26 08:24:26.37+00	441
5032	[INFO] Person mit der id 731 gespeichert. personId: 731, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler, comment: , updateTimestamp: 2016-11-26, active: 1	2016-11-26 08:25:09.168+00	441
5033	[INFO] Person mit der id 731 gespeichert. personId: 731, salutation: Frau, title: , firstName: Elisabeth, lastName: Apfelthaler, comment: , updateTimestamp: 2016-11-26, active: 1	2016-11-26 08:25:35.519+00	441
5034	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-11-28 15:06:15.837+00	252
5035	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-11-28 15:06:58.788+00	252
5036	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-12-01 09:33:40.116+00	519
5037	[INFO] Organisation mit der id 91 gespeichert. organisationId: 91, name: Landwirtschaftskammer Salzburg, comment: , updateTimestamp: Thu Dec 01 09:38:43 UTC 2016, active: 1	2016-12-01 09:38:43.525+00	519
5038	[INFO] Person mit der id 86 gespeichert. personId: 86, salutation: Herr, title: Ing., firstName: Wolfgang, lastName: Dürnberger, comment: , updateTimestamp: 2016-12-01, active: 1	2016-12-01 09:53:43.896+00	519
5039	[INFO] Organisation mit der id 121 gespeichert. organisationId: 121, name: Neustart Saftladen, comment: HFA ok, updateTimestamp: Thu Dec 01 09:56:08 UTC 2016, active: 1	2016-12-01 09:56:08.846+00	519
5040	[INFO] Person mit der id 326 gelöscht	2016-12-01 09:56:24.165+00	519
5041	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-03 12:40:58.91+00	252
5042	[INFO] Person mit der id 44 gespeichert. personId: 44, salutation: Frau, title: , firstName: Anita, lastName: Bernhofer, comment: Tätigkeit: Administration, updateTimestamp: 2016-12-03, active: 1	2016-12-03 12:41:55.961+00	252
5043	[INFO] Person mit der id 519 gespeichert. personId: 519, salutation: Herr, title: , firstName: Michael, lastName: Steingaßner, comment: Tätigkeit: Administration, updateTimestamp: 2016-12-03, active: 1	2016-12-03 12:44:30.403+00	252
5044	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-03 12:45:32.284+00	252
5045	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-12-03 16:59:48.031+00	519
5046	[INFO] Person mit der id 259 gelöscht	2016-12-03 17:00:03.978+00	519
5047	[INFO] Person mit der id 485 gelöscht	2016-12-03 17:01:36.898+00	519
5048	[INFO] Person mit der id 537 gelöscht	2016-12-03 17:02:12.952+00	519
5049	[INFO] Person mit der id 288 gelöscht	2016-12-03 17:02:22.225+00	519
5050	[INFO] Person mit der id 366 gelöscht	2016-12-03 17:02:36.854+00	519
5051	[INFO] Person mit der id 593 gelöscht	2016-12-03 17:02:49.452+00	519
5052	[INFO] Person mit der id 264 gelöscht	2016-12-03 17:03:21.528+00	519
5053	[INFO] Person mit der id 226 gelöscht	2016-12-03 17:03:55.527+00	519
5054	[INFO] Organisation mit der id 104 gespeichert. organisationId: 104, name: Logwin Road + Rail Austria Gmbh, comment: , updateTimestamp: Sat Dec 03 17:05:12 UTC 2016, active: 1	2016-12-03 17:05:12.034+00	519
5055	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-12-03 19:56:55.457+00	519
5056	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2016-12-03 20:01:26.754+00	519
5057	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-12-03 20:45:44.9+00	519
5058	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-04 18:34:02.512+00	252
5059	[INFO] Person mit der id 732 gespeichert. personId: 732, salutation: Frau, title: Mag., firstName: Astrid , lastName: Grabner, comment: Akademisches Gymnasium, updateTimestamp: 2016-12-04, active: 1	2016-12-04 18:37:42.146+00	252
5060	[INFO] Person mit der id 733 gespeichert. personId: 733, salutation: Frau, title: Mag., firstName: Astrid , lastName: Grabner, comment: Akademisches Gymnasium, updateTimestamp: 2016-12-04, active: 1	2016-12-04 18:37:46.06+00	252
5061	[INFO] Person mit der id 732 gelöscht	2016-12-04 18:38:22.958+00	252
5062	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-04 18:39:03.506+00	252
5063	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2016-12-05 16:50:38.326+00	345
5064	[INFO] Person mit der id 179 gelöscht	2016-12-05 16:51:11.399+00	345
5065	[INFO] doina.moldovan@view-salzburg.at hat sich abgemeldet	2016-12-05 17:03:52.978+00	345
5066	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-12-12 06:51:29.46+00	253
5067	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-12 06:52:16.207+00	253
5068	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2016-12-12 19:23:20.843+00	519
5069	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-13 08:55:57.9+00	252
5070	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-17 10:22:45.195+00	252
5071	[INFO] Person mit der id 729 gespeichert. personId: 729, salutation: Frau, title: , firstName: Regina, lastName: Steinhagen , comment: , updateTimestamp: 2016-12-17, active: 1	2016-12-17 10:23:25.719+00	252
5072	[INFO] Person mit der id 729 gespeichert. personId: 729, salutation: Frau, title: , firstName: Regina, lastName: Steinhagen , comment: , updateTimestamp: 2016-12-17, active: 1	2016-12-17 10:23:34.535+00	252
5073	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: nicht mehr Mitglied seit 16. 12. 2016, updateTimestamp: 2016-12-17, active: 1	2016-12-17 10:24:50.602+00	252
5074	[INFO] Person mit der id 18 gespeichert. personId: 18, salutation: Frau, title: , firstName: Ruth, lastName: Amon, comment: nicht mehr Mitglied seit 16. 12. 2016, updateTimestamp: 2016-12-17, active: 1	2016-12-17 10:24:57.411+00	252
5075	[INFO] Person mit der id 424 gespeichert. personId: 424, salutation: Herr, title: Dr., firstName: Roland, lastName: Reichl, comment: 05.01.2013, updateTimestamp: 2016-12-17, active: 1	2016-12-17 10:26:04.848+00	252
5076	[INFO] conny_robl@yahoo.de hat sich angemeldet	2016-12-18 22:14:45.705+00	446
5077	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2016-12-21 11:14:17.817+00	253
5078	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: DI, firstName: Albert, lastName: Kiefel, comment: Tätigkeit: Administration, updateTimestamp: 2016-02-04, active: 1	2016-12-21 11:15:19.425+00	253
5079	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-21 11:16:02.361+00	253
5080	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-21 15:37:30.061+00	252
5081	[INFO] Person mit der id 728 gespeichert. personId: 728, salutation: Herr, title: , firstName: Reinhard, lastName: Pribil, comment: Newsletter: ja, 22.11.2016, updateTimestamp: 2016-12-21, active: 1	2016-12-21 15:44:06.662+00	252
5082	[INFO] Person mit der id 728 gespeichert. personId: 728, salutation: Herr, title: , firstName: Reinhard, lastName: Pribil, comment: Newsletter: ja, 22.11.2016, updateTimestamp: 2016-12-21, active: 1	2016-12-21 15:44:11.262+00	252
5083	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: 15.01.2013, updateTimestamp: 2016-12-21, active: 1	2016-12-21 15:46:42.013+00	252
5084	[INFO] Person mit der id 238 gespeichert. personId: 238, salutation: Frau, title: Mag., firstName: Bärbel, lastName: Januschewsky, comment: 15.01.2013, updateTimestamp: 2016-12-21, active: 1	2016-12-21 15:46:48.617+00	252
5085	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-29 10:50:51.187+00	252
5086	[INFO] Organisation mit der id 129 gespeichert. organisationId: 129, name: Palfinger AG, comment: Webseite Ja\nKontakt über Walter Riezinger, updateTimestamp: Thu Dec 29 10:52:25 UTC 2016, active: 1	2016-12-29 10:52:25.269+00	252
5087	[INFO] Organisation mit der id 129 gespeichert. organisationId: 129, name: Palfinger AG, comment: Webseite Ja\nKontakt über Walter Riezinger, updateTimestamp: Thu Dec 29 10:52:36 UTC 2016, active: 1	2016-12-29 10:52:36.11+00	252
5088	[INFO] Organisation mit der id 129 gespeichert. organisationId: 129, name: Palfinger AG, comment: Webseite Ja\nKontakt über Walter Riezinger, updateTimestamp: Thu Dec 29 10:52:36 UTC 2016, active: 1	2016-12-29 10:52:36.442+00	252
5089	[INFO] Organisation mit der id 155 gespeichert. organisationId: 155, name: Salzburg AG, comment: , updateTimestamp: Thu Dec 29 10:54:00 UTC 2016, active: 1	2016-12-29 10:54:00.477+00	252
5090	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-29 10:54:21.262+00	252
5091	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-30 10:27:43.642+00	252
5092	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-30 10:31:05.792+00	252
5093	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-30 11:08:42.222+00	252
5108	[INFO] Person mit der id 75 gespeichert. personId: 75, salutation: Herr, title: , firstName: Günther, lastName: Derler, comment: 17.04.2013, updateTimestamp: 2016-12-30, active: 1	2016-12-30 15:55:14.489+00	252
5109	[INFO] Person mit der id 75 gespeichert. personId: 75, salutation: Herr, title: , firstName: Günther, lastName: Derler, comment: 17.04.2013, updateTimestamp: 2016-12-30, active: 1	2016-12-30 15:55:19.806+00	252
5110	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-30 15:57:52.193+00	252
5111	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-30 17:48:12.701+00	252
5116	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-01-01 22:29:51.801+00	252
5117	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-02 10:22:17.945+00	252
5120	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-01-02 15:31:21.675+00	252
5121	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-03 09:06:39.539+00	252
5130	[INFO] Warenausgang mit der id 799 gespeichert	2017-01-03 16:59:40.225+00	602
5158	[INFO] Wareneingang mit der id 341 gespeichert	2017-01-03 17:18:47.861+00	602
5159	[INFO] Wareneingang mit der id 341 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:18:52.878+00	602
5160	[INFO] Warenausgang mit der id 807 gespeichert	2017-01-03 17:19:34.017+00	602
5166	[INFO] Warenausgang mit der id 808 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:24:04.804+00	602
5176	[INFO] Warenausgang mit der id 813 gespeichert	2017-01-03 17:31:09.505+00	602
5177	[INFO] Warenausgang mit der id 810 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:31:46.301+00	602
5178	[INFO] Warenausgang mit der id 811 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:31:50.809+00	602
5179	[INFO] Warenausgang mit der id 813 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:31:55.285+00	602
5180	[INFO] Warenausgang mit der id 812 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:31:59.364+00	602
5181	[INFO] Wareneingang mit der id 345 gespeichert	2017-01-03 17:32:48.693+00	602
5182	[INFO] Wareneingang mit der id 345 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:32:54.234+00	602
5183	[INFO] Warenausgang mit der id 814 gespeichert	2017-01-03 17:33:32.77+00	602
5184	[INFO] Warenausgang mit der id 814 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:34:05.775+00	602
5187	[INFO] Wareneingang mit der id 348 gespeichert	2017-01-03 17:37:57.253+00	602
5188	[INFO] Wareneingang mit der id 346 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:38:04.257+00	602
5189	[INFO] Wareneingang mit der id 348 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:38:11.061+00	602
5190	[INFO] Wareneingang mit der id 347 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:38:15.508+00	602
5191	[INFO] Warenausgang mit der id 815 gespeichert	2017-01-03 17:38:46.93+00	602
5193	[INFO] Warenausgang mit der id 817 gespeichert	2017-01-03 17:39:51.705+00	602
5194	[INFO] Warenausgang mit der id 815 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:40:03.994+00	602
5195	[INFO] Warenausgang mit der id 817 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:40:08.421+00	602
5196	[INFO] Warenausgang mit der id 816 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:40:14.284+00	602
5197	[INFO] Warenausgang mit der id 818 gespeichert	2017-01-03 17:41:01.101+00	602
5198	[INFO] Warenausgang mit der id 818 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:41:54.069+00	602
5211	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-13 08:36:08.871+00	252
5094	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-30 11:17:29.264+00	252
5095	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-30 12:09:41.278+00	252
5096	[INFO] Person mit der id 51 gespeichert. personId: 51, salutation: Frau, title: , firstName: Brigitte, lastName: Borbely, comment: 02.11.2009, updateTimestamp: 2016-12-30, active: 1	2016-12-30 12:10:53.869+00	252
5097	[INFO] Person mit der id 51 gespeichert. personId: 51, salutation: Frau, title: , firstName: Brigitte, lastName: Borbely, comment: 02.11.2009, updateTimestamp: 2016-12-30, active: 1	2016-12-30 12:10:59.182+00	252
5098	[INFO] Person mit der id 350 gespeichert. personId: 350, salutation: Herr, title: , firstName: Michael, lastName: Mrazek, comment: Newsletter: nein, 04.12.2013, updateTimestamp: 2016-12-30, active: 1	2016-12-30 12:14:10.235+00	252
5099	[INFO] Person mit der id 350 gespeichert. personId: 350, salutation: Herr, title: , firstName: Michael, lastName: Mrazek, comment: Newsletter: nein, 04.12.2013, updateTimestamp: 2016-12-30, active: 1	2016-12-30 12:14:15.234+00	252
5100	[INFO] Person mit der id 363 gespeichert. personId: 363, salutation: Herr, title: Mag., firstName: Erwin, lastName: Niese, comment: 30.07.2010, updateTimestamp: 2016-12-30, active: 1	2016-12-30 12:17:19.839+00	252
5101	[INFO] Person mit der id 386 gespeichert. personId: 386, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Pfaffenberger, comment: 24.02.2012, updateTimestamp: 2016-12-30, active: 1	2016-12-30 12:18:28.235+00	252
5102	[INFO] Person mit der id 205 gespeichert. personId: 205, salutation: Frau, title: , firstName: Maria, lastName: Hintsteiner, comment: 20.11.2011, updateTimestamp: 2016-12-30, active: 1	2016-12-30 12:19:18.372+00	252
5103	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-30 12:20:11.921+00	252
5104	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-30 15:47:53.1+00	252
5105	[INFO] Person mit der id 673 gespeichert. personId: 673, salutation: Frau, title: Mag., firstName: Friederike, lastName: Hurch, comment: 02.04.2012, updateTimestamp: 2016-12-30, active: 1	2016-12-30 15:51:45.362+00	252
5106	[INFO] Person mit der id 673 gespeichert. personId: 673, salutation: Frau, title: Mag., firstName: Friederike, lastName: Hurch, comment: 02.04.2012, updateTimestamp: 2016-12-30, active: 1	2016-12-30 15:51:50.796+00	252
5107	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2016-12-30 15:54:26.171+00	252
5112	[INFO] Person mit der id 405 gespeichert. personId: 405, salutation: Herr, title: , firstName: Bruno, lastName: Prantl, comment: 19.01.2009, updateTimestamp: 2016-12-30, active: 1	2016-12-30 17:48:59.793+00	252
5113	[INFO] Person mit der id 405 gespeichert. personId: 405, salutation: Herr, title: , firstName: Bruno, lastName: Prantl, comment: 19.01.2009, updateTimestamp: 2016-12-30, active: 1	2016-12-30 17:49:05.442+00	252
5114	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2016-12-30 17:49:23.475+00	252
5115	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-01 22:28:22.63+00	252
5118	[INFO] Person mit der id 315 gespeichert. personId: 315, salutation: Frau, title: Mag., firstName: Elfriede, lastName: Mackinger, comment: 20.01.2009, updateTimestamp: 2017-01-02, active: 1	2017-01-02 10:24:09.638+00	252
5119	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-02 15:10:49.267+00	252
5122	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-01-03 09:07:13.099+00	252
5123	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2017-01-03 16:43:23.773+00	602
5131	[INFO] Warenausgang mit der id 799 auf Archivierungsstatus 1 gesetzt	2017-01-03 16:59:49.62+00	602
5138	[INFO] Wareneingang mit der id 336 gespeichert	2017-01-03 17:06:54.387+00	602
5139	[INFO] Wareneingang mit der id 336 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:07:06.583+00	602
5148	[INFO] Wareneingang mit der id 340 gespeichert	2017-01-03 17:13:56.621+00	602
5149	[INFO] Wareneingang mit der id 340 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:14:05.706+00	602
5150	[INFO] Wareneingang mit der id 339 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:14:15.433+00	602
5151	[INFO] Wareneingang mit der id 338 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:14:20.077+00	602
5152	[INFO] Warenausgang mit der id 804 gespeichert	2017-01-03 17:15:46.99+00	602
5167	[INFO] Wareneingang mit der id 343 gespeichert	2017-01-03 17:25:19.391+00	602
5200	[INFO] Warenausgang mit der id 819 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:45:25.397+00	602
5202	[INFO] Warenausgang mit der id 820 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:47:12.425+00	602
5203	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2017-01-03 17:50:45.841+00	602
5204	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-04 09:25:54.235+00	252
5210	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-01-12 08:41:57.184+00	519
5212	[INFO] Person mit der id 315 gespeichert. personId: 315, salutation: Frau, title: Mag., firstName: Elfriede, lastName: Mackinger, comment: 20.01.2009, updateTimestamp: 2017-01-13, active: 1	2017-01-13 08:40:36.907+00	252
5213	[INFO] Person mit der id 315 gespeichert. personId: 315, salutation: Frau, title: Mag., firstName: Elfriede, lastName: Mackinger, comment: 20.01.2009, updateTimestamp: 2017-01-13, active: 1	2017-01-13 08:40:45.396+00	252
5214	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-01-13 08:41:41.502+00	252
5215	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-01-13 14:24:41.181+00	519
5124	[INFO] Wareneingang mit der id 333 gespeichert	2017-01-03 16:55:27.733+00	602
5125	[INFO] Wareneingang mit der id 333 auf Archivierungsstatus 1 gesetzt	2017-01-03 16:55:48.314+00	602
5126	[INFO] Warenausgang mit der id 798 gespeichert	2017-01-03 16:56:52.168+00	602
5134	[INFO] Warenausgang mit der id 800 gespeichert	2017-01-03 17:03:08.041+00	602
5135	[INFO] Warenausgang mit der id 800 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:03:16.891+00	602
5136	[INFO] Warenausgang mit der id 801 gespeichert	2017-01-03 17:04:12.899+00	602
5137	[INFO] Warenausgang mit der id 801 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:04:19.422+00	602
5143	[INFO] Wareneingang mit der id 337 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:09:21.985+00	602
5144	[INFO] Warenausgang mit der id 803 gespeichert	2017-01-03 17:09:52.288+00	602
5145	[INFO] Warenausgang mit der id 803 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:10:09.046+00	602
5146	[INFO] Wareneingang mit der id 338 gespeichert	2017-01-03 17:11:57.514+00	602
5157	[INFO] Warenausgang mit der id 806 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:17:20.126+00	602
5162	[INFO] Wareneingang mit der id 342 gespeichert	2017-01-03 17:21:29.489+00	602
5163	[INFO] Wareneingang mit der id 342 gespeichert	2017-01-03 17:23:02.711+00	602
5164	[INFO] Wareneingang mit der id 342 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:23:10.014+00	602
5168	[INFO] Wareneingang mit der id 343 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:25:32.732+00	602
5169	[INFO] Warenausgang mit der id 809 gespeichert	2017-01-03 17:26:02.843+00	602
5170	[INFO] Warenausgang mit der id 809 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:26:07.699+00	602
5171	[INFO] Wareneingang mit der id 344 gespeichert	2017-01-03 17:27:30.629+00	602
5172	[INFO] Wareneingang mit der id 344 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:27:36.337+00	602
5185	[INFO] Wareneingang mit der id 346 gespeichert	2017-01-03 17:36:23.877+00	602
5186	[INFO] Wareneingang mit der id 347 gespeichert	2017-01-03 17:37:12.984+00	602
5199	[INFO] Warenausgang mit der id 819 gespeichert	2017-01-03 17:44:30.789+00	602
5205	[INFO] Organisation mit der id 90 gespeichert. organisationId: 90, name: Land-Leben Nahrungsmittel GmbH, comment: Webseite Ja, updateTimestamp: Wed Jan 04 09:27:55 UTC 2017, active: 1	2017-01-04 09:27:55.118+00	252
5206	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-04 09:29:07.864+00	252
5207	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-01-04 09:31:45.688+00	252
5208	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-10 14:42:42.234+00	252
5209	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-01-11 18:21:31.071+00	519
5127	[INFO] Warenausgang mit der id 798 auf Archivierungsstatus 1 gesetzt	2017-01-03 16:57:01.466+00	602
5128	[INFO] Wareneingang mit der id 334 gespeichert	2017-01-03 16:58:55.184+00	602
5129	[INFO] Wareneingang mit der id 334 auf Archivierungsstatus 1 gesetzt	2017-01-03 16:59:01.861+00	602
5132	[INFO] Wareneingang mit der id 335 gespeichert	2017-01-03 17:02:07.053+00	602
5133	[INFO] Wareneingang mit der id 335 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:02:17.465+00	602
5140	[INFO] Warenausgang mit der id 802 gespeichert	2017-01-03 17:07:54.058+00	602
5141	[INFO] Warenausgang mit der id 802 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:08:00.022+00	602
5142	[INFO] Wareneingang mit der id 337 gespeichert	2017-01-03 17:09:16.028+00	602
5147	[INFO] Wareneingang mit der id 339 gespeichert	2017-01-03 17:12:42.021+00	602
5153	[INFO] Warenausgang mit der id 804 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:15:57.316+00	602
5154	[INFO] Warenausgang mit der id 805 gespeichert	2017-01-03 17:16:31.605+00	602
5155	[INFO] Warenausgang mit der id 805 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:16:38.538+00	602
5156	[INFO] Warenausgang mit der id 806 gespeichert	2017-01-03 17:17:15.217+00	602
5161	[INFO] Warenausgang mit der id 807 auf Archivierungsstatus 1 gesetzt	2017-01-03 17:19:44.35+00	602
5165	[INFO] Warenausgang mit der id 808 gespeichert	2017-01-03 17:23:58.06+00	602
5173	[INFO] Warenausgang mit der id 810 gespeichert	2017-01-03 17:28:14.109+00	602
5174	[INFO] Warenausgang mit der id 811 gespeichert	2017-01-03 17:28:50.009+00	602
5175	[INFO] Warenausgang mit der id 812 gespeichert	2017-01-03 17:30:02.539+00	602
5192	[INFO] Warenausgang mit der id 816 gespeichert	2017-01-03 17:39:20.277+00	602
5201	[INFO] Warenausgang mit der id 820 gespeichert	2017-01-03 17:47:05.313+00	602
5216	[INFO] Person mit der id 185 gespeichert. personId: 185, salutation: Frau, title: , firstName: Greta, lastName: Hauswiesner, comment: Tätigkeit: Admin.;Newsletter: ja, updateTimestamp: 2017-01-13, active: 1	2017-01-13 14:26:21.985+00	519
5217	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-01-16 23:00:21.645+00	252
5218	[INFO] Person mit der id 680 gespeichert. personId: 680, salutation: Frau, title: Mag., firstName: Christine , lastName: Mettler-Dornhofer, comment: , updateTimestamp: 2017-01-16, active: 1	2017-01-16 23:02:01.168+00	252
5219	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-01-16 23:02:10.761+00	252
5220	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2017-01-28 17:03:29.342+00	642
5221	[INFO] Wareneingang mit der id 349 gespeichert	2017-01-28 17:13:10.191+00	642
5222	[INFO] Warenausgang mit der id 821 gespeichert	2017-01-28 17:14:33.032+00	642
5223	[INFO] Warenausgang mit der id 822 gespeichert	2017-01-28 17:15:27.026+00	642
5224	[INFO] Warenausgang mit der id 823 gespeichert	2017-01-28 17:16:00.686+00	642
5225	[INFO] Warenausgang mit der id 821 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:16:14.853+00	642
5226	[INFO] Warenausgang mit der id 822 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:16:21.542+00	642
5227	[INFO] Warenausgang mit der id 823 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:16:26.778+00	642
5228	[INFO] Wareneingang mit der id 349 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:16:44.191+00	642
5229	[INFO] Wareneingang mit der id 350 gespeichert	2017-01-28 17:18:03.492+00	642
5230	[INFO] Warenausgang mit der id 824 gespeichert	2017-01-28 17:18:55.034+00	642
5231	[INFO] Warenausgang mit der id 825 gespeichert	2017-01-28 17:19:31.93+00	642
5232	[INFO] Warenausgang mit der id 824 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:19:53.194+00	642
5233	[INFO] Warenausgang mit der id 825 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:19:59.548+00	642
5234	[INFO] Wareneingang mit der id 350 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:20:23.044+00	642
5235	[INFO] Wareneingang mit der id 351 gespeichert	2017-01-28 17:24:14.124+00	642
5236	[INFO] Wareneingang mit der id 352 gespeichert	2017-01-28 17:24:59.749+00	642
5237	[INFO] Warenausgang mit der id 826 gespeichert	2017-01-28 17:25:42.174+00	642
5238	[INFO] Warenausgang mit der id 827 gespeichert	2017-01-28 17:26:14.046+00	642
5239	[INFO] Warenausgang mit der id 827 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:26:20.278+00	642
5240	[INFO] Warenausgang mit der id 826 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:26:25.495+00	642
5241	[INFO] Wareneingang mit der id 352 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:26:38.197+00	642
5242	[INFO] Wareneingang mit der id 351 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:26:45.603+00	642
5243	[INFO] Wareneingang mit der id 353 gespeichert	2017-01-28 17:27:23.49+00	642
5244	[INFO] Wareneingang mit der id 354 gespeichert	2017-01-28 17:27:59.594+00	642
5245	[INFO] Warenausgang mit der id 828 gespeichert	2017-01-28 17:28:35.879+00	642
5246	[INFO] Warenausgang mit der id 829 gespeichert	2017-01-28 17:29:11.438+00	642
5247	[INFO] Warenausgang mit der id 829 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:29:17.743+00	642
5248	[INFO] Warenausgang mit der id 828 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:29:24.428+00	642
5249	[INFO] Wareneingang mit der id 354 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:29:57.589+00	642
5250	[INFO] Wareneingang mit der id 353 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:30:01.034+00	642
5251	[INFO] Wareneingang mit der id 355 gespeichert	2017-01-28 17:30:36.526+00	642
5252	[INFO] Wareneingang mit der id 356 gespeichert	2017-01-28 17:31:06.509+00	642
5253	[INFO] Warenausgang mit der id 830 gespeichert	2017-01-28 17:31:45.523+00	642
5254	[INFO] Warenausgang mit der id 831 gespeichert	2017-01-28 17:32:14.58+00	642
5255	[INFO] Warenausgang mit der id 830 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:32:25.114+00	642
5256	[INFO] Warenausgang mit der id 831 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:32:30.355+00	642
5257	[INFO] Wareneingang mit der id 355 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:32:41.768+00	642
5258	[INFO] Wareneingang mit der id 356 gespeichert	2017-01-28 17:33:05.038+00	642
5259	[INFO] Wareneingang mit der id 356 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:33:12.698+00	642
5260	[INFO] Wareneingang mit der id 357 gespeichert	2017-01-28 17:33:50.799+00	642
5261	[INFO] Wareneingang mit der id 358 gespeichert	2017-01-28 17:34:36.864+00	642
5262	[INFO] Warenausgang mit der id 832 gespeichert	2017-01-28 17:35:22.982+00	642
5263	[INFO] Warenausgang mit der id 833 gespeichert	2017-01-28 17:35:49.154+00	642
5264	[INFO] Warenausgang mit der id 832 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:36:02.539+00	642
5265	[INFO] Warenausgang mit der id 833 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:36:07.775+00	642
5266	[INFO] Wareneingang mit der id 357 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:36:20.343+00	642
5267	[INFO] Wareneingang mit der id 358 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:36:25.88+00	642
5274	[INFO] Wareneingang mit der id 352 gespeichert	2017-01-28 17:40:53.563+00	642
5282	[INFO] Wareneingang mit der id 359 gespeichert	2017-01-28 17:46:14.539+00	642
5294	[INFO] Warenausgang mit der id 839 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:53:59.819+00	642
5295	[INFO] Warenausgang mit der id 838 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:54:14.011+00	642
5296	[INFO] Wareneingang mit der id 362 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:55:24.511+00	642
5297	[INFO] Wareneingang mit der id 361 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:55:31.984+00	642
5300	[INFO] Warenausgang mit der id 840 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:57:56.855+00	642
5301	[INFO] Wareneingang mit der id 363 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:02:19.723+00	642
5304	[INFO] Wareneingang mit der id 364 gespeichert	2017-01-28 18:07:28.944+00	642
5305	[INFO] Warenausgang mit der id 841 gespeichert	2017-01-28 18:08:05.863+00	642
5316	[INFO] Wareneingang mit der id 366 gespeichert	2017-01-28 18:38:18.108+00	642
5317	[INFO] Wareneingang mit der id 366 gespeichert	2017-01-28 18:46:51.501+00	642
5318	[INFO] Warenausgang mit der id 846 gespeichert	2017-01-28 18:48:24.805+00	642
5319	[INFO] Warenausgang mit der id 847 gespeichert	2017-01-28 18:49:30.45+00	642
5320	[INFO] Warenausgang mit der id 846 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:49:49.631+00	642
5321	[INFO] Warenausgang mit der id 848 gespeichert	2017-01-28 18:50:45.24+00	642
5331	[INFO] Wareneingang mit der id 367 gespeichert	2017-01-28 19:01:06.344+00	642
5332	[INFO] Warenausgang mit der id 851 gespeichert	2017-01-28 19:02:00.967+00	642
5333	[INFO] Warenausgang mit der id 851 auf Archivierungsstatus 1 gesetzt	2017-01-28 19:02:10.565+00	642
5334	[INFO] Warenausgang mit der id 852 gespeichert	2017-01-28 19:02:37.87+00	642
5335	[INFO] Warenausgang mit der id 852 auf Archivierungsstatus 1 gesetzt	2017-01-28 19:02:52.87+00	642
5336	[INFO] Warenausgang mit der id 853 gespeichert	2017-01-28 19:04:28.522+00	642
5337	[INFO] Warenausgang mit der id 853 auf Archivierungsstatus 1 gesetzt	2017-01-28 19:04:50.32+00	642
5338	[INFO] Warenausgang mit der id 854 gespeichert	2017-01-28 19:05:17.71+00	642
5339	[INFO] Wareneingang mit der id 367 auf Archivierungsstatus 1 gesetzt	2017-01-28 19:05:55.64+00	642
5340	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2017-01-28 19:07:14.881+00	642
5268	[INFO] Wareneingang mit der id 352 auf Archivierungsstatus 0 gesetzt	2017-01-28 17:37:34.519+00	642
5269	[INFO] Wareneingang mit der id 353 auf Archivierungsstatus 0 gesetzt	2017-01-28 17:38:04.408+00	642
5276	[INFO] Warenausgang mit der id 834 gespeichert	2017-01-28 17:42:10.797+00	642
5278	[INFO] Warenausgang mit der id 835 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:42:53.148+00	642
5279	[INFO] Warenausgang mit der id 834 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:42:58.377+00	642
5280	[INFO] Wareneingang mit der id 353 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:43:12.095+00	642
5281	[INFO] Wareneingang mit der id 352 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:43:31.129+00	642
5283	[INFO] Warenausgang mit der id 836 gespeichert	2017-01-28 17:47:46.663+00	642
5284	[INFO] Warenausgang mit der id 836 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:47:53.743+00	642
5285	[INFO] Wareneingang mit der id 359 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:49:11.668+00	642
5286	[INFO] Wareneingang mit der id 360 gespeichert	2017-01-28 17:49:47.063+00	642
5287	[INFO] Warenausgang mit der id 837 gespeichert	2017-01-28 17:50:58.427+00	642
5288	[INFO] Warenausgang mit der id 837 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:51:15.379+00	642
5289	[INFO] Wareneingang mit der id 360 auf Archivierungsstatus 1 gesetzt	2017-01-28 17:51:39.746+00	642
5292	[INFO] Warenausgang mit der id 838 gespeichert	2017-01-28 17:53:21.331+00	642
5322	[INFO] Warenausgang mit der id 848 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:50:54.371+00	642
5270	[INFO] Warenausgang mit der id 828 auf Archivierungsstatus 0 gesetzt	2017-01-28 17:39:09.133+00	642
5271	[INFO] Warenausgang mit der id 827 auf Archivierungsstatus 0 gesetzt	2017-01-28 17:39:35.293+00	642
5277	[INFO] Warenausgang mit der id 835 gespeichert	2017-01-28 17:42:46.506+00	642
5293	[INFO] Warenausgang mit der id 839 gespeichert	2017-01-28 17:53:47.175+00	642
5298	[INFO] Wareneingang mit der id 363 gespeichert	2017-01-28 17:57:05.463+00	642
5299	[INFO] Warenausgang mit der id 840 gespeichert	2017-01-28 17:57:48.679+00	642
5302	[INFO] Wareneingang mit der id 364 gespeichert	2017-01-28 18:04:03.564+00	642
5303	[INFO] Wareneingang mit der id 364 gespeichert	2017-01-28 18:05:01.605+00	642
5306	[INFO] Warenausgang mit der id 842 gespeichert	2017-01-28 18:08:37.052+00	642
5307	[INFO] Warenausgang mit der id 843 gespeichert	2017-01-28 18:09:04.879+00	642
5308	[INFO] Warenausgang mit der id 844 gespeichert	2017-01-28 18:10:19.279+00	642
5309	[INFO] Warenausgang mit der id 845 gespeichert	2017-01-28 18:11:00.509+00	642
5310	[INFO] Warenausgang mit der id 841 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:11:09.684+00	642
5311	[INFO] Warenausgang mit der id 842 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:11:15.983+00	642
5312	[INFO] Warenausgang mit der id 843 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:11:31.983+00	642
5313	[INFO] Warenausgang mit der id 844 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:11:38.712+00	642
5314	[INFO] Organisation mit der id 285 gespeichert. organisationId: 285, name: Waldbad Anif, comment: , updateTimestamp: Sat Jan 28 18:22:28 UTC 2017, active: 1	2017-01-28 18:22:28.624+00	642
5315	[INFO] Wareneingang mit der id 365 gespeichert	2017-01-28 18:25:30.826+00	642
5272	[INFO] Warenausgang mit der id 828 gelöscht	2017-01-28 17:40:22.598+00	642
5273	[INFO] Warenausgang mit der id 827 gelöscht	2017-01-28 17:40:29.768+00	642
5275	[INFO] Wareneingang mit der id 353 gespeichert	2017-01-28 17:41:25.852+00	642
5290	[INFO] Wareneingang mit der id 361 gespeichert	2017-01-28 17:52:21.219+00	642
5291	[INFO] Wareneingang mit der id 362 gespeichert	2017-01-28 17:52:50.253+00	642
5323	[INFO] Warenausgang mit der id 849 gespeichert	2017-01-28 18:51:45.635+00	642
5324	[INFO] Warenausgang mit der id 849 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:51:53.93+00	642
5325	[INFO] Warenausgang mit der id 850 gespeichert	2017-01-28 18:52:27.794+00	642
5326	[INFO] Warenausgang mit der id 850 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:52:57.459+00	642
5327	[INFO] Wareneingang mit der id 365 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:53:19.647+00	642
5328	[INFO] Wareneingang mit der id 366 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:53:25.69+00	642
5329	[INFO] Wareneingang mit der id 364 auf Archivierungsstatus 1 gesetzt	2017-01-28 18:53:33.76+00	642
5330	[INFO] Organisation mit der id 286 gespeichert. organisationId: 286, name: Brezelbäckerei Ditsch, comment: , updateTimestamp: Sat Jan 28 18:58:20 UTC 2017, active: 1	2017-01-28 18:58:20.471+00	642
5341	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-01-31 09:14:51.571+00	519
5342	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-02-01 08:09:46.814+00	252
5343	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-01 08:16:13.919+00	252
5344	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2017-02-01 12:03:26.566+00	602
5345	[INFO] Wareneingang mit der id 368 gespeichert	2017-02-01 12:13:34.922+00	602
5346	[INFO] Wareneingang mit der id 369 gespeichert	2017-02-01 12:17:58.816+00	602
5347	[INFO] Wareneingang mit der id 370 gespeichert	2017-02-01 12:31:55.308+00	602
5348	[INFO] Warenausgang mit der id 855 gespeichert	2017-02-01 12:34:28.14+00	602
5349	[INFO] Warenausgang mit der id 855 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:34:48.49+00	602
5350	[INFO] Warenausgang mit der id 856 gespeichert	2017-02-01 12:35:35.199+00	602
5351	[INFO] Warenausgang mit der id 857 gespeichert	2017-02-01 12:36:15.54+00	602
5352	[INFO] Warenausgang mit der id 858 gespeichert	2017-02-01 12:37:04.426+00	602
5353	[INFO] Warenausgang mit der id 856 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:37:30.66+00	602
5354	[INFO] Warenausgang mit der id 857 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:37:37.815+00	602
5355	[INFO] Warenausgang mit der id 858 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:37:45.845+00	602
5356	[INFO] Warenausgang mit der id 859 gespeichert	2017-02-01 12:41:16.097+00	602
5357	[INFO] Warenausgang mit der id 859 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:41:28.1+00	602
5358	[INFO] Warenausgang mit der id 860 gespeichert	2017-02-01 12:42:41.781+00	602
5359	[INFO] Warenausgang mit der id 860 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:42:52.727+00	602
5360	[INFO] Warenausgang mit der id 861 gespeichert	2017-02-01 12:44:19.378+00	602
5361	[INFO] Warenausgang mit der id 861 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:44:38.444+00	602
5362	[INFO] Warenausgang mit der id 862 gespeichert	2017-02-01 12:45:19.708+00	602
5363	[INFO] Warenausgang mit der id 862 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:45:34.707+00	602
5364	[INFO] Warenausgang mit der id 863 gespeichert	2017-02-01 12:47:50.228+00	602
5365	[INFO] Warenausgang mit der id 864 gespeichert	2017-02-01 12:48:42.987+00	602
5366	[INFO] Warenausgang mit der id 864 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:48:52.735+00	602
5367	[INFO] Organisation mit der id 287 gespeichert. organisationId: 287, name: Baptistengemeinde Sbg, comment: , updateTimestamp: Wed Feb 01 12:51:45 UTC 2017, active: 1	2017-02-01 12:51:45.388+00	602
5368	[INFO] Organisation mit der id 288 gespeichert. organisationId: 288, name: Leichter leben Vertriebsgesellschaft, comment: , updateTimestamp: Wed Feb 01 12:52:48 UTC 2017, active: 1	2017-02-01 12:52:48.872+00	602
5369	[INFO] Wareneingang mit der id 368 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:53:23.656+00	602
5370	[INFO] Wareneingang mit der id 369 auf Archivierungsstatus 1 gesetzt	2017-02-01 12:53:36.867+00	602
5371	[INFO] Artikelverteilung für Artikel mit der Id 750 geändert	2017-02-01 12:54:32.065+00	602
5372	[INFO] Warenausgang mit der id 863 gespeichert	2017-02-01 12:55:09.831+00	602
5373	[INFO] Wareneingang mit der id 371 gespeichert	2017-02-01 12:57:22.4+00	602
5374	[INFO] Organisation mit der id 288 gespeichert. organisationId: 288, name: Leichter leben Vertriebsgesellschaft, comment: , updateTimestamp: Wed Feb 01 12:58:13 UTC 2017, active: 1	2017-02-01 12:58:13.658+00	602
5375	[INFO] Warenausgang mit der id 865 gespeichert	2017-02-01 13:01:27.344+00	602
5376	[INFO] Warenausgang mit der id 866 gespeichert	2017-02-01 13:05:39.902+00	602
5377	[INFO] Warenausgang mit der id 866 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:05:54.267+00	602
5378	[INFO] Warenausgang mit der id 867 gespeichert	2017-02-01 13:07:01.569+00	602
5379	[INFO] Warenausgang mit der id 867 gespeichert	2017-02-01 13:07:52.487+00	602
5380	[INFO] Warenausgang mit der id 867 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:08:11.233+00	602
5381	[INFO] Warenausgang mit der id 868 gespeichert	2017-02-01 13:08:51.688+00	602
5382	[INFO] Warenausgang mit der id 868 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:09:05.175+00	602
5383	[INFO] Warenausgang mit der id 869 gespeichert	2017-02-01 13:10:05.925+00	602
5384	[INFO] Warenausgang mit der id 869 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:10:30.601+00	602
5385	[INFO] Organisation mit der id 289 gespeichert. organisationId: 289, name: Freie Christengemeinde, comment: , updateTimestamp: Wed Feb 01 13:11:58 UTC 2017, active: 1	2017-02-01 13:11:58.62+00	602
5386	[INFO] Warenausgang mit der id 870 gespeichert	2017-02-01 13:12:54.591+00	602
5387	[INFO] Warenausgang mit der id 870 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:13:07.932+00	602
5388	[INFO] Wareneingang mit der id 372 gespeichert	2017-02-01 13:15:05.888+00	602
5389	[INFO] Wareneingang mit der id 372 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:15:15.544+00	602
5390	[INFO] Warenausgang mit der id 871 gespeichert	2017-02-01 13:16:06.911+00	602
5391	[INFO] Warenausgang mit der id 871 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:16:24.228+00	602
5392	[INFO] Warenausgang mit der id 872 gespeichert	2017-02-01 13:16:59.67+00	602
5393	[INFO] Warenausgang mit der id 872 auf Archivierungsstatus 1 gesetzt	2017-02-01 13:17:44.659+00	602
5394	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2017-02-01 13:22:21.856+00	602
5395	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-02-01 19:50:53.446+00	253
5405	[INFO] Wareneingang mit der id 374 gespeichert	2017-02-02 12:15:26.912+00	602
5396	[INFO] Person mit der id 734 gespeichert. personId: 734, salutation: Herr, title: Mag., firstName: Harald, lastName: Kratzer, comment: , updateTimestamp: 2017-02-01, active: 1	2017-02-01 19:54:56.044+00	253
5397	[INFO] Person mit der id 735 gespeichert. personId: 735, salutation: Frau, title: Mag., firstName: Verena, lastName: Grafinger, comment: , updateTimestamp: 2017-02-01, active: 1	2017-02-01 19:58:15.447+00	253
5398	[INFO] Person mit der id 736 gespeichert. personId: 736, salutation: Frau, title: Mag.a, firstName: Bettina, lastName: Ehrlich, comment: , updateTimestamp: 2017-02-01, active: 1	2017-02-01 20:11:55.797+00	253
5399	[INFO] Organisation mit der id 290 gespeichert. organisationId: 290, name: Fachschule & Höhere Lehranstalt für wirtschaftliche Berufe, comment: , updateTimestamp: Wed Feb 01 20:13:09 UTC 2017, active: 1	2017-02-01 20:13:09.457+00	253
5400	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-01 20:13:38.001+00	253
5401	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2017-02-02 12:10:20.182+00	602
5402	[INFO] Wareneingang mit der id 373 gespeichert	2017-02-02 12:12:01.354+00	602
5403	[INFO] Wareneingang mit der id 373 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:12:21.449+00	602
5404	[INFO] Warenausgang mit der id 873 gespeichert	2017-02-02 12:13:11.653+00	602
5429	[INFO] Wareneingang mit der id 377 gespeichert	2017-02-02 12:34:11.283+00	602
5430	[INFO] Wareneingang mit der id 377 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:34:18.256+00	602
5442	[INFO] Artikelverteilung für Artikel mit der Id 869 geändert	2017-02-02 12:41:36.013+00	602
5465	[INFO] Wareneingang mit der id 382 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:52:04.211+00	602
5466	[INFO] Warenausgang mit der id 889 gespeichert	2017-02-02 12:53:32.697+00	602
5467	[INFO] Warenausgang mit der id 889 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:53:40.713+00	602
5468	[INFO] Warenausgang mit der id 890 gespeichert	2017-02-02 12:54:11.102+00	602
5469	[INFO] Warenausgang mit der id 890 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:54:18.666+00	602
5472	[INFO] Wareneingang mit der id 385 gespeichert	2017-02-02 12:57:21.657+00	602
5473	[INFO] Wareneingang mit der id 385 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:57:27.125+00	602
5474	[INFO] Wareneingang mit der id 384 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:57:31.781+00	602
5475	[INFO] Wareneingang mit der id 383 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:57:37.073+00	602
5476	[INFO] Warenausgang mit der id 891 gespeichert	2017-02-02 12:58:14.064+00	602
5477	[INFO] Warenausgang mit der id 891 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:58:30.693+00	602
5478	[INFO] Warenausgang mit der id 892 gespeichert	2017-02-02 12:59:00.506+00	602
5479	[INFO] Warenausgang mit der id 892 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:59:06.898+00	602
5480	[INFO] Warenausgang mit der id 893 gespeichert	2017-02-02 12:59:44.881+00	602
5481	[INFO] Warenausgang mit der id 893 auf Archivierungsstatus 1 gesetzt	2017-02-02 13:00:08.989+00	602
5482	[INFO] sabine.zoepfl@gmx.at hat sich abgemeldet	2017-02-02 13:02:17.429+00	602
5483	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-02-03 11:33:33.017+00	252
5406	[INFO] Wareneingang mit der id 374 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:15:34.784+00	602
5407	[INFO] Warenausgang mit der id 874 gespeichert	2017-02-02 12:20:33.576+00	602
5408	[INFO] Artikelverteilung für Artikel mit der Id 862 geändert	2017-02-02 12:22:17.105+00	602
5410	[INFO] Warenausgang mit der id 876 gespeichert	2017-02-02 12:23:55.844+00	602
5411	[INFO] Warenausgang mit der id 873 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:24:23.292+00	602
5412	[INFO] Warenausgang mit der id 876 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:24:29.561+00	602
5413	[INFO] Warenausgang mit der id 875 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:24:36.398+00	602
5414	[INFO] Warenausgang mit der id 874 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:24:47.062+00	602
5426	[INFO] Warenausgang mit der id 879 gespeichert	2017-02-02 12:31:45.917+00	602
5427	[INFO] Warenausgang mit der id 878 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:31:52.61+00	602
5428	[INFO] Warenausgang mit der id 879 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:32:11.57+00	602
5443	[INFO] Wareneingang mit der id 379 gespeichert	2017-02-02 12:42:19.033+00	602
5452	[INFO] Wareneingang mit der id 380 gespeichert	2017-02-02 12:46:23.537+00	602
5458	[INFO] Wareneingang mit der id 381 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:48:46.381+00	602
5459	[INFO] Wareneingang mit der id 380 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:48:51.322+00	602
5460	[INFO] Warenausgang mit der id 887 gespeichert	2017-02-02 12:49:22.805+00	602
5461	[INFO] Warenausgang mit der id 887 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:49:28.946+00	602
5462	[INFO] Warenausgang mit der id 888 gespeichert	2017-02-02 12:49:52.749+00	602
5463	[INFO] Warenausgang mit der id 888 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:50:12.401+00	602
5409	[INFO] Warenausgang mit der id 875 gespeichert	2017-02-02 12:23:13.324+00	602
5415	[INFO] Wareneingang mit der id 375 gespeichert	2017-02-02 12:27:32.132+00	602
5416	[INFO] Wareneingang mit der id 375 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:27:41.427+00	602
5417	[INFO] Warenausgang mit der id 877 gespeichert	2017-02-02 12:28:31.527+00	602
5418	[INFO] Warenausgang mit der id 877 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:28:45.893+00	602
5419	[INFO] Warenausgang mit der id 847 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:28:52.105+00	602
5420	[INFO] Warenausgang mit der id 845 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:28:58.116+00	602
5421	[INFO] Warenausgang mit der id 854 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:29:06.428+00	602
5422	[INFO] Warenausgang mit der id 863 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:29:12.359+00	602
5423	[INFO] Wareneingang mit der id 376 gespeichert	2017-02-02 12:30:22.63+00	602
5424	[INFO] Wareneingang mit der id 376 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:30:33.17+00	602
5425	[INFO] Warenausgang mit der id 878 gespeichert	2017-02-02 12:31:17.267+00	602
5431	[INFO] Warenausgang mit der id 880 gespeichert	2017-02-02 12:35:01.552+00	602
5432	[INFO] Warenausgang mit der id 881 gespeichert	2017-02-02 12:35:48.124+00	602
5433	[INFO] Warenausgang mit der id 880 gespeichert	2017-02-02 12:36:21.46+00	602
5434	[INFO] Warenausgang mit der id 880 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:36:36.04+00	602
5435	[INFO] Warenausgang mit der id 881 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:36:41.844+00	602
5436	[INFO] Wareneingang mit der id 378 gespeichert	2017-02-02 12:37:59.607+00	602
5437	[INFO] Wareneingang mit der id 378 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:38:07.408+00	602
5438	[INFO] Warenausgang mit der id 882 gespeichert	2017-02-02 12:39:02.221+00	602
5439	[INFO] Warenausgang mit der id 882 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:39:20.189+00	602
5484	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-03 11:34:12.985+00	252
5440	[INFO] Warenausgang mit der id 883 gespeichert	2017-02-02 12:40:20.673+00	602
5441	[INFO] Warenausgang mit der id 883 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:40:29.961+00	602
5444	[INFO] Warenausgang mit der id 884 gespeichert	2017-02-02 12:43:07.346+00	602
5445	[INFO] Warenausgang mit der id 884 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:43:13.984+00	602
5446	[INFO] Wareneingang mit der id 379 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:43:27.921+00	602
5447	[INFO] Wareneingang mit der id 371 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:43:34.595+00	602
5448	[INFO] Wareneingang mit der id 370 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:43:40.422+00	602
5449	[INFO] Wareneingang mit der id 321 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:43:45.573+00	602
5450	[INFO] Wareneingang mit der id 285 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:43:54.132+00	602
5451	[INFO] Wareneingang mit der id 286 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:44:02.728+00	602
5453	[INFO] Warenausgang mit der id 885 gespeichert	2017-02-02 12:47:00.074+00	602
5454	[INFO] Warenausgang mit der id 886 gespeichert	2017-02-02 12:47:36.712+00	602
5455	[INFO] Warenausgang mit der id 885 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:47:50.842+00	602
5456	[INFO] Warenausgang mit der id 886 auf Archivierungsstatus 1 gesetzt	2017-02-02 12:47:56.129+00	602
5457	[INFO] Wareneingang mit der id 381 gespeichert	2017-02-02 12:48:39.596+00	602
5464	[INFO] Wareneingang mit der id 382 gespeichert	2017-02-02 12:51:58.757+00	602
5470	[INFO] Wareneingang mit der id 383 gespeichert	2017-02-02 12:55:28.399+00	602
5471	[INFO] Wareneingang mit der id 384 gespeichert	2017-02-02 12:56:22.645+00	602
5485	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2017-02-05 13:57:33.627+00	642
5486	[INFO] Warenausgang mit der id 854 auf Archivierungsstatus 0 gesetzt	2017-02-05 14:00:12.693+00	642
5487	[INFO] Wareneingang mit der id 369 auf Archivierungsstatus 0 gesetzt	2017-02-05 14:03:43.059+00	642
5488	[INFO] Warenausgang mit der id 854 gespeichert	2017-02-05 14:07:01.38+00	642
5489	[INFO] Wareneingang mit der id 368 auf Archivierungsstatus 0 gesetzt	2017-02-05 14:08:18.988+00	642
5490	[INFO] Warenausgang mit der id 854 gespeichert	2017-02-05 14:09:26.672+00	642
5491	[INFO] Warenausgang mit der id 854 auf Archivierungsstatus 1 gesetzt	2017-02-05 14:09:38.776+00	642
5492	[INFO] Warenausgang mit der id 894 gespeichert	2017-02-05 14:12:02.894+00	642
5493	[INFO] Wareneingang mit der id 370 auf Archivierungsstatus 0 gesetzt	2017-02-05 14:19:06.665+00	642
5494	[INFO] Warenausgang mit der id 847 gespeichert	2017-02-05 14:31:01.636+00	642
5495	[INFO] Warenausgang mit der id 847 gespeichert	2017-02-05 14:32:13.895+00	642
5496	[INFO] Warenausgang mit der id 845 gespeichert	2017-02-05 14:33:40.691+00	642
5497	[INFO] Warenausgang mit der id 895 gespeichert	2017-02-05 14:34:29.407+00	642
5498	[INFO] Warenausgang mit der id 895 auf Archivierungsstatus 1 gesetzt	2017-02-05 14:34:52.704+00	642
5499	[INFO] Wareneingang mit der id 369 auf Archivierungsstatus 1 gesetzt	2017-02-05 14:38:42.059+00	642
5500	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-02-06 10:43:53.127+00	519
5501	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2017-02-06 12:17:44.434+00	602
5502	[INFO] Artikelverteilung für Artikel mit der Id 627 geändert	2017-02-06 12:37:08.903+00	602
5503	[INFO] Artikelverteilung für Artikel mit der Id 626 geändert	2017-02-06 12:38:56.664+00	602
5504	[INFO] Artikelverteilung für Artikel mit der Id 625 geändert	2017-02-06 12:44:25.952+00	602
5505	[INFO] Warenausgang mit der id 894 auf Archivierungsstatus 1 gesetzt	2017-02-06 13:03:35.923+00	602
5506	[INFO] Warenausgang mit der id 896 gespeichert	2017-02-06 13:04:50.351+00	602
5507	[INFO] Warenausgang mit der id 897 gespeichert	2017-02-06 13:06:00.138+00	602
5508	[INFO] Warenausgang mit der id 896 auf Archivierungsstatus 1 gesetzt	2017-02-06 13:11:01.739+00	602
5509	[INFO] Warenausgang mit der id 897 auf Archivierungsstatus 1 gesetzt	2017-02-06 13:11:08.299+00	602
5510	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-02-06 13:48:48.651+00	519
5511	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2017-02-07 12:31:03.379+00	642
5512	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2017-02-07 12:35:04.352+00	642
5513	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2017-02-07 18:07:28.03+00	602
5514	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-02-08 16:28:23.191+00	252
5515	[INFO] Alle Personen als CSV exportiert.	2017-02-08 16:29:07.189+00	252
5516	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-08 16:33:52.999+00	252
5517	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-02-08 16:41:19.061+00	252
5518	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-02-09 12:25:33.609+00	252
5519	[INFO] Person mit der id 27 gespeichert. personId: 27, salutation: Herr, title: , firstName: Horst, lastName: Badzong, comment: , updateTimestamp: 2017-02-09, active: 1	2017-02-09 12:26:28.933+00	252
5520	[INFO] Person mit der id 27 gespeichert. personId: 27, salutation: Herr, title: , firstName: Horst, lastName: Badzong, comment: , updateTimestamp: 2017-02-09, active: 1	2017-02-09 12:26:38.387+00	252
5521	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-09 12:48:00.532+00	252
5522	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-02-09 12:56:41.201+00	252
5523	[INFO] Person mit der id 185 gespeichert. personId: 185, salutation: Frau, title: , firstName: Greta, lastName: Hauswiesner, comment: Tätigkeit: Admin.;Newsletter: ja, updateTimestamp: 2017-02-09, active: 1	2017-02-09 12:57:25.861+00	252
5524	[INFO] Person mit der id 185 gespeichert. personId: 185, salutation: Frau, title: , firstName: Greta, lastName: Hauswiesner, comment: Tätigkeit: Admin.;Newsletter: ja, updateTimestamp: 2017-02-09, active: 1	2017-02-09 12:57:33.939+00	252
5525	[INFO] Person mit der id 185 gespeichert. personId: 185, salutation: Frau, title: , firstName: Greta, lastName: Hauswiesner, comment: Tätigkeit: Admin.;Newsletter: ja, updateTimestamp: 2017-02-09, active: 1	2017-02-09 12:58:37.473+00	252
5526	[INFO] Person mit der id 185 gespeichert. personId: 185, salutation: Frau, title: , firstName: Greta, lastName: Hauswiesner, comment: Tätigkeit: Admin.;Newsletter: ja, updateTimestamp: 2017-02-09, active: 1	2017-02-09 12:58:45.786+00	252
5527	[INFO] Person mit der id 185 gespeichert. personId: 185, salutation: Frau, title: , firstName: Greta, lastName: Hauswiesner, comment: Tätigkeit: Admin.;Newsletter: ja, updateTimestamp: 2017-02-09, active: 1	2017-02-09 12:58:46.053+00	252
5528	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-09 12:59:02.909+00	252
5529	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-02-10 06:40:25.992+00	253
5533	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-02-11 05:13:07.995+00	519
5530	[INFO] Person mit der id 734 gespeichert. personId: 734, salutation: Herr, title: Mag., firstName: Harald, lastName: Kratzer, comment: , updateTimestamp: 2017-02-10, active: 1	2017-02-10 06:42:36.133+00	253
5531	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-10 06:43:14.873+00	253
5532	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-02-10 15:49:22.705+00	519
5561	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-02-15 18:58:17.399+00	574
5562	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-02-19 19:18:37.688+00	574
5534	[INFO] Person mit der id 22 gespeichert. personId: 22, salutation: Frau, title: , firstName: Ilse, lastName: Asen, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:20:47.327+00	519
5535	[INFO] Person mit der id 44 gespeichert. personId: 44, salutation: Frau, title: , firstName: Anita, lastName: Bernhofer, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:25:52.899+00	519
5536	[INFO] Person mit der id 100 gespeichert. personId: 100, salutation: Herr, title: Dr., firstName: Oskar, lastName: Einzinger, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:26:08.457+00	519
5537	[INFO] Person mit der id 140 gespeichert. personId: 140, salutation: Herr, title: , firstName: Gerald, lastName: Giesswein, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:26:36.122+00	519
5538	[INFO] Person mit der id 149 gespeichert. personId: 149, salutation: Frau, title: , firstName: Christa, lastName: Graf, comment: Newsletter: ja, updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:26:53.313+00	519
5539	[INFO] Person mit der id 185 gespeichert. personId: 185, salutation: Frau, title: , firstName: Greta, lastName: Hauswiesner, comment: Newsletter: ja, updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:27:16.916+00	519
5540	[INFO] Person mit der id 208 gespeichert. personId: 208, salutation: Herr, title: , firstName: Helfried, lastName: Hitsch, comment: Newsletter: nein, updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:27:40.748+00	519
5541	[INFO] Person mit der id 209 gespeichert. personId: 209, salutation: Herr, title: , firstName: Franz, lastName: Hofbauer, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:28:59.722+00	519
5542	[INFO] Person mit der id 228 gespeichert. personId: 228, salutation: Herr, title: Dr., firstName: Wolfgang, lastName: Hübl, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:29:54.218+00	519
5543	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: DI, firstName: Albert, lastName: Kiefel, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:30:15.564+00	519
5544	[INFO] Person mit der id 252 gespeichert. personId: 252, salutation: Frau, title: , firstName: Doris, lastName: Kiefel, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:30:35.676+00	519
5545	[INFO] Person mit der id 345 gespeichert. personId: 345, salutation: Frau, title: DI, firstName: Doina, lastName: Moldovan, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:30:59.899+00	519
5546	[INFO] Person mit der id 616 gespeichert. personId: 616, salutation: Herr, title: , firstName: Peter, lastName: Nussbaum, comment: Newsletter: ja, updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:31:18.776+00	519
5547	[INFO] Person mit der id 430 gespeichert. personId: 430, salutation: Frau, title: , firstName: Sabrina, lastName: Reiter, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:31:51.677+00	519
5548	[INFO] Person mit der id 441 gespeichert. personId: 441, salutation: Frau, title: , firstName: Brigitte, lastName: Ricciotti, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:32:10.171+00	519
5549	[INFO] Person mit der id 445 gespeichert. personId: 445, salutation: Herr, title: Mag., firstName: Walter, lastName: Riezinger, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:32:29.271+00	519
5550	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schwaiger, comment: Newsletter: ja;, updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:32:50.911+00	519
5551	[INFO] Person mit der id 529 gespeichert. personId: 529, salutation: Herr, title: , firstName: Reiner, lastName: Strehl, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:33:16.883+00	519
5552	[INFO] Person mit der id 546 gespeichert. personId: 546, salutation: Herr, title: , firstName: Felix, lastName: Tomo, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:33:34.537+00	519
5553	[INFO] Person mit der id 642 gespeichert. personId: 642, salutation: Frau, title: , firstName: Lisa, lastName: Traubenek, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:33:50.832+00	519
5554	[INFO] Person mit der id 574 gespeichert. personId: 574, salutation: Frau, title: Mag., firstName: Ulrike, lastName: Wenzlhuemer, comment: , updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:34:13.735+00	519
5555	[INFO] Person mit der id 602 gespeichert. personId: 602, salutation: Frau, title: , firstName: Sabine, lastName: Zöpfl, comment: Newsletter: ja;, updateTimestamp: 2017-02-11, active: 1	2017-02-11 05:34:32.403+00	519
5556	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-02-11 05:34:48.663+00	519
5557	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-02-11 06:55:07.112+00	519
5558	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-02-11 10:38:03.608+00	252
5559	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-02-11 10:40:14.541+00	252
5560	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-02-12 07:25:03.401+00	519
5563	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-02-28 18:44:58.956+00	574
5564	[INFO] Wareneingang mit der id 386 gespeichert	2017-02-28 19:17:56.171+00	574
5565	[INFO] Warenausgang mit der id 864 gespeichert	2017-02-28 19:20:45.302+00	574
5566	[INFO] Warenausgang mit der id 864 auf Archivierungsstatus 0 gesetzt	2017-02-28 19:21:32.606+00	574
5567	[INFO] Warenausgang mit der id 880 gespeichert	2017-02-28 19:22:29.993+00	574
5568	[INFO] Warenausgang mit der id 898 gespeichert	2017-02-28 19:26:19.067+00	574
5569	[INFO] Warenausgang mit der id 898 auf Archivierungsstatus 1 gesetzt	2017-02-28 19:26:32.728+00	574
5570	[INFO] Warenausgang mit der id 864 gespeichert	2017-02-28 19:42:52.526+00	574
5571	[INFO] Wareneingang mit der id 386 gespeichert	2017-02-28 19:43:48.581+00	574
5572	[INFO] Wareneingang mit der id 386 gespeichert	2017-02-28 19:45:43.605+00	574
5573	[INFO] Wareneingang mit der id 386 auf Archivierungsstatus 1 gesetzt	2017-02-28 19:45:52.24+00	574
5574	[INFO] Warenausgang mit der id 864 gespeichert	2017-02-28 19:46:38.24+00	574
5575	[INFO] Warenausgang mit der id 864 auf Archivierungsstatus 1 gesetzt	2017-02-28 19:46:53.732+00	574
5576	[INFO] Warenausgang mit der id 865 auf Archivierungsstatus 1 gesetzt	2017-02-28 19:47:33.273+00	574
5577	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-02-28 20:06:21.912+00	574
5578	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-03-02 11:59:31.07+00	441
5579	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: , updateTimestamp: 2017-03-02, active: 1	2017-03-02 12:01:36.839+00	441
5580	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: , updateTimestamp: 2017-03-02, active: 1	2017-03-02 12:03:11.216+00	441
5581	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-02 17:34:42.675+00	519
5582	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-03-03 08:02:21.385+00	253
5583	[INFO] Person mit der id 502 gespeichert. personId: 502, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2017-03-03, active: 1	2017-03-03 08:03:24.888+00	253
5584	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: , updateTimestamp: 2017-03-03, active: 1	2017-03-03 08:03:54.597+00	253
5585	[INFO] Person mit der id 502 gespeichert. personId: 502, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2017-03-03, active: 1	2017-03-03 08:04:15.392+00	253
5586	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2017-03-03, active: 1	2017-03-03 08:04:37.885+00	253
5587	[INFO] Person mit der id 502 gelöscht	2017-03-03 08:05:39.764+00	253
5588	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-03 08:07:23.617+00	253
5589	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-03 15:21:56.033+00	519
5592	[INFO] Artikelverteilung für Artikel mit der Id 836 geändert	2017-03-08 18:38:30.19+00	602
5593	[INFO] Warenausgang mit der id 894 gespeichert	2017-03-08 18:55:21.861+00	602
5594	[INFO] Warenausgang mit der id 894 gespeichert	2017-03-08 19:02:04.815+00	602
5596	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-08 19:50:08.967+00	574
5601	[INFO] Warenausgang mit der id 900 auf Archivierungsstatus 1 gesetzt	2017-03-08 20:46:20.416+00	574
5613	[INFO] Wareneingang mit der id 388 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:00:33.29+00	574
5614	[INFO] Wareneingang mit der id 389 gespeichert	2017-03-08 21:02:20.822+00	574
5615	[INFO] Warenausgang mit der id 905 gespeichert	2017-03-08 21:03:30.634+00	574
5616	[INFO] Warenausgang mit der id 906 gespeichert	2017-03-08 21:04:41.129+00	574
5617	[INFO] Warenausgang mit der id 905 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:04:58.733+00	574
5618	[INFO] Warenausgang mit der id 906 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:05:03.122+00	574
5621	[INFO] Warenausgang mit der id 907 gespeichert	2017-03-08 21:07:42.843+00	574
5622	[INFO] Warenausgang mit der id 907 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:07:50.375+00	574
5623	[INFO] Wareneingang mit der id 390 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:08:00.495+00	574
5624	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-03-08 21:08:08.624+00	574
5625	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-08 21:11:19.29+00	574
5626	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-03-08 21:25:01.779+00	574
5627	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-10 19:29:31.701+00	519
5634	[INFO] lisa_traubenek@yahoo.de hat sich angemeldet	2017-03-13 13:43:46.501+00	642
5652	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-03-14 21:53:31.411+00	574
5653	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-15 19:30:07.079+00	519
5664	[INFO] Wareneingang mit der id 393 gespeichert	2017-03-15 20:16:51.646+00	574
5665	[INFO] Warenausgang mit der id 910 gespeichert	2017-03-15 20:23:52.964+00	574
5666	[INFO] Warenausgang mit der id 910 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:23:59.524+00	574
5667	[INFO] Wareneingang mit der id 393 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:24:17.28+00	574
5668	[INFO] Wareneingang mit der id 394 gespeichert	2017-03-15 20:25:33.494+00	574
5669	[INFO] Warenausgang mit der id 911 gespeichert	2017-03-15 20:26:10.556+00	574
5670	[INFO] Warenausgang mit der id 911 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:26:49.23+00	574
5671	[INFO] Wareneingang mit der id 394 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:26:58.041+00	574
5678	[INFO] Wareneingang mit der id 396 gespeichert	2017-03-15 20:34:39.901+00	574
5679	[INFO] Warenausgang mit der id 914 gespeichert	2017-03-15 20:35:18.39+00	574
5680	[INFO] Warenausgang mit der id 914 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:36:05.171+00	574
5681	[INFO] Wareneingang mit der id 396 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:36:20.623+00	574
5701	[INFO] Alle Organisationen als CSV exportiert.	2017-03-18 11:59:11.598+00	737
5590	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-03-03 16:37:13.485+00	519
5591	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2017-03-08 18:34:40.433+00	602
5597	[INFO] Wareneingang mit der id 387 gespeichert	2017-03-08 20:40:29.514+00	574
5598	[INFO] Warenausgang mit der id 899 gespeichert	2017-03-08 20:41:38.07+00	574
5599	[INFO] Warenausgang mit der id 899 auf Archivierungsstatus 1 gesetzt	2017-03-08 20:42:03.142+00	574
5600	[INFO] Warenausgang mit der id 900 gespeichert	2017-03-08 20:45:53.904+00	574
5602	[INFO] Warenausgang mit der id 901 gespeichert	2017-03-08 20:46:54.835+00	574
5603	[INFO] Warenausgang mit der id 901 auf Archivierungsstatus 1 gesetzt	2017-03-08 20:49:26.961+00	574
5604	[INFO] Wareneingang mit der id 387 auf Archivierungsstatus 1 gesetzt	2017-03-08 20:49:42.375+00	574
5605	[INFO] Wareneingang mit der id 388 gespeichert	2017-03-08 20:55:21.142+00	574
5606	[INFO] Warenausgang mit der id 902 gespeichert	2017-03-08 20:57:25.808+00	574
5607	[INFO] Warenausgang mit der id 902 gespeichert	2017-03-08 20:57:55.999+00	574
5608	[INFO] Warenausgang mit der id 903 gespeichert	2017-03-08 20:58:59.602+00	574
5609	[INFO] Warenausgang mit der id 904 gespeichert	2017-03-08 20:59:42.076+00	574
5610	[INFO] Warenausgang mit der id 902 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:00:12.646+00	574
5611	[INFO] Warenausgang mit der id 903 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:00:17.862+00	574
5612	[INFO] Warenausgang mit der id 904 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:00:22.971+00	574
5635	[INFO] lisa_traubenek@yahoo.de hat sich abgemeldet	2017-03-13 13:44:58.857+00	642
5636	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-13 16:38:00.323+00	519
5639	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-14 19:37:11.04+00	574
5640	[INFO] Warenausgang mit der id 656 gespeichert	2017-03-14 19:48:00.611+00	574
5641	[INFO] Warenausgang mit der id 658 gespeichert	2017-03-14 19:48:47.639+00	574
5642	[INFO] Warenausgang mit der id 655 gespeichert	2017-03-14 19:49:36.375+00	574
5643	[INFO] Warenausgang mit der id 659 gespeichert	2017-03-14 19:50:14.458+00	574
5644	[INFO] Warenausgang mit der id 657 gespeichert	2017-03-14 19:50:52.025+00	574
5645	[INFO] Warenausgang mit der id 658 gespeichert	2017-03-14 19:53:25.192+00	574
5646	[INFO] Wareneingang mit der id 280 gespeichert	2017-03-14 19:54:57.57+00	574
5647	[INFO] Warenausgang mit der id 655 gespeichert	2017-03-14 19:56:16.117+00	574
5648	[INFO] Warenausgang mit der id 656 gespeichert	2017-03-14 19:57:02.586+00	574
5649	[INFO] Warenausgang mit der id 657 gespeichert	2017-03-14 19:57:46.669+00	574
5650	[INFO] Warenausgang mit der id 658 gespeichert	2017-03-14 19:58:30.256+00	574
5651	[INFO] Warenausgang mit der id 659 gespeichert	2017-03-14 19:59:13.158+00	574
5691	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-03-16 14:46:03.626+00	253
5693	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-16 14:55:39.616+00	253
5694	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-03-16 15:04:44.196+00	737
5695	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-03-16 15:05:32.411+00	737
5595	[INFO] Wareneingang mit der id 371 auf Archivierungsstatus 0 gesetzt	2017-03-08 19:10:04.367+00	602
5619	[INFO] Wareneingang mit der id 389 auf Archivierungsstatus 1 gesetzt	2017-03-08 21:05:18.277+00	574
5620	[INFO] Wareneingang mit der id 390 gespeichert	2017-03-08 21:06:29.881+00	574
5628	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-03-12 15:36:18.604+00	252
5629	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-12 15:37:03.437+00	252
5630	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-03-12 17:27:20.041+00	252
5633	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-13 06:50:43.906+00	519
5637	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2017-03-13, active: 1	2017-03-13 16:38:27.029+00	519
5638	[INFO] Passwort für Person mit Id 519 geändert.	2017-03-13 16:38:49.343+00	519
5655	[INFO] Wareneingang mit der id 391 gespeichert	2017-03-15 20:05:43.816+00	574
5656	[INFO] Warenausgang mit der id 908 gespeichert	2017-03-15 20:06:50.486+00	574
5657	[INFO] Warenausgang mit der id 908 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:07:03.028+00	574
5658	[INFO] Wareneingang mit der id 391 gespeichert	2017-03-15 20:08:58.21+00	574
5659	[INFO] Wareneingang mit der id 391 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:09:09.174+00	574
5660	[INFO] Wareneingang mit der id 392 gespeichert	2017-03-15 20:13:09.97+00	574
5661	[INFO] Warenausgang mit der id 909 gespeichert	2017-03-15 20:14:01.725+00	574
5663	[INFO] Wareneingang mit der id 392 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:15:53.638+00	574
5674	[INFO] Warenausgang mit der id 913 gespeichert	2017-03-15 20:32:26.738+00	574
5675	[INFO] Warenausgang mit der id 912 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:33:06.885+00	574
5676	[INFO] Warenausgang mit der id 913 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:33:10.869+00	574
5677	[INFO] Wareneingang mit der id 395 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:33:19.128+00	574
5682	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-16 08:25:25.991+00	519
5699	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-03-16 15:39:35.108+00	737
5700	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-03-18 11:48:41.082+00	737
5631	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-12 17:27:54.837+00	252
5632	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-03-12 20:11:07.587+00	441
5654	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-15 19:51:59.287+00	574
5662	[INFO] Warenausgang mit der id 909 auf Archivierungsstatus 1 gesetzt	2017-03-15 20:15:36.805+00	574
5672	[INFO] Wareneingang mit der id 395 gespeichert	2017-03-15 20:30:10.485+00	574
5673	[INFO] Warenausgang mit der id 912 gespeichert	2017-03-15 20:31:19.916+00	574
5683	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-03-16 14:06:19.585+00	253
5684	[INFO] Passwort für Person mit Id 737 zurückgesetzt.	2017-03-16 14:06:51.028+00	253
5685	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2017-03-16, active: 1	2017-03-16 14:06:53.607+00	253
5686	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-16 14:07:04.515+00	253
5687	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-03-16 14:07:21.415+00	737
5688	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-03-16 14:07:39.783+00	737
5689	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-03-16 14:07:41.567+00	737
5690	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-03-16 14:41:08.51+00	253
5692	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2017-03-16, active: 1	2017-03-16 14:47:30.049+00	253
5696	[INFO] Passwort für Person mit Id 737 geändert.	2017-03-16 15:06:24.675+00	737
5697	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-03-16 15:06:30.376+00	737
5698	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-03-16 15:06:39.594+00	737
5702	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-19 18:11:49.331+00	519
5703	[INFO] Passwort für Person mit Id 519 geändert.	2017-03-19 18:12:06.332+00	519
5704	[INFO] Person mit der id 737 gespeichert. personId: 737, salutation: Frau, title: , firstName: Angela, lastName: Simmel, comment: 28.01.2010, updateTimestamp: 2017-03-19, active: 1	2017-03-19 18:12:29.063+00	519
5705	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-03-19 18:23:01.006+00	519
5706	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-20 09:53:28.617+00	519
5707	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-03-20 09:53:35.811+00	519
5708	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-20 09:53:41.03+00	519
5709	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-03-20 15:22:18.946+00	252
5710	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-20 15:24:01.848+00	252
5711	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-20 19:18:23.203+00	519
5712	[INFO] Person mit der id 381 gespeichert. personId: 381, salutation: Herr, title: , firstName: Christian, lastName: Subera, comment: , updateTimestamp: 2017-03-20, active: 1	2017-03-20 19:34:58.296+00	519
5713	[INFO] Artikelverteilung für Artikel mit der Id 710 geändert	2017-03-20 20:07:50.47+00	519
5714	[INFO] Wareneingang mit der id 305 auf Archivierungsstatus 0 gesetzt	2017-03-20 20:08:42.158+00	519
5715	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-20 20:09:33.349+00	574
5716	[INFO] Warenausgang mit der id 915 gespeichert	2017-03-20 20:13:44.643+00	519
5717	[INFO] Warenausgang mit der id 915 auf Archivierungsstatus 1 gesetzt	2017-03-20 20:13:54.647+00	519
5718	[INFO] Artikelverteilung für Artikel mit der Id 710 geändert	2017-03-20 20:14:36.111+00	519
5719	[INFO] Wareneingang mit der id 305 auf Archivierungsstatus 1 gesetzt	2017-03-20 20:14:43.437+00	519
5720	[INFO] Artikelverteilung für Artikel mit der Id 710 geändert	2017-03-20 20:16:47.69+00	519
5721	[INFO] Wareneingang mit der id 397 gespeichert	2017-03-20 20:27:18.012+00	519
5722	[INFO] Wareneingang mit der id 397 auf Archivierungsstatus 1 gesetzt	2017-03-20 20:29:59.599+00	519
5723	[INFO] Warenausgang mit der id 916 gespeichert	2017-03-20 20:31:28.226+00	519
5724	[INFO] Warenausgang mit der id 916 auf Archivierungsstatus 1 gesetzt	2017-03-20 20:31:36.392+00	519
5725	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-03-20 20:51:47.585+00	519
5726	[INFO] Wareneingang mit der id 398 gespeichert	2017-03-20 21:18:57.045+00	574
5727	[INFO] Warenausgang mit der id 917 gespeichert	2017-03-20 21:20:11.972+00	574
5728	[INFO] Warenausgang mit der id 917 auf Archivierungsstatus 1 gesetzt	2017-03-20 21:20:26.201+00	574
5729	[INFO] Warenausgang mit der id 918 gespeichert	2017-03-20 21:21:14.253+00	574
5730	[INFO] Warenausgang mit der id 918 auf Archivierungsstatus 1 gesetzt	2017-03-20 21:21:26.124+00	574
5731	[INFO] Wareneingang mit der id 399 gespeichert	2017-03-20 21:26:18.678+00	574
5732	[INFO] Warenausgang mit der id 919 gespeichert	2017-03-20 21:28:03.147+00	574
5733	[INFO] Warenausgang mit der id 919 auf Archivierungsstatus 1 gesetzt	2017-03-20 21:29:05.072+00	574
5734	[INFO] Warenausgang mit der id 920 gespeichert	2017-03-20 21:29:47.752+00	574
5735	[INFO] Warenausgang mit der id 920 auf Archivierungsstatus 1 gesetzt	2017-03-20 21:30:11.66+00	574
5736	[INFO] Wareneingang mit der id 399 auf Archivierungsstatus 1 gesetzt	2017-03-20 21:31:51.839+00	574
5737	[INFO] Wareneingang mit der id 398 auf Archivierungsstatus 1 gesetzt	2017-03-20 21:31:56.987+00	574
5738	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-03-20 21:32:04.986+00	574
5739	[INFO] doina.moldovan@view-salzburg.at hat sich angemeldet	2017-03-22 18:47:44.433+00	345
5740	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-03-22 19:49:04.893+00	252
5741	[INFO] Person mit der id 307 gespeichert. personId: 307, salutation: Herr, title: , firstName: Hubert, lastName: Lixl, comment: 20.02.2008, updateTimestamp: 2017-03-22, active: 1	2017-03-22 19:49:47.942+00	252
5742	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-22 19:50:57.227+00	252
5743	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-03-23 12:18:50.999+00	252
5744	[INFO] Person mit der id 292 gespeichert. personId: 292, salutation: Frau, title: , firstName: Erika, lastName: Lange, comment: 06.12.2011, updateTimestamp: 2017-03-23, active: 1	2017-03-23 12:19:51.541+00	252
5745	[INFO] Person mit der id 292 gespeichert. personId: 292, salutation: Frau, title: , firstName: Erika, lastName: Lange, comment: 06.12.2011, updateTimestamp: 2017-03-23, active: 1	2017-03-23 12:19:56.193+00	252
5746	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-23 12:20:02.672+00	252
5747	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-27 18:57:07.814+00	574
5748	[INFO] Warenausgang mit der id 921 gespeichert	2017-03-27 19:24:51.151+00	574
5749	[INFO] Warenausgang mit der id 922 gespeichert	2017-03-27 19:25:46.26+00	574
5750	[INFO] Warenausgang mit der id 921 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:26:01.901+00	574
5751	[INFO] Warenausgang mit der id 922 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:26:05.453+00	574
5752	[INFO] Wareneingang mit der id 371 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:26:18.953+00	574
5753	[INFO] Wareneingang mit der id 400 gespeichert	2017-03-27 19:37:14.025+00	574
5754	[INFO] Warenausgang mit der id 923 gespeichert	2017-03-27 19:37:51.303+00	574
5760	[INFO] Wareneingang mit der id 401 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:47:28.462+00	574
5761	[INFO] Wareneingang mit der id 402 gespeichert	2017-03-27 19:56:04.715+00	574
5762	[INFO] Warenausgang mit der id 925 gespeichert	2017-03-27 19:57:04.594+00	574
5763	[INFO] Warenausgang mit der id 926 gespeichert	2017-03-27 19:57:42.844+00	574
5767	[INFO] Warenausgang mit der id 927 gespeichert	2017-03-27 20:10:05.975+00	574
5768	[INFO] Warenausgang mit der id 928 gespeichert	2017-03-27 20:11:16.967+00	574
5769	[INFO] Warenausgang mit der id 929 gespeichert	2017-03-27 20:12:54.664+00	574
5770	[INFO] Warenausgang mit der id 930 gespeichert	2017-03-27 20:13:51.703+00	574
5773	[INFO] Warenausgang mit der id 933 gespeichert	2017-03-27 20:16:57.494+00	574
5774	[INFO] Warenausgang mit der id 934 gespeichert	2017-03-27 20:17:36.654+00	574
5775	[INFO] Warenausgang mit der id 935 gespeichert	2017-03-27 20:18:10.711+00	574
5776	[INFO] Warenausgang mit der id 927 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:18.932+00	574
5777	[INFO] Warenausgang mit der id 928 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:24.59+00	574
5778	[INFO] Warenausgang mit der id 931 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:28.861+00	574
5779	[INFO] Warenausgang mit der id 932 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:33.043+00	574
5780	[INFO] Warenausgang mit der id 933 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:38.008+00	574
5781	[INFO] Warenausgang mit der id 934 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:42.006+00	574
5782	[INFO] Warenausgang mit der id 935 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:46.769+00	574
5783	[INFO] Wareneingang mit der id 403 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:18:55.379+00	574
5784	[INFO] Wareneingang mit der id 402 auf Archivierungsstatus 1 gesetzt	2017-03-27 20:19:01.676+00	574
5785	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-03-27 20:20:23.33+00	574
5786	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-28 17:33:05.575+00	519
5791	[INFO] Organisation mit der id 291 gespeichert. organisationId: 291, name: Verein menschen.leben Hayat Hallein, comment: , updateTimestamp: Tue Mar 28 17:40:07 UTC 2017, active: 1	2017-03-28 17:40:07.969+00	519
5792	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-03-28 18:00:46.652+00	519
5793	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-28 18:25:23.207+00	574
5794	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-03-28 18:58:42.842+00	574
5795	[INFO] Warenausgang mit der id 929 gespeichert	2017-03-28 18:59:45.15+00	574
5796	[INFO] Warenausgang mit der id 929 gespeichert	2017-03-28 19:00:13.054+00	574
5797	[INFO] Warenausgang mit der id 930 gespeichert	2017-03-28 19:05:32.05+00	574
5798	[INFO] Wareneingang mit der id 404 gespeichert	2017-03-28 19:17:06.747+00	574
5799	[INFO] Warenausgang mit der id 936 gespeichert	2017-03-28 19:19:11.803+00	574
5808	[INFO] Wareneingang mit der id 405 gespeichert	2017-03-28 20:01:51.827+00	574
5809	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-03-28 20:16:09.251+00	574
5755	[INFO] Warenausgang mit der id 923 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:38:02.881+00	574
5756	[INFO] Wareneingang mit der id 401 gespeichert	2017-03-27 19:42:43.04+00	574
5757	[INFO] Wareneingang mit der id 400 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:42:50.468+00	574
5758	[INFO] Warenausgang mit der id 924 gespeichert	2017-03-27 19:46:09.167+00	574
5759	[INFO] Warenausgang mit der id 924 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:46:45.167+00	574
5764	[INFO] Warenausgang mit der id 926 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:57:59.474+00	574
5765	[INFO] Warenausgang mit der id 925 auf Archivierungsstatus 1 gesetzt	2017-03-27 19:58:03.503+00	574
5766	[INFO] Wareneingang mit der id 403 gespeichert	2017-03-27 20:08:46.08+00	574
5771	[INFO] Warenausgang mit der id 931 gespeichert	2017-03-27 20:15:16.148+00	574
5772	[INFO] Warenausgang mit der id 932 gespeichert	2017-03-27 20:16:04.727+00	574
5787	[INFO] Organisation mit der id 291 gespeichert. organisationId: 291, name: Verein menschen.leben Hayat Hallein, comment: , updateTimestamp: Tue Mar 28 17:35:12 UTC 2017, active: 1	2017-03-28 17:35:12.412+00	519
5788	[INFO] Organisation mit der id 291 gespeichert. organisationId: 291, name: Verein menschen.leben Hayat Hallein, comment: , updateTimestamp: Tue Mar 28 17:35:44 UTC 2017, active: 1	2017-03-28 17:35:44.845+00	519
5789	[INFO] Person mit der id 738 gespeichert. personId: 738, salutation: , title: , firstName: Leitung, lastName: Hayat, comment: , updateTimestamp: 2017-03-28, active: 1	2017-03-28 17:39:25.246+00	519
5790	[INFO] Person mit der id 738 gespeichert. personId: 738, salutation: , title: , firstName: Leitung, lastName: Hayat, comment: , updateTimestamp: 2017-03-28, active: 1	2017-03-28 17:39:43.075+00	519
5800	[INFO] Warenausgang mit der id 937 gespeichert	2017-03-28 19:20:42.051+00	574
5801	[INFO] Warenausgang mit der id 938 gespeichert	2017-03-28 19:21:47.821+00	574
5802	[INFO] Warenausgang mit der id 939 gespeichert	2017-03-28 19:22:40.786+00	574
5803	[INFO] Warenausgang mit der id 940 gespeichert	2017-03-28 19:23:44.338+00	574
5804	[INFO] Warenausgang mit der id 941 gespeichert	2017-03-28 19:34:23.521+00	574
5805	[INFO] Warenausgang mit der id 942 gespeichert	2017-03-28 19:37:30.279+00	574
5806	[INFO] Warenausgang mit der id 943 gespeichert	2017-03-28 19:38:20.04+00	574
5807	[INFO] Warenausgang mit der id 930 auf Archivierungsstatus 1 gesetzt	2017-03-28 19:56:08.043+00	574
5810	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-03-29 11:20:50.891+00	441
5811	[INFO] Person mit der id 739 gespeichert. personId: 739, salutation: Herr, title: , firstName: Thomas, lastName: Kletzl, comment: , updateTimestamp: 2017-03-29, active: 1	2017-03-29 11:22:37.732+00	441
5812	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-03-30 05:19:10.249+00	253
5813	[INFO] Person mit der id 345 gespeichert. personId: 345, salutation: Frau, title: DI, firstName: Doina, lastName: Moldovan, comment: , updateTimestamp: 2017-03-30, active: 1	2017-03-30 05:23:54.147+00	253
5814	[INFO] Person mit der id 253 gespeichert. personId: 253, salutation: Herr, title: DI, firstName: Albert, lastName: Kiefel, comment: , updateTimestamp: 2017-02-11, active: 1	2017-03-30 05:24:25.796+00	253
5815	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-30 05:25:54.502+00	253
5816	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-03-30 08:31:09.777+00	252
5817	[INFO] Person mit der id 607 gespeichert. personId: 607, salutation: Frau, title: Dr., firstName: Tina, lastName: Widmann, comment: , updateTimestamp: 2017-03-30, active: 1	2017-03-30 08:32:18.059+00	252
5818	[INFO] Person mit der id 607 gespeichert. personId: 607, salutation: Frau, title: Dr., firstName: Tina, lastName: Widmann, comment: , updateTimestamp: 2017-03-30, active: 1	2017-03-30 08:32:22.729+00	252
5819	[INFO] Organisation mit der id 225 gespeichert. organisationId: 225, name: Rollende Herzen, comment: , updateTimestamp: Thu Mar 30 08:33:01 UTC 2017, active: 1	2017-03-30 08:33:01.431+00	252
5820	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-30 08:33:40.56+00	252
5821	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-03-30 08:41:12.075+00	252
5822	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-03-30 08:42:07.147+00	252
5823	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-03-30 13:51:52.736+00	441
5824	[INFO] Person mit der id 740 gespeichert. personId: 740, salutation: Herr, title: , firstName: Werner, lastName: Ruß, comment: , updateTimestamp: 2017-03-30, active: 1	2017-03-30 13:55:13.875+00	441
5825	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-03-30 13:58:18.388+00	441
5826	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-03-30 15:12:46.635+00	253
5827	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schwaiger, comment: Newsletter: ja;, updateTimestamp: 2017-03-30, active: 1	2017-03-30 15:18:42.57+00	253
5828	[INFO] Person mit der id 644 gespeichert. personId: 644, salutation: Herr, title: DI Dr., firstName: Alois, lastName: Schwaiger, comment: Newsletter: ja;, updateTimestamp: 2017-03-30, active: 1	2017-03-30 15:24:37.028+00	253
5829	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-03-31 16:30:05.3+00	519
5830	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-04-03 15:31:49.655+00	519
5831	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-04-03 16:11:45.773+00	519
5832	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-04-03 16:31:51.936+00	519
5833	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-04-03 16:42:59.282+00	519
5834	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-04-03 18:14:35.337+00	519
5835	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-04-04 15:50:52.272+00	252
5836	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-04-09 08:05:31.774+00	737
5837	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-04-09 09:05:17.449+00	737
5838	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-04-18 18:34:58.914+00	574
5839	[INFO] Wareneingang mit der id 405 gespeichert	2017-04-18 18:36:50.909+00	574
5840	[INFO] Warenausgang mit der id 944 gespeichert	2017-04-18 18:39:45.061+00	574
5841	[INFO] Warenausgang mit der id 945 gespeichert	2017-04-18 18:41:03.925+00	574
5842	[INFO] Warenausgang mit der id 946 gespeichert	2017-04-18 18:42:12.953+00	574
5843	[INFO] Warenausgang mit der id 947 gespeichert	2017-04-18 18:43:10.984+00	574
5844	[INFO] Warenausgang mit der id 944 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:45:12.889+00	574
5845	[INFO] Warenausgang mit der id 945 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:45:18.226+00	574
5846	[INFO] Warenausgang mit der id 947 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:45:23.664+00	574
5847	[INFO] Warenausgang mit der id 946 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:45:30.076+00	574
5848	[INFO] Wareneingang mit der id 405 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:53:54.567+00	574
5849	[INFO] Wareneingang mit der id 404 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:54:32.476+00	574
5850	[INFO] Warenausgang mit der id 941 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:54:57.248+00	574
5851	[INFO] Warenausgang mit der id 943 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:55:06.72+00	574
5852	[INFO] Warenausgang mit der id 937 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:55:13.021+00	574
5853	[INFO] Warenausgang mit der id 936 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:55:21.246+00	574
5854	[INFO] Warenausgang mit der id 938 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:55:26.612+00	574
5855	[INFO] Warenausgang mit der id 939 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:55:31.876+00	574
5856	[INFO] Warenausgang mit der id 940 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:55:38.801+00	574
5857	[INFO] Warenausgang mit der id 929 auf Archivierungsstatus 1 gesetzt	2017-04-18 18:55:48.663+00	574
5864	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-04-18 19:09:55.194+00	574
5865	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-04-23 19:56:13.465+00	252
5858	[INFO] Wareneingang mit der id 366 gespeichert	2017-04-18 19:00:05.12+00	574
5859	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-04-18 19:01:55.362+00	574
5860	[INFO] Warenausgang mit der id 942 gespeichert	2017-04-18 19:02:22.557+00	574
5861	[INFO] Warenausgang mit der id 942 auf Archivierungsstatus 1 gesetzt	2017-04-18 19:02:35.053+00	574
5862	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich abgemeldet	2017-04-18 19:03:41.236+00	574
5863	[INFO] ulrike.wenzlhuemer@view-salzburg.at hat sich angemeldet	2017-04-18 19:08:44.124+00	574
5866	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-04-25 16:01:38.131+00	441
5867	[INFO] Alle Personen als CSV exportiert.	2017-04-25 16:04:01.946+00	441
5868	[INFO] Alle Personen als CSV exportiert.	2017-04-25 16:04:07.247+00	441
5869	[INFO] Alle Personen als CSV exportiert.	2017-04-25 16:04:08.345+00	441
5870	[INFO] Alle Personen als CSV exportiert.	2017-04-25 16:04:12.424+00	441
5871	[INFO] Alle Personen als CSV exportiert.	2017-04-25 16:04:18.833+00	441
5872	[INFO] Alle Personen als CSV exportiert.	2017-04-25 16:04:19.366+00	441
5873	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-04-26 07:31:51.24+00	441
5874	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-04-26 13:37:49.104+00	252
5875	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-04-26 14:12:08.03+00	253
5876	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-04-26 14:25:54.171+00	253
5877	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-04-26 15:22:56.091+00	441
5878	[INFO] Alle Personen als CSV exportiert.	2017-04-26 15:23:24.503+00	441
5879	[INFO] b.ricciotti@view-salzburg.at hat sich angemeldet	2017-04-26 15:24:52.151+00	441
5880	[INFO] Alle Personen als CSV exportiert.	2017-04-26 15:25:28.533+00	441
5881	[INFO] Alle Personen als CSV exportiert.	2017-04-26 15:25:33.067+00	441
5882	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-04-27 04:20:13.098+00	519
5883	[INFO] Organisation mit der id 208 gelöscht	2017-04-27 04:20:47.25+00	519
5884	[INFO] Person mit der id 314 gelöscht	2017-04-27 04:21:04.257+00	519
5885	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-04-27 04:34:32.455+00	519
5886	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-04-29 11:56:24.522+00	253
5887	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-05-02 15:08:05.302+00	252
5888	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-05-07 07:55:40.19+00	519
5889	[INFO] Person mit der id 741 gespeichert. personId: 741, salutation: Herr, title: Mag., firstName: Gerhild , lastName: Hofer, MBA, comment: Klartext PR, updateTimestamp: 2017-05-07, active: 1	2017-05-07 07:58:08.311+00	519
5890	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-05-07 08:04:06.219+00	519
5891	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-05-08 12:21:32.419+00	519
5892	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-05-08 14:59:24.049+00	252
5893	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-05-08 16:10:12.102+00	519
5894	[INFO] Organisation mit der id 11 gespeichert. organisationId: 11, name: Bäckerei Schmidhuber, comment: Backstube in der Bäckerkellerstraße 9, updateTimestamp: Mon May 08 16:11:05 UTC 2017, active: 1	2017-05-08 16:11:05.261+00	519
5895	[INFO] Organisation mit der id 292 gespeichert. organisationId: 292, name: TKL Lebensmittel Logistik GmbH, comment: , updateTimestamp: Mon May 08 16:14:25 UTC 2017, active: 1	2017-05-08 16:14:25.307+00	519
5896	[INFO] Person mit der id 742 gespeichert. personId: 742, salutation: , title: , firstName: Rudi, lastName: Krepper, comment: , updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:24:27.508+00	519
5897	[INFO] Organisation mit der id 292 gespeichert. organisationId: 292, name: TKL Lebensmittel Logistik GmbH, comment: , updateTimestamp: Mon May 08 16:24:57 UTC 2017, active: 1	2017-05-08 16:24:57.075+00	519
5898	[INFO] Person mit der id 742 gespeichert. personId: 742, salutation: , title: , firstName: Rudi, lastName: Krepper, comment: Leitung Warenverteilzentrum Salzburg, updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:25:45.633+00	519
5899	[INFO] Organisation mit der id 293 gespeichert. organisationId: 293, name: Klartext PR, comment: www.klartext-pr.at, updateTimestamp: Mon May 08 16:27:21 UTC 2017, active: 1	2017-05-08 16:27:21.25+00	519
5900	[INFO] Person mit der id 743 gespeichert. personId: 743, salutation: Frau, title: Mag., firstName: Gerhild , lastName: Hofer, MBA, comment: , updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:28:37.155+00	519
5901	[INFO] Person mit der id 741 gelöscht	2017-05-08 16:29:29.43+00	519
5902	[INFO] Organisation mit der id 293 gespeichert. organisationId: 293, name: Klartext PR, comment: www.klartext-pr.at, updateTimestamp: Mon May 08 16:29:52 UTC 2017, active: 1	2017-05-08 16:29:52.371+00	519
5903	[INFO] Organisation mit der id 294 gespeichert. organisationId: 294, name: Transgourmet Salzburg, comment: , updateTimestamp: Mon May 08 16:32:33 UTC 2017, active: 1	2017-05-08 16:32:33.091+00	519
5904	[INFO] Person mit der id 744 gespeichert. personId: 744, salutation: Herr, title: , firstName: Michael , lastName: Mayerhofer, comment: , updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:33:43.604+00	519
5905	[INFO] Organisation mit der id 294 gespeichert. organisationId: 294, name: Transgourmet Salzburg, comment: , updateTimestamp: Mon May 08 16:34:10 UTC 2017, active: 1	2017-05-08 16:34:10.507+00	519
5906	[INFO] Person mit der id 743 gespeichert. personId: 743, salutation: Frau, title: Mag., firstName: Gerhild, lastName: Hofer, MBA, comment: , updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:35:28.391+00	519
5907	[INFO] Person mit der id 743 gespeichert. personId: 743, salutation: Frau, title: Mag., firstName: Gerhild, lastName: Hofer, MBA, comment: , updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:36:02.582+00	519
5908	[INFO] Person mit der id 743 gespeichert. personId: 743, salutation: Frau, title: Mag., firstName: Gerhild, lastName: Hofer, comment: , updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:36:46.795+00	519
5909	[INFO] Person mit der id 743 gespeichert. personId: 743, salutation: Frau, title: Mag., firstName: Gerhild, MBA, lastName: Hofer, comment: , updateTimestamp: 2017-05-08, active: 1	2017-05-08 16:37:02.725+00	519
5910	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-05-12 16:02:02.972+00	737
5911	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-05-12 16:08:52.183+00	737
5912	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-05-13 12:43:04.116+00	253
5913	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-05-13 13:00:11.206+00	253
5914	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-05-14 11:43:51.968+00	519
5915	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-05-19 07:28:19.028+00	253
5916	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-05-19 07:49:53.524+00	253
5917	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-05-21 04:18:45.496+00	519
5918	[INFO] Person mit der id 578 gespeichert. personId: 578, salutation: Herr, title: , firstName: Toni, lastName: Wieland, comment: , updateTimestamp: 2017-05-21, active: 1	2017-05-21 04:19:37.649+00	519
5919	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-05-22 07:08:29.495+00	252
5920	[INFO] Person mit der id 725 gespeichert. personId: 725, salutation: Frau , title: , firstName: Elisabeth , lastName: Hörl, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 07:12:34.472+00	252
5921	[INFO] Person mit der id 745 gespeichert. personId: 745, salutation: Frau, title: , firstName: Gabriela , lastName: Moretti-Prucher, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 07:22:45.76+00	252
5922	[INFO] Person mit der id 367 gespeichert. personId: 367, salutation: Herr, title: Dr., firstName: Kurt, lastName: Oberholzer, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 07:26:34+00	252
5923	[INFO] Person mit der id 367 gespeichert. personId: 367, salutation: Herr, title: Dr., firstName: Kurt, lastName: Oberholzer, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 07:26:38.4+00	252
5924	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-05-22 07:27:31.275+00	252
5925	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-05-22 07:44:22.106+00	253
5926	[INFO] Person mit der id 495 gelöscht	2017-05-22 07:44:50.212+00	253
5927	[INFO] Person mit der id 658 gelöscht	2017-05-22 07:48:25.174+00	253
5928	[INFO] Person mit der id 746 gespeichert. personId: 746, salutation: Frau, title: , firstName: Kristina, lastName: Höhn, comment: Marketing- und Innovationsmanagerin, updateTimestamp: 2017-05-22, active: 1	2017-05-22 07:49:10.308+00	253
5938	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-05-29 12:07:03.659+00	253
5939	[INFO] Person mit der id 722 gespeichert. personId: 722, salutation: Frau, title: , firstName: Julia, lastName: Böck, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 12:09:01.089+00	253
5940	[INFO] Person mit der id 273 gespeichert. personId: 273, salutation: Herr, title: , firstName: Gerd, lastName: Konklewski, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 12:09:43.364+00	253
5941	[INFO] Person mit der id 620 gespeichert. personId: 620, salutation: Frau, title: , firstName: Lena, lastName: Repplinger, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 12:10:21.02+00	253
5942	[INFO] Person mit der id 273 gespeichert. personId: 273, salutation: Herr, title: , firstName: Gerd, lastName: Konklewski, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 12:11:32.08+00	253
5943	[INFO] Person mit der id 542 gelöscht	2017-05-29 12:11:48.809+00	253
5944	[INFO] Person mit der id 619 gelöscht	2017-05-29 12:12:47.556+00	253
5945	[INFO] Person mit der id 458 gespeichert. personId: 458, salutation: Herr Prokurist, title: , firstName: Peter, lastName: Schafleitner, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 12:13:24.052+00	253
5946	[INFO] Person mit der id 322 gelöscht	2017-05-29 12:14:01.387+00	253
5947	[INFO] Person mit der id 565 gespeichert. personId: 565, salutation: Frau, title: Mag., firstName: Verena, lastName: Weber, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 12:15:01.934+00	253
5948	[INFO] Person mit der id 235 gespeichert. personId: 235, salutation: Herr Ök.-Rat, title: , firstName: Simon, lastName: Illmer, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 12:15:29.205+00	253
5949	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-05-29 12:16:01.74+00	253
5929	[INFO] Organisation mit der id 142 gespeichert. organisationId: 142, name: R&S GOURMET EXPRESS VertriebsGmbH, comment: Webseite Ja, updateTimestamp: Mon May 22 07:49:47 UTC 2017, active: 1	2017-05-22 07:49:47.651+00	253
5930	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-05-22 17:46:50.45+00	252
5931	[INFO] Person mit der id 747 gespeichert. personId: 747, salutation: Herr, title: , firstName: Günther , lastName: Berberich, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 17:49:07.933+00	252
5932	[INFO] Person mit der id 748 gespeichert. personId: 748, salutation: Herr, title: , firstName: Günther , lastName: Berberich, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 17:49:13.507+00	252
5933	[INFO] Person mit der id 743 gespeichert. personId: 743, salutation: Frau, title: Mag., firstName: Gerhild, lastName: Hofer, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 17:51:50.4+00	252
5934	[INFO] Person mit der id 749 gespeichert. personId: 749, salutation: Herr , title: Dr. , firstName: Michael , lastName: Mayr, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 17:54:23.689+00	252
5935	[INFO] Person mit der id 750 gespeichert. personId: 750, salutation: Herr, title: MMag., firstName: Bernhard , lastName: Pichler, comment: , updateTimestamp: 2017-05-22, active: 1	2017-05-22 17:58:27.08+00	252
5936	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-05-22 18:00:14.462+00	252
5937	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-05-25 11:24:18.096+00	252
5950	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-05-29 15:59:18.106+00	252
5951	[INFO] Person mit der id 634 gespeichert. personId: 634, salutation: Frau Präsident, title: Dr., firstName: Maria, lastName: Ganauser, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 16:03:39.745+00	252
5952	[INFO] Person mit der id 749 gespeichert. personId: 749, salutation: Herr , title: Dr. , firstName: Michael , lastName: Mayr, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 16:05:08.719+00	252
5953	[INFO] Person mit der id 749 gespeichert. personId: 749, salutation: Herr , title: Dr. , firstName: Michael , lastName: Mayr, comment: , updateTimestamp: 2017-05-29, active: 1	2017-05-29 16:05:13.386+00	252
5954	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-05-30 04:07:43.251+00	519
5955	[INFO] Person mit der id 751 gespeichert. personId: 751, salutation: Herr, title: Dr. , firstName: Wolfgang, lastName: Fischer , comment: GFB & Partner Unternehmensberatung, updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:10:29.956+00	519
5956	[INFO] Person mit der id 752 gespeichert. personId: 752, salutation: Herr, title: , firstName: Josef , lastName: Kendlbacher, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:13:10.711+00	519
5957	[INFO] Person mit der id 753 gespeichert. personId: 753, salutation: Herr, title: Ing., firstName: Walter , lastName: Kogler , comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:13:43.419+00	519
5958	[INFO] Organisation mit der id 295 gespeichert. organisationId: 295, name: Schweighofer Fiber GmbH, comment: , updateTimestamp: Tue May 30 04:14:37 UTC 2017, active: 1	2017-05-30 04:14:37.301+00	519
5959	[INFO] Organisation mit der id 295 gespeichert. organisationId: 295, name: Schweighofer Fiber GmbH, comment: , updateTimestamp: Tue May 30 04:14:55 UTC 2017, active: 1	2017-05-30 04:14:55.586+00	519
5960	[INFO] Person mit der id 265 gespeichert. personId: 265, salutation: Frau, title: , firstName: , lastName: Kogler, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:15:16.488+00	519
5961	[INFO] Person mit der id 265 gelöscht	2017-05-30 04:15:26.528+00	519
5962	[INFO] Person mit der id 754 gespeichert. personId: 754, salutation: Herr, title: , firstName: Martin, lastName: Ettinger, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:16:32.582+00	519
5963	[INFO] Organisation mit der id 296 gespeichert. organisationId: 296, name: WKO Bezirksstelle Gmunden, comment: , updateTimestamp: Tue May 30 04:17:29 UTC 2017, active: 1	2017-05-30 04:17:29.552+00	519
5964	[INFO] Person mit der id 755 gespeichert. personId: 755, salutation: Herr, title: Prof. DI , firstName: Heinz , lastName: Spitzauer, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:18:54.364+00	519
5965	[INFO] Organisation mit der id 297 gespeichert. organisationId: 297, name: HTBLu VA , comment: , updateTimestamp: Tue May 30 04:20:40 UTC 2017, active: 1	2017-05-30 04:20:40.436+00	519
5966	[INFO] Person mit der id 756 gespeichert. personId: 756, salutation: Herr, title: Präsident Dr. , firstName: Axel , lastName: Greiner, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:22:30.289+00	519
5967	[INFO] Organisation mit der id 298 gespeichert. organisationId: 298, name: Industriellenvereinigung Oberösterreich, comment: , updateTimestamp: Tue May 30 04:23:21 UTC 2017, active: 1	2017-05-30 04:23:21.662+00	519
5968	[INFO] Person mit der id 756 gespeichert. personId: 756, salutation: Herr, title: Präsident Dr. , firstName: Axel , lastName: Greiner, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:23:41.511+00	519
5969	[INFO] Organisation mit der id 299 gespeichert. organisationId: 299, name: GFB & Partner Unternehmensberatung, comment: , updateTimestamp: Tue May 30 04:24:45 UTC 2017, active: 1	2017-05-30 04:24:45.797+00	519
5970	[INFO] Organisation mit der id 296 gespeichert. organisationId: 296, name: WKO Bezirksstelle Gmunden, comment: , updateTimestamp: Tue May 30 04:25:20 UTC 2017, active: 1	2017-05-30 04:25:20.308+00	519
5971	[INFO] Person mit der id 753 gespeichert. personId: 753, salutation: Herr, title: Ing., firstName: Walter , lastName: Kogler, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:26:04.374+00	519
5972	[INFO] Person mit der id 752 gespeichert. personId: 752, salutation: Herr, title: , firstName: Josef , lastName: Kendlbacher, comment: , updateTimestamp: 2017-05-30, active: 1	2017-05-30 04:26:35.03+00	519
5973	[INFO] Person mit der id 722 gelöscht	2017-05-30 04:29:50.789+00	519
5974	[INFO] Person mit der id 566 gelöscht	2017-05-30 04:41:54.977+00	519
5975	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-05-30 04:42:55.318+00	519
5976	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-05-30 04:48:27.621+00	519
5977	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-07 10:27:44.486+00	252
5978	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-07 11:03:33.73+00	252
5979	[INFO] Person mit der id 533 gespeichert. personId: 533, salutation: Herr, title: , firstName: Gerhard, lastName: Sulzer Sen., comment: , updateTimestamp: 2017-06-07, active: 1	2017-06-07 11:09:15.847+00	252
5980	[INFO] Person mit der id 533 gespeichert. personId: 533, salutation: Herr, title: , firstName: Gerhard, lastName: Sulzer Sen., comment: , updateTimestamp: 2017-06-07, active: 1	2017-06-07 11:09:20.881+00	252
5981	[INFO] Person mit der id 491 gespeichert. personId: 491, salutation: Herr, title: Mag., firstName: Christoph, lastName: Schwaiger, comment: , updateTimestamp: 2017-06-07, active: 1	2017-06-07 11:10:36.026+00	252
6045	[INFO] Warenausgang mit der id 960 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:21:24.77+00	602
5982	[INFO] Organisation mit der id 60 gespeichert. organisationId: 60, name: GREEN Egglgut, comment: , updateTimestamp: Wed Jun 07 11:13:41 UTC 2017, active: 1	2017-06-07 11:13:41.552+00	252
5983	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-08 06:36:33+00	252
5984	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-06-08 15:37:57.247+00	737
5985	[INFO] Person mit der id 673 gelöscht	2017-06-08 15:38:57.097+00	737
5986	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-06-08 15:40:41.372+00	737
5987	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-06-08 16:25:44.902+00	253
5988	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-06-08 19:34:01.999+00	253
5989	[INFO] Person mit der id 757 gespeichert. personId: 757, salutation: Frau, title: , firstName: Manuela, lastName: Rindler, comment: , updateTimestamp: 2017-06-08, active: 1	2017-06-08 19:35:54.909+00	253
5990	[INFO] Person mit der id 758 gespeichert. personId: 758, salutation: Herr, title: , firstName: Thomas, lastName: Gassner, comment: , updateTimestamp: 2017-06-08, active: 1	2017-06-08 19:37:31.85+00	253
5991	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-06-08 19:38:50.806+00	253
5992	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-09 07:13:42.224+00	252
5993	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-09 08:07:59.773+00	252
5994	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-06-09 08:09:27.782+00	252
5995	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-09 08:14:21.315+00	252
5996	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-06-11 06:55:06.915+00	519
5997	[INFO] Person mit der id 759 gespeichert. personId: 759, salutation: Frau, title: , firstName: Marion, lastName: Müller, comment: , updateTimestamp: 2017-06-11, active: 1	2017-06-11 06:57:56.203+00	519
5998	[INFO] Organisation mit der id 300 gespeichert. organisationId: 300, name: Teekanne Gesellschaft m.b.H. , comment: potentieller Lieferant - Stand 06/17, updateTimestamp: Sun Jun 11 06:59:15 UTC 2017, active: 1	2017-06-11 06:59:15.633+00	519
5999	[INFO] Organisation mit der id 301 gespeichert. organisationId: 301, name: Caros Verrührung, comment: potentieller Lieferant - Stand 06/2017, updateTimestamp: Sun Jun 11 07:00:07 UTC 2017, active: 1	2017-06-11 07:00:07.167+00	519
6000	[INFO] Organisation mit der id 302 gespeichert. organisationId: 302, name: STRASSER IMPORT-EXPORT GMBH , comment: potentieller Lieferant - Stand 06/2017, updateTimestamp: Sun Jun 11 07:00:52 UTC 2017, active: 1	2017-06-11 07:00:52.209+00	519
6001	[INFO] Person mit der id 760 gespeichert. personId: 760, salutation: Herr, title: , firstName: , lastName: Strasser, comment: , updateTimestamp: 2017-06-11, active: 1	2017-06-11 07:02:49.844+00	519
6002	[INFO] Organisation mit der id 302 gespeichert. organisationId: 302, name: STRASSER IMPORT-EXPORT GMBH , comment: potentieller Lieferant - Stand 06/2017, updateTimestamp: Sun Jun 11 07:03:20 UTC 2017, active: 1	2017-06-11 07:03:20.137+00	519
6003	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-06-11 07:09:43.239+00	519
6004	[INFO] sabine.zoepfl@gmx.at hat sich angemeldet	2017-06-12 14:36:47.051+00	602
6005	[INFO] Wareneingang mit der id 406 gespeichert	2017-06-12 14:47:48.91+00	602
6006	[INFO] Warenausgang mit der id 948 gespeichert	2017-06-12 14:50:13.828+00	602
6007	[INFO] Warenausgang mit der id 949 gespeichert	2017-06-12 14:51:32.085+00	602
6008	[INFO] Warenausgang mit der id 950 gespeichert	2017-06-12 14:53:42.019+00	602
6009	[INFO] Wareneingang mit der id 407 gespeichert	2017-06-12 14:56:38.932+00	602
6010	[INFO] Wareneingang mit der id 407 auf Archivierungsstatus 1 gesetzt	2017-06-12 14:56:45.559+00	602
6011	[INFO] Warenausgang mit der id 951 gespeichert	2017-06-12 14:57:17.037+00	602
6012	[INFO] Warenausgang mit der id 951 auf Archivierungsstatus 1 gesetzt	2017-06-12 14:57:26.443+00	602
6013	[INFO] Wareneingang mit der id 408 gespeichert	2017-06-12 15:01:08.595+00	602
6014	[INFO] Wareneingang mit der id 409 gespeichert	2017-06-12 15:02:42.137+00	602
6015	[INFO] Wareneingang mit der id 409 gespeichert	2017-06-12 15:03:36.128+00	602
6016	[INFO] Wareneingang mit der id 410 gespeichert	2017-06-12 15:05:29.398+00	602
6017	[INFO] Warenausgang mit der id 952 gespeichert	2017-06-12 15:07:05.373+00	602
6018	[INFO] Warenausgang mit der id 953 gespeichert	2017-06-12 15:07:36.79+00	602
6019	[INFO] Warenausgang mit der id 952 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:08:06.495+00	602
6020	[INFO] Warenausgang mit der id 953 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:08:11.339+00	602
6021	[INFO] Warenausgang mit der id 954 gespeichert	2017-06-12 15:09:07.345+00	602
6022	[INFO] Warenausgang mit der id 955 gespeichert	2017-06-12 15:10:02.568+00	602
6023	[INFO] Warenausgang mit der id 954 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:10:12.551+00	602
6024	[INFO] Warenausgang mit der id 955 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:10:17.331+00	602
6025	[INFO] Warenausgang mit der id 956 gespeichert	2017-06-12 15:10:53.459+00	602
6026	[INFO] Warenausgang mit der id 956 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:11:01.621+00	602
6027	[INFO] Wareneingang mit der id 408 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:13:42.362+00	602
6028	[INFO] Wareneingang mit der id 409 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:13:45.976+00	602
6029	[INFO] Wareneingang mit der id 410 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:13:51.656+00	602
6030	[INFO] Wareneingang mit der id 411 gespeichert	2017-06-12 15:15:39.83+00	602
6031	[INFO] Warenausgang mit der id 957 gespeichert	2017-06-12 15:16:07.777+00	602
6032	[INFO] Warenausgang mit der id 957 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:16:17.582+00	602
6033	[INFO] Wareneingang mit der id 411 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:16:32.463+00	602
6034	[INFO] Wareneingang mit der id 412 gespeichert	2017-06-12 15:17:22.701+00	602
6035	[INFO] Wareneingang mit der id 412 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:17:28.589+00	602
6036	[INFO] Warenausgang mit der id 958 gespeichert	2017-06-12 15:17:59.27+00	602
6037	[INFO] Warenausgang mit der id 958 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:18:05.45+00	602
6038	[INFO] Wareneingang mit der id 413 gespeichert	2017-06-12 15:19:04.828+00	602
6039	[INFO] Wareneingang mit der id 413 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:19:10.308+00	602
6040	[INFO] Warenausgang mit der id 959 gespeichert	2017-06-12 15:19:39.023+00	602
6041	[INFO] Warenausgang mit der id 959 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:19:44.377+00	602
6042	[INFO] Wareneingang mit der id 414 gespeichert	2017-06-12 15:20:44.324+00	602
6043	[INFO] Wareneingang mit der id 414 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:20:49.406+00	602
6044	[INFO] Warenausgang mit der id 960 gespeichert	2017-06-12 15:21:14.764+00	602
6046	[INFO] Wareneingang mit der id 415 gespeichert	2017-06-12 15:22:14.441+00	602
6047	[INFO] Wareneingang mit der id 415 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:22:22.373+00	602
6051	[INFO] Wareneingang mit der id 416 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:23:51.512+00	602
6064	[INFO] Warenausgang mit der id 965 gespeichert	2017-06-12 15:29:07.63+00	602
6065	[INFO] Warenausgang mit der id 965 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:29:15.499+00	602
6068	[INFO] Warenausgang mit der id 966 gespeichert	2017-06-12 15:30:53.543+00	602
6080	[INFO] Wareneingang mit der id 421 gespeichert	2017-06-12 15:36:32.156+00	602
6081	[INFO] Wareneingang mit der id 421 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:36:38.91+00	602
6082	[INFO] Warenausgang mit der id 972 gespeichert	2017-06-12 15:37:06.719+00	602
6084	[INFO] Warenausgang mit der id 974 gespeichert	2017-06-12 15:38:17.988+00	602
6085	[INFO] Warenausgang mit der id 972 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:38:32.076+00	602
6086	[INFO] Warenausgang mit der id 973 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:38:37.251+00	602
6087	[INFO] Warenausgang mit der id 974 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:38:40.889+00	602
6088	[INFO] Wareneingang mit der id 422 gespeichert	2017-06-12 15:39:18.138+00	602
6089	[INFO] Wareneingang mit der id 422 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:39:26.221+00	602
6090	[INFO] Warenausgang mit der id 975 gespeichert	2017-06-12 15:39:58.627+00	602
6096	[INFO] Warenausgang mit der id 977 gespeichert	2017-06-12 15:41:56.822+00	602
6097	[INFO] Warenausgang mit der id 978 gespeichert	2017-06-12 15:42:27.636+00	602
6102	[INFO] Wareneingang mit der id 424 gespeichert	2017-06-12 15:44:20.289+00	602
6103	[INFO] Wareneingang mit der id 424 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:44:26.518+00	602
6107	[INFO] Warenausgang mit der id 983 gespeichert	2017-06-12 15:46:11.559+00	602
6048	[INFO] Warenausgang mit der id 961 gespeichert	2017-06-12 15:22:45.714+00	602
6052	[INFO] Warenausgang mit der id 962 gespeichert	2017-06-12 15:24:34.082+00	602
6053	[INFO] Warenausgang mit der id 962 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:24:46.806+00	602
6056	[INFO] Warenausgang mit der id 963 gespeichert	2017-06-12 15:25:59.25+00	602
6057	[INFO] Warenausgang mit der id 963 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:26:11.822+00	602
6062	[INFO] Wareneingang mit der id 419 gespeichert	2017-06-12 15:28:38.041+00	602
6063	[INFO] Wareneingang mit der id 419 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:28:43.355+00	602
6069	[INFO] Warenausgang mit der id 967 gespeichert	2017-06-12 15:31:25.06+00	602
6071	[INFO] Warenausgang mit der id 969 gespeichert	2017-06-12 15:32:52.355+00	602
6072	[INFO] Warenausgang mit der id 970 gespeichert	2017-06-12 15:33:25.195+00	602
6083	[INFO] Warenausgang mit der id 973 gespeichert	2017-06-12 15:37:41.219+00	602
6105	[INFO] Warenausgang mit der id 981 gespeichert	2017-06-12 15:45:29.057+00	602
6108	[INFO] Warenausgang mit der id 984 gespeichert	2017-06-12 15:47:03.859+00	602
6117	[INFO] Organisation mit der id 303 gespeichert. organisationId: 303, name: Dorfkäserei Pötzelsberger, comment: potentieller Lieferant - 06/2017, updateTimestamp: Tue Jun 13 10:34:55 UTC 2017, active: 1	2017-06-13 10:34:55.556+00	519
6049	[INFO] Warenausgang mit der id 961 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:22:52.518+00	602
6050	[INFO] Wareneingang mit der id 416 gespeichert	2017-06-12 15:23:43.333+00	602
6058	[INFO] Wareneingang mit der id 418 gespeichert	2017-06-12 15:27:02.358+00	602
6059	[INFO] Wareneingang mit der id 418 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:27:07.909+00	602
6066	[INFO] Wareneingang mit der id 420 gespeichert	2017-06-12 15:30:16.669+00	602
6067	[INFO] Wareneingang mit der id 420 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:30:28.696+00	602
6070	[INFO] Warenausgang mit der id 968 gespeichert	2017-06-12 15:32:00.616+00	602
6095	[INFO] Wareneingang mit der id 423 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:41:30.007+00	602
6104	[INFO] Warenausgang mit der id 980 gespeichert	2017-06-12 15:44:56.236+00	602
6109	[INFO] Warenausgang mit der id 985 gespeichert	2017-06-12 15:47:38.688+00	602
6110	[INFO] Warenausgang mit der id 982 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:47:54.429+00	602
6111	[INFO] Warenausgang mit der id 984 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:47:58.632+00	602
6112	[INFO] Warenausgang mit der id 983 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:48:02.57+00	602
6113	[INFO] Warenausgang mit der id 980 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:48:06.846+00	602
6114	[INFO] Warenausgang mit der id 985 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:48:10.624+00	602
6115	[INFO] Warenausgang mit der id 981 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:48:14.139+00	602
6116	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-06-13 10:32:43.597+00	519
6054	[INFO] Wareneingang mit der id 417 gespeichert	2017-06-12 15:25:26.628+00	602
6055	[INFO] Wareneingang mit der id 417 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:25:34.52+00	602
6060	[INFO] Warenausgang mit der id 964 gespeichert	2017-06-12 15:27:43.959+00	602
6061	[INFO] Warenausgang mit der id 964 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:27:53.701+00	602
6073	[INFO] Warenausgang mit der id 971 gespeichert	2017-06-12 15:33:54.187+00	602
6074	[INFO] Warenausgang mit der id 966 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:34:09.642+00	602
6075	[INFO] Warenausgang mit der id 967 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:34:13.214+00	602
6076	[INFO] Warenausgang mit der id 968 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:34:16.748+00	602
6077	[INFO] Warenausgang mit der id 969 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:34:20.963+00	602
6078	[INFO] Warenausgang mit der id 970 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:34:24.82+00	602
6079	[INFO] Warenausgang mit der id 971 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:34:30.707+00	602
6091	[INFO] Warenausgang mit der id 976 gespeichert	2017-06-12 15:40:30.868+00	602
6092	[INFO] Warenausgang mit der id 975 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:40:42.04+00	602
6093	[INFO] Warenausgang mit der id 976 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:40:46.19+00	602
6094	[INFO] Wareneingang mit der id 423 gespeichert	2017-06-12 15:41:23.008+00	602
6098	[INFO] Warenausgang mit der id 979 gespeichert	2017-06-12 15:43:02.74+00	602
6099	[INFO] Warenausgang mit der id 977 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:43:17.622+00	602
6100	[INFO] Warenausgang mit der id 978 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:43:21.43+00	602
6101	[INFO] Warenausgang mit der id 979 auf Archivierungsstatus 1 gesetzt	2017-06-12 15:43:25.127+00	602
6106	[INFO] Warenausgang mit der id 982 gespeichert	2017-06-12 15:45:29.105+00	602
6118	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-18 21:02:34.232+00	252
6119	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-18 21:07:24.041+00	252
6120	[INFO] Person mit der id 244 gespeichert. personId: 244, salutation: Frau, title: Dipl.Kauf., firstName: Trude, lastName: Kaindl-Hönig, comment: , updateTimestamp: 2017-06-18, active: 1	2017-06-18 21:10:15.396+00	252
6121	[INFO] Person mit der id 244 gespeichert. personId: 244, salutation: Frau, title: Dipl.Kauf., firstName: Trude, lastName: Kaindl-Hönig, comment: , updateTimestamp: 2017-06-18, active: 1	2017-06-18 21:10:21.234+00	252
6122	[INFO] Person mit der id 244 gespeichert. personId: 244, salutation: Frau, title: Dipl.Kauf., firstName: Trude, lastName: Kaindl-Hönig, comment: , updateTimestamp: 2017-06-18, active: 1	2017-06-18 21:11:22.485+00	252
6123	[INFO] Person mit der id 244 gespeichert. personId: 244, salutation: Frau, title: Dipl.Kauf., firstName: Trude, lastName: Kaindl-Hönig, comment: , updateTimestamp: 2017-06-18, active: 1	2017-06-18 21:11:27.93+00	252
6124	[INFO] Person mit der id 241 gespeichert. personId: 241, salutation: Frau, title: , firstName: Helga, lastName: Jungreithmayr, comment: , updateTimestamp: 2017-06-18, active: 1	2017-06-18 21:14:15.415+00	252
6125	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-19 19:40:58.394+00	252
6126	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-19 19:41:54.614+00	252
6127	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-06-21 07:03:34.859+00	253
6128	[INFO] Person mit der id 592 gelöscht	2017-06-21 07:04:16.7+00	253
6129	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-06-21 07:05:52.079+00	253
6130	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-06-21 07:05:54.488+00	253
6131	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-22 06:27:53.9+00	252
6132	[INFO] Person mit der id 710 gespeichert. personId: 710, salutation: Herr, title: , firstName: Otmar, lastName: Wimmer, comment: , updateTimestamp: 2017-06-22, active: 1	2017-06-22 06:34:48.722+00	252
6133	[INFO] Person mit der id 710 gespeichert. personId: 710, salutation: Herr, title: , firstName: Otmar, lastName: Wimmer, comment: , updateTimestamp: 2017-06-22, active: 1	2017-06-22 06:36:03.439+00	252
6134	[INFO] Person mit der id 710 gespeichert. personId: 710, salutation: Herr, title: , firstName: Otmar, lastName: Wimmer, comment: , updateTimestamp: 2017-06-22, active: 1	2017-06-22 06:36:43.644+00	252
6135	[INFO] Person mit der id 761 gespeichert. personId: 761, salutation: Frau , title: , firstName: Petra , lastName: Mitiska, comment: , updateTimestamp: 2017-06-22, active: 1	2017-06-22 06:44:42.517+00	252
6136	[INFO] Person mit der id 762 gespeichert. personId: 762, salutation: Herr, title: , firstName: Martin, lastName: Herbst, comment: , updateTimestamp: 2017-06-22, active: 1	2017-06-22 06:46:16.354+00	252
6137	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-06-22 06:46:52.762+00	252
6138	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-06-26 06:55:49.919+00	737
6139	[INFO] Person mit der id 763 gespeichert. personId: 763, salutation: Herr, title: Dr., firstName: Rudolf, lastName: Stadler, comment: , updateTimestamp: 2017-06-26, active: 1	2017-06-26 06:57:30.287+00	737
6140	[INFO] Person mit der id 763 gespeichert. personId: 763, salutation: Herr, title: Dr., firstName: Rudolf, lastName: Stadler, comment: , updateTimestamp: 2017-06-26, active: 1	2017-06-26 06:57:52.045+00	737
6141	[INFO] Person mit der id 763 gespeichert. personId: 763, salutation: Herr, title: Dr., firstName: Rudolf, lastName: Stadler, comment: 23.6.2017, updateTimestamp: 2017-06-26, active: 1	2017-06-26 06:58:16.935+00	737
6142	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-06-26 07:00:01.444+00	737
6143	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-06-26 15:13:10.723+00	253
6144	[INFO] Person mit der id 764 gespeichert. personId: 764, salutation: Herr, title: Dr., firstName: Rudolf, lastName: Stadler, comment: , updateTimestamp: 2017-06-26, active: 1	2017-06-26 15:14:53.791+00	253
6145	[INFO] Person mit der id 764 gelöscht	2017-06-26 15:16:01.286+00	253
6146	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-06-26 15:16:47.356+00	253
6147	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-06-26 18:06:59.222+00	519
6148	[INFO] Person mit der id 765 gespeichert. personId: 765, salutation: Herr, title: Dr, firstName: Rudolf, lastName: Stadler, comment: Beitritt 23 06 17, updateTimestamp: 2017-06-26, active: 1	2017-06-26 18:10:26.523+00	519
6149	[INFO] Person mit der id 765 gelöscht	2017-06-26 18:11:03.463+00	519
6150	[INFO] Person mit der id 274 gelöscht	2017-06-26 18:15:10.795+00	519
6151	[INFO] Person mit der id 766 gespeichert. personId: 766, salutation: , title: , firstName: Alexander, lastName: Koppensteiner, comment: , updateTimestamp: 2017-06-26, active: 1	2017-06-26 18:28:16.331+00	519
6152	[INFO] Organisation mit der id 145 gespeichert. organisationId: 145, name: Reckitt Benckiser Switzerland AG, comment: , updateTimestamp: Mon Jun 26 18:29:12 UTC 2017, active: 1	2017-06-26 18:29:12.284+00	519
6153	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-27 12:58:48.065+00	252
6154	[INFO] Person mit der id 533 gespeichert. personId: 533, salutation: Herr, title: , firstName: Gerhard, lastName: Sulzer Sen., comment: , updateTimestamp: 2017-06-27, active: 1	2017-06-27 13:03:14.759+00	252
6155	[INFO] Person mit der id 533 gespeichert. personId: 533, salutation: Herr, title: , firstName: Gerhard, lastName: Sulzer Sen., comment: , updateTimestamp: 2017-06-27, active: 1	2017-06-27 13:03:19.762+00	252
6156	[INFO] Person mit der id 533 gespeichert. personId: 533, salutation: Herr, title: , firstName: Gerhard, lastName: Sulzer Sen., comment: , updateTimestamp: 2017-06-27, active: 1	2017-06-27 13:04:16.572+00	252
6157	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-06-30 20:57:26.657+00	252
6158	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-06-30 20:58:22.222+00	252
6159	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-07-05 16:47:29.127+00	252
6160	[INFO] Person mit der id 761 gespeichert. personId: 761, salutation: Frau , title: , firstName: Petra , lastName: Mitiska, comment: , updateTimestamp: 2017-07-05, active: 1	2017-07-05 16:51:45.437+00	252
6161	[INFO] Person mit der id 761 gespeichert. personId: 761, salutation: Frau , title: , firstName: Petra , lastName: Mitiska, comment: , updateTimestamp: 2017-07-05, active: 1	2017-07-05 16:51:51.304+00	252
6162	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-07-05 16:52:53.378+00	252
6163	[INFO] albert.kiefel@view-salzburg.at hat sich angemeldet	2017-07-10 05:40:28.627+00	253
6164	[INFO] albert.kiefel@view-salzburg.at hat sich abgemeldet	2017-07-10 05:42:11.546+00	253
6165	[INFO] michael.steingassner@view-salzburg.at hat sich angemeldet	2017-07-10 07:18:17.864+00	519
6166	[INFO] michael.steingassner@view-salzburg.at hat sich abgemeldet	2017-07-10 07:19:39.891+00	519
6167	[INFO] angela.simmel@gmail.com hat sich angemeldet	2017-07-10 13:34:35.321+00	737
6168	[INFO] angela.simmel@gmail.com hat sich abgemeldet	2017-07-10 13:46:54.592+00	737
6169	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-07-13 15:17:57.053+00	252
6170	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-07-13 15:18:31.797+00	252
6171	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-07-14 15:58:44.241+00	252
6172	[INFO] Person mit der id 767 gespeichert. personId: 767, salutation: Herr, title: Dipl.Ing., firstName: Martin, lastName: Mayrhofer-Reinhartshuber, comment: , updateTimestamp: 2017-07-14, active: 1	2017-07-14 16:02:53.729+00	252
6173	[INFO] Person mit der id 768 gespeichert. personId: 768, salutation: Herr, title: , firstName: Dominik, lastName: Mayer, comment: , updateTimestamp: 2017-07-14, active: 1	2017-07-14 16:04:47.746+00	252
6174	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-07-14 17:29:21.478+00	252
6175	[INFO] Person mit der id 769 gespeichert. personId: 769, salutation: Herr, title: , firstName: Tobi, lastName: Ullrich, comment: , updateTimestamp: 2017-07-14, active: 1	2017-07-14 17:31:33.83+00	252
6176	[INFO] Person mit der id 770 gespeichert. personId: 770, salutation: Herr, title: , firstName: Tobi, lastName: Ullrich, comment: , updateTimestamp: 2017-07-14, active: 1	2017-07-14 17:31:39.608+00	252
6177	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-07-17 19:54:46.712+00	252
6178	[INFO] doris.kiefel@view-salzburg.at hat sich abgemeldet	2017-07-17 19:56:32.245+00	252
6179	[INFO] doris.kiefel@view-salzburg.at hat sich angemeldet	2017-07-21 08:50:46.102+00	252
\.


--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 198
-- Name: logging_logging_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('logging_logging_id_seq', 6179, true);


--
-- TOC entry 3249 (class 0 OID 420612)
-- Dependencies: 199
-- Data for Name: organisation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organisation (organisation_id, address_id, city_id, country_id, person_id, name, comment, update_timestamp, active) FROM stdin;
2	374	42	2	1	ABZ St. Josef		2015-02-24	1
241	563	42	\N	519	Stadtlesen VeranstaltungsGmbH	keine Post - richtige Organisation ist Innovationswerkstatt	2016-10-03	0
242	565	116	\N	345	Ökosoziales Forum Österreich|Europa		2015-05-20	1
22	427	53	2	345	C+C Pfeiffer Salzburg		2016-10-07	1
10	308	24	3	1	AWO Seniorenzentrum Bürgerstift		2015-02-24	1
18	359	139	3	345	Bergader Privatkäserei GmbH		2016-10-07	1
32	\N	\N	2	252	Ehrenamtliches Team Obertrum	HFA ok	2016-10-08	1
95	372	31	2	252	Landesberufsschulheim Hallein 	HFA ok	2016-10-08	1
36	450	68	2	252	Essen und Leben		2016-10-10	1
20	281	28	2	1	Biofit Naturprodukte \nGmbH & Co KG		2015-02-24	1
21	311	82	2	1	Blumen und Gartendesign		2015-02-24	1
90	662	143	2	252	Land-Leben Nahrungsmittel GmbH	Webseite Ja	2017-01-04	1
77	478	94	2	345	J. Gschwandtner ImportGmbH.		2016-11-12	0
25	257	42	2	1	clearwhite GmbH		2015-02-24	1
27	272	42	2	1	CREDIT SUISSE		2015-02-24	1
31	282	103	3	1	Eberl Internationale Spedition		2015-02-24	1
91	240	42	2	519	Landwirtschaftskammer Salzburg		2016-12-01	1
33	370	83	2	1	Erste Steirische Kochschule		2015-02-24	1
187	378	71	2	1	Servus TV		2015-02-24	1
11	355	44	2	519	Bäckerei Schmidhuber	Backstube in der Bäckerkellerstraße 9	2017-05-08	1
48	409	63	2	1	Frigologo Kühllogistik GmbH		2015-02-24	1
49	243	42	2	1	Gallbauer Event- & Officecatering GmbH		2015-02-24	1
50	407	42	2	1	Gärtnerei Aiglhof		2015-02-24	1
52	390	39	2	1	Geislinger GmbH		2015-02-24	1
54	8	5	2	1	Gemeinde Lamprechtshausen		2015-02-24	1
55	387	42	2	1	Generali Versicherung AG		2015-02-24	1
58	381	59	2	1	GLASERITALIA GMBH		2015-02-24	1
59	87	32	2	1	Gmachl Hotel	Webseite Ja	2015-02-24	1
64	340	67	2	1	HBLA Elisabethinum St. Johann		2015-02-24	1
60	471	31	2	252	GREEN Egglgut		2017-06-07	1
68	391	48	2	1	Hotel Iris Porsche		2015-02-24	1
69	290	42	2	1	Hotel Schaffenrath		2015-02-24	1
72	272	42	2	1	innocent Alps GmbH		2015-02-24	1
79	363	42	2	1	Katholische Frauenbewegung		2015-02-24	1
85	417	42	2	1	Kunstgärtnerei Doll GmbH		2015-02-24	1
86	426	61	2	1	L.P. Logistik Ges.m.b.H		2015-02-24	1
87	361	42	2	1	La Vie	Webseite ja	2015-02-24	1
88	446	72	2	1	Laboratis HandelsgmbH		2015-02-24	1
89	293	42	2	1	Lagermax Int. Spedition GmbH		2015-02-24	1
57	410	11	2	1	Gittis Naturprodukte		2015-04-14	1
93	347	81	3	1	Laufener Tafel		2015-02-24	1
28	402	79	2	1	dm drogerie markt GmbH		2015-04-21	0
29	467	85	2	1	DONAU Versicherung AG		2015-04-21	1
37	341	32	2	1	Eurogast Österreich GmbH		2015-04-21	0
39	318	42	2	1	Fa. ABA Österreichs Ansiedlungsberater	Newsletter: nein	2015-04-21	0
40	468	42	2	1	Fakultätsbibliothek für Rechtswissenschaften		2015-04-21	1
61	272	42	2	1	Großglockner Hochalpenstraßen AG	Newsletter: nein	2015-04-21	1
67	473	84	2	1	Hipp Gmbh & Co Export KG	Webseite Ja	2015-04-21	1
76	477	39	2	1	Institut für Management GmbH		2015-04-21	1
78	262	80	2	1	Johann Schallmoser GmbH & Co KG	Webseite Ja	2015-04-21	0
84	481	32	2	1	Kühne & Nagel GmbH		2015-04-21	1
41	403	42	2	345	Format Orange	Webseite: Ja	2015-05-15	1
3	275	32	2	345	ADEG Österreich HandelsAG		2015-05-15	1
14	71	16	2	345	Bauer & Thürridl HandelsGmbH		2015-05-15	1
19	438	56	2	345	Bio-Nahrungsmittel GmbH		2015-05-15	1
26	409	63	2	345	Concept Fresh VertriebsGmbH		2015-05-15	1
35	270	42	2	345	Erzdiözese Salzburg		2015-05-15	1
43	375	42	2	345	Franz Gramiller & Sohn GmbH		2015-05-15	1
51	558	42	2	345	Gebrüder Weiss GmbH		2015-05-15	1
53	328	31	2	345	Geissler Cosmetics GmbH	Webseite: Ja	2015-05-15	1
4	188	42	2	345	Adhurricane Advertising GmbH	Webseite: Ja	2015-05-15	1
30	323	42	2	345	Dr.-Viktor-Freiherr-von-Fuchs-Stiftung	Webseite: Ja	2015-05-15	1
42	297	28	2	345	Foto Sulzer	Webseite: Ja	2015-05-15	1
70	560	42	2	345	IBM Salzburg		2015-05-15	1
108	487	42	2	345	Manfred Roth BackwarenerzeugungsGmbH	Webseite offen	2015-05-20	1
12	139	42	2	519	Barmherzige Schwestern	HFA ok	2016-09-08	1
23	439	47	2	519	Caritas Altenpension	HFA ok	2016-09-08	1
24	432	42	2	519	Caritas Flüchtlingshaus	HFA ok	2016-09-08	1
44	264	42	2	519	Franziskaner Kloster Salzburg	HFA ok	2016-09-08	1
45	469	31	2	519	Frauenhaus Hallein - Haus Mirjam	HFA ok	2016-09-08	1
46	413	42	2	519	Frauenhaus Salzburg GmbH	HFA ok	2016-09-08	1
63	298	92	2	519	HBLA Ursprung	HFA ok	2016-09-08	1
65	317	97	3	519	Heilpädagogisches Zentrum BGL	HFA ok	2016-09-08	1
74	309	42	2	519	INSEL - Haus der Jugend	HFA ok	2016-09-08	1
81	479	42	2	519	Kolpinghaus Salzburg	HFA ok	2016-09-08	1
82	480	58	2	519	Konradinum Eugendorf	HFA ok	2016-09-08	1
83	300	42	2	519	Konvent der Franziskanerinnen	HFA ok	2016-09-08	1
92	357	31	2	519	Laube Sozial-Psychiatrische Aktivitäten GmbH	HFA ok	2016-09-08	1
118	620	42	2	252	Nähr-Engel GmbH		2016-09-24	1
6	322	42	2	252	Aktion Leben		2016-09-25	1
66	585	42	2	252	Freiwilligenzentrum Salzburg		2016-09-25	1
75	436	93	2	253	Institut für Abfallwirtschaft		2016-09-25	1
71	564	42	2	519	Industriellenvereinigung		2016-09-26	1
8	358	58	2	1	Altenwohnhaus St. Martin		2016-09-26	0
15	416	42	2	1	Benediktinen Frauenstift Nonnberg		2016-09-26	0
34	453	101	2	1	Erzabtei  Stift Sankt Peter		2016-09-26	0
80	437	47	2	1	Kloster Goldenstein - Hauptschule		2016-09-26	0
17	465	86	3	1	Berchtesgadener Tafel		2016-09-26	0
123	261	42	2	345	NÜRNBERGER Versicherung AG	Webseite Ja	2015-05-20	1
125	265	63	2	345	Öller-Brandstätter HandelsGmbH		2015-05-20	1
102	396	53	2	345	LFS Klessheim		2016-10-07	1
56	470	42	2	345	Pappas AutomobilvertriebsGmbH	Webseite ja	2015-05-20	1
105	88	42	2	1	Lorentschitsch GmbH Computer Center	Webseite Ja	2015-02-24	1
244	567	117	\N	345	SKIDATA AG		2015-05-20	1
110	343	76	2	1	Meggle - Verkaufsleitung Österreich		2015-02-24	1
111	373	42	2	1	Mercedes-Benz Österreich	Webseite Ja	2015-02-24	1
172	291	42	2	1	Seniorenheim Hellbrunn		2015-06-23	0
113	425	42	2	1	Michael Neugebauer Edition		2015-02-24	1
173	286	42	2	1	Seniorenheim Itzling		2015-06-23	0
174	336	42	2	1	Seniorenheim Liefering		2015-06-23	0
117	335	97	3	1	Molkerei-Vertrieb Piding EG		2015-02-24	1
177	506	42	2	1	Seniorenheim Taxham		2015-06-23	0
120	315	73	2	1	Nehemia Hilfswerk Österreich		2015-02-24	1
112	489	53	2	345	Metro Cash & Carry Österrreich GmbH	Webseite Ja	2016-10-07	1
126	320	100	2	1	ORA International Österreich		2015-02-24	1
130	444	66	2	1	PAN&CO Success MarketingUnternehmensberatungsges.mbH		2015-02-24	1
133	393	42	2	1	Pfarrquelle Parsch		2015-02-24	1
134	366	97	3	1	Pidinger Werkstätten GmbH		2015-02-24	1
136	406	46	2	1	Pölzleitner Transport GmbH		2015-02-24	1
137	305	42	2	1	Pöyry Infra Gmbh		2015-02-24	1
139	428	95	2	1	QimiQ Handels GmbH	Webseite Ja	2015-02-24	1
140	339	32	2	1	Quehenberger Logistics GmbH Bergheim		2015-02-24	1
144	415	27	2	1	Raps GmbH		2015-02-24	1
147	440	42	2	1	Referat für Katholische Privatschulen		2015-02-24	1
158	368	53	2	345	Salzburger Agrarmarketing		2016-10-07	1
178	451	53	2	345	Seniorenheim Wals		2016-10-07	1
152	294	56	2	1	Rudolf Ölz Meisterbäcker GmbH	Webseite Ja	2015-02-24	1
116	292	53	2	345	Moderne Gartechnik Anner GmbH	Webseite Ja	2016-10-07	1
175	405	63	2	345	Seniorenheim Seekirchen	HFA ok	2016-10-07	1
161	431	101	2	1	Salzburger Landesregierung		2015-02-24	1
163	306	42	2	1	Salzburger Woche		2015-02-24	1
166	353	32	2	1	Schenker & Co. AG		2015-02-24	1
167	329	42	2	1	Schmankerl		2015-02-24	1
168	418	102	2	1	Seniorenheim Golling		2015-02-24	1
169	330	56	2	1	Seniorenheim Grödig		2015-02-24	1
171	419	95	2	1	Seniorenheim Haus St. Sebastian		2015-02-24	1
190	646	51	2	345	SOLEart  Straßwalchen	HFA ok	2016-10-09	1
180	285	46	2	1	Seniorenwohnhaus Neumarkt		2015-02-24	1
181	422	59	2	1	Seniorenwohnhaus Straßwalchen		2015-02-24	1
182	398	70	2	1	Seniorenwohnheim Abtenau		2015-02-24	1
183	325	52	2	1	Seniorenwohnheim Bürmoos		2015-02-24	1
184	260	13	2	1	Seniorenwohnheim Oberndorf		2015-02-24	1
143	319	42	2	519	Raiffeisenverband Salzburg		2016-10-13	1
235	653	42	\N	252	Kuratorium für Journalistenausbildung		2016-10-20	1
164	505	42	2	252	SalzburgMilch GmbH	Webseite Ja	2016-10-24	1
156	400	28	2	252	Salzburg Patisserie GmbH	Webseite Ja	2016-11-10	1
124	495	42	2	1	ÖAMTC Salzburg	Webseite ja	2015-04-21	1
127	496	42	2	1	ORF Salzburg		2015-04-21	1
131	498	42	2	1	Pfarre St. Martin		2015-04-21	1
135	302	42	2	1	Pieper Naturkosmetik & ätherische Öle		2015-04-21	0
121	494	42	2	519	Neustart Saftladen	HFA ok	2016-12-01	1
103	288	42	2	345	Lions Club Elsbethen	Kontakt über Walter Riezinger	2015-05-15	1
149	303	42	2	1	Reiter Offset	Webseite ja	2015-04-21	0
151	502	31	2	1	REWE International AG		2015-04-21	1
145	501	88	4	519	Reckitt Benckiser Switzerland AG		2017-06-26	1
104	658	42	2	519	Logwin Road + Rail Austria Gmbh		2016-12-03	1
162	306	42	2	1	Salzburger Nachrichten	Webseite Ja	2015-04-21	1
179	507	78	2	1	Seniorenwohnhaus Köstendorf		2015-04-21	1
186	508	32	2	1	Seniorenzentrum Bergheim		2015-04-21	1
188	457	62	2	1	SIG Stadt Salzburg Immobilien Gmbh		2015-04-21	1
146	240	62	2	1	Redaktion   “Salzburger Bauer”		2015-04-22	0
154	384	104	2	345	S. SPITZ GmbH		2015-05-15	1
239	497	42	\N	345	Salzburger Seniorenbund		2015-05-20	1
245	568	62	\N	345	Stadt Salzburg - Magistrat 		2015-05-20	1
195	258	42	2	1	SportImPuls Verlags- & Marketing GmbH		2015-02-24	1
157	324	56	2	345	Salzburg Schokolade GmbH	Webseite: ja	2016-08-18	1
98	338	42	2	519	Lebenshilfe Kindergarten	HFA ok	2016-09-08	1
249	260	13	2	519	Lebenshilfe Oberndorf	HFA ok	2016-09-08	1
99	433	51	2	519	Lebenshilfe Straßwalchen	HFA ok	2016-09-08	1
100	365	42	2	519	Lebenshilfe Wohnhaus	HFA ok	2016-09-08	1
101	348	42	2	519	Lebensküche GmbH	HFA ok	2016-09-08	1
138	499	42	2	519	pro mente plus Neuland	HFA ok	2016-09-08	1
148	352	69	3	519	Reichenhaller Tafel	HFA ok	2016-09-08	1
153	412	42	2	519	Russisch-Orthodoxe Kirche	HFA ok	2016-09-08	1
185	321	72	2	519	Seniorenwohnheim St. Gilgen	nicht mehr aktuell, löschen?\n	2016-09-12	0
106	485	42	2	345	Loretto St Maria Frauenkloster	HFA ok	2016-09-24	1
119	493	44	2	253	Nannerl Gmbh & Co KG	Webseite Ja	2016-09-25	1
128	497	42	2	1	ÖVP Salzburg		2016-09-25	0
159	621	42	2	253	Salzburger Bildungswerk		2016-09-25	1
160	146	42	2	252	Salzburger Hilfswerk	HFA ok	2016-09-26	1
165	414	31	2	252	San Helios	HFA ok	2016-09-26	1
107	486	65	2	1	LWS Winklhof		2016-09-26	0
150	411	72	2	519	Rettet das Kind - BAZ St. Gilgen	HFA ok	2016-09-26	0
170	434	6	2	1	Seniorenheim Großgmain		2016-09-26	0
197	420	42	2	1	St. Peter Stiftsbäckerei	Webseite Ja\nZufahrt Kapitelplatz 8, \nMittwochs Salzachmühle Aiglhof	2015-02-24	1
198	568	62	2	345	Stadt Salzburg - Stadtsenat		2015-05-20	1
219	497	42	2	345	Wirtschaftsbund Salzburg		2016-09-29	1
212	458	31	2	1	Volksschule Hallein Burgfried		2016-09-30	0
206	259	98	2	1	Unilever Foodsolutions	Webseite Ja	2015-02-24	1
246	570	31	\N	345	Werner&Mertz Professional VertriebsGmbH		2015-05-20	1
247	571	118	\N	345	Wirtschaftskammer Österreich 		2015-05-20	1
251	580	123	2	253	Billa Elixhausen		2015-06-10	1
215	307	42	2	1	WIFF	Webseite ja	2015-02-24	1
216	310	42	2	1	Wildenhofer GmbH		2015-02-24	1
196	453	42	2	1	St. Peter - Kloster		2016-09-30	0
218	299	42	2	1	Winternotschlafstelle Caritas		2015-02-24	1
280	641	42	\N	519	Verein menschen.leben Hayat Schallmoos	HFA ok	2016-10-04	1
222	454	42	2	1	ZUPmedia Dienstleistungs OG		2015-02-24	1
203	313	65	2	1	TRAFFIX Verkehrsplanung GmbH		2015-03-26	1
250	578	53	2	345	Lebenshilfe Wals	HFA ok	2016-10-07	1
224	\N	107	2	252	SOMA Linz		2015-04-10	1
114	490	53	2	345	MIELE Gesellschaft m.b.H.		2016-10-07	1
266	610	63	2	345	Öller Brandstätter		2016-10-07	1
7	399	42	2	1	Alpenländischer Kreditorenverband		2015-02-24	1
5	464	32	2	1	AGM		2015-04-21	1
192	511	63	2	345	SOS-Kinderdorf Seekirchen	HFA ok	2016-10-07	1
237	561	42	\N	345	Rieger Weinloft		2015-05-15	1
228	474	42	2	1	Hotel Heffterhof		2015-04-21	1
96	483	61	2	252	Landesberufsschulheim Obertrum 	HFA ok	2016-10-08	1
213	519	42	2	252	Wärmestube	HFA ok	2016-10-21	1
225	\N	\N	\N	252	Rollende Herzen		2017-03-30	1
189	509	42	2	1	Smartfood Vertriebs GmbH		2015-04-21	1
208	517	42	2	345	Verein für Alleinerziehende		2017-04-27	0
142	295	53	2	253	R&S GOURMET EXPRESS VertriebsGmbH	Webseite Ja	2017-05-22	1
62	346	42	2	345	Halleiner Schwestern Franziskanerinnen		2015-08-25	0
201	514	42	2	1	TEEKANNE  GmbH		2015-04-21	1
207	516	42	2	1	Uniqa Versicherungen AG		2015-04-21	1
238	562	42	\N	345	Salzburger Bauernbund		2015-05-15	1
221	521	44	2	1	Zaltech GmbH & Co KG	Webseite Ja	2015-04-21	1
230	554	112	3	345	Cologne Business School		2015-05-15	1
231	555	42	\N	345	DESK TOP MEDIA GmbH		2015-05-15	1
232	556	42	\N	345	Doringer Werbenetzwerk GmbH		2015-05-15	1
227	466	42	2	345	Commend International GmbH	Webseite: Ja	2015-05-15	1
252	588	77	2	519	Projektbasis GmbH	Wildsau Dirt Run (Leube) www.wild-sau.com	2015-09-10	1
204	273	99	3	345	Traunsteiner Tafel		2015-05-15	1
199	379	90	2	1	Stiegl Getränke & Service GmbH & CO. KG		2015-05-15	0
200	445	90	2	345	Stieglbrauerei zu Salzburg GmbH	Webseite Ja	2015-05-15	1
240	445	90	\N	345	Stiegl Getränke & Service GmbH & Co KG		2015-05-15	1
253	\N	125	9	345	Haus der Hoffnung		2015-10-18	1
254	593	31	2	253	Revolution Event GmbH (Electric Love)		2015-11-11	1
256	596	42	\N	519	UnikumSky		2015-12-02	1
194	513	42	2	519	SPAR AG		2015-12-02	1
257	\N	\N	\N	519	andere Zwecke		2015-12-05	1
258	\N	\N	\N	519	Differenzen		2015-12-05	1
259	597	129	\N	519	Soziales Netzwerk Oberndorf		2015-12-09	1
260	599	121	\N	519	Hangar 7		2016-02-03	1
109	488	87	2	345	McCain foods GmbH	Festnetz: 01/7684524; Email: info.austria@mccain.com; Webseite:ja;\n	2016-08-19	1
261	600	131	7	519	Caritas-Zentrum Berchtesgadener Land		2016-02-03	1
262	601	132	\N	519	Hügli Nährmittel Erzeugung Ges.mbH		2016-02-03	1
264	603	42	2	253	Pfarre Morzg		2016-03-22	1
226	\N	24	3	345	Freilassinger Tafel	Adresse ergänzen	2016-03-22	1
265	605	28	\N	519	 Kiddy Event GmbH	Kinderfeste & Parties, www.kinderparties.at  	2016-04-21	1
268	612	91	2	345	Umwelt Service Salzburg	Unterstützer	2016-06-27	1
269	613	42	2	345	Chaka2	Webseite:ja	2016-08-01	1
73	476	42	2	345	Innovationswerkstatt Sebastian Mettler	Fax: 0662/841079; www.innovationserkstatt.at	2016-08-01	1
271	615	42	2	642	ARGE Beisl - ABC Gastronomie GmbH		2016-08-14	1
193	512	31	2	519	Sozialwerk Hallein	zu löschen	2016-09-08	0
220	267	91	2	519	Wirtschaftskammer Salzburg		2016-09-08	1
234	559	114	\N	519	IBM Austria		2016-09-08	1
233	557	113	\N	519	Fachhochschule Salzburg GmbH		2016-09-08	1
9	327	105	2	519	anderskompetent Gmbh	HFA ok	2016-09-08	1
248	577	42	2	519	Lebenshilfe Wagingerstraße	HFA ok	2016-09-08	1
191	287	42	2	519	SOS-Kinderdorf Clearinghouse	HFA ok	2016-09-08	1
223	315	52	2	519	Sozialer Lieferservice Bürmoos	HFA ok	2016-09-08	1
209	569	42	2	519	Viele-Verein für interkulturellen Ansatz	HFA ok	2016-09-08	1
210	518	42	2	519	VinziTisch Salzburg	HFA ok	2016-09-08	1
205	326	95	2	519	Ultrafrisch Salzburg GmbH	nicht mehr aktuell, löschen?	2016-09-12	0
214	520	42	2	519	Wiberg GmbH	nicht mehr aktuell, löschen?	2016-09-12	0
270	614	52	2	345	Freie Christengemeinde Bürmoos	Webseite: Ja	2016-09-24	1
47	452	52	2	345	Freie Christengemeinde	Webseite: Ja	2016-09-24	0
267	611	135	7	253	Bergader Lager TS		2016-09-24	0
217	421	77	2	252	winnovation consulting gmbh		2016-09-25	1
263	602	133	\N	253	Österreichische Gesellschaft für Dekubitusprävention (APUPA)		2016-09-25	1
255	595	95	2	253	Bodengraf GmbH & Co. KG	IXSO	2016-09-25	1
236	240	42	\N	253	Landwirtschaftskammer Salzburg		2016-09-25	0
202	515	89	3	1	Teisendorfer Tafel		2016-09-26	0
211	314	42	2	1	Volkshilfe Salzburg		2016-09-26	0
229	553	111	3	345	Bonduelle Deutschland GmbH	Webseite: Ja	2016-09-29	1
16	385	4	2	519	Benediktinerabtei Michaelbeuern	HFA ok	2016-09-08	1
38	362	42	2	519	Jugend-Notschlafstelle Exit 7	HFA ok	2016-09-08	1
132	383	53	2	519	Lebensmittelbrücke / Pfarre Wals	vormals Pfarre Wals oder Vinzitisch / nur Zustelladresse - Postadresse siehe VinziTisch\nHFA ok	2016-09-08	1
115	491	42	2	519	Missionshaus Liefering	HFA ok	2016-09-08	1
122	279	42	2	519	Notschlafstelle der Caritas	Festnetz: 0662/629786\nEmail: Notschlafstelle@caritas-salzburg.at\nHFA ok	2016-09-08	1
13	402	71	2	519	Bastian’s  im Designer Outlet Salzburg	nicht mehr aktuell, löschen?	2016-09-12	0
97	364	42	2	519	Lebenshilfe GmbH	nicht mehr aktuell, löschen?	2016-09-12	0
272	618	42	\N	519	Last Minute Grace Ministries		2016-09-14	1
243	566	42	\N	252	Österreichisch-Amerikanische Gesellschaft		2016-09-25	1
273	627	42	2	253	Landesberufsschule 5		2016-09-25	1
274	628	136	2	253	Gymnasium & ART-ORG St. Ursula		2016-09-25	1
275	491	42	2	253	Privatgymnasium der Herz-Jesu-Missionare		2016-09-25	1
276	629	31	2	519	JACOBY GM PHARMA GMBH		2016-09-26	1
277	628	138	\N	519	Gymnasium St. Ursula		2016-09-26	0
279	639	116	2	345	BMLFUW Abteilung V/6		2016-09-29	1
281	642	42	\N	519	Verein menschen.leben		2016-10-05	1
282	\N	\N	\N	574	zzz anderer Lieferant zzz	dieser Lieferant wurde für Warenbuchhaltung angelegt, wenn keine weiteren Lieferungen zu erwarten sind	2016-10-07	1
141	500	53	2	345	Quehenberger Logistics GmbH Wals	Kontakt über Anna Gross	2016-10-07	1
94	482	53	2	252	Landesberufsschulheim Wals	HFA ok	2016-10-08	1
284	\N	121	\N	252	Bankhaus Carl Spängler & Co. AG		2016-10-10	0
278	636	42	\N	345	Bankhaus Carl Spängler & Co. AG		2016-10-10	1
283	636	121	\N	252	Bankhaus Carl Spängler & Co. AG		2016-10-10	0
129	651	32	2	252	Palfinger AG	Webseite Ja\nKontakt über Walter Riezinger	2016-12-29	1
155	503	42	2	252	Salzburg AG		2016-12-29	1
285	664	57	2	642	Waldbad Anif		2017-01-28	1
286	665	144	7	642	Brezelbäckerei Ditsch		2017-01-28	1
287	666	42	\N	602	Baptistengemeinde Sbg		2017-02-01	1
288	667	146	7	602	Leichter leben Vertriebsgesellschaft		2017-02-01	1
289	668	42	\N	602	Freie Christengemeinde		2017-02-01	1
290	374	42	2	253	Fachschule & Höhere Lehranstalt für wirtschaftliche Berufe		2017-02-01	1
291	673	31	\N	519	Verein menschen.leben Hayat Hallein		2017-03-28	1
292	677	147	\N	519	TKL Lebensmittel Logistik GmbH		2017-05-08	1
293	676	121	\N	519	Klartext PR	www.klartext-pr.at	2017-05-08	1
294	678	148	\N	519	Transgourmet Salzburg		2017-05-08	1
295	683	31	\N	519	Schweighofer Fiber GmbH		2017-05-30	1
297	685	42	\N	519	HTBLu VA 		2017-05-30	1
298	686	14	\N	519	Industriellenvereinigung Oberösterreich		2017-05-30	1
299	682	42	\N	519	GFB & Partner Unternehmensberatung		2017-05-30	1
296	687	84	\N	519	WKO Bezirksstelle Gmunden		2017-05-30	1
300	514	42	\N	519	Teekanne Gesellschaft m.b.H. 	potentieller Lieferant - Stand 06/17	2017-06-11	1
301	688	42	\N	519	Caros Verrührung	potentieller Lieferant - Stand 06/2017	2017-06-11	1
302	689	65	\N	519	STRASSER IMPORT-EXPORT GMBH 	potentieller Lieferant - Stand 06/2017	2017-06-11	1
303	690	150	\N	519	Dorfkäserei Pötzelsberger	potentieller Lieferant - 06/2017	2017-06-13	1
\.


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 200
-- Name: organisation_organisation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('organisation_organisation_id_seq', 303, true);


--
-- TOC entry 3251 (class 0 OID 420622)
-- Dependencies: 201
-- Data for Name: orgcontactperson; Type: TABLE DATA; Schema: public; Owner: -
--

COPY orgcontactperson (person_id, organisation_id) FROM stdin;
511	2
638	246
637	247
603	7
578	32
510	191
219	10
677	191
249	207
231	207
111	96
98	207
376	95
66	95
334	20
56	21
32	94
262	190
248	223
419	209
313	209
71	209
323	25
558	190
724	278
701	278
189	36
381	31
211	210
173	33
689	272
201	48
128	49
588	50
144	52
168	54
357	204
172	58
141	59
143	64
600	118
614	200
403	68
456	69
109	200
613	200
309	72
29	72
254	200
464	240
116	79
248	270
640	245
234	198
82	85
390	86
77	87
406	198
596	198
545	93
9	106
154	6
311	105
280	110
13	113
398	117
240	120
429	126
213	126
236	133
126	133
473	134
467	136
251	137
450	139
304	139
174	139
570	140
423	144
50	147
93	66
492	152
634	243
583	161
127	161
463	163
183	166
230	168
102	169
132	171
300	217
325	119
694	119
387	119
667	263
335	180
23	180
536	181
87	181
257	182
410	183
410	184
164	221
404	187
466	221
654	252
411	3
30	14
543	14
590	19
621	230
14	26
622	231
293	195
147	197
623	232
233	35
698	273
396	43
699	274
458	51
626	51
138	53
627	53
700	275
548	4
564	4
703	255
317	215
329	216
611	227
599	222
610	227
501	203
243	203
606	224
706	75
707	75
349	57
609	57
68	5
708	159
291	29
480	40
702	276
221	61
321	67
486	71
697	71
413	160
384	160
167	160
416	160
306	165
620	229
715	229
717	279
719	219
718	219
515	219
720	219
723	281
33	22
79	22
648	250
43	102
303	112
336	114
39	114
650	114
41	141
281	141
340	158
171	178
57	178
19	116
78	175
195	175
383	192
181	192
675	18
137	18
690	18
65	18
612	228
426	76
342	84
421	143
160	143
217	143
631	235
391	213
308	124
250	127
298	164
493	164
296	131
58	164
319	164
133	164
84	156
339	156
96	151
705	91
439	91
632	91
527	91
559	91
577	91
704	91
244	162
199	179
568	186
99	186
175	188
60	188
299	188
483	188
508	188
223	189
255	121
182	104
125	30
31	41
601	201
533	42
420	103
462	103
491	70
635	129
729	129
636	237
409	154
617	238
448	129
649	155
457	155
49	90
370	90
736	290
738	291
451	108
607	225
346	123
290	123
633	242
55	125
271	11
380	56
131	56
618	239
643	244
471	11
742	292
743	293
744	294
427	142
695	142
659	256
746	142
696	142
42	194
660	259
752	295
753	295
662	260
663	261
664	262
755	297
756	298
668	226
608	226
751	299
754	296
344	60
759	300
760	302
766	145
671	265
678	268
679	269
639	73
680	73
338	73
669	157
108	220
207	220
367	220
684	220
26	220
295	220
641	234
628	234
685	234
687	233
688	233
686	233
625	233
624	233
676	9
2	12
393	12
470	23
103	16
222	24
169	24
46	24
6	44
277	45
540	46
595	63
394	65
479	65
414	74
569	74
514	38
170	38
532	81
64	81
539	82
227	82
505	83
436	92
285	92
62	92
530	98
263	98
648	249
139	99
648	248
364	100
156	100
294	101
105	132
438	115
518	115
535	138
362	138
191	148
163	148
11	153
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
1242	568	523	0	28
1243	594	549	0	5
1244	594	550	1	1
1245	595	552	0	150
1246	596	552	0	150
1247	476	484	1	50
1248	476	491	0	60
1251	597	558	1	10
1252	597	559	3	3
1253	597	554	0	40
1254	597	561	2	3
1255	598	562	1	10
1256	598	559	3	9
1257	598	560	0	40
1258	598	561	2	11
1259	599	555	1	18
1260	599	554	2	10
1261	599	560	0	10
1262	599	562	3	10
1263	593	548	0	8
1264	600	483	0	8
1265	601	483	0	2
1266	602	567	0	10
1267	603	570	0	14
1268	603	569	1	28
1269	603	568	2	10
1270	604	563	1	20
1271	604	566	0	12
1272	605	565	2	15
1273	605	566	1	8
1274	605	564	3	2
1275	605	563	0	10
1276	606	566	0	10
1277	607	571	0	9
1278	608	572	0	3
1279	609	573	0	3
1280	610	574	0	3
1281	611	577	1	10
1282	611	575	0	13
1283	612	577	1	11
1284	612	575	0	6
1285	612	576	2	1
1286	613	534	0	25
1287	613	536	1	16
1290	581	578	1	9
1291	581	533	0	3
1292	585	531	0	5
1293	585	537	2	20
1294	585	578	3	2
1295	585	530	1	1
1296	614	579	0	6
1297	615	579	0	5
1298	616	579	0	10
1299	617	580	0	2
1303	619	582	1	1
1304	619	581	0	1
1305	620	590	0	3
1306	620	586	2	3
1307	620	584	4	9
1308	620	589	5	6
1309	620	587	6	10
1310	620	591	1	2
1311	620	583	3	2
1313	622	586	0	1
1314	622	591	1	2
1315	622	587	3	2
1316	622	588	5	5
1317	622	589	2	3
1318	622	585	4	4
1319	623	588	2	25
1320	623	590	0	5
1321	623	587	1	3
1322	621	588	0	25
1325	618	580	0	1
1326	618	529	1	8
1328	625	582	1	5
1329	625	581	0	5
1330	626	581	0	3
1331	626	582	1	14
1332	627	582	1	10
1333	627	581	0	4
1334	628	581	0	9
1336	630	592	0	160
1337	631	593	0	9
1338	631	595	2	8
1339	631	594	1	12
1340	632	596	0	30
1341	633	598	0	30
1342	634	599	0	5
1343	634	600	1	11
1344	635	599	0	5
1345	635	600	1	10
1346	624	581	0	1
1347	629	592	0	90
1348	636	558	3	8
1349	636	555	2	10
1350	636	560	0	90
1351	636	554	1	40
1352	637	601	0	3
1353	638	604	0	8
1354	638	603	2	8
1355	638	602	1	15
1356	639	604	0	16
1357	639	602	1	20
1358	640	603	1	8
1359	640	602	0	15
1360	640	604	2	10
1361	641	605	0	50
1362	642	606	0	14
1363	643	606	0	8
1364	644	606	0	8
1365	645	606	0	10
1366	646	608	1	9
1367	646	607	2	3
1368	646	609	0	8
1369	647	607	1	7
1370	647	609	0	22
1371	648	611	1	20
1372	648	613	2	10
1373	648	612	0	2
1374	649	611	2	14
1375	649	610	3	3
1376	649	612	1	2
1377	649	613	0	17
1378	650	614	0	20
1379	651	615	0	15
1380	652	616	0	30
1381	653	617	0	69
1382	654	619	0	3
1388	660	621	0	40
1389	661	622	0	4
1390	662	623	0	3
1402	665	553	2	3
1403	665	624	0	3
1404	665	561	1	4
1405	666	559	0	2
1406	666	557	2	10
1407	666	561	1	1
1408	664	554	1	20
1409	664	555	2	10
1410	664	557	0	16
1411	664	560	3	15
1412	663	556	3	2
1413	663	554	0	40
1414	663	557	2	8
1415	663	559	1	1
1416	667	625	0	10
1417	668	625	0	20
1418	669	625	0	2
1419	670	625	0	8
1420	671	625	0	15
1421	672	625	0	5
1422	673	625	0	4
1423	674	625	0	6
1424	675	626	0	22
1425	675	627	1	11
1426	676	626	0	4
1427	676	627	1	1
1428	677	627	1	9
1429	677	626	0	18
1438	681	627	0	10
1439	681	626	1	22
1445	686	628	0	10
1432	678	627	0	9
1433	678	626	1	18
1434	679	626	0	2
1435	679	627	1	1
1436	680	626	0	24
1437	680	627	1	6
1440	682	626	0	14
1441	682	627	1	5
1442	683	628	0	13
1443	684	628	0	9
1444	685	628	0	9
1450	689	629	1	9
1451	689	632	0	10
1456	691	629	0	10
1457	691	630	1	5
1458	691	632	2	6
1459	692	633	0	15
1446	687	628	0	10
1447	688	632	1	15
1448	688	629	0	16
1449	688	631	2	2
1452	690	631	1	5
1453	690	629	3	24
1454	690	632	2	22
1455	690	630	0	3
1487	697	668	1	26
1488	697	669	0	8
1495	699	668	0	10
1496	700	673	2	1
1497	700	672	4	1
1498	700	675	0	1
1499	700	676	1	1
1500	700	671	3	1
1501	701	672	6	1
1502	701	671	3	2
1503	701	677	2	5
1504	701	673	1	4
1505	701	670	4	2
1506	701	674	5	2
1507	701	675	0	2
1508	702	673	1	2
1509	702	671	2	4
1510	702	676	0	2
1511	702	672	4	1
1512	702	677	3	2
1524	704	674	3	3
1525	704	678	2	10
1526	704	667	1	2
1527	704	671	5	2
1528	704	676	4	1
1529	704	668	0	3
1530	705	627	1	4
1531	705	679	0	62
1537	706	679	0	38
1538	706	626	1	32
1553	709	680	0	2
1554	709	681	1	7
1555	710	680	0	6
1556	710	681	1	25
1567	712	682	0	20
1568	713	683	0	12
1569	714	683	0	8
1570	715	684	1	8
1571	715	685	0	8
1572	716	685	0	16
1573	716	684	1	7
1574	716	686	2	10
1575	717	685	0	7
1576	717	686	1	11
1577	717	687	2	1
1578	718	689	0	70
1579	719	688	0	6
1580	720	688	0	53
1581	721	688	0	6
1582	722	688	0	80
1583	723	691	0	20
1584	724	690	1	16
1585	724	691	0	3
1586	725	691	0	102
1587	725	690	1	33
1588	726	691	0	28
1589	727	691	0	5
1617	729	694	6	2
1618	729	699	1	1
1619	729	692	0	1
1620	729	697	4	6
1621	729	702	3	4
1622	729	704	5	5
1623	729	693	7	4
1624	729	698	2	1
1625	729	705	9	1
1626	729	701	8	1
1638	728	702	2	3
1639	728	697	6	4
1640	728	704	3	3
1641	728	698	1	1
1642	728	693	0	5
1643	728	701	4	1
1644	728	706	5	1
1645	731	707	2	2
1646	731	709	0	4
1647	731	696	3	100
1648	731	708	1	1
1649	732	707	0	5
1650	732	708	1	3
1651	733	703	0	3
1652	733	695	2	19
1653	733	696	1	127
1654	734	708	0	5
1655	734	707	1	5
1656	735	707	0	13
1657	735	708	1	14
1658	736	712	0	7
1659	736	710	1	17
1660	736	711	2	7
1661	737	710	2	5
1662	737	712	1	5
1663	737	711	0	10
1664	738	712	2	5
1665	738	710	1	5
1666	738	711	0	10
1667	739	712	2	10
1668	739	710	1	15
1669	739	711	0	20
1673	741	712	1	40
1674	741	710	2	15
1675	741	711	0	40
1676	742	712	1	9
1677	742	711	0	9
1678	743	711	0	5
1679	743	712	1	5
1670	740	710	2	4
1671	740	711	1	8
1672	740	712	0	8
1684	703	713	4	8
1685	703	673	0	11
1686	703	677	2	6
1687	703	672	1	2
1688	703	671	3	2
1689	744	681	2	17
1690	744	680	1	2
1691	744	713	0	5
1693	745	713	1	5
1694	745	627	0	22
1697	746	713	2	9
1698	746	625	1	8
1699	746	627	0	12
1700	747	691	0	12
1701	748	688	0	15
1702	730	697	9	4
1703	730	702	3	5
1704	730	706	6	1
1705	730	698	1	2
1706	730	692	0	10
1707	730	703	4	4
1708	730	701	7	1
1709	730	700	8	2
1710	730	705	2	2
1711	730	694	5	3
1712	749	697	4	4
1713	749	707	3	26
1714	749	704	1	1
1715	749	708	0	27
1716	749	699	2	3
1717	750	709	0	11
1718	751	715	0	9
1719	752	715	0	23
1720	752	714	1	8
1721	752	716	2	10
1722	753	719	0	3
1723	754	717	0	4
1727	756	721	2	9
1728	756	720	1	10
1729	756	722	0	1
1730	755	722	1	1
1731	755	720	2	9
1732	755	721	0	15
1733	757	731	3	1
1734	757	728	0	108
1735	757	732	4	5
1736	757	729	1	1
1737	757	730	2	12
1738	758	529	0	20
1739	759	734	0	10
1740	760	736	0	15
1741	761	737	0	25
1742	761	738	1	14
1743	762	739	0	9
1744	763	740	0	5
1745	763	741	1	10
1746	764	740	0	10
1747	764	741	1	5
1748	765	741	0	83
1749	765	740	1	166
1750	766	740	0	20
1751	766	741	1	15
1752	767	740	0	10
1753	767	741	1	10
1754	768	740	0	10
1755	768	741	1	10
1756	769	742	0	70
1757	770	743	0	15
1759	772	745	0	8
1760	773	748	2	72
1761	773	747	1	26
1762	773	746	0	11
1763	773	749	3	8
1764	774	750	0	14
1765	775	750	0	15
1766	776	750	0	12
1767	777	750	0	5
1768	778	750	0	30
1769	779	750	0	1
1770	780	750	0	18
1771	781	752	0	29
1772	781	751	1	5
1773	782	752	0	40
1774	783	752	0	40
1775	784	752	0	40
1776	785	754	0	6
1777	785	753	2	128
1778	785	755	1	5
1779	786	755	0	20
1780	786	753	1	142
1781	787	756	1	1
1782	787	757	0	20
1783	788	757	0	115
1784	788	756	1	1
1785	789	765	1	5
1786	789	766	0	5
1787	790	766	1	12
1788	790	765	0	11
1789	791	767	0	300
1790	771	769	0	2
1791	792	764	0	145
1792	792	709	1	4
1793	793	770	2	7
1794	793	768	0	84
1795	793	769	1	1
1796	793	773	4	31
1797	793	771	3	76
1800	794	774	1	220
1801	794	775	0	210
1802	795	778	0	10
1803	796	776	0	9
1804	797	777	0	2
1805	798	779	0	24
1806	799	781	1	33
1807	799	780	0	30
1808	800	784	0	8
1809	800	783	1	23
1810	800	782	2	12
1811	801	784	0	22
1812	801	782	1	10
1813	801	783	2	7
1814	802	785	0	5
1815	803	786	0	4
1816	804	787	0	4
1817	805	788	0	3
1818	806	789	0	4
1819	807	790	0	26
1820	808	793	1	20
1821	808	792	2	22
1822	808	794	0	18
1823	809	795	0	24
1824	810	796	0	12
1825	811	797	0	20
1826	812	796	0	8
1827	813	796	0	14
1828	814	798	0	5
1829	815	799	0	3
1830	816	800	0	7
1831	817	801	0	6
1832	818	744	0	6
1833	819	772	0	700
1834	820	750	0	3
1835	821	803	1	10
1836	821	802	0	10
1837	821	804	2	16
1838	822	802	0	20
1839	822	803	1	10
1840	822	804	2	6
1841	823	804	0	8
1842	823	803	1	10
1843	823	802	2	20
1844	824	805	0	14
1845	824	806	1	8
1846	825	806	0	9
1847	826	807	0	8
1850	829	810	0	20
1853	832	813	0	9
1854	833	814	0	15
1862	841	827	0	5
1863	841	828	1	10
1869	846	833	1	5
1870	846	835	2	20
1871	846	834	0	20
1875	848	834	1	8
1876	848	835	2	9
1877	848	833	0	12
1885	851	837	1	3
1886	851	838	0	19
1887	851	836	2	24
1888	852	838	0	14
1889	853	838	0	5
1878	849	833	0	5
1879	849	834	1	10
1880	849	835	2	6
1881	850	829	0	80
1882	850	833	3	28
1883	850	835	1	30
1884	850	834	2	17
1851	830	811	0	15
1852	831	812	0	15
1855	834	815	0	15
1856	835	816	0	12
1857	836	817	0	100
1858	837	818	0	8
1859	838	819	0	4
1860	839	820	0	6
1861	840	821	0	6
1864	842	826	0	6
1865	843	828	0	6
1866	844	826	0	10
1891	855	847	0	30
1892	856	847	0	60
1893	857	847	0	24
1894	858	847	0	131
1895	859	852	2	1
1896	859	849	4	5
1897	859	855	5	21
1898	859	851	0	3
1899	859	853	6	37
1900	859	854	3	19
1901	859	856	1	2
1902	860	853	3	6
1903	860	851	1	6
1904	860	848	0	1
1905	860	855	2	6
1907	862	750	0	10
1906	861	750	0	29
1911	863	856	0	5
1912	863	850	1	1400
1913	863	750	2	1
1914	865	746	1	80
1915	865	749	0	17
1916	866	858	1	150
1917	866	857	0	150
1920	867	858	1	150
1921	867	857	0	150
1922	868	857	0	150
1923	868	858	1	150
1924	869	857	0	60
1925	870	858	1	150
1926	870	857	0	150
1927	871	859	0	13
1928	872	859	0	17
1929	873	860	0	1
1930	874	862	0	8
1931	875	861	1	51
1932	875	862	0	8
1933	876	862	0	4
1934	877	863	0	20
1935	878	865	0	19
1936	878	864	1	8
1937	879	864	0	12
1939	881	866	0	52
1943	882	870	1	14
1945	883	869	0	8
1944	882	869	0	10
1946	884	871	0	20
1947	885	875	0	32
1948	886	872	0	20
1949	886	875	3	8
1950	886	873	1	35
1951	886	874	2	1
1952	887	876	0	20
1953	888	876	0	9
1954	889	878	2	1
1955	889	879	0	18
1956	889	877	1	10
1957	889	880	3	6
1958	890	880	0	9
1959	890	877	1	28
1960	891	883	1	14
1961	891	884	0	24
1962	892	881	0	51
1963	893	882	0	14
1966	854	847	1	24
1967	854	840	2	1
1968	854	838	0	2
1969	854	844	4	1
1970	854	843	3	1
1978	847	850	3	484
1979	847	835	2	5
1980	847	834	0	5
1981	847	833	1	10
1982	845	850	2	242
1983	845	826	0	4
1984	845	828	1	2
1985	895	847	0	84
1986	896	841	0	4
1987	896	839	1	6
1988	897	857	0	190
1990	880	867	1	1
1991	880	868	2	35
1992	880	866	0	17
1993	898	748	0	45
1995	864	887	0	37
2001	894	842	2	1
2002	894	845	3	7
2003	894	846	1	17
2004	894	847	0	90
2005	894	839	4	3
2006	899	888	0	10
2007	900	888	0	8
2008	901	888	0	16
2011	902	890	0	16
2012	902	891	1	10
2013	903	890	1	11
2014	903	891	0	23
2015	904	890	0	3
2016	904	889	1	19
2017	904	891	2	6
2018	905	892	0	3
2019	906	892	0	3
2020	907	893	0	4
2027	655	894	0	15
2028	656	894	0	100
2029	657	894	0	30
2030	658	894	0	100
2031	659	894	0	54
2032	908	895	0	250
2033	909	896	2	13
2034	909	898	1	21
2035	909	897	0	7
2036	910	899	0	15
2037	911	900	0	15
2038	912	901	0	11
2039	913	902	1	1
2040	913	903	2	8
2041	913	901	0	8
2042	913	904	3	11
2043	914	905	0	15
2044	915	710	0	125
2045	916	906	1	1800
2046	916	907	0	618
2047	917	908	0	125
2048	918	908	0	60
2049	919	908	0	111
2050	920	909	0	113
2051	920	908	1	130
2052	921	858	0	370
2053	921	857	1	30
2054	922	857	0	30
2055	922	858	1	280
2056	923	910	0	74
2057	924	911	0	30
2058	925	912	0	144
2059	926	912	0	144
2060	927	913	0	15
2061	928	913	0	5
2064	931	912	1	24
2065	931	913	0	2
2066	932	913	0	15
2067	932	912	1	26
2068	933	913	0	11
2069	934	913	0	15
2070	935	913	0	6
2072	929	913	0	1
2073	930	913	0	1
2074	936	916	0	120
2075	937	919	0	3
2076	937	918	1	3
2077	938	916	0	50
2078	939	915	1	3
2079	939	916	0	100
2080	940	916	0	56
2081	941	920	0	45
2082	941	919	1	13
2083	941	918	2	4
2087	943	916	1	46
2088	943	914	0	24
2089	944	927	0	8
2090	944	926	1	7
2091	945	927	2	7
2092	945	926	1	8
2093	945	929	0	7
2094	946	927	1	40
2095	946	926	0	24
2096	946	929	3	3
2097	946	928	2	3
2098	947	926	0	4
2099	947	927	1	6
2100	942	916	2	5
2101	942	914	1	43
2102	942	917	0	17
2103	948	933	0	4
2104	949	934	0	2
2105	949	935	2	5
2106	949	933	1	4
2107	950	932	3	1
2108	950	933	0	10
2109	950	931	2	1
2110	950	935	1	41
2111	951	936	0	1
2112	952	943	2	2
2113	952	941	0	13
2114	952	942	1	10
2115	953	941	0	20
2116	954	937	0	16
2117	955	937	0	14
2118	956	940	0	25
2119	956	939	1	33
2120	957	944	0	3
2121	958	945	0	3
2122	959	946	0	2
2123	960	947	0	3
2124	961	948	0	4
2125	962	949	0	6
2126	963	950	0	3
2127	964	951	0	2
2128	965	952	0	6
2129	966	953	0	30
2130	967	953	0	22
2131	968	953	0	8
2132	969	953	0	10
2133	970	953	0	20
2134	971	953	0	10
2135	972	954	0	20
2136	973	954	0	30
2137	974	954	0	20
2138	974	955	1	10
2139	975	956	0	20
2140	976	956	0	20
2141	977	957	0	12
2142	978	957	0	13
2143	979	957	0	25
2144	980	958	0	80
2145	981	958	0	20
2146	982	958	0	20
2147	983	958	0	10
2148	984	958	0	100
2149	985	958	0	20
\.


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 202
-- Name: outgoing_article_outgoing_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('outgoing_article_outgoing_article_id_seq', 2149, true);


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
476	210	642	\N	0	2015-12-02		2016-03-03	1
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
575	210	574	\N	0	2016-01-07	WP U 26	2016-02-14	1
579	92	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
576	98	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
577	210	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
578	210	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
580	165	574	\N	0	2016-01-19	WP U 27	2016-02-14	1
584	259	574	\N	0	2016-01-25	WP U 28	2016-02-14	1
583	190	574	\N	0	2016-01-25	WP U 28	2016-02-14	1
582	190	574	\N	0	2016-01-22	WP U 28	2016-02-14	1
587	210	642	\N	0	2015-12-22		2016-02-17	1
588	213	642	\N	0	2015-12-23		2016-02-17	1
589	12	642	\N	0	2015-12-23		2016-02-17	1
590	12	642	\N	0	2015-12-18		2016-02-17	1
591	46	574	\N	0	2016-01-22	WP U 30	2016-02-19	1
592	98	574	\N	0	2016-01-22	WP U 30	2016-02-19	1
608	12	574	\N	0	2016-02-12	WP U 37	2016-03-21	1
568	257	574	\N	0	2016-01-02	WP U 22 (Kunde Landw. Betrieb Riezinger)	2016-02-19	1
594	210	574	\N	0	2015-11-19	WP U 21	2016-02-19	1
595	191	574	\N	0	2015-12-30	WP U 31	2016-02-19	1
596	210	574	\N	0	2015-12-30	WP U 31	2016-02-19	1
597	213	602	\N	0	2016-03-08		2016-03-13	1
598	12	602	\N	0	2016-03-08		2016-03-13	1
599	121	602	\N	0	2016-03-08		2016-03-13	1
593	12	574	\N	0	2016-01-15	WP U 32	2016-03-21	1
600	122	574	\N	0	2015-11-19		2016-03-21	1
601	257	574	\N	0	2015-11-19	Empf: Pfarre Morzg	2016-03-21	1
602	12	574	\N	0	2016-01-22	WP U 34	2016-03-21	1
603	12	574	\N	0	2016-02-05	WP U 35	2016-03-21	1
604	12	574	\N	0	2015-11-24	WP U 33	2016-03-21	1
605	46	574	\N	0	2015-11-24	WP U 33	2016-03-21	1
606	115	574	\N	0	2015-11-24	WP U 33	2016-03-21	1
607	12	574	\N	0	2016-02-05	WP U 36	2016-03-21	1
610	12	574	\N	0	2016-02-26	WP U 39	2016-03-21	1
609	12	574	\N	0	2016-02-19	WP U 38	2016-03-21	1
611	12	574	\N	0	2016-02-26	WP U 40	2016-03-21	1
612	46	574	\N	0	2016-02-26	WP U 40	2016-03-21	1
613	126	574	\N	0	2016-02-02		2016-04-04	1
581	96	574	\N	0	2016-01-22	WP U 28	2016-04-08	1
628	225	574	\N	0	2016-01-18	WP U 43	2016-04-08	1
585	32	574	\N	0	2016-01-22	WP U 29 u.a.	2016-04-08	1
614	223	574	\N	0	2016-01-05	WP U 41	2016-04-08	1
615	259	574	\N	0	2016-01-05	WP U 41	2016-04-08	1
616	190	574	\N	0	2016-01-05	WP U 41	2016-04-08	1
617	44	574	\N	0	2016-01-08	WP U 42	2016-04-08	1
621	210	574	\N	0	2016-02-08	WP U 46	2016-04-08	1
620	213	574	\N	0	2016-02-08	WP U 46	2016-04-08	1
622	65	574	\N	0	2016-02-08	WP U 46	2016-04-08	1
623	12	574	\N	0	2016-02-08	WP U 46	2016-04-08	1
627	210	574	\N	0	2016-01-13	WP U 43+44	2016-04-08	1
618	223	574	\N	0	2016-01-08	an: Sozialer Hilfsdienst Lamprechtsh	2016-04-08	1
619	46	574	\N	0	2016-01-13	WP U 43+44	2016-04-08	1
625	121	574	\N	0	2016-01-13	WP U 43+44	2016-04-08	1
626	12	574	\N	0	2016-01-13	WP U 43+44	2016-04-08	1
630	190	574	\N	0	2016-02-11	WP U 47	2016-04-08	1
631	121	574	\N	0	2016-02-11	WP U 48	2016-04-08	1
632	223	574	\N	0	2016-02-18	WP U 49	2016-04-08	1
633	213	574	\N	0	2016-02-25	WP U 50	2016-04-08	1
634	12	574	\N	0	2016-03-01	WP U 51	2016-04-08	1
635	121	574	\N	0	2016-03-01	WP U 51	2016-04-08	1
629	223	574	\N	0	2016-02-11	WP U 47	2016-04-08	1
624	223	574	\N	0	2016-01-13	WP U 43 an Pfingstgemeinde Vogelweiderstr	2016-04-08	1
574	46	574	\N	0	2016-01-07	WP U 26 (eigentlich auch 2x1,16kg Müsliriegel Schoko dazu (gibts aber im ERP nicht)	2016-02-14	1
636	223	602	\N	0	2016-03-08		2016-04-20	1
637	12	602	\N	0	2016-03-25		2016-04-20	1
638	209	602	\N	0	2016-03-16		2016-04-20	1
639	12	602	\N	0	2016-03-16		2016-04-20	1
640	46	602	\N	0	2016-03-16		2016-04-20	1
641	210	602	\N	0	2016-04-01		2016-04-21	1
642	97	602	\N	0	2016-04-20		2016-06-07	1
643	46	602	\N	0	2016-04-20		2016-06-07	1
644	12	602	\N	0	2016-04-20		2016-06-07	1
645	122	602	\N	0	2016-04-20		2016-06-07	1
646	12	602	\N	0	2016-04-08		2016-06-07	1
647	97	602	\N	0	2016-04-08		2016-06-07	1
648	12	602	\N	0	2016-04-26		2016-06-07	1
649	46	602	\N	0	2016-04-26		2016-06-07	1
650	12	602	\N	0	2016-04-01		2016-06-07	1
651	12	602	\N	0	2016-04-29		2016-06-07	1
652	97	602	\N	0	2016-04-22		2016-06-07	1
653	12	602	\N	0	2016-04-22		2016-06-07	1
654	12	602	\N	0	2016-04-22		2016-06-07	1
661	12	602	\N	0	2016-05-06		2016-06-07	1
662	12	602	\N	0	2016-05-13		2016-06-07	1
663	65	602	\N	0	2016-03-11		2016-06-07	1
672	191	602	\N	0	2016-05-30		2016-06-07	1
671	210	602	\N	0	2016-05-30		2016-06-07	1
669	45	602	\N	0	2016-05-30		2016-06-07	1
675	190	602	\N	0	2016-06-03		2016-06-07	1
678	82	602	\N	0	2016-06-03		2016-06-07	1
679	46	602	\N	0	2016-06-03		2016-06-07	1
655	210	574	\N	0	2016-04-22		2017-03-14	1
677	192	602	\N	0	2016-06-03		2016-06-07	1
681	12	602	\N	0	2016-06-03		2016-06-07	1
676	32	602	\N	0	2016-06-03		2016-06-07	1
686	213	602	\N	0	2016-05-27		2016-06-07	1
656	12	574	\N	0	2016-04-22		2017-03-14	1
659	65	574	\N	0	2016-04-22		2017-03-14	1
664	210	602	\N	0	2016-03-11		2016-06-07	1
666	126	602	\N	0	2016-04-05		2016-06-07	1
665	65	602	\N	0	2016-03-18		2016-06-07	1
667	100	602	\N	0	2016-05-30		2016-06-07	1
673	98	602	\N	0	2016-05-30		2016-06-07	1
668	92	602	\N	0	2016-05-30		2016-06-07	1
687	170	602	\N	0	2016-05-27		2016-06-07	1
688	92	602	\N	0	2016-05-18		2016-06-07	1
690	148	602	\N	0	2016-05-18		2016-06-07	1
657	44	574	\N	0	2016-04-22		2017-03-14	1
658	210	574	\N	0	2016-04-22		2017-03-14	1
660	210	602	\N	0	2016-04-29		2016-06-07	1
674	226	602	\N	0	2016-06-03		2016-06-07	1
670	165	602	\N	0	2016-05-30		2016-06-07	1
680	121	602	\N	0	2016-06-03		2016-06-07	1
682	213	602	\N	0	2016-06-03		2016-06-07	1
685	12	602	\N	0	2016-05-27		2016-06-07	1
683	192	602	\N	0	2016-05-27		2016-06-07	1
684	148	602	\N	0	2016-05-27		2016-06-07	1
689	213	602	\N	0	2016-05-18		2016-06-07	1
691	12	602	\N	0	2016-05-18		2016-06-07	1
692	213	602	\N	0	2016-05-13		2016-06-07	1
741	184	642	\N	0	2016-06-30		2016-07-21	1
697	148	642	\N	0	2016-06-07		2016-06-28	1
742	223	642	\N	0	2016-06-30		2016-07-21	1
699	192	642	\N	0	2016-06-07		2016-06-28	1
743	96	642	\N	0	2016-06-30		2016-07-21	1
736	209	642	\N	0	2016-06-30		2016-07-21	1
737	180	642	\N	0	2016-06-30		2016-07-21	1
738	181	642	\N	0	2016-06-30		2016-07-21	1
740	175	642	\N	0	2016-06-30		2016-07-21	1
739	179	642	\N	0	2016-06-30		2016-07-21	1
757	213	642	\N	0	2016-06-10		2016-08-14	1
704	190	642	\N	0	2016-06-07		2016-06-28	1
700	65	642	\N	0	2016-06-06		2016-06-28	1
701	213	642	\N	0	2016-06-06		2016-06-28	1
702	12	642	\N	0	2016-06-06		2016-06-28	1
709	250	642	\N	0	2016-06-20		2016-06-29	1
710	12	642	\N	0	2016-06-20		2016-06-29	1
712	12	642	\N	0	2016-06-10		2016-07-07	1
713	12	642	\N	0	2016-06-14		2016-07-07	1
714	100	642	\N	0	2016-06-14		2016-07-07	1
715	122	642	\N	0	2016-06-25		2016-07-07	1
716	12	642	\N	0	2016-06-25		2016-07-07	1
717	46	642	\N	0	2016-06-25		2016-07-07	1
718	92	642	\N	0	2016-06-23		2016-07-07	1
719	165	642	\N	0	2016-06-23		2016-07-07	1
720	210	642	\N	0	2016-06-23		2016-07-07	1
721	9	642	\N	0	2016-06-23		2016-07-07	1
722	225	642	\N	0	2016-06-23		2016-07-07	1
723	65	642	\N	0	2016-06-24		2016-07-07	1
724	94	642	\N	0	2016-06-24		2016-07-07	1
725	224	642	\N	0	2016-06-24		2016-07-07	1
726	190	642	\N	0	2016-06-24		2016-07-07	1
727	82	642	\N	0	2016-06-24		2016-07-07	1
759	12	574	\N	0	2016-07-01	WP U 52	2016-09-23	1
758	258	574	\N	0	2016-01-07	kein Warenausgang zu finden	2016-09-23	1
703	126	642	\N	0	2016-06-07		2016-07-29	1
744	213	642	\N	0	2016-06-20		2016-07-29	1
745	210	642	\N	0	2016-06-08		2016-07-29	1
746	44	642	\N	0	2016-06-08		2016-07-29	1
748	259	642	\N	0	2016-06-23		2016-08-14	1
747	270	642	\N	0	2016-06-23		2016-08-14	1
706	148	642	\N	0	2016-06-07		2016-06-29	1
705	210	642	\N	0	2016-06-07		2016-06-29	1
732	213	642	\N	0	2016-06-28		2016-07-21	1
733	148	642	\N	0	2016-06-28		2016-07-21	1
734	65	642	\N	0	2016-06-28		2016-07-21	1
735	12	642	\N	0	2016-06-28		2016-07-21	1
729	12	642	\N	0	2016-06-27		2016-07-21	1
728	213	642	\N	0	2016-06-27		2016-07-21	1
731	165	642	\N	0	2016-06-28		2016-07-21	1
730	65	642	\N	0	2016-06-27		2016-08-14	1
749	132	642	\N	0	2016-07-05		2016-08-14	1
750	24	642	\N	0	2016-07-05		2016-08-14	1
751	122	642	\N	0	2016-06-07		2016-08-14	1
752	165	642	\N	0	2016-06-07		2016-08-14	1
753	12	642	\N	0	2016-04-15		2016-08-14	1
754	12	642	\N	0	2016-05-20		2016-08-14	1
755	12	642	\N	0	2016-03-30		2016-08-14	1
756	165	642	\N	0	2016-03-30		2016-08-14	1
760	12	574	\N	0	2016-07-08	WP U 53	2016-09-23	1
761	98	574	\N	0	2016-07-12	WP U 54	2016-09-23	1
762	12	574	\N	0	2016-07-15	WP U 55	2016-09-23	1
763	210	574	\N	0	2016-07-01	WP U 56	2016-09-23	1
764	74	574	\N	0	2016-07-01	WP U 56	2016-09-23	1
765	224	574	\N	0	2016-07-01	WP U 56	2016-09-23	1
766	92	574	\N	0	2016-07-01	WP U 56	2016-09-23	1
767	95	574	\N	0	2016-07-01	WP U 56	2016-09-23	1
768	169	574	\N	0	2016-07-01	WP U 56	2016-09-23	1
769	213	602	\N	0	2016-08-23		2016-09-26	1
770	213	602	\N	0	2016-09-05		2016-09-26	1
772	126	602	\N	0	2016-09-06		2016-09-26	1
773	210	602	\N	0	2016-08-09		2016-09-26	1
774	12	602	\N	0	2016-09-19		2016-09-26	1
776	190	602	\N	0	2016-09-19		2016-09-26	1
780	92	602	\N	0	2016-09-19		2016-09-26	1
779	165	602	\N	0	2016-09-19		2016-09-26	1
778	210	602	\N	0	2016-09-19		2016-09-26	1
777	192	602	\N	0	2016-09-19		2016-09-26	1
775	213	602	\N	0	2016-09-19		2016-09-26	1
781	210	574	\N	0	2016-07-15	WP U 57	2016-10-02	1
782	213	574	\N	0	2016-07-15	WP U 57	2016-10-02	1
784	121	574	\N	0	2016-07-15	WP U 57	2016-10-02	1
783	12	574	\N	0	2016-07-15	WP U 57	2016-10-02	1
785	190	574	\N	0	2016-07-19	WP U 58	2016-10-02	1
786	148	574	\N	0	2016-07-19	WP U 58	2016-10-02	1
787	32	574	\N	0	2016-07-26	WP U 59	2016-10-02	1
788	192	574	\N	0	2016-07-26	WP U 59	2016-10-02	1
789	12	574	\N	0	2016-07-27	WP U 62	2016-10-02	1
790	226	574	\N	0	2016-07-27	WP U 62	2016-10-02	1
791	213	574	\N	0	2016-07-18	WP U 63	2016-10-02	1
771	44	574	\N	0	2016-09-05		2016-10-07	1
792	74	574	\N	0	2016-07-26	WP U 60 u.a.	2016-10-07	1
793	190	574	\N	0	2016-07-28	WP U 61	2016-10-07	1
794	12	574	\N	0	2016-07-06	WP U 64	2016-10-07	1
795	12	574	\N	0	2016-07-22	WP U 67	2016-10-08	1
796	12	574	\N	0	2016-04-08	WP U 65	2016-10-08	1
797	12	574	\N	0	2016-05-27	WP U 66	2016-10-08	1
798	100	602	\N	0	2016-10-21		2017-01-03	1
799	100	602	\N	0	2016-10-05		2017-01-03	1
802	12	602	\N	0	2016-10-14	WP S 113	2017-01-03	1
805	12	602	\N	0	2016-09-23	WP S 116	2017-01-03	1
806	100	602	\N	0	2016-09-24	WP S 117	2017-01-03	1
807	12	602	\N	0	2016-10-29	WP S 118	2017-01-03	1
808	98	602	\N	0	2016-08-06	WP S 119	2017-01-03	1
810	121	602	\N	0	2016-08-05	WP S 121	2017-01-03	1
811	46	602	\N	0	2016-08-05	WP S 121	2017-01-03	1
813	12	602	\N	0	2016-08-05	WP S 121	2017-01-03	1
812	122	602	\N	0	2016-08-05	WP S 121	2017-01-03	1
814	12	602	\N	0	2016-08-05	WP S 122	2017-01-03	1
815	12	602	\N	0	2016-10-28	WP S 123	2017-01-03	1
817	12	602	\N	0	2016-09-17	WP S 125	2017-01-03	1
816	12	602	\N	0	2016-06-25	WP S 124	2017-01-03	1
818	210	602	\N	0	2016-09-13		2017-01-03	1
820	74	602	\N	0	2016-09-20	WP S 109	2017-01-03	1
800	46	602	\N	0	2016-09-02	WP S 112	2017-01-03	1
801	248	602	\N	0	2016-09-02	WP S 112	2017-01-03	1
803	12	602	\N	0	2016-10-21	WP S 114	2017-01-03	1
804	100	602	\N	0	2016-10-08	WP S 115	2017-01-03	1
809	165	602	\N	0	2016-10-27	WP S 120	2017-01-03	1
819	74	602	\N	0	2016-09-13		2017-01-03	1
821	209	642	\N	0	2016-11-11		2017-01-28	1
822	46	642	\N	0	2016-11-11		2017-01-28	1
823	12	642	\N	0	2016-11-11		2017-01-28	1
824	46	642	\N	0	2016-12-07		2017-01-28	1
825	12	642	\N	0	2016-12-07		2017-01-28	1
847	192	642	\N	0	2016-12-20		2017-02-05	1
826	12	642	\N	0	2016-11-12		2017-01-28	1
829	100	642	\N	0	2016-12-10		2017-01-28	1
845	148	642	\N	0	2016-12-13		2017-02-05	1
830	12	642	\N	0	2016-12-02		2017-01-28	1
831	12	642	\N	0	2016-11-14		2017-01-28	1
832	12	642	\N	0	2016-12-16		2017-01-28	1
833	12	642	\N	0	2016-11-11		2017-01-28	1
835	12	642	\N	0	2016-12-09		2017-01-28	1
834	12	642	\N	0	2016-11-18		2017-01-28	1
836	213	642	\N	0	2016-12-02		2017-01-28	1
837	12	642	\N	0	2016-02-29		2017-01-28	1
839	12	642	\N	0	2016-10-07		2017-01-28	1
838	12	642	\N	0	2016-08-12		2017-01-28	1
840	12	642	\N	0	2016-11-15		2017-01-28	1
841	12	642	\N	0	2016-12-13		2017-01-28	1
842	210	642	\N	0	2016-12-13		2017-01-28	1
843	213	642	\N	0	2016-12-13		2017-01-28	1
844	210	642	\N	0	2016-12-13		2017-01-28	1
846	190	642	\N	0	2016-12-20		2017-01-28	1
848	210	642	\N	0	2016-12-21		2017-01-28	1
849	213	642	\N	0	2016-12-21		2017-01-28	1
850	12	642	\N	0	2016-12-29		2017-01-28	1
851	213	642	\N	0	2016-11-10		2017-01-28	1
852	210	642	\N	0	2016-11-11		2017-01-28	1
853	210	642	\N	0	2016-11-11		2017-01-28	1
855	95	602	\N	0	2016-10-27		2017-02-01	1
856	92	602	\N	0	2016-10-27		2017-02-01	1
857	192	602	\N	0	2016-10-27		2017-02-01	1
858	190	602	\N	0	2016-10-27		2017-02-01	1
859	12	602	\N	0	2016-09-22		2017-02-01	1
860	74	602	\N	0	2016-09-22		2017-02-01	1
861	225	602	\N	0	2016-09-22		2017-02-01	1
862	209	602	\N	0	2016-09-22		2017-02-01	1
866	210	602	\N	0	2016-09-01		2017-02-01	1
867	210	602	\N	0	2016-09-01		2017-02-01	1
868	213	602	\N	0	2016-09-01		2017-02-01	1
869	46	602	\N	0	2016-09-01		2017-02-01	1
870	289	602	\N	0	2016-09-01		2017-02-01	1
871	12	602	\N	0	2016-09-01		2017-02-01	1
872	100	602	\N	0	2016-09-01		2017-02-01	1
873	12	602	\N	0	2016-03-11		2017-02-02	1
876	100	602	\N	0	2016-06-16		2017-02-02	1
875	46	602	\N	0	2016-06-16		2017-02-02	1
874	122	602	\N	0	2016-06-16		2017-02-02	1
877	12	602	\N	0	2016-07-08		2017-02-02	1
864	280	574	\N	0	2016-10-24	WP U 68	2017-02-28	1
865	287	602	\N	0	2016-08-10		2017-02-01	1
863	126	602	\N	0	2016-10-04		2017-02-01	1
878	46	602	\N	0	2016-07-05		2017-02-02	1
881	100	602	\N	0	2016-06-09		2017-02-02	1
882	12	602	\N	0	2016-07-02		2017-02-02	1
854	209	642	\N	0	2016-11-10		2017-02-05	1
880	46	574	\N	0	2016-06-09		2017-02-28	1
879	121	602	\N	0	2016-07-05		2017-02-02	1
883	122	602	\N	0	2016-07-02		2017-02-02	1
884	46	602	\N	0	2016-05-10		2017-02-02	1
885	100	602	\N	0	2016-05-10		2017-02-02	1
886	46	602	\N	0	2016-05-10		2017-02-02	1
887	100	602	\N	0	2016-06-09		2017-02-02	1
888	46	602	\N	0	2016-06-09		2017-02-02	1
889	46	602	\N	0	2016-12-01		2017-02-02	1
890	121	602	\N	0	2016-12-01		2017-02-02	1
891	12	602	\N	0	2016-10-19		2017-02-02	1
892	46	602	\N	0	2016-07-26		2017-02-02	1
893	100	602	\N	0	2016-10-11		2017-02-02	1
895	210	642	\N	0	2016-11-03		2017-02-05	1
896	12	602	\N	0	2016-11-03		2017-02-06	1
897	126	602	\N	0	2016-10-04		2017-02-06	1
898	223	574	\N	0	2016-08-10	LS Duplikat!	2017-02-28	1
894	213	602	\N	0	2016-11-03		2017-03-08	1
899	46	574	\N	0	2017-01-11	WP U 69	2017-03-08	1
900	210	574	\N	0	2017-01-11	WP U 69	2017-03-08	1
901	223	574	\N	0	2017-01-11	WP U 69	2017-03-08	1
902	12	574	\N	0	2017-01-25	WP U 70	2017-03-08	1
903	98	574	\N	0	2017-01-25	WP U 70	2017-03-08	1
904	46	574	\N	0	2017-01-25	WP U 70	2017-03-08	1
905	248	574	\N	0	2017-01-28	WP U 71	2017-03-08	1
906	250	574	\N	0	2017-01-28	WP U 71	2017-03-08	1
907	12	574	\N	0	2017-02-03	WP U 72	2017-03-08	1
908	213	574	\N	0	2016-09-13	Lieferant "Messezentrum"	2017-03-15	1
909	46	574	\N	0	2016-12-20	WP U 74	2017-03-15	1
910	248	574	\N	0	2016-12-24	WP U 75	2017-03-15	1
911	12	574	\N	0	2017-01-13	WP U 76	2017-03-15	1
912	12	574	\N	0	2017-01-14	WP U 77	2017-03-15	1
913	46	574	\N	0	2017-01-14	WP U 77	2017-03-15	1
914	12	574	\N	0	2017-01-20	WP U 78	2017-03-15	1
915	126	519	\N	0	2016-06-30		2017-03-20	1
916	126	519	\N	0	2016-06-28		2017-03-20	1
917	165	574	\N	0	2017-01-17	WP U 79	2017-03-20	1
918	223	574	\N	0	2017-01-17	WP U 79	2017-03-20	1
919	12	574	\N	0	2017-01-18	WP U 79	2017-03-20	1
920	210	574	\N	0	2017-01-18	WP U 79 und 80	2017-03-20	1
921	44	574	\N	0	2016-09-01	kein LS vorhanden; nur emails genaue Menge? Datum?	2017-03-27	1
922	223	574	\N	0	2016-09-01	kein LS vorhanden; nur emails; genaue Menge? Datum?	2017-03-27	1
923	213	574	\N	0	2017-02-07	WP U 81	2017-03-27	1
924	213	574	\N	0	2017-03-02	WP U 82	2017-03-27	1
926	12	574	\N	0	2017-01-31	WP U 83	2017-03-27	1
925	213	574	\N	0	2017-01-31	WP U 83	2017-03-27	1
927	44	574	\N	0	2017-02-03	WP U 84	2017-03-27	1
928	165	574	\N	0	2017-02-03	WP U 84	2017-03-27	1
931	82	574	\N	0	2017-02-02	WP U 83+84	2017-03-27	1
932	192	574	\N	0	2017-02-02	WP U 83+84	2017-03-27	1
933	210	574	\N	0	2017-02-02	WP U 84	2017-03-27	1
934	213	574	\N	0	2017-02-02	WP U 84	2017-03-27	1
935	209	574	\N	0	2017-02-02	WP U 84	2017-03-27	1
930	291	574	\N	0	2017-02-03	WP U 84	2017-03-28	1
944	209	574	\N	0	2017-03-08		2017-04-18	1
945	223	574	\N	0	2017-03-08		2017-04-18	1
947	210	574	\N	0	2017-03-08		2017-04-18	1
946	12	574	\N	0	2017-03-08		2017-04-18	1
941	126	574	\N	0	2017-03-06	WP U 85	2017-03-28	1
943	121	574	\N	0	2017-02-21	WP U 85	2017-03-28	1
937	65	574	\N	0	2017-02-08	WP U 85	2017-03-28	1
936	210	574	\N	0	2017-02-08	WP U 85	2017-03-28	1
938	210	574	\N	0	2017-02-08	WP U 85	2017-03-28	1
939	12	574	\N	0	2017-02-08	WP U 85	2017-03-28	1
940	259	574	\N	0	2017-02-08	WP U 85	2017-03-28	1
929	280	574	\N	0	2017-02-03	WP U 84; Empfänger: Hayat Teisenbergstr	2017-03-28	1
957	12	602	\N	0	2017-03-10		2017-06-12	1
942	223	574	\N	0	2017-02-21	1x5l Feinwaschmittel fehlen (sind von WernerMertz aus 15.12.2016 - wurden schon mit "restlicher Menge" auf anderen Abnehmer gebucht)	2017-04-18	1
948	213	602	\N	0	2017-03-27		2017-06-12	0
949	65	602	\N	0	2017-03-27		2017-06-12	0
950	12	602	\N	0	2017-03-27		2017-06-12	0
951	213	602	\N	0	2017-04-14		2017-06-12	1
952	46	602	\N	0	2017-03-08		2017-06-12	1
953	12	602	\N	0	2017-03-08		2017-06-12	1
954	12	602	\N	0	2017-04-07		2017-06-12	1
955	95	602	\N	0	2017-04-07		2017-06-12	1
956	165	602	\N	0	2017-04-05		2017-06-12	1
958	12	602	\N	0	2017-03-17		2017-06-12	1
959	12	602	\N	0	2017-03-31		2017-06-12	1
960	12	602	\N	0	2017-04-28		2017-06-12	1
961	12	602	\N	0	2017-04-14		2017-06-12	1
962	100	602	\N	0	2017-04-08		2017-06-12	1
963	12	602	\N	0	2017-04-07		2017-06-12	1
964	12	602	\N	0	2017-03-24		2017-06-12	1
965	100	602	\N	0	2017-03-04		2017-06-12	1
966	115	602	\N	0	2017-03-08		2017-06-12	1
967	209	602	\N	0	2017-03-08		2017-06-12	1
968	44	602	\N	0	2017-03-08		2017-06-12	1
969	82	602	\N	0	2017-03-08		2017-06-12	1
970	100	602	\N	0	2017-03-08		2017-06-12	1
971	122	602	\N	0	2017-03-08		2017-06-12	1
972	12	602	\N	0	2017-04-06		2017-06-12	1
973	82	602	\N	0	2017-04-06		2017-06-12	1
974	115	602	\N	0	2017-04-06		2017-06-12	1
975	115	602	\N	0	2017-03-28		2017-06-12	1
977	82	602	\N	0	2017-04-14		2017-06-12	1
978	12	602	\N	0	2017-04-14		2017-06-12	1
983	121	602	\N	0	2017-04-26		2017-06-12	1
976	165	602	\N	0	2017-03-28		2017-06-12	1
979	210	602	\N	0	2017-04-14		2017-06-12	1
982	100	602	\N	0	2017-04-26		2017-06-12	1
980	12	602	\N	0	2017-04-26		2017-06-12	1
985	165	602	\N	0	2017-04-26		2017-06-12	1
984	210	602	\N	0	2017-04-27		2017-06-12	1
981	100	602	\N	0	2017-04-26		2017-06-12	1
\.


--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 204
-- Name: outgoing_delivery_outgoing_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('outgoing_delivery_outgoing_delivery_id_seq', 985, true);


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
558	2	51	510	519	Frau		Theresia	Wallerstorfer	10.04.2013	2016-10-04	1
30	\N	\N	\N	345	Herr		Hans	Bauer		2016-10-07	1
24	2	53	32	345	Herr		Christian	Atanassoff		2016-10-07	1
15	2	59	125	1	Herr		Wolfgang	Allmann		2015-02-24	1
88	2	53	141	345	Herr	Ing.	Franz	Dusch		2016-10-07	1
19	\N	\N	\N	1	Herr		Christian	Anner	Geschäftsführer	2015-02-24	1
23	\N	\N	\N	1	Frau		Brigitte	Asen		2015-02-24	1
26	\N	\N	\N	1	Herr Dir.	Dr.	Johann	Bachleitner		2015-02-24	1
29	\N	\N	\N	1	Herr		Adam	Balon	Geschäftsführer	2015-02-24	1
31	\N	\N	\N	1	Herr		Thomas	Bauernfeind		2015-02-24	1
32	\N	\N	\N	1	Herr		Georg	Baumann		2015-02-24	1
33	\N	\N	\N	1	Herr			Baumgartner		2015-02-24	1
35	2	50	150	1	Herr		Ludwig	Bayer		2015-02-24	1
9	\N	\N	\N	345	Schwester		Oberin	 		2016-10-07	1
28	\N	65	552	519	Frau		Elfi	Baier	Newslatter: ja, 01.11.2015	2016-10-09	1
39	\N	\N	\N	1	Herr		Wolfgang	Bell		2015-02-24	1
40	2	37	111	1	Herr		Hubert	Berger		2015-02-24	1
41	\N	\N	\N	1	Herr		Stephan	Berger		2015-02-24	1
86	2	42	240	519	Herr	Ing.	Wolfgang	Dürnberger		2016-12-01	1
43	\N	\N	\N	1	Herr		Gerold	Berner	Küchenleiter	2015-02-24	1
46	\N	\N	\N	1	Herr			Bichler		2015-02-24	1
47	2	42	48	1	Herr	Mag.	Roland	Bieber		2015-02-24	1
48	2	42	35	1	Frau		Kathryn	Bishop		2015-02-24	1
49	\N	\N	\N	1	Herr		Franz	Bliem		2015-02-24	1
50	\N	\N	\N	1	Frau	Mag.	Rosalinde	Bonecker		2015-02-24	1
18	2	48	81	252	Frau		Ruth	Amon	nicht mehr Mitglied seit 16. 12. 2016	2016-12-17	1
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
51	2	5	78	252	Frau		Brigitte	Borbely	02.11.2009	2016-12-30	1
74	2	42	16	1	Frau		Helga	Derkits		2015-02-24	1
27	2	42	175	252	Herr		Horst	Badzong		2017-02-09	1
76	2	42	84	1	Frau	Mag.	Kirstin	Descho		2015-02-24	1
77	\N	\N	\N	1	Frau		Alexandra	Dietrichsteiner		2015-02-24	1
78	\N	\N	\N	1	Herr		Daniel	Dinter		2015-02-24	1
79	\N	\N	\N	1	Herr		Walter	Dintl		2015-02-24	1
22	2	63	522	519	Frau		Ilse	Asen		2017-02-11	1
44	2	31	221	519	Frau		Anita	Bernhofer		2017-02-11	1
82	\N	\N	\N	1	Herr		Jörg	Doll		2015-02-24	1
83	2	31	217	1	Herr	Dr.	Arthur	Domig		2015-02-24	1
84	\N	\N	\N	1	Herr		Gregor Svend	Dreher		2015-02-24	1
87	\N	\N	\N	1	Frau		Margarete	Dürnberger	Verwaltung	2015-02-24	1
90	2	56	173	1	Frau		Doraja	Eberle		2015-02-24	1
91	2	41	51	1	Frau		Wally	Ebner		2015-02-24	1
92	2	42	23	1	Frau	Mag.	Barbara	Ebner		2015-02-24	1
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
6	\N	\N	\N	345	Pater		Alexander	Puchberger	Guardian	2015-05-15	1
63	2	42	432	1	Herr		Robert	Buggler		2015-04-21	0
93	\N	\N	\N	252	Frau	Mag.	Ingrid	Ebner		2015-08-17	1
96	\N	\N	\N	1	Herr		Wolfgang	Eckerl		2015-02-24	1
98	\N	\N	\N	1	Frau	Dr.	Andrea	Eder-Gitschthaler		2015-02-24	1
42	\N	\N	\N	519	Frau	Mag.	Nicole	Berkmann		2015-12-02	1
14	\N	\N	\N	252	Frau			Albrecht		2016-01-15	1
34	2	46	226	252	Herr		Wolf	Baur	derzeit Karenz	2016-02-04	1
80	2	36	222	345	Herr	Dr.	Johannes	Ditz		2016-03-02	1
2	\N	\N	\N	252	Schwester		Berta	 		2016-09-07	1
13	\N	\N	\N	252	Frau		Gudrun	Albertsmeier		2016-09-24	1
55	\N	48	576	345	Frau	Mag. Dr.	Brigitte 	Brandstötter		2016-09-26	1
73	2	42	223	345	Frau		Brigitte	Derkits		2016-09-26	1
37	2	42	245	519	Frau		Lydia	Bazanella	12.12.2011	2016-10-04	1
38	2	42	58	519	Frau		Gerlinde	Beinsteiner	27.01.2010	2016-10-04	1
85	2	42	137	519	Herr	Dipl.Ing.	Christian	Dreyer	24.02.2012	2016-10-04	1
94	2	52	79	519	Frau		Johanna	Ebner	13.11.2009	2016-10-04	1
97	2	42	130	519	Frau		Ingrid	Eder	10.04.2013	2016-10-04	1
99	\N	\N	\N	1	Frau		Barbara	Eichberger		2015-02-24	1
102	\N	\N	\N	1	Herr		Manfred	Ellmer		2015-02-24	1
103	\N	\N	\N	1	Pater		Michael	Eppengschwandtner		2015-02-24	1
105	\N	\N	\N	1	Herr		Lorenz	Erlbacher		2015-02-24	1
141	2	32	87	519	Frau		Silvia	Gmachl	18.05.2010	2016-10-13	1
108	\N	\N	\N	1	Herr	Mag.	Helmut	Eymannsberger		2015-02-24	1
109	\N	\N	\N	1	Frau	Mag.	Maria	Fally		2015-02-24	1
111	\N	\N	\N	1	Herr		Franz	Federspieler		2015-02-24	1
115	2	42	116	1	Herr		Ernst	Flatscher		2015-02-24	1
116	\N	\N	\N	1	Frau		Friederike	Flesch, MAS		2015-02-24	1
117	2	64	68	1	Frau		Resi	Fletschberger		2015-02-24	1
122	\N	\N	\N	1	Herr		Reinhard	Fritz	Geschäftsführer	2015-02-24	1
126	\N	\N	\N	1	Sr.		Gerlinde	Fuchsbauer		2015-02-24	1
127	\N	\N	\N	1	Frau	Dr.	Doris	Fuschlberger, MBL		2015-02-24	1
128	2	42	243	1	Herr		Horst	Gallbauer		2015-02-24	1
130	2	30	254	1	Herr Bürgermeister		Johann	Ganisl		2015-02-24	1
131	\N	\N	\N	1	Herr	Mag.	Stephan	Gantner		2015-02-24	1
132	\N	\N	\N	1	Frau		Marianne	Gastager		2015-02-24	1
133	\N	\N	\N	1	Herr		Andreas	Gasteiger		2015-02-24	1
190	2	28	101	1	Herr		Reinhard	Heindl		2016-11-12	0
179	2	42	191	1	Frau		Renate	Harant		2016-12-05	0
137	\N	\N	\N	1	Frau		Annemarie	Geierstanger		2015-02-24	1
138	\N	\N	\N	1	Frau	Mag.(FH)	Claudia	Geissler		2015-02-24	1
139	\N	\N	\N	1	Herr		Martin	Gensluckner		2015-02-24	1
142	2	42	215	1	Frau		Eva-Maria	Goldmann		2015-02-24	1
143	\N	\N	\N	1	Frau		Angelika	Goller		2015-02-24	1
144	\N	\N	\N	1	Frau		Claudia	Göllner	Assistentin der Geschäftsführung	2015-02-24	1
146	2	3	3	1	Frau Bürgermeister		Antonia	Götzendorfer		2015-02-24	1
100	2	42	147	519	Herr	Dr.	Oskar	Einzinger		2017-02-11	1
151	\N	\N	\N	1	Frau		Evelyne	Grasshof		2015-02-24	1
152	2	42	59	1	Frau		Roswitha	Graupner		2015-02-24	1
153	2	3	210	1	Herr		Martin	Greisberger		2015-02-24	1
140	2	42	104	519	Herr		Gerald	Giesswein		2017-02-11	1
155	2	5	8	1	Herr Bürgermeister	Ing.	Johann	Grießner		2015-02-24	1
156	\N	\N	\N	1	Frau		Roswitha	Grießner	Urlaubsvertretung	2015-02-24	1
160	\N	\N	\N	1	Herr	Mag.	Arnold	Gruber		2015-02-24	1
161	2	3	10	1	Herr		Johann	Grubinger		2015-02-24	1
163	\N	\N	\N	1	Herr		Georg	Gschwendtner		2015-02-24	1
164	\N	\N	\N	1	Herr		Helmut	Gstöhl	Geschäftsführer	2015-02-24	1
170	\N	\N	\N	1	Frau		Sandra	Habersatter		2015-02-24	1
171	\N	\N	\N	1	Frau			Hager		2015-02-24	1
172	\N	\N	\N	1	Frau		Christine	Hahn		2015-02-24	1
173	\N	\N	\N	1	Herr		Willi	Haider		2015-02-24	1
174	\N	\N	\N	1	Herr		Rudolf	Haindl	Geschäftsführer	2015-02-24	1
175	\N	\N	\N	1	Frau AR	Mag.	Ingeborg	Haller	Aufsichtsrat	2015-02-24	1
176	2	42	145	1	Herr		Horst	Haltrich		2015-02-24	1
722	\N	\N	\N	253	Frau		Julia	Böck		2017-05-30	0
178	2	19	213	1	Herr	Dr.	Rüdiger	Hanifle		2015-02-24	1
181	\N	\N	\N	1	Herr		Rudi	Harner		2015-02-24	1
182	\N	\N	\N	1	Herr		Ernst	Harringer		2015-02-24	1
183	\N	\N	\N	1	Herr		Robert	Hartmann	Geschäftsstellenleiter	2015-02-24	1
188	2	42	17	1	Herr	Dr.	Helmut	Hegen		2015-02-24	1
189	\N	\N	\N	1	Herr		Erwin	Hehenberger		2015-02-24	1
168	\N	\N	\N	1	Frau		Walburga	Gwechenberger		2015-04-21	1
134	2	57	526	1	Herr	Dkfm.	Bernd	Gaubinger		2015-04-21	1
129	\N	\N	\N	1	Herr GR	Mag.	Wolfgang	Gallei		2015-04-21	0
113	2	42	27	1	Frau		Rosmarie	Fink		2015-04-21	0
123	2	42	27	1	Frau		Christiane	Fuchs		2015-04-21	0
157	2	42	61	1	Herr		David	Gross		2015-04-21	0
125	\N	\N	\N	1	Herr		Alexander	Fuchs		2015-04-21	1
186	2	42	155	1	Frau		Margareta	Hauswiesner		2015-04-21	0
187	\N	\N	\N	345	Frau		Anni	Hauzenberger	gelöscht	2015-05-14	0
104	2	42	518	1	Frau		Lucia	Erlbacher		2015-04-21	0
110	\N	\N	\N	1	Frau			Faulhaber		2015-05-14	0
169	\N	\N	\N	519	Frau		Bettina	Haberl		2015-06-11	1
191	\N	\N	\N	1	Herr		Wolfgang	Heitmeier		2015-02-24	1
193	2	56	102	1	Herr Bürgermeister		Richard	Hemetsberger		2015-02-24	1
195	\N	\N	\N	1	Frau		Gabriele	Hemetsberger		2015-02-24	1
199	\N	\N	\N	1	Frau		Christine	Herzig		2015-02-24	1
107	2	47	107	345	Herr		Fritz	Eybl		2016-03-02	1
197	\N	\N	\N	1	Frau			Herbst		2016-06-23	0
159	\N	\N	\N	1	Herr		Markus	Gruber		2016-09-08	0
154	\N	\N	\N	252	Frau	Mag. 	Brigitta	Grießl		2016-09-24	1
192	2	42	630	253	Frau		Bettina	Hemetsberger		2016-09-25	1
114	2	42	25	519	Frau		Ina	Fischinger	Newsletter: nein, 05.12.2013	2016-10-04	1
106	2	9	134	1	Herr KR		Martin	Essl		2016-09-30	0
118	2	42	133	1	Frau	Dr.	Dagmar	Fliegel		2016-09-30	0
121	2	46	94	519	Herr		Hermann	Frauenschuh	21.01.2012	2016-10-04	1
120	2	46	94	519	Frau		Claudia	Frauenschuh	20.01.2012	2016-10-04	1
135	2	42	196	519	Frau		Gudrun	Gebetsroither	10.04.2013	2016-10-04	1
136	2	57	230	519	Herr		Thomas	Geierspichler	10.04.2013	2016-10-04	1
145	2	18	528	519	Frau		Christine	Gölzner	24.10.2012	2016-10-04	1
147	2	42	420	519	Herr		Franz	Grabmer	11.04.2013	2016-10-04	1
158	2	52	235	519	Herr		Christoph	Grötzinger	24.08.2012	2016-10-04	1
165	2	42	40	519	Herr		Irmin	Gundl	14.01.2009	2016-10-04	1
167	2	58	96	519	Frau	Mag.	Daniela	Gutschi	10.04.2013	2016-10-04	1
177	2	42	126	519	Frau	Mag.	Esther	Handschin	30.03.2010	2016-10-04	1
180	2	52	529	519	Herr		Reinhold	Harfmann	02.11.2009	2016-10-04	1
184	2	42	530	519	Herr Landeshauptmann	Dr.	Wilfried	Haslauer	20.05.2010	2016-10-04	1
200	2	39	65	1	Herr		Peter	Herzog		2015-02-24	1
201	\N	\N	\N	1	Frau		Gabriele	Herzog		2015-02-24	1
202	2	33	5	1	Frau		Christine	Hilzensauer		2015-02-24	1
203	2	4	34	1	Herr Bürgermeister		Adolf	Hinterhauser		2015-02-24	1
207	\N	\N	\N	1	Herr	Dr.	Franz	Hirnsperger		2015-02-24	1
211	\N	\N	\N	1	Frau		Katharina	Hofer		2015-02-24	1
212	2	42	114	1	Frau		Monika	Hoffmeister		2015-02-24	1
213	\N	\N	\N	1	Herr	Dkfm.	Hanspeter	Hofinger		2015-02-24	1
217	\N	\N	\N	1	Herr	DDr.	Manfred	Holztrattner		2015-02-24	1
219	\N	\N	\N	1	Herr		Bernhard	Höppener		2015-02-24	1
222	\N	\N	\N	1	Frau DSA		Gerlinde	Hörl		2015-02-24	1
223	\N	\N	\N	1	Herr		Bernd	Hörtnagl		2015-02-24	1
198	2	42	532	345	Herr und Frau		Hans	Herneth		2016-10-07	1
216	2	10	152	519	Herr		Georg	Hölscher	Newsletter: nein, 13.03.2010	2016-10-09	1
227	\N	\N	\N	1	Frau		Andrea	Huber		2015-02-24	1
205	2	42	251	252	Frau		Maria	Hintsteiner	20.11.2011	2016-12-30	1
230	\N	\N	\N	1	Herr		Josef	Humer		2015-02-24	1
231	\N	\N	\N	1	Herr	Dr.	Peter	Humer		2015-02-24	1
234	\N	\N	\N	1	Herr GR	Dr.	Helmut	Hüttinger		2015-02-24	1
288	2	42	232	1	Frau		Lieselotte	Lainer		2016-12-03	0
236	\N	\N	\N	1	Pater		Hermann	Imminger		2015-02-24	1
237	2	42	89	1	Herr	Mag.	Michael J. F.	Jansen		2015-02-24	1
264	2	53	227	345	Frau		Ingrid	Koberger		2016-12-03	0
226	2	28	209	345	Frau		Helga	Huber	Newsletter: ja	2016-12-03	0
243	\N	\N	\N	1	Herr		Andreas	Käfer		2015-02-24	1
245	\N	\N	\N	1	Frau		Heidi	Karl		2015-02-24	1
249	\N	\N	\N	1	Herr	Dr.	Reinhold	Kelderer		2015-02-24	1
250	\N	\N	\N	1	Herr		Karl	Kern		2015-02-24	1
251	\N	\N	\N	1	Frau		Vanessa	Kern		2015-02-24	1
254	\N	\N	\N	1	Herr	Dr.	Heinrich Dieter	Kiener		2015-02-24	1
208	2	28	166	519	Herr		Helfried	Hitsch	Newsletter: nein	2017-02-11	1
256	2	18	108	1	Herr und Frau		Robert und Karin	Kirbisch		2015-02-24	1
257	\N	\N	\N	1	Frau		Angela	Kirchgatterer		2015-02-24	1
209	2	5	211	519	Herr		Franz	Hofbauer		2017-02-11	1
261	2	13	178	1	Herr		Hannes	Kletzl		2015-02-24	1
292	2	32	228	252	Frau		Erika	Lange	06.12.2011	2017-03-23	1
263	\N	\N	\N	1	Frau		Agnes	Knorr		2015-02-24	1
273	\N	\N	\N	253	Herr		Gerd	Konklewski		2017-05-29	1
235	2	60	202	253	Herr Ök.-Rat		Simon	Illmer		2017-05-29	1
271	\N	\N	\N	1	Frau		Brigitte	Költringer		2015-02-24	1
275	2	42	112	1	Herr		Martin	Koppenwallner		2015-02-24	1
277	\N	\N	\N	1	Frau		Andrea	Krämmer		2015-02-24	1
278	2	59	41	1	Herr Bürgermeister		Friedrich	Kreil		2015-02-24	1
265	\N	\N	\N	519	Frau			Kogler		2017-05-30	0
280	\N	\N	\N	1	Herr		Franz	Kreuzeder		2015-02-24	1
281	\N	\N	\N	1	Herr		Jürgen	Kreuzsaler		2015-02-24	1
285	\N	\N	\N	1	Frau		Gertraud	Kronberger		2015-02-24	1
287	2	10	157	1	Herr Medizinalrat	Dr.	Leonhard	Laimböck		2015-02-24	1
196	2	42	531	1	Frau	Mag.	Sonja	Henhapl-Röhrich		2015-04-21	1
282	\N	\N	\N	1	Herr		Alexander	Kribus		2015-04-21	0
284	\N	\N	\N	1	Herr		Lars	Kroiss		2015-04-21	0
239	\N	\N	\N	1	Frau			Jost		2015-04-21	0
220	2	42	533	1	Frau		Andrea	Hoppichler		2015-04-21	1
204	2	42	174	1	Herr	Dr.	Jürgen	Hinterwirth		2015-04-21	0
224	2	42	534	1	Frau	Mag.	Nicole	Huber		2015-04-21	1
232	2	42	113	252	Frau	Mag.	Friederike	Hurch		2015-04-21	0
244	\N	\N	\N	252	Frau	Dipl.Kauf.	Trude	Kaindl-Hönig		2017-06-18	1
247	2	42	206	1	Frau	Dr.	Ilse	Kartnig		2015-04-21	0
266	2	54	43	1	Frau		Ingrid	Kohl		2015-04-21	0
206	\N	\N	\N	345	Frau		Veronika	Hirnböck	gelöscht	2015-05-14	0
210	\N	\N	\N	1	Herr			Hofbauer		2015-05-14	0
241	2	6	20	252	Frau		Helga	Jungreithmayr		2017-06-18	1
194	\N	\N	\N	1	Frau			Hemetsberger		2015-06-23	0
214	\N	\N	\N	1	Schwester		Rita	Höllwerth		2015-08-25	0
290	\N	\N	\N	1	Frau		Petra	Landschützer		2015-02-24	1
291	\N	\N	\N	1	Frau		Alexandra	Landsteiner		2015-02-24	1
293	\N	\N	\N	1	Frau		Ruth	Langer		2015-02-24	1
294	\N	\N	\N	1	Herr		Hanno	Langer		2015-02-24	1
295	\N	\N	\N	1	Frau	Dr.	Maximiliane	Laserer		2015-02-24	1
298	\N	\N	\N	1	Herr		Christian	Leeb		2015-02-24	1
255	\N	\N	\N	252	Herr		Martin	Schmidbauer 		2016-03-22	1
233	\N	\N	\N	345	Frau	Mag.	Andrea	Huttegger	Pressereferentin, Amt für Kommunikation und Öffentlichkeitsarbeit	2016-09-26	1
296	\N	\N	\N	345	Frau und Herr		Stefan und Elke	Lebesmühlbacher		2016-09-26	1
240	\N	\N	\N	345	Herr		Edwin	Jung		2016-09-26	1
260	\N	\N	\N	1	Frau		Sylvia	Klabuschnig		2016-09-26	0
286	\N	\N	\N	1	Sr.		Brithe	Kröncke		2016-09-26	0
279	\N	\N	\N	345	Frau		Ulrike	Krempler		2016-09-29	0
215	2	10	152	519	Frau		Alathea	Hölscher	Newsletter: nein, 12.03.2010	2016-10-04	1
225	2	42	13	519	Frau		Johanna	Huber	12.04.2013	2016-10-04	1
229	2	12	72	519	Herr	Dipl.Ing.	Johannes	Hubmann	18.10.2012	2016-10-04	1
242	2	13	128	519	Frau		Rosmarie	Jungwirth	07.03.2013	2016-10-04	1
246	2	42	535	519	Frau		Minni	Karres	Newsletter: ja, 19.02.2014	2016-10-04	1
258	2	42	9	519	Frau	Mag.	Elisabeth	Kislinger-Ziegler	10.04.2013	2016-10-04	1
262	2	51	103	519	Frau		Waltraud	Klima	10.04.2013	2016-10-04	1
268	2	11	224	519	Herr	Mag.	Helmut	Köllensperger	01.08.2012	2016-10-04	1
269	2	42	536	519	Herr	Dr.	Karl	Koller	Newsletter: ja, 24.02.2014	2016-10-04	1
270	2	42	248	519	Herr	Mag.	Reinhold	Kolm	09.02.2011	2016-10-04	1
297	2	10	218	519	Frau		Inge	Lederer	19.01.2009	2016-10-04	1
299	\N	\N	\N	1	Frau AR-Vorsitzende		Annemarie	Lehner	Aufsichtsrat	2015-02-24	1
300	\N	\N	\N	1	Frau	Dr.	Gertraud	Leimüller		2015-02-24	1
302	2	11	123	1	Frau	Mag.Dr.	Heidemarie	Leitner		2015-02-24	1
303	\N	\N	\N	1	Herr		Klaus	Leitner		2015-02-24	1
304	\N	\N	\N	1	Herr	Mag.	Simon	Lindenthaler		2015-02-24	1
723	\N	42	642	519	Frau	Mag.	Nina	Stumtner		2016-10-04	1
306	\N	\N	\N	1	Frau		Daniela	Linke		2015-02-24	1
384	\N	\N	\N	345	Frau	Mag.	Claudia	Petschl		2016-10-07	1
308	\N	\N	\N	1	Herr. Dir.		Erich	Lobensommer		2015-02-24	1
309	\N	\N	\N	1	Herr		Janos	Lobos	Logistics Manager DACH	2015-02-24	1
311	\N	\N	\N	1	Herr	Ing.	Karl	Lorentschitsch		2015-02-24	1
313	\N	\N	\N	1	Frau	Mag.	Ruzica	Lukic		2015-02-24	1
341	2	42	497	345	Herr		Peter	Mitgutsch		2016-10-07	1
317	\N	\N	\N	1	Herr		Mario	Mairhofer		2015-02-24	1
318	2	53	187	1	Herr Bürgermeister		Joachim	Maislinger		2015-02-24	1
305	2	47	99	252	Frau	Univ.Prof. Dr. Mag.	Andrea	Lindmayr-Brandl	05.08.2011	2016-10-08	1
321	\N	\N	\N	1	Herr		Martin	Mallinger		2015-02-24	1
323	\N	\N	\N	1	Frau	Mag.	Natalie	Malzner		2015-02-24	1
324	2	57	74	1	Frau	Mag.	Elisabeth	Mang		2015-02-24	1
325	\N	\N	\N	1	Herr		Walter	Markitz		2015-02-24	1
329	\N	\N	\N	1	Herr	Mag.		Mayer		2015-02-24	1
375	2	18	63	252	Frau		Gudrun	Ostermayer	Vereinsaustritt 12. 10. 2016	2016-10-12	1
331	2	42	80	1	Frau	Mag.	Traudl	Mayr		2015-02-24	1
391	\N	\N	\N	252	Herr		Edi	Pichlmaier		2016-10-21	1
334	\N	\N	\N	1	Herr		Roland	Mayrhofer	Geschäftsführer	2015-02-24	1
335	\N	\N	\N	1	Herr		Manfred	Mayrhofer	Heimleiter	2015-02-24	1
336	\N	\N	\N	1	Herr	Mag.	Martin	Melzer		2015-02-24	1
338	\N	\N	\N	1	Herr		Sebastian	Mettler	Geschäftsführer	2015-02-24	1
339	\N	\N	\N	1	Herr		Rolf Olaf	Meyer	Geschäftsführer	2015-02-24	1
340	\N	\N	\N	1	Herr	Mag.	Herwig	Mikutta		2015-02-24	1
363	2	42	539	252	Herr	Mag.	Erwin	Niese	30.07.2010	2016-12-30	1
342	\N	\N	\N	1	Herr		Josef	Mittermaier		2015-02-24	1
366	\N	42	364	519	Frau		Claudia	Oberascher		2016-12-03	0
344	\N	\N	\N	1	Herr		Manfred	Moldan		2015-02-24	1
346	\N	\N	\N	1	Herr Dir.		Kurt	Molterer		2015-02-24	1
349	\N	\N	\N	1	Herr		Johann	Mösl		2015-02-24	1
315	2	48	663	252	Frau	Mag.	Elfriede	Mackinger	20.01.2009	2017-01-13	1
381	\N	\N	\N	519	Herr		Christian	Subera		2017-03-20	1
307	2	48	185	252	Herr		Hubert	Lixl	20.02.2008	2017-03-22	1
367	\N	\N	\N	252	Herr	Dr.	Kurt	Oberholzer		2017-05-22	1
314	\N	\N	\N	1	Frau	Dr.	Astrid	Lüttich		2017-04-27	0
355	2	42	209	1	Frau		Vida	Neugebauer		2015-02-24	1
357	\N	\N	\N	1	Herr		Günter	Neumann		2015-02-24	1
322	\N	\N	\N	1	Herr		Roland	Maly		2017-05-29	0
361	2	42	19	1	Frau		Erni	Niederer		2015-02-24	1
362	\N	\N	\N	1	Frau		Anja	Niederreiter		2015-02-24	1
364	\N	\N	\N	1	Frau		Angelika	Noisternigg	Leiterin	2015-02-24	1
365	2	39	246	1	Frau		Brigitte	Nußdorfer		2015-02-24	1
370	\N	\N	\N	1	Herr		Martin	Ölz		2015-02-24	1
374	2	45	138	1	Herr	Dipl.Ing.(FH)	Martin	Ortner	PR & Projektkoordination MediaCube	2015-02-24	1
380	\N	\N	\N	1	Herr KR		Alexander	Pappas		2015-02-24	1
383	\N	\N	\N	1	Frau		Sabine	Paulitsch		2015-02-24	1
333	2	13	110	1	Herr und Frau		Georg und Sabine	Mayrhofer		2015-04-21	1
378	\N	\N	\N	1	Herr Stadtrat		Johann	Padutsch		2015-04-21	0
347	2	42	537	1	Herr		Helfrid	Mooshammer		2015-04-21	1
337	\N	\N	\N	1	Frau		Eva	Mentl		2015-04-21	1
372	2	56	541	1	Herr		Johannes	Orsini-Rosenberg		2015-04-21	1
377	2	42	542	1	Frau		Renate	Ourth		2015-04-21	1
385	2	42	106	1	Herr		Manfred	Petzelsberger		2015-04-21	0
327	\N	\N	\N	345	Pater		Karl	Mauri	gelöscht	2015-05-14	0
328	2	42	497	1	Herr	Mag.	Wolfgang	Mayer		2015-02-24	1
316	\N	\N	\N	1	Herr			Maderthaner		2015-05-14	0
360	\N	\N	\N	1	Herr		Josef	Niederbrucker		2015-05-14	0
387	\N	\N	\N	1	Herr		Markus	Pfarrhofer	Geschäftsführer	2015-02-24	1
390	\N	\N	\N	1	Herr		Thomas	Pichler		2015-02-24	1
393	\N	\N	\N	1	Herr		Gerhard	Pirchner		2015-02-24	1
394	\N	\N	\N	1	Herr		Alfred	Plank		2015-02-24	1
396	\N	\N	\N	1	Herr	Dipl.Ing.(FH)	Gerhard	Pockenauer-Gramiller		2015-02-24	1
398	\N	\N	\N	1	Herr		Helmut	Pointner		2015-02-24	1
319	2	\N	\N	252	Frau	Mag.	Petra	Maislinger-Knoll		2016-01-21	1
358	2	42	121	252	Frau	Mag.	Christine	Neurauter		2016-04-11	1
400	\N	\N	\N	1	Herr	KR	Hans	Pöll	Geschäftsführer	2016-04-20	0
312	\N	\N	\N	1	Frau		Bettina	Lotterhos		2016-09-08	0
376	\N	\N	\N	519	Herr		Helmut	Suhrer		2016-09-26	1
373	2	42	247	345	Herr		Wilhelm 	Ortmayr		2016-09-29	1
267	2	42	86	519	Frau	Mag.	Veronika	Kois	Newsletter: Ja, 08.02.2011	2016-10-04	1
369	\N	\N	\N	1	Frau		Elisabeth	Olsacher		2016-09-30	0
382	2	42	180	1	Familie		Gerhard	Parisot		2016-09-30	0
310	2	42	88	519	Frau		Bettina	Lorentschitsch, Msc MBA	23.01.2008	2016-10-04	1
332	2	51	214	519	Herr		Franz	Mayr	10.04.2013	2016-10-04	1
343	2	39	192	519	Herr Präsident		Helmut	Mödlhammer	Newsletter: ja, 25.09.2013	2016-10-04	1
348	2	42	139	519	Sr.		Erika	Moser	15.07.2009	2016-10-04	1
351	2	18	66	519	Herr	Dr.	Alois	Navara	23.01.2008	2016-10-04	1
352	2	42	182	519	Herr	Dipl.Ing.	Norbert	Nechansky	12.03.2010	2016-10-04	1
353	2	42	182	519	Frau	Dr.	Verena	Nechansky	12.03.2010	2016-10-04	1
356	2	59	203	519	Frau LAbg.		Theresia	Neuhofer	25.06.2012	2016-10-04	1
359	2	8	538	519	Herr	MMag.	Michael	Neureiter	15.10.2008	2016-10-04	1
368	3	24	171	519	Frau		Cornelia	Oetzlinger	10.04.2013	2016-10-04	1
399	2	18	38	519	Frau		Karin	Pokorny	01.01.2012	2016-10-04	1
395	\N	\N	\N	1	Frau		Elisabeth	Plener		2016-10-07	0
403	\N	\N	\N	1	Herr		Gerhard	Porsche		2015-02-24	1
404	\N	\N	\N	1	Frau	Mag.	Kathrin	Prähauser		2015-02-24	1
406	\N	\N	\N	1	Herr Bürgermeister	Dipl.-Ing.	Harald	Preuner		2015-02-24	1
409	\N	\N	\N	1	Frau		Rebecca	Promersberger		2015-02-24	1
424	2	42	67	252	Herr	Dr.	Roland	Reichl	05.01.2013	2016-12-17	1
411	\N	\N	\N	1	Herr		Ernst	Pühringer		2015-02-24	1
413	\N	\N	\N	1	Frau		Helga	Purgstaller		2015-02-24	1
414	\N	\N	\N	1	Frau		Heidi	Püschel		2015-02-24	1
416	\N	\N	\N	1	Frau		Birgit	Radwanovsky		2015-02-24	1
417	\N	\N	\N	1	Frau		Tatjana	Rakovic		2015-02-24	1
485	2	42	193	1	Frau	Dr.	Elisabeth	Schreiner		2016-12-03	0
419	\N	\N	\N	1	Frau		Gabriele	Rechberger	Geschäftsführung	2015-02-24	1
420	2	42	156	1	Herr	Dr.	Alexander	Rehrl		2015-02-24	1
421	\N	\N	\N	1	Herr Generaldirektor	Dr.	Günther	Reibersdorfer		2015-02-24	1
422	2	20	21	1	Frau		Ruth	Reichegger		2015-02-24	1
423	\N	\N	\N	1	Herr			Reichl		2015-02-24	1
386	2	42	650	252	Frau	Mag.	Ulrike	Pfaffenberger	24.02.2012	2016-12-30	1
405	2	48	661	252	Herr		Bruno	Prantl	19.01.2009	2016-12-30	1
427	\N	\N	\N	1	Frau		Nancy	Reinhardt	Lagerleiterin	2015-02-24	1
428	2	11	204	1	Herr und Frau		Günther und Dorli	Reinthaler		2015-02-24	1
429	\N	\N	\N	1	Herr		Ludwig	Reisinger	Fahrer	2015-02-24	1
433	2	61	69	1	Frau		Ulrike	Reitter		2015-02-24	1
430	2	18	583	519	Frau		Sabrina	Reiter		2017-02-11	1
436	\N	\N	\N	1	Herr		Bernhard	Reschreiter		2015-02-24	1
438	\N	\N	\N	1	Frau		Katharina	Rettenbacher		2015-02-24	1
439	\N	\N	\N	1	Herr	Mag.	Gottfried	Rettenegger		2015-02-24	1
440	2	18	122	1	Herr		Landolf	Revertera		2015-02-24	1
444	2	46	36	1	Herr Bürgermeister	Dr.	Emmerich	Riesner		2015-02-24	1
441	2	42	584	519	Frau		Brigitte	Ricciotti		2017-02-11	1
448	\N	\N	\N	1	Herr		Hannes	Roither	Kontakt über Walter Riezinger	2015-02-24	1
450	\N	\N	\N	1	Frau		Madeleine	Rosenlechner		2015-02-24	1
451	\N	\N	\N	1	Herr		Manfred	Roth		2015-02-24	1
452	\N	\N	\N	1	Frau		Caroline	Roth		2015-02-24	1
458	\N	\N	\N	253	Herr Prokurist		Peter	Schafleitner		2017-05-29	1
495	\N	\N	\N	1	Frau		Helena	Schwarz		2017-05-22	0
456	\N	\N	\N	1	Frau		Ulrike	Schaffenrath		2015-02-24	1
457	\N	\N	\N	1	Herr	Dr.	Michael	Schaffer		2015-02-24	1
460	2	21	253	1	Frau		Ingeborg	Scheiber		2015-02-24	1
461	2	42	120	1	Frau		Traudl	Scheichl		2015-02-24	1
462	2	42	132	1	Herr		Helmut	Scheliessnig	Kontakt über Walter Riezinger	2015-02-24	1
463	\N	\N	\N	1	Frau		Michaela	Scheließnig	Assistenz Geschäftsleitung	2015-02-24	1
464	\N	\N	\N	1	Frau		Claudia	Scheucher		2015-02-24	1
465	2	42	241	1	Frau		Gerti	Scheuerer		2015-02-24	1
466	\N	\N	\N	1	Herr		Franz	Schindecker		2015-02-24	1
467	\N	\N	\N	1	Frau		Helga	Schinwald		2015-02-24	1
470	\N	\N	\N	1	Frau		Andrea	Schmid		2015-02-24	1
471	\N	\N	\N	1	Herr		Christian	Schmidhuber		2015-02-24	1
473	\N	\N	\N	1	Herr		Markus	Schmidt	Küchenleiter	2015-02-24	1
475	2	42	153	1	Herr	Mag.	Oliver	Schneider		2015-02-24	1
477	2	15	142	1	Frau		Ingrid	Schöchl		2015-02-24	1
480	\N	\N	\N	1	Frau	Mag.	Renate	Schönmayr		2015-02-24	1
472	\N	\N	\N	1	Frau Stadträtin	Mag.	Claudia	Schmidt		2015-04-21	0
412	2	42	82	1	Frau		Margit	Pum		2015-04-21	0
431	2	31	194	1	Frau		Sissy	Reiter		2015-04-21	0
481	2	42	545	1	Herr	Dr.	Eduard	Schöpfer		2015-04-21	1
476	2	42	160	1	Frau		Edith	Schnöll		2015-04-21	0
397	2	42	56	345	Frau		Monika	Pointner		2015-07-10	1
443	\N	\N	\N	1	Herr			Rieger		2015-06-23	0
483	\N	\N	\N	1	Herr	Dipl.-Ing.	Alexander	Schrank	Geschäftsführung	2015-02-24	1
484	2	42	30	1	Frau		Katharina	Schreilechner		2015-02-24	1
486	\N	\N	\N	1	Frau	Mag.	Irene	Schulte		2015-02-24	1
488	2	63	118	1	Frau Bürgermeisterin	Mag.	Monika	Schwaiger		2015-02-24	1
493	\N	\N	\N	1	Herr	Mag.	Florian	Schwap	Marketing	2015-02-24	1
494	2	10	163	1	Herr		Manfred	Schwarz		2015-02-24	1
474	\N	\N	\N	345	Frau	Dipl.Ing.	Felicitas	Schneider		2016-09-26	1
447	\N	\N	\N	1	Herr		Wilfried	Rogler		2016-04-18	0
407	\N	\N	\N	1	Frau		Susannne	Prieth		2016-06-23	0
469	\N	\N	\N	1	Herr Präsident		Julius	Schmalz		2016-09-08	0
492	\N	\N	\N	345	Herr		Günther	Schwaighofer		2016-09-26	1
410	\N	\N	\N	252	Frau		Sabine	Prügger		2016-09-26	1
437	\N	\N	\N	1	Herr		Kurt	Resl		2016-09-29	0
442	\N	\N	\N	1	Herr Direktor		Franz	Riedl		2016-09-29	0
449	2	42	200	1	Herr		Christoph	Rolletschek		2016-09-30	0
434	2	42	133	1	Frau	Mag.	Helga	Rendl		2016-09-30	0
402	2	42	197	519	Herr		Johann	Pongruber	Newsletter: ja, 03.12.2013	2016-10-04	1
415	2	42	544	519	Frau Präsidentin	Dr.	Helga	Rabl-Stadler	17.04.2013	2016-10-04	1
418	2	42	57	519	Herr	Dr.	Johann	Rausch	10.04.2013	2016-10-04	1
425	2	42	225	519	Frau		Elfriede	Reichl	05.01.2013	2016-10-04	1
426	2	39	477	519	Herr	Dr.	Wolfgang	Reiger	Newsletter: ja, 05.12.2013	2016-10-04	1
432	2	42	536	519	Frau		Maria	Reiter	Newsletter: ja, 24.02.2014	2016-10-04	1
435	2	14	18	519	Herr	Ing.	Günther	Resch	18.07.2008	2016-10-04	1
454	2	10	93	519	Herr		Erich	Sättele	03.03.2008	2016-10-04	1
468	2	42	255	519	Frau		Edeltraud	Schirlbauer	08.04.2014	2016-10-04	1
478	2	58	244	519	Herr LAbg.	Dr.	Josef	Schöchl	21.05.2010	2016-10-04	1
490	2	42	52	519	Herr	Dr.	Wolfgang	Schwaiger	21.05.2010	2016-10-04	1
497	2	42	161	519	Frau		Aloisia	Schwertl	Newsletter: nein, 08.12.2013	2016-10-04	1
563	2	42	188	519	Frau		Christine	Wawra	19.05.2010	2016-10-04	1
564	2	42	188	519	Herr		Hans-Peter	Wawra	Ehrenmitglied, 20.09.2011	2016-10-04	1
567	2	42	64	519	Herr	Dr.	Franz	Weber	30.06.2009	2016-10-04	1
573	2	18	124	519	Frau		Armella	Wengler	22.01.2009	2016-10-04	1
508	\N	\N	\N	1	Frau		Heidemarie	Spannlang	Assistentin Geschäftsführung	2015-02-24	1
510	\N	\N	\N	1	Herr	Mag.	Bernhard	Spiegel	Pädagogischer Leiter	2015-02-24	1
511	\N	\N	\N	1	Frau	Ing.	Dipl.Päd. Edith	Springl		2015-02-24	1
512	2	31	229	1	Herr und Frau		Werner	Stadler		2015-02-24	1
514	\N	\N	\N	1	Frau	DSA	Josephine	Stainer		2015-02-24	1
518	\N	\N	\N	1	Pater		Provinzial	Steiner		2015-02-24	1
520	2	18	75	1	Herr und Frau		Max und Talin	Steinhofer		2015-02-24	1
575	2	47	136	519	Frau		Ingrid	Werdenich	03.02.2010	2016-10-04	1
524	\N	\N	\N	1	Frau	Mag. (FH)	Christina	Stöger		2015-02-24	1
582	2	58	39	519	Herr Dir.		Karl-Armin	Wieser	23.01.2008	2016-10-04	1
598	2	42	31	519	Frau	Dipl.Ing.	Jana	Zitta	31.01.2010	2016-10-04	1
528	2	58	83	1	Herr Bgm KR		Johann	Strasser		2015-02-24	1
530	\N	\N	\N	1	Herr		Roman	Strimmer	Koch	2015-02-24	1
515	\N	\N	\N	345	Herr		Nikolaus	Stampfer		2016-10-07	1
532	\N	\N	\N	1	Herr		Harald	Sulzer	Küchenlaeiter	2015-02-24	1
535	\N	\N	\N	1	Herr		Andreas	Szigethy		2015-02-24	1
536	\N	\N	\N	1	Frau		Karin	Szvasztics	Pflegedienstleitung	2015-02-24	1
539	\N	\N	\N	1	Frau		Gabriele	Teufl	Leiterin der Pflege	2015-02-24	1
540	\N	\N	\N	1	Frau		Birgit	Thaler-Haag		2015-02-24	1
504	2	95	73	345	Herr		Christian	Sitte		2016-10-07	1
561	2	42	50	345	Herr		Josef	Walser		2016-10-07	1
548	\N	\N	\N	1	Frau	Mag.	Claudia	Trausnitz		2015-02-24	1
551	2	42	90	1	Frau		Caroline	Udvarhelyi		2015-02-24	1
553	2	56	24	1	Herr	Mag.	Alfred	Unterberger		2015-02-24	1
554	\N	\N	\N	1	Frau		Daniela	Vsol		2015-02-24	1
552	2	42	117	252	Frau	Mag.	Michaela	Ullmann		2016-10-08	1
559	\N	\N	\N	1	Frau Dipl.-Päd.		Daniela	Wallner		2015-02-24	1
560	2	27	11	1	Herr Bürgermeister	Ing.	Simon	Wallner		2015-02-24	1
568	\N	\N	\N	1	Herr			Weichenberger		2015-02-24	1
569	\N	\N	\N	1	Herr		Heimo	Weilharter		2015-02-24	1
570	\N	\N	\N	1	Herr		Werner	Weinguny		2015-02-24	1
572	2	42	131	1	Frau	Mag.	Eva	Weissenbacher		2015-02-24	1
577	\N	\N	\N	1	Frau		Adelheid	Widmoser		2015-02-24	1
529	2	28	164	519	Herr		Reiner	Strehl		2017-02-11	1
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
538	\N	\N	\N	1	Herr			Terler		2015-05-14	0
562	\N	\N	\N	1	Herr		Georg	Walter		2015-05-14	0
503	\N	\N	\N	1	Herr		Erwin	Simmer		2015-05-14	0
534	\N	\N	\N	1	Herr		Johann	Svager		2015-05-14	0
527	\N	\N	\N	519	Herr Ök.-Rat.		Walter	Strasser		2015-05-18	1
549	\N	15	550	345	Frau	Dipl.Ing.	Tina	Tscherteu		2015-05-20	1
537	2	42	207	1	Frau		Christiane	Teichmann		2016-12-03	0
593	2	18	219	1	Frau		Irmgard	Wöhrl		2016-12-03	0
581	\N	55	60	1	Herr		David	Wieser		2015-02-24	1
583	\N	\N	\N	1	Herr	Mag.	Franz	Wieser, MBA		2015-02-24	1
584	2	10	76	1	Frau		Gudrun	Wilhelm		2015-02-24	1
546	2	42	548	519	Herr		Felix	Tomo		2017-02-11	1
590	\N	\N	\N	1	Herr		Christian	Winzer		2015-02-24	1
502	2	42	546	253	Frau		Angela	Simmel	28.01.2010	2017-03-03	0
596	\N	\N	\N	1	Frau GR		Marlene	Wörndl		2015-02-24	1
599	\N	\N	\N	1	Herr		Florian	Zöchling		2015-02-24	1
600	\N	\N	\N	1	Frau		Charlotte	Zöhrer		2015-02-24	1
742	\N	\N	\N	519			Rudi	Krepper	Leitung Warenverteilzentrum Salzburg	2017-05-08	1
498	\N	\N	\N	252	Herr	DDDr.	Clemens	Sedmak	Ehrenmitglied	2016-05-09	1
594	\N	\N	\N	1	Herr		Erich	Woltsche		2016-09-08	0
507	\N	\N	\N	1	Frau		Manuela	Sokolt		2016-09-08	0
588	\N	\N	\N	252	Frau		Marianne	Winkler		2016-09-24	1
501	2	2	183	345	Frau		Karin	Siller	Fax 01/5864181-10	2016-09-26	1
597	2	42	637	345	Frau		Maria	Zeppezauer		2016-09-29	1
545	\N	\N	\N	252	Herr	Dr.	Raimund	Tischler		2016-09-29	1
544	2	31	256	252	Herr 	DI	Peter 	Thuswaldner		2016-09-29	1
500	\N	\N	\N	345	Herr	Dr.	Günther	Signitzer		2016-09-30	0
521	2	56	234	1	Herr		Georg	Steinitz		2016-09-30	0
505	2	42	300	519	Sr.		Joanella	Six	08.11.2010	2016-10-04	1
506	2	35	37	519	Frau		Maria	Slowak	09.08.2009	2016-10-04	1
525	2	42	115	519	Frau		Edith	Stöllinger	18.05.2010	2016-10-04	1
526	2	42	115	519	Herr		Engelbert	Stöllinger	10.04.2013	2016-10-04	1
531	2	29	148	519	Herr	Dipl.Ing.	Christian	Struber	23.02.2012	2016-10-04	1
541	2	58	14	519	Frau		Monika	Thonhofer	10.04.2013	2016-10-04	1
557	2	11	250	519	Frau		Andrea	Waldmann	18.09.2010	2016-10-04	1
578	\N	140	645	519	Herr		Toni	Wieland		2017-05-21	1
566	\N	\N	\N	1	Herr		Herbert	Weber		2017-05-30	0
601	\N	\N	\N	1	Herr	Mag.	Bernhard	Zoller		2015-02-24	1
603	\N	\N	\N	1	Herr	Mag.	Klaus	Zuckerstätter		2015-02-24	1
1	\N	\N	\N	1	Herr		Matthias	Schnöll		2015-02-20	1
655	2	127	591	519	Herr	Mag.	Rudolf	Zrost	Newsletter: ja, 27.05.2015	2016-10-04	1
606	\N	\N	\N	252	Herr		Manfred	Kiesenhofer		2015-04-10	1
608	\N	\N	\N	252	Frau		Erika	Wimmer		2015-04-10	1
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
379	2	42	195	1	Frau	Dr.	Brigitta	Pallauf	Newsletter: ja	2015-04-21	0
20	2	42	151	1	Frau		Franziska	Aschauer		2016-10-07	0
571	2	42	100	1	Herr und Frau	Dr.	Johann und Irene	Weiß		2015-04-21	0
579	2	43	239	1	Herr		Reinfried	Wieser		2015-04-21	0
580	2	42	551	1	Herr KommR		Johann	Wieser		2015-04-21	1
631	\N	\N	\N	345	Frau	Mag.	Dagmar	Köttl		2015-05-14	1
586	2	42	144	1	Frau		Grete	Windhager		2015-04-21	0
605	5	106	460	345	Frau/Herr		Test	Persona	Zuschauer im Testsystem	2015-04-22	0
618	\N	\N	\N	345	Frau		Lisa	Authried		2015-05-14	1
621	\N	\N	\N	345	Herr	Prof. Dr.	René	Schmidpeter		2015-05-14	1
622	\N	\N	\N	345	Herr		Peter	Scheließnig		2015-05-14	1
623	\N	\N	\N	345	Frau		Ingrid	Spitaler		2015-05-14	1
645	\N	53	574	345	Herr		Leopold	Reichenauer		2016-10-07	1
625	\N	\N	\N	345	Frau		Sandra	Lagler		2015-05-14	1
626	\N	\N	\N	345	Herr		Roland	Lochmann		2015-05-14	1
627	\N	\N	\N	345	Frau		Bianca	Rieder		2015-05-14	1
595	\N	\N	\N	345	Herr			Reischl		2015-05-14	1
632	\N	\N	\N	345	Herr	Ing.	Josef	Putz		2015-05-14	1
657	2	128	647	252	Herr		Josef	Nobis	Newsletter: nein, 22.12.2015	2016-10-08	1
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
408	2	53	119	252	Frau		Elena	Proksch		2016-10-19	1
519	2	42	547	252	Herr		Michael	Steingaßner	Tätigkeit: Administration	2016-12-03	1
149	2	56	85	519	Frau		Christa	Graf	Newsletter: ja	2017-02-11	1
607	6	108	461	252	Frau	Dr.	Tina	Widmann		2017-03-30	1
646	\N	120	575	345	Frau		Elisabeth	Pfeffer		2015-05-20	1
615	2	42	527	519	Herr		Anton	Gietzinger		2015-06-23	1
620	\N	\N	\N	253	Frau		Lena	Repplinger		2017-05-29	1
648	2	121	577	519	Herr	MAS	Kurt	Schiechl		2015-05-23	1
650	\N	\N	\N	345	Frau		Petra	 Ummenberger		2015-06-10	1
617	\N	\N	\N	345	Herr	Ing.	Josef	Bachleitner		2015-06-20	1
658	\N	\N	\N	345	Frau		Edith 	Frauscher	Marketing- und Innovationsmanagerin	2017-05-22	0
634	\N	\N	\N	252	Frau Präsident	Dr.	Maria	Ganauser		2017-05-29	1
619	\N	\N	\N	345	Herr		Simon	Letsch		2017-05-29	0
653	8	42	587	441	Herr		Stefan	Scherzer		2015-09-09	0
654	2	77	588	519	Herr		Thomas	Klein		2015-09-10	1
649	2	126	579	519	Herr	Dr.	Leonhard	Schitter	Newsletter: nein, 20.05.2015	2016-10-04	1
221	2	42	272	519	Herr Generaldirektor	Dr.	Johannes	Hörl	Newsletter: nein, 28.05.2013	2016-10-04	1
656	2	42	592	441	Frau		Sabine	Füssl		2016-07-14	1
624	\N	\N	\N	519	Herr	DI Dr. 	Gerhard	Jöchtl		2016-09-08	1
628	\N	\N	\N	345	Frau	Mag.	Christina	Laggner		2016-09-29	1
629	\N	\N	\N	345	Herr	MSc	Andreas	Van-Hametner		2016-09-26	0
36	2	53	523	519	Frau Dir. KR		Regina	Bayer-Volkmann	23.01.2008	2016-10-04	1
21	\N	\N	\N	252	Herr		Franz	Aschauer		2016-09-30	0
248	2	52	452	519	Herr		Oskar	Kaufmann	10.11.2009	2016-10-04	1
652	2	124	582	519	Herr	Dr.	Helmut	Leube	Newsletter: ja, 30.05.2015	2016-10-04	1
647	2	42	195	519	Frau	Dr.	Brigitta	Pallauf	Newsletter: ja, 25.01.2014	2016-10-04	1
659	\N	\N	\N	519	Herr		Florian	Hoffmeister		2015-12-02	1
660	\N	130	597	519	Frau		Sabine	Mayrhofer		2015-12-09	1
704	\N	\N	\N	253	Herr Präsident	Abg. z. NR Ök.-Rat	Franz	Eßl		2016-09-25	1
522	2	42	220	252	Herr		Bruno	Steinwender		2016-01-04	0
683	2	64	617	345	Herr	Mag.	Paul 	Lindner		2016-10-07	1
446	2	53	589	345	Frau		Cornelia	Robl		2016-10-07	1
709	\N	18	631	252	Herr	Mag.	Andreas	Kadi		2016-09-25	1
643	\N	53	586	345	Herr		Hugo	Rohner	Newsletter: ja; 18.08.2015	2016-10-07	1
662	\N	\N	\N	519	Herr			Bruch		2016-02-03	1
663	\N	\N	\N	519	Frau			Lorenzl		2016-02-03	1
664	\N	\N	\N	519	Frau		Manuela	Rauter		2016-02-03	1
166	2	31	643	345	Herr		Sören	Guth		2016-10-07	1
101	2	25	109	345	Herr Landesrat a. D.		Sepp	Eisl		2016-03-02	1
330	2	44	205	345	Frau		Elke	Mayer		2016-03-02	1
668	3	24	\N	345	Herr		Siegfried	Huber    		2016-10-07	1
721	7	24	640	345	Herr 		Gerhard 	Richter		2016-10-07	1
701	\N	\N	\N	252	Herr	Mag.	Walter	Schnitzhofer		2016-10-08	1
665	\N	\N	\N	252	Herr		Mario	Ebner		2016-04-11	1
53	2	47	99	252	Herr	Ass.-Prof. Dr.	Johannes	Brandl	15.07.2010	2016-10-08	1
670	\N	42	604	519	Herr		 Wilfried 	Rogler		2016-04-20	1
401	\N	\N	\N	1	Herr		Hannes Christoph	Pöll	Geschäftsführer	2016-04-20	0
671	\N	\N	\N	519	Frau 		Sarah	Feiersinger		2016-04-21	1
692	2	101	622	519	Herr Landesrat	Dipl.-Ing. Dr.	Josef	Schwaiger		2016-10-13	1
675	\N	\N	\N	253	Herr		Christian	Greim		2016-06-23	1
676	\N	\N	\N	253	Frau		Birgit	Schmauss		2016-06-23	1
677	\N	\N	\N	253	Frau		Monika	Stöckl		2016-06-23	1
591	2	42	169	519	Frau		Elisabeth	Apfelthaler (Wittich)	Tätigkeit: Waren	2016-11-26	0
678	\N	\N	\N	345	Frau	Mag.	Sabine	Wolfsgruber	Geschäftsführerin	2016-06-27	1
679	\N	\N	\N	345	Herr		Dominik	Teubi	Projektmanager	2016-08-01	1
681	\N	\N	\N	519	Frau		Leona	Lorentschitsch		2016-08-22	1
682	\N	42	616	519	Frau	Mag	Barbara	Scheibner		2016-09-06	1
301	\N	\N	\N	1	Herr		Wolfgang	Leitinger	Geschäftsführer	2016-09-08	0
685	\N	\N	\N	519	Frau	Mag.	Tatjana	Oppitz		2016-09-08	1
684	\N	\N	\N	519	Herr Präsident	KommR	Konrad 	Steindl 	 	2016-09-08	1
686	\N	\N	\N	519	Frau	Mag. Dr.	Doris	Walter		2016-09-08	1
687	\N	\N	\N	519	Frau	Dr. 	Christine 	Vallaster		2016-09-08	1
688	\N	\N	\N	519	Herr 	DI (FH) DI 	Peter 	Haber		2016-09-08	1
589	\N	\N	\N	1	Herr	Mag.	Marcus	Winkler		2016-09-08	0
689	\N	\N	\N	519	Frau	DI	Helga 	Frauenlob		2016-09-14	1
690	\N	\N	\N	345	Frau		Beatrice 	Kress 		2016-09-24	1
691	2	101	622	253	Herr	Mag.	Thomas	Kerschbaum		2016-09-25	1
693	2	101	622	253	Herr		Michael	Unterberger, MA		2016-09-25	1
694	\N	\N	\N	253	Frau		Isabella	Neutatz		2016-09-25	1
695	\N	\N	\N	253	Frau		Daniela	Wietzke		2016-09-25	1
696	\N	\N	\N	253	Herr	Mag.	Manfred	Kröswang		2016-09-25	1
697	\N	\N	\N	253	Herr	Dr.	Peter	Unterkofler	Päsident	2016-09-25	1
238	2	42	4	252	Frau	Mag.	Bärbel	Januschewsky	15.01.2013	2016-12-21	1
350	2	42	242	252	Herr		Michael	Mrazek	Newsletter: nein, 04.12.2013	2016-12-30	1
680	\N	\N	\N	252	Frau	Mag.	Christine 	Mettler-Dornhofer		2017-01-16	1
698	\N	\N	\N	253	Herr	Mag.	Markus	Ertl		2016-09-25	1
699	\N	\N	\N	253	Frau	Mag.	Karin	Krassler		2016-09-25	1
700	\N	\N	\N	253	Herr	Mag.art.	Lukas	Schwingenschuh		2016-09-25	1
702	\N	\N	\N	253	Frau	Mag. pharm. Dr.	Sonja	Jacoby, PhD, MbA-HSG,		2016-09-25	1
703	\N	\N	\N	253	Herr		Josef	Prantler		2016-09-25	1
17	2	64	140	519	Frau		Anna	Aminger	21.05.2010	2016-10-04	1
706	\N	\N	\N	253	Frau	DI	Gudrun	Obersteiner		2016-09-25	1
707	\N	\N	\N	253	Frau	DI (FH)	Silvia	Scherhaufer		2016-09-25	1
574	2	28	42	519	Frau	Mag.	Ulrike	Wenzlhuemer		2017-02-11	1
711	7	42	497	252	Frau	Mag.	Claudia	Schmidt		2016-09-25	1
712	\N	36	633	252	Frau 	Dr. 	Gudrun	Kugler		2016-09-25	1
713	\N	31	634	252	Herr	Dr.	Walter	Antosch		2016-09-25	1
714	\N	121	635	252	Frau 	Mag.	Cornelia 	Thöni		2016-09-25	1
630	\N	\N	\N	345	Herr Bakk.Komm.		Martin	Wautischer		2016-09-26	0
669	\N	\N	\N	252	Frau 	Mag.	Anna 	Viehhauser		2016-09-26	1
708	\N	\N	\N	345	Herr Direktor	DI	Richard	Breschar		2016-09-26	1
81	2	42	252	519	Frau		Ingrid	Doblinger	28.07.2009	2016-10-04	1
666	\N	\N	\N	253	Frau		Ramona	Götz		2016-09-26	0
715	\N	\N	\N	345	Frau		Daniela	Braun		2016-09-29	1
150	\N	\N	\N	1	Frau		Katharina	Grasser	Fax: 0662/841079;www.innovationserkstatt.at	2016-09-29	0
705	\N	\N	\N	345	Herr Direktor	Dipl.-Ing. Dr.	Nikolaus	Lienbacher, MBA		2016-09-29	1
716	2	117	638	345	Frau		Maria	Reitinger  		2016-09-29	1
717	\N	\N	\N	345	Frau	Mag.	Christine	Hochholdinger		2016-09-29	1
718	\N	\N	\N	345	Herr Direktor		Kurt	Katstaller		2016-09-29	1
719	\N	\N	\N	345	Herr	Mag.	Christian	Pucher		2016-09-29	1
720	\N	\N	\N	345	Frau		Helene	Weiss MA		2016-09-29	1
667	\N	\N	\N	345	Frau		Elfriede	Binder		2016-09-30	1
253	3	134	660	253	Herr	DI	Albert	Kiefel		2017-02-11	1
674	\N	42	609	519	Herr	Dipl.Bw.	Gerhard	Feichtinger	Newsletter: nein, 03.12.2013	2016-10-04	1
672	2	42	608	519	Herr		Gerhard	Grosschädel	Newsletter: ja, 27.05.2015	2016-10-04	1
272	2	42	95	519	Frau		Herma	König	Newsletter: ja, 03.12.2013	2016-10-04	1
389	3	24	55	519	Frau		Isolde	Pfingstl	Newsletter: ja, 22.11.2011	2016-10-04	1
651	2	42	581	519	Herr		Bernhard	Rosegger	Newsletter: nein, 28.05.2015	2016-10-04	1
453	2	65	97	519	Frau		Margit	Sachsenhofer	14.03.2010	2016-10-04	1
661	2	28	598	519	Herr	Dr.	Eduard	Thaler	Newsletter: ja; 31.12.2015	2016-10-04	1
673	\N	42	113	252	Frau	Mag.	Friederike	Hurch	02.04.2012	2017-06-08	0
710	\N	137	632	252	Herr		Otmar	Wimmer		2017-06-22	1
724	\N	\N	\N	252	Herr KommR		Heinrich 	Spängler		2016-10-12	1
726	\N	6	652	252	Herr	Dr.	Peter	Ransmayr		2016-10-12	1
489	\N	\N	\N	1	Herr Landesrat	DI Dr.	Josef	Schwaiger		2016-10-13	0
148	2	42	77	252	Frau		Marijana 	Barisic, Bakk.Phil.	Newsletter: ja, 24.06.2013, hieß früher: Grabovac	2016-10-22	1
162	\N	\N	\N	1	Frau		Siglinde	Gschwandtner		2016-11-12	0
727	2	11	70	253	Herr	Prim. Univ.Prof. Dr.	Wolfgang	Sperl		2016-11-19	1
509	2	11	70	1	Herr	Univ.Prof. Dr.	Wolfgang	Sperl		2016-11-19	0
760	\N	\N	\N	519	Herr			Strasser		2017-06-11	1
592	\N	\N	\N	1	Herr	Dr.	Alois	Wittinghofer		2017-06-21	0
730	\N	\N	\N	441	Frau		Elisabeth	Apfelthaler		2016-11-26	0
731	2	42	657	441	Frau		Elisabeth	Apfelthaler		2016-11-26	1
326	\N	\N	\N	1	Frau		Maria	Marx		2016-12-01	0
259	2	32	170	1	Herr		Hans	Kitzberger		2016-12-03	0
733	\N	121	659	252	Frau	Mag.	Astrid 	Grabner	Akademisches Gymnasium	2016-12-04	1
732	\N	121	659	252	Frau	Mag.	Astrid 	Grabner	Akademisches Gymnasium	2016-12-04	0
729	2	32	656	252	Frau		Regina	Steinhagen 		2016-12-17	1
728	\N	141	654	252	Herr		Reinhard	Pribil	Newsletter: ja, 22.11.2016	2016-12-21	1
75	2	49	53	252	Herr		Günther	Derler	17.04.2013	2016-12-30	1
735	2	42	670	253	Frau	Mag.	Verena	Grafinger		2017-02-01	1
736	\N	\N	\N	253	Frau	Mag.a	Bettina	Ehrlich		2017-02-01	1
734	2	42	671	253	Herr	Mag.	Harald	Kratzer		2017-02-10	1
185	2	42	127	519	Frau		Greta	Hauswiesner	Newsletter: ja	2017-02-11	1
228	2	18	15	519	Herr	Dr.	Wolfgang	Hübl		2017-02-11	1
252	3	24	6	519	Frau		Doris	Kiefel		2017-02-11	1
616	2	56	540	519	Herr		Peter	Nussbaum	Newsletter: ja	2017-02-11	1
445	2	42	28	519	Herr	Mag.	Walter	Riezinger		2017-02-11	1
642	\N	119	572	519	Frau		Lisa	Traubenek		2017-02-11	1
602	2	42	607	519	Frau		Sabine	Zöpfl	Newsletter: ja;	2017-02-11	1
737	2	42	672	519	Frau		Angela	Simmel	28.01.2010	2017-03-19	1
738	\N	\N	\N	519			Leitung	Hayat		2017-03-28	1
739	2	13	674	441	Herr		Thomas	Kletzl		2017-03-29	1
345	2	42	233	253	Frau	DI	Doina	Moldovan		2017-03-30	1
740	2	32	675	441	Herr		Werner	Ruß		2017-03-30	1
644	\N	42	606	253	Herr	DI Dr.	Alois	Schwaiger	Newsletter: ja;	2017-03-30	1
762	\N	71	692	252	Herr		Martin	Herbst		2017-06-22	1
741	\N	42	676	519	Herr	Mag.	Gerhild 	Hofer, MBA	Klartext PR	2017-05-08	0
744	\N	\N	\N	519	Herr		Michael 	Mayerhofer		2017-05-08	1
763	2	42	693	737	Herr	Dr.	Rudolf	Stadler	23.6.2017	2017-06-26	1
725	\N	42	648	252	Frau 		Elisabeth 	Hörl		2017-05-22	1
745	\N	42	679	252	Frau		Gabriela 	Moretti-Prucher		2017-05-22	1
746	\N	\N	\N	253	Frau		Kristina	Höhn	Marketing- und Innovationsmanagerin	2017-05-22	1
747	\N	149	680	252	Herr		Günther 	Berberich		2017-05-22	1
748	\N	149	680	252	Herr		Günther 	Berberich		2017-05-22	1
743	\N	42	676	252	Frau	Mag.	Gerhild	Hofer		2017-05-22	1
750	\N	\N	\N	252	Herr	MMag.	Bernhard 	Pichler		2017-05-22	1
542	\N	\N	\N	1	Herr	Mag.	Thomas	Thöny		2017-05-29	0
565	2	42	238	253	Frau	Mag.	Verena	Weber		2017-05-29	1
749	\N	57	681	252	Herr 	Dr. 	Michael 	Mayr		2017-05-29	1
751	\N	42	682	519	Herr	Dr. 	Wolfgang	Fischer 	GFB & Partner Unternehmensberatung	2017-05-30	1
752	\N	\N	\N	519	Herr		Josef 	Kendlbacher		2017-05-30	1
754	\N	\N	\N	519	Herr		Martin	Ettinger		2017-05-30	1
755	\N	\N	\N	519	Herr	Prof. DI 	Heinz 	Spitzauer		2017-05-30	1
756	\N	\N	\N	519	Herr	Präsident Dr. 	Axel 	Greiner		2017-05-30	1
753	\N	\N	\N	519	Herr	Ing.	Walter 	Kogler		2017-05-30	1
491	\N	\N	\N	252	Herr	Mag.	Christoph	Schwaiger		2017-06-07	1
757	\N	\N	\N	253	Frau		Manuela	Rindler		2017-06-08	1
758	\N	\N	\N	253	Herr		Thomas	Gassner		2017-06-08	1
759	\N	\N	\N	519	Frau		Marion	Müller		2017-06-11	1
764	2	42	693	253	Herr	Dr.	Rudolf	Stadler		2017-06-26	0
765	\N	42	693	519	Herr	Dr	Rudolf	Stadler	Beitritt 23 06 17	2017-06-26	0
274	\N	\N	\N	1	Herr		Alexander	Koppensteiner		2017-06-26	0
766	\N	\N	\N	519			Alexander	Koppensteiner		2017-06-26	1
533	\N	\N	\N	252	Herr		Gerhard	Sulzer Sen.		2017-06-27	1
761	\N	134	691	252	Frau 		Petra 	Mitiska		2017-07-05	1
767	\N	3	694	252	Herr	Dipl.Ing.	Martin	Mayrhofer-Reinhartshuber		2017-07-14	1
768	2	42	695	252	Herr		Dominik	Mayer		2017-07-14	1
769	2	11	696	252	Herr		Tobi	Ullrich		2017-07-14	1
770	2	11	696	252	Herr		Tobi	Ullrich		2017-07-14	1
\.


--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 208
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('person_person_id_seq', 770, true);


--
-- TOC entry 3262 (class 0 OID 420674)
-- Dependencies: 214
-- Data for Name: platformuser; Type: TABLE DATA; Schema: public; Owner: -
--

COPY platformuser (person_id, permission_id, password, login_email) FROM stdin;
1	1	TdKGOS_A7e7xbF7SViJVch1mHlbOogpaGiOHhIVVCLD7MkFCyDAOA	mschnoell@gmx.net
519	1	29SkSmLeHGW3YDA2J1mBPP3vHYRtzv9ER8qfphg0p_GIpLWsx1nLc	michael.steingassner@view-salzburg.at
737	1	F-5w2QK5OZxznfPwXrrEalI6MRrzoUkV4eEE92SdUm7xFkX8ns300	angela.simmel@gmail.com
253	1	cwAOMlVjZrCioaZcjBpxfmuL7lPi6DUbVBTQR4P3djk_DukBP9mb4	albert.kiefel@view-salzburg.at
681	3	TZPW4TmLKXdDYggk7MdD5E57My9t3iJ4Um2UxllCPCRuNiebRJmuc	llorentschitsch@yahoo.de
165	3	lZKhHIlLmLqNab7rs873izruuohNNOIplNXnMxafTGHk1szmq1PjE	irmin.gundl@aon.at
446	3	WgMEni3d_GKdtlfQ9WTk0eHCcfYgPOiZE2jdt8M22X0Hp_PWzbDIw	conny_robl@yahoo.de
252	1	qP7-gSHcI4FGV8mutwTIn11knLxQdNvHAbYLJYSjDaWi2J9F1RgP0	doris.kiefel@view-salzburg.at
441	1	mKekp7ZAZh9XvX0rgI8u6DuYlviIPym5ZKLDDN-eSuAq6J5DQ3t_g	b.ricciotti@view-salzburg.at
642	1	nbHbeyTorczuCZGtoMTV1sNG663SKpzxJx2uWZQN4VdXPP3laz0lk	lisa_traubenek@yahoo.de
574	1	y4BB3bPNeaw0MMohoK2Soj8ndduAV2DEvn7dAHauC3DfrJnR1-bfU	ulrike.wenzlhuemer@view-salzburg.at
602	1	V0ObcglxthAu7Za0JY0MmdwnA1523DaR8yVIUNsdd2_nMfHCIagBQ	sabine.zoepfl@gmx.at
\.


--
-- TOC entry 3263 (class 0 OID 420677)
-- Dependencies: 215
-- Data for Name: relorgcat; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relorgcat (organisation_id, category_id) FROM stdin;
280	3
280	6
291	6
291	3
\.


--
-- TOC entry 3259 (class 0 OID 420655)
-- Dependencies: 209
-- Data for Name: relorgtype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relorgtype (type_id, organisation_id) FROM stdin;
5	20
5	25
5	31
7	270
5	58
5	72
5	86
5	251
6	62
5	252
5	117
5	130
5	136
5	139
5	140
5	152
5	197
5	206
6	106
6	8
6	10
6	6
6	15
5	119
5	263
6	34
5	255
6	79
6	80
7	276
7	71
6	93
6	160
6	165
6	120
6	126
6	133
6	134
5	229
6	167
6	168
6	169
6	170
6	171
6	172
6	173
6	174
6	280
6	180
6	181
6	182
6	183
6	184
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
7	149
7	199
7	215
7	203
6	224
5	282
5	57
6	17
6	250
5	67
6	102
7	76
5	112
7	114
5	141
6	178
5	116
6	107
5	266
6	175
6	192
7	124
6	131
5	18
5	151
6	32
7	162
6	177
6	179
6	186
5	189
6	96
6	202
7	207
6	95
6	94
6	190
5	221
6	36
7	143
7	51
5	53
7	4
7	227
7	30
7	41
7	42
7	47
7	103
6	213
5	164
7	70
5	156
5	154
7	238
6	204
7	200
7	240
6	121
5	108
7	123
7	242
7	56
7	239
7	129
7	155
5	246
7	247
5	90
6	253
5	254
5	285
5	286
5	256
6	287
6	257
6	258
5	288
6	259
6	289
6	291
6	225
5	11
5	260
5	261
7	292
5	262
6	264
6	226
7	293
5	294
5	142
5	265
5	60
5	267
5	300
5	301
5	269
5	73
5	302
5	271
5	157
5	109
6	193
5	13
6	185
6	97
5	205
5	241
7	220
7	234
7	233
5	214
6	9
6	12
6	23
6	16
6	24
6	44
6	45
6	46
6	63
6	65
6	74
6	38
6	81
6	82
6	83
6	92
6	98
6	249
6	99
6	248
6	100
6	101
6	132
6	115
6	122
6	138
6	148
6	150
6	153
6	191
6	223
6	209
6	210
6	272
5	303
5	145
\.


--
-- TOC entry 3260 (class 0 OID 420658)
-- Dependencies: 210
-- Data for Name: relpersontype; Type: TABLE DATA; Schema: public; Owner: -
--

COPY relpersontype (type_id, person_id) FROM stdin;
3	53
2	373
4	597
2	47
2	50
2	70
2	117
2	130
2	143
2	179
2	250
4	716
2	287
2	300
2	340
2	355
2	717
2	379
3	657
2	439
2	442
2	444
2	463
2	718
2	480
2	485
2	487
2	488
2	489
2	719
2	559
2	572
2	577
2	583
2	599
2	720
4	552
3	28
3	216
4	544
4	726
4	375
2	692
3	141
2	141
3	112
4	408
1	591
3	591
3	148
3	727
3	17
3	36
3	731
2	86
1	519
3	519
2	732
2	733
4	18
3	424
3	37
3	728
4	238
3	51
3	38
3	350
3	363
3	379
3	386
3	205
3	673
3	75
3	405
3	315
4	735
4	736
3	27
1	27
4	12
3	81
4	15
4	20
4	25
4	33
4	35
4	40
4	48
4	60
4	61
4	63
4	67
4	68
3	85
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
4	173
4	175
4	176
4	178
4	182
4	183
4	186
4	188
4	190
3	94
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
4	247
4	251
4	256
4	259
4	261
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
3	97
4	342
4	361
4	365
4	374
4	378
4	382
3	674
3	734
3	114
2	734
3	121
3	120
3	135
3	136
3	145
3	147
3	672
3	158
3	165
3	167
3	177
3	180
3	184
1	22
1	44
3	44
1	100
3	100
1	140
3	140
3	149
1	149
1	185
3	185
3	208
1	208
1	209
3	209
1	228
3	228
4	385
4	392
4	396
4	404
4	406
3	252
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
1	252
4	508
4	509
4	511
4	512
4	513
4	520
4	521
4	528
4	550
4	551
4	553
4	556
4	560
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
3	616
4	600
4	601
4	603
1	616
3	232
4	523
4	543
4	371
4	168
2	612
4	320
2	69
4	95
4	134
1	430
3	430
1	441
4	196
3	441
4	220
4	224
1	445
2	333
2	347
4	337
3	445
4	372
4	377
3	215
2	481
3	221
4	517
4	547
4	580
2	621
4	622
4	623
4	631
4	632
3	225
4	635
4	636
3	229
3	587
4	640
4	641
4	527
4	549
4	646
4	615
4	397
4	93
4	42
4	522
4	14
3	34
1	34
4	80
4	101
4	107
4	226
4	330
4	358
4	665
4	670
3	498
2	678
3	656
4	682
4	366
3	242
4	685
4	684
3	246
3	248
1	529
3	529
3	258
3	262
1	546
1	642
3	267
3	642
3	268
3	269
1	574
3	574
3	270
1	602
3	272
2	13
4	691
4	693
3	297
3	652
3	602
2	698
2	699
2	700
2	702
2	703
4	192
2	709
4	711
4	712
4	713
4	55
4	73
2	233
2	474
2	500
2	279
3	310
3	332
3	343
3	348
3	351
3	352
3	353
3	356
3	359
3	368
3	647
3	389
3	399
3	402
3	415
3	418
3	425
3	426
3	432
3	435
3	651
3	453
3	454
3	468
3	649
3	478
3	490
3	497
3	505
3	506
3	525
3	526
3	531
3	661
3	541
3	557
3	558
3	563
3	564
3	567
3	573
3	575
3	582
3	598
3	655
2	384
2	515
4	30
4	683
4	504
4	645
4	88
4	264
3	446
1	446
3	643
4	561
4	166
4	198
4	341
3	305
3	502
1	737
3	737
4	307
3	292
1	739
3	345
1	253
3	253
1	740
1	644
3	644
4	741
4	725
4	565
4	235
4	634
4	751
4	265
4	754
4	755
4	756
4	753
4	752
2	757
2	758
4	241
4	710
3	763
2	764
3	765
4	767
4	768
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
971	722	11	0676/5580048
7	19	11	0662/856777-22
909	208	10	0650/7339596
11	25	11	0662 8072-0
910	209	10	0699/11780107
485	587	11	0699/10030007
16	29	11	0662/882883-0
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
974	620	10	+49/160/98917218
79	143	11	06412/6355
80	144	11	0662/66999-16
84	150	11	0662/841079
85	151	11	0662/434702
912	228	10	0664/3217283
911	228	10	0662/628670
88	156	11	0662/823274
89	156	11	0664/8394734
90	157	10	0660/7648802
91	163	11	0049/172/8840805
92	163	11	0049/8651/4578
93	164	11	06223/3211-11
973	620	11	+49/7121/1494-806 
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
975	273	11	0662/434702
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
138	230	11	06244/5201-41
141	234	11	0662 8072-0
803	248	11	06274/4256-5
146	239	11	0662/8388
802	248	11	0676/89692604
491	640	11	0662/8072-2015 
494	6	11	0662/843629
493	6	11	0664/3951550
495	641	10	0664/6185500
149	245	11	06225/3281
152	251	11	0676/83878-0
804	262	11	0664/4532596
159	257	11	0664/4033008
160	260	11	06245/80427-0
161	261	10	06272/7957
162	261	10	0680/20131191
164	263	11	0662/642723-16
167	271	11	06223/2223
168	271	11	0664/2542454
170	274	11	0041/44 808 49 56
805	269	10	0664/2612008
806	343	10	0662/661957
808	647	10	0664/8565665
809	432	10	0664/2612008
860	731	10	06648291447
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
863	519	10	0699/12054062
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
812	651	10	0662/435406
201	321	11	07612/76577-166
202	323	11	0662/661172
203	325	11	0662/661046
204	326	11	0662/650436-503
205	326	11	0699/11152909
977	458	11	0664/1619206
210	335	11	06216/20333
211	334	11	0662/436383-14
212	336	11	50/800-81551
214	338	11	0662/841079
215	339	11	0662/876681
976	458	11	0662/889123600
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
813	505	11	0662/874016-12
231	369	11	06245/83124
235	374	10	050/2211-1209
814	506	11	0662/8886-1540
237	378	11	0662/8072-0
238	379	10	0664/8565665
240	385	10	0660/1621866
241	387	11	0662/661046
242	388	11	0662/435541-220
243	390	11	06212/29600-30
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
257	409	11	07674/616-727
815	564	11	0662/885050
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
295	459	11	0664/41422771
296	459	11	07748/2229-0
297	462	11	0662/843748
298	463	11	0662/820220-551
575	93	11	0662 849373-164
299	464	11	0662/838229-03
300	464	11	0664/6142074
301	466	11	06223/3211-13
302	466	11	0650/3804508
303	467	11	06216/5373-17
304	470	11	0662/908668-200
305	471	11	0664/2444757
306	472	11	0662 8072-0
307	473	11	08651/960140
309	479	11	0049/8651/9829-210
310	480	11	0662/80443043
311	482	11	0662 8072-0
312	483	11	0662 8072 3073
313	484	10	0664/2335463
314	487	10	0664/8466369
317	488	10	06212/2308-10
318	488	10	0676/6628007
320	493	11	0662/2455-147
321	495	11	0662/66 9 11-221
322	496	10	0662/870211
648	330	11	
649	330	11	
819	723	11	0662/267463
820	384	10	0676/82 60 9729
821	515	10	0662/8698-14
822	515	10	0676/47 61 240
824	683	10	0680/2081260
323	499	11	0662/8389
325	503	11	0662/438676-210
328	507	11	01/60897839
329	508	11	0662 8072 2319
330	510	11	0662/636766-15
331	510	11	0676/88144663
332	514	11	0662/439728
978	565	10	0664/1123361
335	518	11	0662/432901-153
336	518	11	0676/87466603
342	530	11	0662/642723-16
343	532	11	0662/4661-539
344	534	11	0662/636766
345	535	11	0662/834595
346	536	11	06215/8021-26
347	539	11	06225/8219-28
348	540	11	0662/458458-14
349	540	11	0664/4860547
350	542	11	0662/434702
353	550	10	0664/3837372
354	551	10	0662/828531
355	553	10	0664/1213245
356	554	11	06215/5308
357	554	11	0681/20300-345
865	729	10	0660/4773447
359	562	11	0662/435541-220
362	568	11	0662/459606-4
363	569	11	0662/620135
364	570	11	050145-2410
366	576	11	0662 8072-0
916	252	10	0049/8654/65801
369	581	10	0664/3847613
370	584	10	0699/11850459
371	585	11	0662/423944
372	585	11	0664/4022985
375	589	11	0662/6382-0
917	252	10	0676/3252443
377	594	11	06229/20493
378	594	11	0664/88673808
380	596	11	0662 8072-0
980	235	10	06468/5386
979	235	10	0664/1110045
397	605	11	0220/987654321
398	605	10	0110/123456789
998	764	10	0664/1519690
402	606	11	0732792836
999	765	10	0664/1519690
404	21	11	0049/8666/7427
868	18	10	0680/1168895
407	232	10	0662/833069
410	609	11	06245/90400 722
823	30	11	07748/68767
921	616	10	06246/75132
415	119	10	0664/2281230
418	610	11	0662/856225-0
419	611	11	0662/856225-0
825	264	10	0664/6402062
420	371	10	0662/643579-15
504	633	11	01/2536350 -21
421	168	11	6274/6202-20
422	612	11	0662/641996-406
423	613	11	0662/8387-1641
424	614	11	0662/8387-1623
1002	533	10	0664/3388559
827	446	10	0650/5665474
429	69	10	0650/4414560
432	224	10	0699/10476679
434	337	10	0650/3334577
567	615	10	0650/4304443
437	372	11	06246/76795
442	125	11	0676/7225515
441	125	11	0662/648512
443	11	11	0664/9744340
445	16	11	0662/871400
444	16	11	0662/870737
653	666	11	0049/7121/1494-623
447	618	11	0662/875685-44
449	187	11	0664/9235431
448	187	11	0662/841607-20
1005	761	10	0175-2456697
1006	761	10	08654-7799-62
1007	767	10	0043-676-6605919
830	643	10	0664/88616396
450	3	11	0664/9235431
451	3	11	0662/841607-20
452	45	11	0049/8652/5313
453	289	11	0049/8652/1739
551	617	11	0662/8698-30
457	621	11	0049/221/931809-835
458	622	10	0662/459915-17
459	623	11	0662/647760-18
460	623	10	0699/19287345
462	327	11	0676/9022643
461	327	11	0662/844576 Pforte
831	643	11	06246/888-2201
1008	768	10	0043-662-90860041
464	625	11	050/2211-1322
465	626	11	0662/88912-3670
466	627	11	06245/80826-18 
467	89	11	0662/820332-8003
590	654	10	01/9246105
468	595	11	0662/480301-0
469	629	11	0662/872266-77
589	654	10	0664/3811647
470	630	10	0650/6246204 
471	630	11	0662/872266-79
472	59	11	0662/623421
473	8	11	0662/623421
474	632	11	0662/870571-241
1009	769	10	
832	561	10	05/7083613
1010	769	10	0043-660-2438414
833	9	11	0662-871163
834	166	10	06245/21238
836	668	10	0049/170/2318678 
835	668	11	0049/173/2948143
839	657	10	0650/6209909
840	28	10	0664/73621374
841	28	10	06245/82488
842	692	11	0662/80422359 
843	408	10	0664/2437181
844	591	10	0664/8291447
846	391	11	0664/1257840
845	391	11	06229/39678
847	148	10	0676/9128020
848	727	10	06245/73929
477	635	11	0662/4684-82388 
478	206	11	0662/870737
479	206	11	0662/871400
981	634	11	0662/439501-10 
982	751	11	0664/4226554 
920	616	10	0664/5946602
751	154	11	0676/87466619
869	18	10	06232/4067
528	648	11	0662/627698
529	650	11	50/800-81551
530	650	10	0664/2566571
531	169	11	0662/849373-201
984	755	11	0664/736559-25
752	154	11	0662/627984
985	755	11	0662/453610-800
922	430	10	0650/7469293
986	752	11	06245/890572
924	441	10	0662/441509
874	728	10	0664/73479852
756	691	11	0662/80422332  
923	441	10	0664/5411487
988	491	11	0664/6185046
987	491	11	01/21145-3581
657	255	11	0699/11152910
658	255	11	0662/650436-504
598	658	11	0662/66911-222
758	693	11	0662/80423912
925	445	10	0680/5024202
926	445	10	0662/825617
989	757	11	0662/88912-3724
990	758	11	0662/880013
878	238	10	0676/3134610
601	659	10	0664/80783613
602	659	11	0662/804469-11
761	699	11	0662/623112
603	660	11	06272/7601 
669	670	10	0662/823178
877	238	10	0676/3134610
880	673	10	0662/833069
991	758	11	0676/84747469
762	700	11	0662/432901
763	702	11	06245/895136
992	759	11	0662/4355010
764	703	11	06229/39801
672	671	11	0699/10830539
765	669	11	06246/8911-0
673	671	11	0662/481467
993	760	11	06245/85643
883	680	11	0662/841079 
766	55	10	0699/11711171
882	680	10	0664/1311524
767	233	11	0662/8047-2020
994	760	10	0664/3855475
768	296	10	0662/441364
769	296	10	0676/87466569
770	376	11	06245/84252
885	735	11	0664 888 726 07
771	474	11	01/3189900-320
772	492	11	06246/76562
886	736	10	0680/1180765
615	14	11	06212/2494-0
773	240	11	0676/89692600
774	240	11	06274/425 62
887	736	11	0662/842177
775	501	11	01/5864181
890	27	10	0662/822360
891	27	10	0664/4728421
623	319	11	06212/2254
782	410	11	06272/4359-85
781	410	11	06274/40308
780	410	11	0664/4544191
783	373	10	0699/11336666
628	662	11	0664/8397755
629	663	11	0049/175/2975511
784	545	11	0049/8682/7441
630	664	11	05574/694-110
631	34	10	0681/20901579
785	667	10	0650/5817792
897	734	11	0676 3423447
898	734	10	0662 842140
788	36	10	0662/833754
789	36	10	0664-1800081
899	22	10	06212/7616
900	22	10	0664/9280220
790	674	10	0664/3454489
791	674	10	0662/625007-0
902	44	10	0650/5207421
792	147	11	0664/1296575
793	147	11	0662/847898
901	44	10	0650/5207421
904	100	10	0662/641453
795	672	11	0662/481167
903	100	10	0650/4152790
906	140	10	0664/1313134
797	165	10	0650/8230081
796	165	10	0662/823008
905	140	10	0662/643381
798	167	11	0662/434702
705	675	11	0049/861/90983847
907	149	10	0664/80020170
908	185	10	0650/2320635
708	678	11	0662/8888-440
710	656	10	0699/13353211
713	679	11	0676/7451915
719	681	10	0676/5598212
720	682	10	0699/13335041
721	2	11	0664/4154764
722	2	11	0662/432354-26
724	366	11	0662/820984-47
728	688	11	050/2211-1308
729	686	11	050/2211-1050
730	687	11	050/2211-1108
731	624	11	050/2211-1301
732	689	10	0650/5106890
997	763	10	0664/1519690
1011	770	10	
929	529	10	0662/651055
930	529	10	0699/81136749
1012	770	10	0043-660-2438414
931	546	10	0664/1802118
932	642	10	0676/4654007
933	642	10	0676/4654007
934	574	10	0650/4330054
935	602	10	0699/10992232
943	737	10	0650/4248962
945	738	11	0676/5580041
946	739	10	0650/4567883
947	345	10	0662/646971
948	345	10	0680/3149482
950	253	10	0049/151/52527134
949	253	10	0699/10543869
952	607	11	06648565777
953	740	10	0664/5221991
957	644	10	0662/824550
956	644	10	0664/73663498
958	741	10	0650/8188938
962	742	10	0676/88865-1821
961	742	11	01/33165-1821
964	744	11	0664/88302411
969	578	11	0664/5607635
970	743	11	0650/8188938
\.


--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 219
-- Name: telephone_telephone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('telephone_telephone_id_seq', 1012, true);


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


-- Completed on 2017-08-04 11:13:50

--
-- PostgreSQL database dump complete
--

