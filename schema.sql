PGDMP         *                t            postgres    9.5.2    9.5.2 8               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                        2615    16384    ArticleRepository    SCHEMA     #   CREATE SCHEMA "ArticleRepository";
 !   DROP SCHEMA "ArticleRepository";
             postgres    false            �            1259    16395 
   conference    TABLE     _   CREATE TABLE conference (
    id integer NOT NULL,
    name character varying(256) NOT NULL
);
 +   DROP TABLE "ArticleRepository".conference;
       ArticleRepository         postgres    false    8            �            1259    16393    Conferencia_id_seq    SEQUENCE     v   CREATE SEQUENCE "Conferencia_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE "ArticleRepository"."Conferencia_id_seq";
       ArticleRepository       postgres    false    8    184            �           0    0    Conferencia_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE "Conferencia_id_seq" OWNED BY conference.id;
            ArticleRepository       postgres    false    183            �            1259    16405    edition    TABLE     �   CREATE TABLE edition (
    id integer NOT NULL,
    conference_id integer NOT NULL,
    issm integer,
    doi integer,
    place character varying(256),
    date date
);
 (   DROP TABLE "ArticleRepository".edition;
       ArticleRepository         postgres    false    8            �            1259    16403    Edicao_conferencia_id_seq    SEQUENCE     }   CREATE SEQUENCE "Edicao_conferencia_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE "ArticleRepository"."Edicao_conferencia_id_seq";
       ArticleRepository       postgres    false    187    8            �           0    0    Edicao_conferencia_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE "Edicao_conferencia_id_seq" OWNED BY edition.conference_id;
            ArticleRepository       postgres    false    186            �            1259    16401    Edicao_id_seq    SEQUENCE     q   CREATE SEQUENCE "Edicao_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "ArticleRepository"."Edicao_id_seq";
       ArticleRepository       postgres    false    8    187            �           0    0    Edicao_id_seq    SEQUENCE OWNED BY     4   ALTER SEQUENCE "Edicao_id_seq" OWNED BY edition.id;
            ArticleRepository       postgres    false    185            �            1259    16422    article    TABLE     �   CREATE TABLE article (
    id integer NOT NULL,
    edition_id integer NOT NULL,
    title character varying(256) NOT NULL,
    abstract text,
    file_path character varying(256) NOT NULL,
    download_count integer DEFAULT 0
);
 (   DROP TABLE "ArticleRepository".article;
       ArticleRepository         postgres    false    8            �            1259    16420    article_edition_id_seq    SEQUENCE     x   CREATE SEQUENCE article_edition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE "ArticleRepository".article_edition_id_seq;
       ArticleRepository       postgres    false    190    8            �           0    0    article_edition_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE article_edition_id_seq OWNED BY article.edition_id;
            ArticleRepository       postgres    false    189            �            1259    16418    article_id_seq    SEQUENCE     p   CREATE SEQUENCE article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE "ArticleRepository".article_id_seq;
       ArticleRepository       postgres    false    190    8            �           0    0    article_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE article_id_seq OWNED BY article.id;
            ArticleRepository       postgres    false    188            �            1259    16440    author_article    TABLE     s   CREATE TABLE author_article (
    article_id integer NOT NULL,
    person_email character varying(256) NOT NULL
);
 /   DROP TABLE "ArticleRepository".author_article;
       ArticleRepository         postgres    false    8            �            1259    16438    author_article_article_id_seq    SEQUENCE        CREATE SEQUENCE author_article_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE "ArticleRepository".author_article_article_id_seq;
       ArticleRepository       postgres    false    8    192            �           0    0    author_article_article_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE author_article_article_id_seq OWNED BY author_article.article_id;
            ArticleRepository       postgres    false    191            �            1259    16458    editor_edition    TABLE     s   CREATE TABLE editor_edition (
    person_email character varying(256) NOT NULL,
    edition_id integer NOT NULL
);
 /   DROP TABLE "ArticleRepository".editor_edition;
       ArticleRepository         postgres    false    8            �            1259    16456    editor_edition_edition_id_seq    SEQUENCE        CREATE SEQUENCE editor_edition_edition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE "ArticleRepository".editor_edition_edition_id_seq;
       ArticleRepository       postgres    false    194    8            �           0    0    editor_edition_edition_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE editor_edition_edition_id_seq OWNED BY editor_edition.edition_id;
            ArticleRepository       postgres    false    193            �            1259    16385    person    TABLE     m   CREATE TABLE person (
    email character varying(254) NOT NULL,
    name character varying(256) NOT NULL
);
 '   DROP TABLE "ArticleRepository".person;
       ArticleRepository         postgres    false    8            �           2604    16425    id    DEFAULT     Z   ALTER TABLE ONLY article ALTER COLUMN id SET DEFAULT nextval('article_id_seq'::regclass);
 F   ALTER TABLE "ArticleRepository".article ALTER COLUMN id DROP DEFAULT;
       ArticleRepository       postgres    false    188    190    190            �           2604    16426 
   edition_id    DEFAULT     j   ALTER TABLE ONLY article ALTER COLUMN edition_id SET DEFAULT nextval('article_edition_id_seq'::regclass);
 N   ALTER TABLE "ArticleRepository".article ALTER COLUMN edition_id DROP DEFAULT;
       ArticleRepository       postgres    false    190    189    190            �           2604    16443 
   article_id    DEFAULT     x   ALTER TABLE ONLY author_article ALTER COLUMN article_id SET DEFAULT nextval('author_article_article_id_seq'::regclass);
 U   ALTER TABLE "ArticleRepository".author_article ALTER COLUMN article_id DROP DEFAULT;
       ArticleRepository       postgres    false    192    191    192            �           2604    16398    id    DEFAULT     c   ALTER TABLE ONLY conference ALTER COLUMN id SET DEFAULT nextval('"Conferencia_id_seq"'::regclass);
 I   ALTER TABLE "ArticleRepository".conference ALTER COLUMN id DROP DEFAULT;
       ArticleRepository       postgres    false    183    184    184            �           2604    16408    id    DEFAULT     [   ALTER TABLE ONLY edition ALTER COLUMN id SET DEFAULT nextval('"Edicao_id_seq"'::regclass);
 F   ALTER TABLE "ArticleRepository".edition ALTER COLUMN id DROP DEFAULT;
       ArticleRepository       postgres    false    187    185    187            �           2604    16409    conference_id    DEFAULT     r   ALTER TABLE ONLY edition ALTER COLUMN conference_id SET DEFAULT nextval('"Edicao_conferencia_id_seq"'::regclass);
 Q   ALTER TABLE "ArticleRepository".edition ALTER COLUMN conference_id DROP DEFAULT;
       ArticleRepository       postgres    false    187    186    187            �           2604    16461 
   edition_id    DEFAULT     x   ALTER TABLE ONLY editor_edition ALTER COLUMN edition_id SET DEFAULT nextval('editor_edition_edition_id_seq'::regclass);
 U   ALTER TABLE "ArticleRepository".editor_edition ALTER COLUMN edition_id DROP DEFAULT;
       ArticleRepository       postgres    false    193    194    194            �           0    0    Conferencia_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('"Conferencia_id_seq"', 1, false);
            ArticleRepository       postgres    false    183            �           0    0    Edicao_conferencia_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"Edicao_conferencia_id_seq"', 1, false);
            ArticleRepository       postgres    false    186            �           0    0    Edicao_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('"Edicao_id_seq"', 1, false);
            ArticleRepository       postgres    false    185            x          0    16422    article 
   TABLE DATA               V   COPY article (id, edition_id, title, abstract, file_path, download_count) FROM stdin;
    ArticleRepository       postgres    false    190   �?       �           0    0    article_edition_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('article_edition_id_seq', 1, false);
            ArticleRepository       postgres    false    189            �           0    0    article_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('article_id_seq', 1, false);
            ArticleRepository       postgres    false    188            z          0    16440    author_article 
   TABLE DATA               ;   COPY author_article (article_id, person_email) FROM stdin;
    ArticleRepository       postgres    false    192   @       �           0    0    author_article_article_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('author_article_article_id_seq', 1, false);
            ArticleRepository       postgres    false    191            r          0    16395 
   conference 
   TABLE DATA               '   COPY conference (id, name) FROM stdin;
    ArticleRepository       postgres    false    184   5@       u          0    16405    edition 
   TABLE DATA               E   COPY edition (id, conference_id, issm, doi, place, date) FROM stdin;
    ArticleRepository       postgres    false    187   R@       |          0    16458    editor_edition 
   TABLE DATA               ;   COPY editor_edition (person_email, edition_id) FROM stdin;
    ArticleRepository       postgres    false    194   o@       �           0    0    editor_edition_edition_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('editor_edition_edition_id_seq', 1, false);
            ArticleRepository       postgres    false    193            p          0    16385    person 
   TABLE DATA               &   COPY person (email, name) FROM stdin;
    ArticleRepository       postgres    false    182   �@       �           2606    16432 
   article_pk 
   CONSTRAINT     I   ALTER TABLE ONLY article
    ADD CONSTRAINT article_pk PRIMARY KEY (id);
 I   ALTER TABLE ONLY "ArticleRepository".article DROP CONSTRAINT article_pk;
       ArticleRepository         postgres    false    190    190            �           2606    16445    author_article_pk 
   CONSTRAINT     m   ALTER TABLE ONLY author_article
    ADD CONSTRAINT author_article_pk PRIMARY KEY (article_id, person_email);
 W   ALTER TABLE ONLY "ArticleRepository".author_article DROP CONSTRAINT author_article_pk;
       ArticleRepository         postgres    false    192    192    192            �           2606    16400    conference_pk 
   CONSTRAINT     O   ALTER TABLE ONLY conference
    ADD CONSTRAINT conference_pk PRIMARY KEY (id);
 O   ALTER TABLE ONLY "ArticleRepository".conference DROP CONSTRAINT conference_pk;
       ArticleRepository         postgres    false    184    184            �           2606    16411 
   edition_pk 
   CONSTRAINT     I   ALTER TABLE ONLY edition
    ADD CONSTRAINT edition_pk PRIMARY KEY (id);
 I   ALTER TABLE ONLY "ArticleRepository".edition DROP CONSTRAINT edition_pk;
       ArticleRepository         postgres    false    187    187            �           2606    16463    editor_edition_pk 
   CONSTRAINT     m   ALTER TABLE ONLY editor_edition
    ADD CONSTRAINT editor_edition_pk PRIMARY KEY (person_email, edition_id);
 W   ALTER TABLE ONLY "ArticleRepository".editor_edition DROP CONSTRAINT editor_edition_pk;
       ArticleRepository         postgres    false    194    194    194            �           2606    16392 	   person_pk 
   CONSTRAINT     J   ALTER TABLE ONLY person
    ADD CONSTRAINT person_pk PRIMARY KEY (email);
 G   ALTER TABLE ONLY "ArticleRepository".person DROP CONSTRAINT person_pk;
       ArticleRepository         postgres    false    182    182            �           1259    16417    fki_edition_conference_fk    INDEX     O   CREATE INDEX fki_edition_conference_fk ON edition USING btree (conference_id);
 :   DROP INDEX "ArticleRepository".fki_edition_conference_fk;
       ArticleRepository         postgres    false    187            �           2606    16433    article_edition_fk    FK CONSTRAINT     p   ALTER TABLE ONLY article
    ADD CONSTRAINT article_edition_fk FOREIGN KEY (edition_id) REFERENCES edition(id);
 Q   ALTER TABLE ONLY "ArticleRepository".article DROP CONSTRAINT article_edition_fk;
       ArticleRepository       postgres    false    187    190    2032            �           2606    16451    author_article_article    FK CONSTRAINT     {   ALTER TABLE ONLY author_article
    ADD CONSTRAINT author_article_article FOREIGN KEY (article_id) REFERENCES article(id);
 \   ALTER TABLE ONLY "ArticleRepository".author_article DROP CONSTRAINT author_article_article;
       ArticleRepository       postgres    false    192    190    2035            �           2606    16446    author_article_person_fk    FK CONSTRAINT     �   ALTER TABLE ONLY author_article
    ADD CONSTRAINT author_article_person_fk FOREIGN KEY (person_email) REFERENCES person(email);
 ^   ALTER TABLE ONLY "ArticleRepository".author_article DROP CONSTRAINT author_article_person_fk;
       ArticleRepository       postgres    false    192    182    2028            �           2606    16412    edition_conference_fk    FK CONSTRAINT     y   ALTER TABLE ONLY edition
    ADD CONSTRAINT edition_conference_fk FOREIGN KEY (conference_id) REFERENCES conference(id);
 T   ALTER TABLE ONLY "ArticleRepository".edition DROP CONSTRAINT edition_conference_fk;
       ArticleRepository       postgres    false    2030    187    184            �           2606    16464    editor_edition_edition_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY editor_edition
    ADD CONSTRAINT editor_edition_edition_fk FOREIGN KEY (edition_id) REFERENCES edition(id);
 _   ALTER TABLE ONLY "ArticleRepository".editor_edition DROP CONSTRAINT editor_edition_edition_fk;
       ArticleRepository       postgres    false    2032    187    194            �           2606    16469    editor_edition_person_fk    FK CONSTRAINT     �   ALTER TABLE ONLY editor_edition
    ADD CONSTRAINT editor_edition_person_fk FOREIGN KEY (person_email) REFERENCES person(email);
 ^   ALTER TABLE ONLY "ArticleRepository".editor_edition DROP CONSTRAINT editor_edition_person_fk;
       ArticleRepository       postgres    false    2028    182    194            x      x������ � �      z      x������ � �      r      x������ � �      u      x������ � �      |      x������ � �      p      x������ � �     