drop schema public cascade;
create schema public;
CREATE SEQUENCE public.administracja_administracja_pk_seq;

CREATE TABLE public.administracja (
                administracja_pk INTEGER NOT NULL DEFAULT nextval('public.administracja_administracja_pk_seq'),
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                numer_telefonu INTEGER NOT NULL,
                CONSTRAINT administracja_pk PRIMARY KEY (administracja_pk)
);


ALTER SEQUENCE public.administracja_administracja_pk_seq OWNED BY public.administracja.administracja_pk;

CREATE SEQUENCE public.jezyk_jezyk_pk_seq_2;

CREATE TABLE public.jezyk (
                jezyk_pk INTEGER NOT NULL DEFAULT nextval('public.jezyk_jezyk_pk_seq_2'),
                jezyk VARCHAR NOT NULL,
                CONSTRAINT jezyk_pk PRIMARY KEY (jezyk_pk)
);


ALTER SEQUENCE public.jezyk_jezyk_pk_seq_2 OWNED BY public.jezyk.jezyk_pk;

CREATE SEQUENCE public.tlumacz_tlumacz_pk_seq_1;

CREATE TABLE public.tlumacz (
                tlumacz_pk INTEGER NOT NULL DEFAULT nextval('public.tlumacz_tlumacz_pk_seq_1'),
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                CONSTRAINT tlumacz_pk PRIMARY KEY (tlumacz_pk)
);


ALTER SEQUENCE public.tlumacz_tlumacz_pk_seq_1 OWNED BY public.tlumacz.tlumacz_pk;

CREATE SEQUENCE public.czytelnik_czytelnik_pk_seq;

CREATE TABLE public.czytelnik (
                czytelnik_pk INTEGER NOT NULL DEFAULT nextval('public.czytelnik_czytelnik_pk_seq'),
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                mail VARCHAR NOT NULL,
                haslo VARCHAR NOT NULL,
                CONSTRAINT czytelnik_pk PRIMARY KEY (czytelnik_pk)
);


ALTER SEQUENCE public.czytelnik_czytelnik_pk_seq OWNED BY public.czytelnik.czytelnik_pk;

CREATE TABLE public.wydawnictwo (
                wydawnictwo_pk INTEGER NOT NULL,
                Nazwa_wydawnictwa VARCHAR NOT NULL,
                CONSTRAINT wydawnictwo_pk PRIMARY KEY (wydawnictwo_pk)
);


CREATE SEQUENCE public.dziedzina_ksiazki_dziedzina_ksiazki_pk_seq;

CREATE TABLE public.dziedzina_ksiazki (
                dziedzina_ksiazki_pk INTEGER NOT NULL DEFAULT nextval('public.dziedzina_ksiazki_dziedzina_ksiazki_pk_seq'),
                Nazwa_dziedziny VARCHAR NOT NULL,
                opis VARCHAR NOT NULL,
                Parent_dziedzina_ksiazki_pk INTEGER,
                CONSTRAINT dziedzina_ksiazki_pk PRIMARY KEY (dziedzina_ksiazki_pk)
);


ALTER SEQUENCE public.dziedzina_ksiazki_dziedzina_ksiazki_pk_seq OWNED BY public.dziedzina_ksiazki.dziedzina_ksiazki_pk;

CREATE SEQUENCE public.autor_autor_pk_seq;

CREATE TABLE public.autor (
                autor_pk INTEGER NOT NULL DEFAULT nextval('public.autor_autor_pk_seq'),
                imie VARCHAR NOT NULL,
                nazwisko VARCHAR NOT NULL,
                CONSTRAINT autor_pk PRIMARY KEY (autor_pk)
);


ALTER SEQUENCE public.autor_autor_pk_seq OWNED BY public.autor.autor_pk;

CREATE SEQUENCE public.ksiazka_ksiazka_pk_seq;

CREATE TABLE public.ksiazka (
                ksiazka_pk INTEGER NOT NULL DEFAULT nextval('public.ksiazka_ksiazka_pk_seq'),
                jezyk_pk INTEGER NOT NULL,
                data_wydania_oryginalu DATE NOT NULL,
                tytul VARCHAR NOT NULL,
                CONSTRAINT ksiazka_pk PRIMARY KEY (ksiazka_pk)
);


ALTER SEQUENCE public.ksiazka_ksiazka_pk_seq OWNED BY public.ksiazka.ksiazka_pk;

CREATE SEQUENCE public.wydanie_wydanie_pk_seq_1;

CREATE TABLE public.wydanie (
                wydanie_pk INTEGER NOT NULL DEFAULT nextval('public.wydanie_wydanie_pk_seq_1'),
                jezyk_pk INTEGER NOT NULL,
                ksiazka_pk INTEGER NOT NULL,
                tlumacz_pk INTEGER,
                wydawnictwo_pk INTEGER NOT NULL,
                data_nowego_wydania DATE NOT NULL,
                ilosc_stron INTEGER NOT NULL,
                numer_wydania INTEGER NOT NULL,
                CONSTRAINT wydanie_pk PRIMARY KEY (wydanie_pk)
);


ALTER SEQUENCE public.wydanie_wydanie_pk_seq_1 OWNED BY public.wydanie.wydanie_pk;

CREATE SEQUENCE public.stan_katalogowy_stan_katalogowy_pk_seq_1;

CREATE TABLE public.stan_katalogowy (
                stan_katalogowy_pk INTEGER NOT NULL DEFAULT nextval('public.stan_katalogowy_stan_katalogowy_pk_seq_1'),
                wydanie_pk INTEGER NOT NULL,
                CONSTRAINT stan_katalogowy_pk PRIMARY KEY (stan_katalogowy_pk)
);


ALTER SEQUENCE public.stan_katalogowy_stan_katalogowy_pk_seq_1 OWNED BY public.stan_katalogowy.stan_katalogowy_pk;

CREATE SEQUENCE public.wyporzyczone_wyporzyczone_pk_seq;

CREATE TABLE public.wyporzyczone (
                wyporzyczone_pk INTEGER NOT NULL DEFAULT nextval('public.wyporzyczone_wyporzyczone_pk_seq'),
                stan_katalogowy_pk INTEGER NOT NULL,
                czytelnik_pk INTEGER NOT NULL,
                data_wyporzyczenia DATE NOT NULL,
                data_zwrotu DATE NOT NULL,
                CONSTRAINT wyporzyczone_pk PRIMARY KEY (wyporzyczone_pk)
);


ALTER SEQUENCE public.wyporzyczone_wyporzyczone_pk_seq OWNED BY public.wyporzyczone.wyporzyczone_pk;

CREATE SEQUENCE public.ksiazka_autor_ksiazka_autor_pk_seq;

CREATE TABLE public.ksiazka_autor (
                ksiazka_autor_pk INTEGER NOT NULL DEFAULT nextval('public.ksiazka_autor_ksiazka_autor_pk_seq'),
                ksiazka_pk INTEGER NOT NULL,
                autor_pk INTEGER NOT NULL,
                CONSTRAINT ksiazka_autor_pk PRIMARY KEY (ksiazka_autor_pk)
);


ALTER SEQUENCE public.ksiazka_autor_ksiazka_autor_pk_seq OWNED BY public.ksiazka_autor.ksiazka_autor_pk;

CREATE SEQUENCE public.ksiazka_dziedzina_ksiazka_dziedzina_pk_seq;

CREATE TABLE public.ksiazka_dziedzina (
                ksiazka_dziedzina_pk INTEGER NOT NULL DEFAULT nextval('public.ksiazka_dziedzina_ksiazka_dziedzina_pk_seq'),
                ksiazka_pk INTEGER NOT NULL,
                dziedzina_ksiazki_pk INTEGER NOT NULL,
                CONSTRAINT ksiazka_dziedzina_pk PRIMARY KEY (ksiazka_dziedzina_pk)
);


ALTER SEQUENCE public.ksiazka_dziedzina_ksiazka_dziedzina_pk_seq OWNED BY public.ksiazka_dziedzina.ksiazka_dziedzina_pk;

ALTER TABLE public.ksiazka ADD CONSTRAINT jezyk_ksiazka_fk
FOREIGN KEY (jezyk_pk)
REFERENCES public.jezyk (jezyk_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.wydanie ADD CONSTRAINT jezyk_wydanie_fk
FOREIGN KEY (jezyk_pk)
REFERENCES public.jezyk (jezyk_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.wydanie ADD CONSTRAINT tlumacz_wydanie_fk
FOREIGN KEY (tlumacz_pk)
REFERENCES public.tlumacz (tlumacz_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.wyporzyczone ADD CONSTRAINT czytelnik_wyporzyczone_fk
FOREIGN KEY (czytelnik_pk)
REFERENCES public.czytelnik (czytelnik_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.wydanie ADD CONSTRAINT wydawnictwo_wydanie_fk
FOREIGN KEY (wydawnictwo_pk)
REFERENCES public.wydawnictwo (wydawnictwo_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ksiazka_dziedzina ADD CONSTRAINT dziedzina_ksiazki_ksiazka_dziedzina_fk
FOREIGN KEY (dziedzina_ksiazki_pk)
REFERENCES public.dziedzina_ksiazki (dziedzina_ksiazki_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.dziedzina_ksiazki ADD CONSTRAINT dziedzina_ksiazki_dziedzina_ksiazki_fk
FOREIGN KEY (Parent_dziedzina_ksiazki_pk)
REFERENCES public.dziedzina_ksiazki (dziedzina_ksiazki_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ksiazka_autor ADD CONSTRAINT autor_ksiazka_autor_fk
FOREIGN KEY (autor_pk)
REFERENCES public.autor (autor_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ksiazka_dziedzina ADD CONSTRAINT ksiazka_ksiazka_dziedzina_fk
FOREIGN KEY (ksiazka_pk)
REFERENCES public.ksiazka (ksiazka_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ksiazka_autor ADD CONSTRAINT ksiazka_ksiazka_autor_fk
FOREIGN KEY (ksiazka_pk)
REFERENCES public.ksiazka (ksiazka_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.wydanie ADD CONSTRAINT ksiazka_wydanie_fk
FOREIGN KEY (ksiazka_pk)
REFERENCES public.ksiazka (ksiazka_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stan_katalogowy ADD CONSTRAINT wydanie_stan_katalogowy_fk
FOREIGN KEY (wydanie_pk)
REFERENCES public.wydanie (wydanie_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.wyporzyczone ADD CONSTRAINT stan_katalogowy_wyporzyczone_fk
FOREIGN KEY (stan_katalogowy_pk)
REFERENCES public.stan_katalogowy (stan_katalogowy_pk)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;



insert into tlumacz (tlumacz_pk, imie, nazwisko) values (1, 'Sandra', 'Foreman');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (2, 'Megan', 'Gibson');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (3, 'Geoff', 'Lee');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (4, 'Carla', 'Mulders');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (5, 'Betty', 'Kellock');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (6, 'Joop', 'Freed');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (7, 'Jordy', 'Morgan');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (8, 'Megan', 'Symbouras');

insert into tlumacz (tlumacz_pk, imie, nazwisko) values (9, 'Anton', 'White');


insert into autor (autor_pk, imie, nazwisko) values (1, 'Marco', 'Menovosa');

insert into autor (autor_pk, imie, nazwisko) values (2, 'Pip', 'Lawton');

insert into autor (autor_pk, imie, nazwisko) values (3, 'Edwin', 'Suszantor');

insert into autor (autor_pk, imie, nazwisko) values (4, 'Jesse', 'DeWald');

insert into autor (autor_pk, imie, nazwisko) values (5, 'Stanislaw', 'Mitchell');

insert into autor (autor_pk, imie, nazwisko) values (6, 'Femke', 'Barnett');

insert into autor (autor_pk, imie, nazwisko) values (7, 'Pieter', 'DeBuck');

insert into autor (autor_pk, imie, nazwisko) values (8, 'Nicoline', 'Hoogbandt');

insert into autor (autor_pk, imie, nazwisko) values (9, 'Susan', 'Symms');

insert into autor (autor_pk, imie, nazwisko) values (10, 'Cecilie', 'Press');

insert into autor (autor_pk, imie, nazwisko) values (11, 'Taylor', 'Francis');

insert into autor (autor_pk, imie, nazwisko) values (12, 'Cees', 'Helbush');

insert into autor (autor_pk, imie, nazwisko) values (13, 'Ciska', 'Brisco');

insert into autor (autor_pk, imie, nazwisko) values (14, 'Jean', 'Whitehurst');

insert into autor (autor_pk, imie, nazwisko) values (15, 'Susan', 'Shapiro');

insert into autor (autor_pk, imie, nazwisko) values (16, 'Niklas', 'Willis');

insert into autor (autor_pk, imie, nazwisko) values (17, 'Edwin', 'Miller');

insert into autor (autor_pk, imie, nazwisko) values (18, 'Christa', 'Weaver');

insert into autor (autor_pk, imie, nazwisko) values (19, 'Sam', 'Morgan');

insert into autor (autor_pk, imie, nazwisko) values (20, 'Philippa', 'Arcadi');


insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (1, 'Notalya Consultancy');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (2, 'Karwei Bouwmarkt');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (3, 'Netscape Communications');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (4, 'BetterSystems');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (5, 'Ningy Food');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (6, 'Cszerwinski Informatics');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (7, 'KM WebDesign');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (8, 'NAFR Transport');

insert into wydawnictwo (wydawnictwo_pk, nazwa_wydawnictwa) values (9, 'KT Builders');


insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (48, 'Dogpile Web Search', 'Description number 4771942', null);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (72, 'Lycos', 'This is a description 9365931', null);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (89, 'InfoSpace', 'This is a description 6031130', null);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (262, 'Abacho.com', 'Description number 7071065', null);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (1, 'Google', 'Description number 6635808', 48);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (2, 'Dogpile Web Search', 'This is a description 1107280', 48);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (3, 'MonsterCrawler', 'This is a description 5352039', 48);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (4, 'AskScott', 'This is a description 2976213', 262);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (5, 'DMOZ.org', 'Description number 5896928', 262);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (6, 'Findspot', 'This is a description 6652919', 3);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (7, 'What-u-seek', 'Description number 5992819', 4);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (8, 'AskScott', 'Description number 8865353', 4);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (9, 'Search.com', 'Description number 3708128', 5);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (10, 'Yahoo', 'This is a description 5817780', 48);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (11, 'Dogpile Web Search', 'Description number 6293626', null);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (12, 'DMOZ.org', 'This is a description 6933286', null);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (13, 'Better Brian Web Index', 'This is a description 7644211', 3);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (14, 'Ask', 'This is a description 1331367', 3);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (15, 'Find.com', 'This is a description 3270879', 3);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (16, 'MonsterCrawler', 'Description number 2015343', null);

insert into dziedzina_ksiazki (dziedzina_ksiazki_pk, nazwa_dziedziny, opis, parent_dziedzina_ksiazki_pk) values (17, 'Northen Light', 'Description number 4817435', 12);
insert into jezyk (jezyk_pk, jezyk) values (1, 'Mari');

insert into jezyk (jezyk_pk, jezyk) values (2, 'Etruscan');

insert into jezyk (jezyk_pk, jezyk) values (3, 'Sawai');

insert into jezyk (jezyk_pk, jezyk) values (4, 'Old French');

insert into jezyk (jezyk_pk, jezyk) values (5, 'Tausug');

insert into jezyk (jezyk_pk, jezyk) values (6, 'N|u');

insert into jezyk (jezyk_pk, jezyk) values (7, 'Tagalog');

insert into jezyk (jezyk_pk, jezyk) values (8, 'Luganda');

insert into jezyk (jezyk_pk, jezyk) values (9, 'Asturian');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (1, 1, '2005-10-28 00:00:00', 'Alice blue');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (2, 1, '2012-08-13 00:00:00', 'Azure');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (3, 1, '2005-05-06 00:00:00', 'Lime');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (4, 2, '2007-12-30 00:00:00', 'Lawn green');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (5, 3, '2003-09-19 00:00:00', 'Burnt orange');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (6, 3, '2012-12-19 00:00:00', 'Old Lavender');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (7, 2, '2016-02-02 00:00:00', 'Dark pink');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (8, 2, '2015-11-28 00:00:00', 'Hollywood Cerise');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (9, 1, '2003-09-09 00:00:00', 'Rose Taupe');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (10, 1, '2003-05-31 00:00:00', 'Seashell');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (11, 5, '2010-10-28 00:00:00', 'Dodger blue');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (12, 6, '2008-09-21 00:00:00', 'Deep cerise');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (13, 6, '2007-11-10 00:00:00', 'Brown');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (14, 2, '2003-04-16 00:00:00', 'Russet');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (15, 2, '2006-12-27 00:00:00', 'Dark chestnut');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (16, 2, '2006-07-18 00:00:00', 'Dark violet');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (17, 1, '2015-01-11 00:00:00', 'Persian indigo');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (18, 1, '2008-01-28 00:00:00', 'Navajo white');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (19, 5, '2014-10-26 00:00:00', 'White');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (20, 5, '2004-07-28 00:00:00', 'Hot Pink');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (21, 2, '2011-11-11 00:00:00', 'Cream');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (22, 2, '2010-01-26 00:00:00', 'Cerise');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (23, 5, '2005-08-06 00:00:00', 'Mauve');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (24, 5, '2016-08-23 00:00:00', 'Green');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (25, 6, '2013-09-24 00:00:00', 'Mountbatten pink');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (26, 6, '2015-03-18 00:00:00', 'Lawn green');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (27, 6, '2013-03-22 00:00:00', 'Bright turquoise');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (28, 1, '2007-02-01 00:00:00', 'Rose Taupe');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (29, 1, '2013-01-17 00:00:00', 'Dark turquoise');

insert into ksiazka (ksiazka_pk, jezyk_pk, data_wydania_oryginalu, tytul) values (30, 1, '2014-06-06 00:00:00', 'Carolina blue');


insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (1, 8, 8);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (2, 5, 9);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (3, 10, 15);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (4, 10, 3);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (5, 3, 6);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (6, 10, 15);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (7, 10, 15);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (8, 10, 15);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (9, 9, 6);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (10, 9, 6);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (11, 15, 7);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (12, 15, 7);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (13, 3, 7);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (14, 4, 17);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (15, 4, 17);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (16, 4, 17);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (17, 7, 3);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (18, 7, 3);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (19, 7, 3);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (20, 8, 13);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (24, 4, 2);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (25, 7, 2);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (26, 7, 2);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (27, 17, 4);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (28, 17, 4);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (29, 17, 11);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (30, 26, 11);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (31, 1, 1);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (32, 13, 3);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (33, 14, 4);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (34, 21, 5);

insert into ksiazka_autor (ksiazka_autor_pk, ksiazka_pk, autor_pk) values (35, 6, 8);


insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (1, 6, 4);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (2, 6, 1);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (3, 4, 5);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (4, 4, 89);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (5, 4, 89);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (6, 9, 89);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (7, 9, 2);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (8, 2, 2);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (9, 5, 48);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (10, 1, 48);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (11, 2, 72);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (12, 2, 1);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (13, 2, 5);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (14, 3, 5);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (15, 3, 7);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (16, 13, 7);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (17, 13, 7);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (18, 13, 9);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (19, 16, 9);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (20, 6, 3);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (21, 29, 48);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (22, 29, 48);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (23, 29, 7);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (24, 8, 10);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (25, 9, 10);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (26, 13, 11);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (27, 13, 16);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (28, 17, 16);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (29, 17, 48);

insert into ksiazka_dziedzina (ksiazka_dziedzina_pk, ksiazka_pk, dziedzina_ksiazki_pk) values (30, 17, 5);




insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (1, 3, 6, null, 1, '2010-10-06 00:00:00', 450, 4);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (2, 3, 6, 1, 1, '2015-03-20 00:00:00', 175, 8);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (3, 3, 6, null, 3, '2017-11-13 00:00:00', 167, 10);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (4, 6, 4, 6, 5, '2001-03-24 00:00:00', 465, 4);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (5, 6, 5, 4, 5, '2002-04-05 00:00:00', 965, 9);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (6, 1, 5, 4, 4, '2014-07-03 00:00:00', 979, 14);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (7, 1, 5, 1, 4, '2007-07-09 00:00:00', 760, 14);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (8, 3, 14, 1, 2, '2012-05-10 00:00:00', 454, 6);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (9, 1, 1, 1, 2, '2003-03-23 00:00:00', 961, 11);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (10, 1, 1, 5, 4, '2009-01-17 00:00:00', 643, 8);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (11, 1, 8, 2, 4, '2009-12-29 00:00:00', 608, 15);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (12, 3, 15, 2, 4, '2013-02-16 00:00:00', 141, 5);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (13, 3, 15, 4, 5, '2001-06-27 00:00:00', 339, 12);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (14, 5, 13, 2, 2, '2009-05-12 00:00:00', 98, 2);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (15, 5, 13, 7, 2, '2007-04-14 00:00:00', 574, 2);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (16, 5, 13, 7, 3, '2017-09-13 00:00:00', 96, 13);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (17, 8, 21, 7, 3, '2016-11-08 00:00:00', 576, 14);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (18, 7, 21, 1, 3, '2012-05-11 00:00:00', 301, 13);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (19, 2, 21, 1, 3, '2014-05-31 00:00:00', 110, 13);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (20, 2, 26, 1, 3, '2017-01-14 00:00:00', 785, 6);

insert into wydanie (wydanie_pk, jezyk_pk, ksiazka_pk, tlumacz_pk, wydawnictwo_pk, data_nowego_wydania, ilosc_stron, numer_wydania) values (21, 2, 6, null, 3, '2001-02-03 00:00:00', 636, 9);





insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (1, 5);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (2, 5);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (3, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (4, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (5, 9);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (6, 5);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (7, 5);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (8, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (9, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (10, 4);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (11, 4);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (12, 4);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (13, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (14, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (15, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (16, 3);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (17, 10);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (18, 3);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (19, 3);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (20, 8);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (21, 5);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (22, 11);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (23, 11);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (24, 13);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (25, 8);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (26, 8);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (27, 8);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (28, 5);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (29, 6);

insert into stan_katalogowy (stan_katalogowy_pk, wydanie_pk) values (30, 3);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (1, 'Sylvia', 'Noteboom', 32316);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (2, 'Frederik', 'Herring', 943996);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (3, 'Ollie', 'McDaniel', 573730);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (4, 'Daan', 'Weaver', 928583);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (5, 'Rob', 'Waldo', 260777);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (6, 'Mikkel', 'Wesolowski', 192551);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (7, 'Kees', 'Jessen', 927691);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (8, 'Elzbieta', 'Bright', 607627);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (9, 'Ron', 'Hendrix', 899011);

insert into administracja (administracja_pk, imie, nazwisko, numer_telefonu) values (10, 'Alba', 'Deans', 754575);

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (1, 'Benjamin', 'Nahay', 'W.Novratni@lycos.co.uk', '8RcthovWR3PpRtSlLI2N2leHjabUHjced8i');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (2, 'Andrew', 'Sharp', 'Frans.Ayers4@weboffice.de', 'RHzZnH5ER3OtxSeOAELRA3EO8OfMORS5bfC2eMiOWF2IG64fSzZaD51kjRoyZrkbtbs7FWvpV2MbSlkwkCacvLdu4PTiErepf7nLNVrUMGv2Atzj48ECQL0dJ7F771Caz38mKywghSHnypoqLdNKqcDwFviXUlcoLkhBtnOuwt');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (3, 'Daniela', 'Brumley', 'DRoger@live.ca', '421ChdpGIYIAYSzpsfKmgW7mVtPEyHn7KQE');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (4, 'Ana', 'Korkovski', 'Y.McDaniel@myspace.us', 'Y8vnbr1C6s2fn3OwvlAS2PsOoxP6FOauiF5cHeGl3drSWeaEetgrBN7qYcadfZ1CijJi5h');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (5, 'Sophia', 'Sakurai', 'P.Jiminez4@myspace.it', 'GqzzqklHmBNrUcPr2qxbTYlUGhAhuIBMY4a20JFecwNVJfBMryo');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (6, 'Jules', 'Koss', 'BiancaScheffold@web.co.uk', 'hQWJVdShJ2uGCEJDGwkCBbNRVIcsCO4p8RbKkwWXxkUtiJpnA62XDXcoVlYUHsvbvpNkJcl5jCzGlIfS1hFo5XIkD3NLoxVFA3eaH3SELVWLGogmroPAaZ8QAxNX8EEJyjnT2oKpShTE7V1O410fGMpaJ8ATTc8MRLzN1xH5UDP4YpaTELKYJ3zkH0MKb6liANzyaRE3B1Qu7iWkM8mcUSPJ4nCyMADiTu7Pjb0lRT');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (7, 'Joanne', 'Mairy', 'Rick.Warner2@telefonica.cn', '8bv2WASkpYVOibi7rAOQEhEs2LZ6N25qtQx8KRqZvEcqtKQrPYxS5OxQ1JUR35j2HZWTMoSargvdRoGeFnCHvUytx4iF');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (8, 'Magnus', 'Herring', 'Frank.Stockton@telefonica.no', 'V6iQNpKORbMaILKIqlXJnCbBem1ORBaJbyLSJzmpVgmnaBAbUeGhU6qBJ6Q22LHCIAXDKLILcMN');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (9, 'Agnieszka', 'Watson', 'TreesMiller@lycos.co.uk', 'smswaxoNOhfESORxhUFnA1geFPXUx2LGKsMDh65vnpUXFPCIuuA4s');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (10, 'Ciska', 'van het Hof', 'P.Baltec@aol.us', 'aP1UkE6hB3f5a0bXo5UoAK702A2jrtzEcM3wo7YGMfB4UrkXPrjOsCedNseM5dKXvfYWxlzFsT3sNNRJKbQOfNFLtzsjOIuVMvN3aa8GukfIyX0hXhJA2ohpowfYSeqdeBQZf7vf2IvDfA7SE3ynKKIgFKekFLIdZ8nOmZEB5D7X2ftEsRo7Uo');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (11, 'Lea', 'Browne', 'Hank.Riegel@hotmail.no', 'RvgdgrpY6ZhOuFDpq08MPYF4QCUjf2DXj1XB4HY6sNOGIMqM88cSLaociqmsHxFjkBHDqgCmrMrLZGDODGccfxudA1C2hsYuCk8Ys5ILoEFpiu5cKUJvupZoKv7eYu76UwICnnw5qTFz1eIqR07EKiNyjPLs');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (12, 'Nienke', 'Phelps', 'CamillaPekagnan@dolfijn.us', 'RikhBLY7uoqXWD3DeNioFs4sem3Q6Y77QzgTc7eoNAUNJtcJrBIdV0KUUS1HWiCIVVmbu0i0T4RTAY7rFY0xxJqWy1SnVEXIEcJUsg3bzgWiHivtSkCWG6fvIDk5O1RjFboSCcILf0LOy4PnrpdWgbKnYTBo5A7f2w8lo0uKedlpU0i6EXhkAwCEYfCbHLLfr5KkOVFMmB2BzL75Abf');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (13, 'Lia', 'Kellock', 'Nick.Lee4@live.cc', 'ikHzxU7kYOiRBm24jgUXP6FghlFkU46uodfMjCFqQ8YHU0nb1qGaNrhlwrNHFy23fganKlBs3kHlGuhFoYJio16tUlcE6TJnEy1MBmZAPwT6sz6GGob1Pk1AKtlvrATOExeliw2qadZw2ZK0Sp8');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (14, 'Joost', 'Richter', 'PattyAhlgren1@excite.dk', 'n7uMEQ3aQH8aRdsGcVWgXKar5W44dkUnhvefjZyu6S14bCICwqVkW1rlGuzMCXL0KDUfgYZwpDGrMyWepuyqPOh7doEJUNatJCYNl1bo1gDQ2JI302z5GFCGjDUOVRJG87SAe1t1gOj0DUvPecjyLNoa6hMI7ui5pTpPUmh6Lclgj3EwQPxrWKjSDc7VIEpwAVszEzMnawSmtOl8FMH1tBPbw2FmtLUCPmW2uhgmJDl');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (15, 'Jack', 'Miller', 'MandyRichter@telfort.nl', 'cU4ysTNPaW20oub3lMhOZMHBSUNj3dg6KpP');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (16, 'Robert', 'Wolpert', 'Nick.Brady1@msn.ca', 'dHoEEOaAi8h0kfg2jTh5uMcsDOPdrW5xEaOsSCLO5eZn77VGqgigrHnsFEreYVJMYJdglXuVGAtvxEXiMnTEHSQz3l3s2LO1JUzgJF60e4cXiXlDzrXBJTUOu1y0sZ83gu1bITbSd32IikAjNW56ctligHClUCzpp5Ico');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (17, 'Geoff', 'Glanswol', 'Freddy.Chwatal@gawab.org', 'K3I6NtY7ZYGCcCuy2DxVGxvJU01AybR0KsUu03AJxRe5nPpv8yEWzyKPLbgkmE0XSTAOgFSHqtnIJ8eHNtt3kBfYnDrPxrYFc8EuNtafpIeAfzaTA0TlehT72XuAsfF2MSFHsmnRSRFCs2eHQY31ZKCvwgmeTrIx5eWbSWrAGJab6edQm0zwk5B6tZnzeFOiTZymtRWTek6cpicQDYOzjh64ZhVmZup0h6YokkT');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (18, 'Anthony', 'Jiminez', 'E.Mcgrew1@kpn.us', 'wVzn5QalfwFqCOMT5DAyAfHeefabsAYAO0eixM7tuUcvEpdQfO61oywymt1UgVg8pOtWilQtYOSEbr4vZhukHjaZDlvgiRlrGAIEJsfq5oRMkQXRyqzhKSxmJxADWiCb1cWWpcSUnOlZoRIkC0XMETlQrNMUwaX4PwPZxfmozbVqum');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (19, 'Edward', 'Cohen', 'Frank.Lawton@mobileme.ca', 'qFLZx2tWyEOO2JGegPE7pOWGti280mwKgNjdihzoAdJ0PRiEuU0dlyBrrSwdiUqAym3YAYbaDW1ZAPUj677pgQXRCoiEGsghEJmhocN7KLbc2DxPM');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (20, 'David', 'Mcnally', 'MadeleinMakelaar1@web.dk', 'tthuFlovCcJIitXSfDI5YuZVeOBXIRXmYuNKLeXFkt5a0eiIazBYUaTwtrdl6LpD1YniRk2oE7uQIOT8XeeimS1E2h4BivOVzrspmE65i7oVBb8zzfZoH4TssY5tb6ewCxYvUIlAclP1dly03uPLxy3H5R1uuuwb8XM6nipuEISIchH5bCxL5XY5cuqtSTx2mOV1exS2tOyM0seCcp6FIuSb4Lfnz3sYl0iCe3J0rAEqbaMPa8TXZ2Q1b6');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (21, 'Bess', 'Langham	', 'Pierre.Howe@yahoo.cc', '8TpkvUs2YIviY8Ns7DEeXCCXZ0gbBdkAI85sf4dywe6xGLtc7BLmBcEuOUtiaUL7fFLrH10EvIgzuw5UyndEjJFObtVdy5diQuORWxJrFXPlNzTzve63VAhhA3ICkR7UbYr3JROOinW2NMDYP2GQOoP4NIOQE8eC1UmHeVFjgavi8UweaDUO');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (22, 'Cristina', 'DeBuck', 'PeterLittle@dolfijn.com', 'tlSYznrI8EaJ04vfof4zWvLSByb1oXpjuW3IAvoZt1MvdBQzoSn2eAjWQE24iBlr');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (23, 'Edwyn', 'Spensley', 'TNoteboom@libero.gov', 'eUz8VRtNcCQSpnSH5CY4MJugctv7UWOsWi08KuddRIg4SfT5m8jiYN24FnsexbTU6oWeEhmtMx');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (24, 'Harry', 'Little', 'HansGreen5@dolfijn.nl', 'hYSNF3iT');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (25, 'Matt', 'Cramer', 'Will.Slater3@gawab.no', 'tkz8o3dggVcYJmM4FcjD8CtJGjiysLCOA5UlNoQkmgm76Z5LXLUBIibchkNddIYLscOtkyepQJcXsSCjVN24ywDVE0PA4kkxte5sF5VpZL0A3sqaXuOE4WJMkhUnCGAgO4ug3wfivBrRwhRuCWLHgOaMjDj7ArpvrlED2CRb2hYHLhjJwyYP7FcDU808TR0Dq2cUhMRNRljZPjAFKH876ogPCkVx5IM75XuMW4NV2yVEWq6Df');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (26, 'Frederik', 'Press', 'RickZia1@msn.fr', 'rfJPmzYb6hC5NdWAr3UMqv4ssstJDwwNry1TtFnFpdn2RQrXmnxXDPxcBm6zGBzvGD3MO6bVM5g6RQscLUK');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (27, 'Kim', 'Mariojnisk', 'MattDittrich@mail.gov', 'mngEaMA1VdlRpmyWjS5tls1ewvAYAx8snKvRn7qn2QiZpnPB563R1WlSORVyme0M0f3HUUP4dFNw1bpDz3ceGZMGauQesaMVJ2AgjjeAh3YilGtF');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (28, 'Joost', 'Toler', 'U.Jackson3@yahoo.es', 'ebiFDvSIfCdZhTaXjvjvjmK8uc83zhJciATWiJ7KfvYICxrJBSr6epMQ1hZrKQ7kayLsy4Jhm0qKmlzaSOE3Yqd2khQXcvmtwwLWK6C1MznKwEDOCF3qtPtKnR7R6YZvOUMZ8OzerbzUGdvnmxpwVj13XSpoUHbyF4CIFzP0ilhIZgEWJacDIzdfW3Ki');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (29, 'Jack', 'Spensley', 'Y.Ayers1@yahoo.fr', 'A5dD0AA1DOFXBrT8VXiyffgB7QWyV7c4F5AHQFw8X3aX6ggUSmL');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (30, 'Tobias', 'Patricelli', 'WilliamChwatal@mobileme.net', 'sSrMIhk2qPIdlnv2mdbzEo3tp2YngPbHz1JXpKhnuEn8zPNceKEl4tdscHPMij1jNmTh');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (31, 'Erin', 'Gibson', 'RickImhoff@mymail.de', 'SjcCM6avY1CKJDZZoWwEzGGh6gn4VskYxKiHohn802');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (32, 'Cloe', 'Van Toorenbeek', 'PCarlos@gmail.es', 'rqcrFuJLSNN8ndz4NRZfMG3UEEIOqHn6EcDxPeheX8pFazWqnaZFVFjPe666NewaHPOiikveVVG8RnJDH1UmUSy1sdWVV8hPXzaVyYf6LFjrx0Mi8HxrOPyD6C56k8fgNPbYsYGIp0votK1XXwc2hFCS7dCDyijfyCog4glefSBVcA82RVK6CtxuQMCjho5SBJkFDXnfGq00pMOMLdTyojSMiqfIan7TbUDsTl4b');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (33, 'Matthijs', 'Brisco', 'BiancaBoyer@web.cn', '2X1aXgpbMBEA3z8g16yYdAxAEgX3NJFE3THUh');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (34, 'Lu', 'Ladaille', 'BiancaAntonucci@telfort.fr', 'g2HqxTqCbWpnAEvthTDGSKIjhqFPvW8Cc4z');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (35, 'Lars', 'Cohen', 'YSlocum@aol.dk', 'XC2Ydo2oOwDbd6QEF8CCYeUNKN7XFaGfmE1Q4z1VdDPdrKE3tfl438WMS7M1y2EQ8RYWBipW5TGBKYv37TXaKPF7TGqttnn6ouIvcFZ06mhqUsH12YwHiZ8Ls1HlRwJZN6Wf8u8Lfw2lQpCKHzABbWMIfmfoXLWoj6hdfZFLmVf3Nb6CmhAaLV1V81y2BwF74bHXY60Rr8tZHWmME8BTn2s0AZ4AyeaT');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (36, 'Nicky', 'Geoppo', 'Fred.Deans@dolfijn.co.uk', 'ZvnmEfsEIHVH6kw4jT7OmCEahWlQMIYn8ggqscRkjhgMxwUSPLmJWprwMmouDjB2R0g61D3uVfddcHStAFtR5N2Jfhk8ar1n0');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (37, 'Ruth', 'Helfrich', 'BillLinton@myspace.nl', 'krT3nTtWXWzhe6j1aHfqygYtnmlSwHDbjXlZeBDEqAPCy2hNQXPDBTLNuEYWly2aaFvFPLGaeEkP8MKz3BaVx8IHu5GV0X4AatnQeLQaVuANdnIaHR7V1x4O5566udwUGmoxneqg4ifRDW717nejH3PI0qpi5aNIjuE5PJkgCIEESiIUgfYk00y0VhPbHHlBCTkhWQqgvegI6Bo2pAAkItNMnjsZi8LaftSJ1NLvEH6m5');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (38, 'Duncan', 'Julieze', 'Frans.Miller2@gmail.no', 'eqwdWrRHLtVfUwAoM8UyJDhaUqON0qSZC7KJEtWOhD3QannEOUJWeGt');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (39, 'Nico', 'Storrs', 'Brent.Cragin5@telfort.cn', '2Yf11EaJOAfsBm5S5PNmfMqrLtYKuBXToOwW3CgQkcT5Lq1fM3Tp8miorCDRfi1QwpjOnQJbx5BfcYVD6v5bJY6fIdSa1lpi4YN6KCrW7ebUoJj6N8pkjaRObOYUNUc0q7jMN8hZC5SmDGVoB4BAfjiJrXGv4bfGx815lfLHHAaQE4BVyEhPFDCnnzTRtNmzLdATgml54S2oxnXbGtP6s6XL');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (76, 'Isak', 'Brady', 'AgnesBeckbau@live.nl', '4uzXYwMaeuxNDcHGkf1NZXeWapb56YqheRYUYd4tO1QUNP1NCjuu3xbFIGCCDAto1NQDgzvdmNgtKmQo2zgLTX00ML6JM3VZeuufVBVRm8nEAi5RP3v0VW6n6LkRNWWal6uqsAeieFYXi1XS4hekelQ3mkp7diezIKYlzqjFmfjyv0tuizvzkDkcQd7y6Nz3Nn576M06lbzGXoZcIZ63UfB8BRsMRbN');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (40, 'Peg', 'Stevenson', 'Victoria.Katsekes@msn.it', 'vilcYlEtdVurb7tnlOwyV1wyXk0ShcghnMD4jTWwjo6EOVM53JPdFvMK3dNgud3gzMhBcuvwzbkTwEmBLp2114tS3NEvlHj6z2YWzV6ARpLdfhjzXMNoLJBhRDFzZd6QKTfMSJfFPz4FwkGSazHTckWQ8xlEZscE7MLSAnmne5UwHKDHf3xuCZDjWNzkq8SJKN23R3uv5jgPND5xvAoH5PkgTh');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (41, 'Scott', 'Lawton', 'TNefos2@yahoo.com', 'RmLeQ8XLFYrpfou7TGXPu');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (42, 'Lisa', 'Glanswol', 'Hank.Moon@dolfijn.cc', 'MdGvVxVOuKDo7AVhBgmDK78sltOypPE2aDckRk7Fp2wIxxcOM03Ejpxlauho0oUvZxr5FTB27eb3egwr8j7DCo2wQxuXQBWWqKBwANYP02vM53Z0CbgIqpXafCrw8cNOrLhytmPSkdJzBLlgQJMQsJbhMWicUkixJMDFkFNI4CpLQ0lA1aOT8I');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (43, 'Magnus', 'Freeman', 'Kay.Krutkov1@freeweb.ca', 'ERtJq0sWDGmFNTsaTKkXXIXpbqK70TocNS11Q654FA5uXHndSktlsWFVSfQd0L5lWwkyyyuyiqaPuP6WVAeKAZZppDGcOANgEcM06lotan5aCXeMqmgrJ34kHPRMz2oKa4Az8tXvIRotiXFpcad6o2');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (44, 'Ida', 'Cross', 'E.Moore@mail.it', 'oqVyp8k7XGiDIMrT4y8qHnuaVJORVPKhCUHnSFvqmOWz7reuPSKh81nh4Vj5ECAOGEwoIIyvC5XuLjiXcE1el1rnvr6P1TSxLH8nvdC1DuO4vcSEklX7OI0VNn7PCtxLGoQNu6pIuePKQSNrk6ldl7q0xc1atfgHe82UltnKFxLmAK7yevocFialhuWUJtN2gUSdiLa6wjuePLh1oGFAlBEyjEF3HiYMEpP8z5UicKtUgyNI3e2DYBWQm2FI');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (45, 'Cecilie', 'Weaver', 'LindsyBraconi@telefonica.co.uk', 'Grlesi3QFC6P2SDpLaNqTMKfMPA6wOsAJZ212qdpFpLa');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (46, 'Tony', 'Poissant', 'E.Poissant@hotmail.dk', 'VHfRO');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (47, 'David', 'Lezniak', 'Johnvan Dijk@excite.de', '4SDWQK6jUji28xouSMkZEhM8CCOMAYMuABpHm0aZcg5oCLJl57xdbFAvgwK0MnUNGO27kTHrpAcksESsntybET7xvBA08B3uaDmmvmc4jQAi4FaP7R6FjrrZaUiDNwgHUbWu');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (48, 'Niek', 'Lawton', 'WilliamMejia@live.net', 'giP6uIzE62aRZ1WKfgEEB5oPhm36OxTxyDYqUFCCfE86oooOEyXeArGKKlgvK1ac8beuwhmqhZlyT2e4JmwDqoB4');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (49, 'Nick', 'Herzog', 'Rico.Alspaugh@excite.cc', 'WwUnADr1SqsMM71Xkw5qLL5UpxYQVGzzmS3sr00k4XmfbzybgNeaSDRCc4tKWKuLjfdIhYTeY7Z4S4VsjJjJZHbMQcY6SkDyRUJgqetpiM6zcd0JVfxWkyOD2QNbskgS6T8Kx4X7ElK');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (50, 'Ester', 'Shapiro', 'E.Green3@web.org', 'SywEdZCcCi2nrzeeED1jfyQnq4skvCnll3VeLGqcJZyQDTu3VFXsqHWPtKq0PkQluVrWNj785A6A4XCH8YMhnzNn01hyOxvbee8sVE5ejSaFHi7cMLFm4wI5KnG4eMIAh35o22qmrk8jtM5Om0L8rOvWDXTgp6DDoKhIz7iaWSgqZRkO5QVJgR2kv6GCIuS0lXnyh0rRkuzkXM3jMrOS0iU5xYPsg8BgYb3BVYbJtChEHqw');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (51, 'Godfrey', 'Thaler', 'Richard.Lawton@kpn.co.uk', 'FEz6CU2nC5niqFUkepAZRkdJPVD');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (52, 'Mary', 'Roger', 'NadineRobbins@myspace.es', 'i7NAlCO24LZMozRhDlcQziVDRX3dmdsjJB3XEkpzY8uoqBG8q3J5f5QkXP2oFFlkvCCQ20eqJWTr8ZQ06jZxX2HIKpIPVZuKE2nCv3i7x1HFiKGDlXmvAGXMQck1YiUUVWtD40mSlVdrp');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (53, 'Margo', 'Hoogbandt', 'Leon.Gua Lima5@telefonica.co.uk', '7e70xUo3ySI8bRXowHcUWDIK6TGtKSCbGzvuZpLL0KWxznkftvgoDVQUHDIeLUEZkxPlbIeZRRDOoapOBhFQBaJ5aKPbpYuZvyYn6DIDsEHqQapHOhfrMR2idqB0EIviU7epwQnOBiFkpmzrKZOxQSjCpDCWIfpFWC8e5aWjLZwkIA1dLWfQuABi5AEmOXYy1Jox1sl52OCidqjGsRJfgIa0rNlk8tXhFjfr26sx1Hzge');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (54, 'Raul', 'Archer', 'Nick.Franklin@myspace.cn', 'ZgAupMJGc4JT3wVuuHVuRkkqlX5r3lbBPwfpboVJ86wK0XlvLXcKAfUmBILCmdjiTTsIZUB7PaHFFS2HWMNjWfHK255hkrlE5QkZYOI6dmBENH2tzZtRfV5mwIROVP8Kuo5ivuoKaAHG2BTKaZU0AD1HMwnaahF02Qi4Eke66OPajDG5WJf3KCvld8C4PxQr2GvlmRyylf2knY');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (55, 'Freja', 'Stevens', 'PeterHopper@dolfijn.cc', 'LaiVua0cPnGNkgcbyyYtKSDNi0xgo4hfq7yJx8Aa1nBdNRVbSWcJUf25QEhEKY581iPNDuyOEA8VKyq06JJxfTq1eUOCD2OoJglPWTJ7umAEGEm6ezYLFFbZ5wKrVmRsEf7EPuWJA5IFjTXymtXFtMkUzJSBq5j8Box');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (56, 'Alice', 'Brumley', 'Royvan Dijk@libero.org', 'wTqwx1E4ofG8E4Ht5XBLwhp4wYHWlyJgzhb0SMSY2BjX0M1RsDd4qes036is3Wzmm6QwZlhmCJSkrjGkdX0ncffGj3LKs');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (57, 'Siem', 'Sakurai', 'Pauline.Framus5@mymail.ca', 'mLPB8NBKrjcVWzhDrs1ymQGlRvIEMFCtpSIuWR8mYV0M0sUnYb1o0FrXIbP7OAMeOzjRCaPlyB2RzNHCmzMJYQabCdn2FMo1KpZCOGX8k0ELhvMlSyHzIJq2g4LK3Ev3KIxXpIBNarRwnlXD71ZY8dGLEssbEN0HH6NdDfp0kyCzLQMJb5ZCUYbwUdjkHHA7C5nV34bVLde');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (58, 'Fons', 'Millikin', 'BobEcchevarri3@live.no', 'KePDqCblseaJipAsALduth0BhacS2WniVqXywzBK1l0r2lc8yIE5QGLoZwCkMBW4VRDGsXLk5aIbkpwXAtaoWQqGwOnzTlddIc8jDFdgBGChRDxqw1Wgho5AnjNDNSvsAxVA');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (59, 'Siska', 'Gieske', 'H.Thompson@gawab.es', 'DbdtzPYT4LOR2lzVR7yl7o8QNIx5cg1ddKXfF75vUvGyILZnJYrLDhTGtqdQgZVsWseH0dpYkNQcGSnDaVaCYI3MJsByscU5IinRN6Ysr32D8pwT1tReGTGJoDDHMVJZCayvjtitxxRODoOt16q64V6EnZSffEe1EQx0HYLmoLit8wobjTJF');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (60, 'Rogier', 'King', 'Geoffry.Crocetti4@dolfijn.de', 'bPFwvckmQV7uOpxB4yRjtWtcLzaleeDCfRn6BgGGtUqWgnCaI6RaRp3vbgpMTA0SjpWNwuMnMBk4wiuEjREx3SSfmnyqsPBEEsplSqmTjsi4yelmiDUd6SQ1sTVK5oM6mb3uD4ZPe8zcYzAuXUMkPMzad3AmU7OtzZt');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (61, 'Alvaro', 'Cramer', 'T.Byrnes@dolfijn.us', 'fSR1WITdoqrCuKzaSoMutEt86O1OyEDst7ZRpgKAbLapHLzDJf0Hp6l4keh4nh5cC5n5WcSgEP4D0WW7ffqXL0d2wrQdfSeR7RZSU1m62ubxHtuqTA8SA5g8abFf2vjmatvfk6zGSVvfbTduZjL1pjMWtKMA7wAOCPtXd6Ic4yEukxistAWERwUUTKKVi');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (62, 'Ton', 'Hopper', 'Amber.Bugno@msn.es', 'xtIbqA23BBQnFFlFCASeZuiOS7jamQKj68IwipNfKeL6ww5Xur4fdD68K5mlwhTzFlWlJr07VPZqDYmdeWnNtzJvGYRWKnMNLzuRvn2SYHuKLbcqucxla6OK5');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (63, 'Adam', 'Hoyt', 'RogerDuvall@gmail.es', 'CCIi7j1anK0dwn2QQuwi6XIjJ1dGH1dtixm8zLnEeyB1xN5QNS4hc5qXfNuyTBhVdk4AfOyPbbHDN40s8a7PmbxYWilRY68dWHXcs7ReDAV');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (64, 'Andrea', 'Matthew', 'KBlount4@freeweb.de', '63uoVXqVwRZ8JImYV3Fe3aXqMXXDOIDy1txNIoLv3N35p0ipNwojf8WLGC7');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (65, 'Jim', 'Botsik', 'Ciskavan Dijk@gmail.be', '4pdBKO11QI2aaDreEm7ClyP13e2fx7iqqiQyFTtLIETzMVqhQjCwTxgWqkPEWkcCVNLRYH2T1EEiejycCVRFHb');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (66, 'Rob', 'Morton', 'EJackson5@freeweb.es', 'ioTDFVjBkscuqrR6vyJef1kW7gimm1mooBN4RAKhgJNTpcSL5NpGOZxQLdJstSeRRE6ZlGDKP4AWDITyhzXC2D8kp7hhTfZsvFRbHbMHGMzPkcKfyBSoLR3X1');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (67, 'Camille', 'Bernstein', 'GPickering3@telefonica.gov', 'WTOVvDMBOh0GYBCWfL22qSIMV3GvZ6Dsc4fOQiAU4PMR1thgPNOizF55nh6WR4vupNd8RGTp0RS7ELwyy4jepD3XdnpEauvDjSEeoNas0ScWFwsBGMBpqvcj2pywVZXXU6gzhplIlnrxYLnySDcGIKjBirQ3qAhvjVtw0gHYAeAfMy3YZAbcHRZpWQLqd5ihhz3td');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (68, 'Sharon', 'Helbush', 'John.Reyes2@mobileme.com', 'YOkxKFTY3mQnjcRAgtJw55LyZW0WD8RTFP5KRGlLwiPVgoS0wnjDLVyyv6xQ5Z2GhM0MauA7vsxgAJyORGypaWoxssSKLg2X2EFyPxtpx4uudEuegdXMEz5ExbMk7LBSJUcoBbGdnqfAHtOpWjkgaRZsyau5EGSSb4T1c2WryIwAYhrk08aooHwsCSmfMAwFhRwR6oCFewXV822xVccSOgQoBuCRAgQyp3cQZrp');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (69, 'Martina', 'Ditmanen', 'FrankWeaver@hotmail.com', 'pjd88aMBHRiXqm70YVcmadk4OAMvgVljWUP0hix254v5spmnnFxm7VuAXSR5XUqYLMCyIvssgrxDuIzFbNyJjJX7TvDumHlnSXOBvN0QlNNdU11rFSMLRnItZlznGNqvcZunItrm4FSBtI8S6ahzcqw4SfItXKDmKpyUjkG58hnc');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (70, 'Daniela', 'Jones', 'WilliamWood1@kpn.cc', 'z4SjcfsBanryhSuwzZNWNMYrjaFAJuOLLad5kgOZhhjQahxDGA3x3OX1MPGcmpuvl4C7wQZlyBSj58HgmZeCQujTBk15Eo66LUQC5Duy7niJWxMzbMt5LwwJhK0eW7d2cUzVBULYcyvmIsBJ5N1uYZXeE8G00yg1oHOSN0TVCAmJ45MRoVcD3Zq5N82fuzH8K4l0Thrq7v1vpbWoHeQ5nvqS0gFER8QOzWKgBcVtVO00LMmR0tqY1');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (71, 'Jules', 'Sanders', 'KDavis1@msn.nl', 'Gc0P7OtH2Hgq7aweBAHSe6FBfbBaHoptBx13lJeZknQjc1kp37KPR4coBtTRXdTvO4Id2PVrHSGSHiJBzxhyzoya3Xnh3RqM1CHm8g28UUc7uGjo2NoEYQkqABXUNhQr83XLNVs4tawexV7HK05fyJCVCQ7iJbbrnH0UGm8dzmmpOmAnsdBur2MIrDUWfjbl0XLnVv7yq5xnT81V44');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (72, 'Pablo', 'Ratliff', 'Trees.Poplock@mobileme.org', 'KG51KnpXuT7fNHlVIbOnZ0EGaxb');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (73, 'Mads', 'Marra', 'Johan.Linton4@gawab.cn', 'Jla7DuHsODB2t7XJDpIsNZqREkTFdH');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (74, 'Nick', 'White', 'Ton.Deans@web.net', 'LR4F1pUVoghh0UVh2KP4SllbPpKyfphmtFbMsGNQ8008yrPE1EDTGw2N0FikRoYG1iSfzsawQs6E0csywUDguyfLwXLLW4eWo15Q8wvUYmZZNICFlDA6R0FSBaovkUgPl1Y6wpZEfaXflqELtmklQQ7Y25gY3oT5pqdpvkp2xYXAdkQwyUsXLAPrVFaCVshT2pHiiV6YF8C4ooMjRISFk1zE4kvoyh3luuc1ICqOZPuIkI2lVwSudW');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (75, 'Paul', 'Grote', 'PatrickThompson5@msn.us', 'WCDmawtL1oKzsUGVe5QqyFghSuJUPZ8VajQBJtp80hlg0v0ZWgfvn8NZFEZFdP16Kxdh0vggRcG635KwSnCrFLIqpGkcwMk4WoUh7KhnxFS0eq80HYWslWnEhASvS1NfVdwqorV4YfnUgwGY1rIDD6iuDrWL3FcckEdPlRsBCqL3Mq5kE3zeZpuvYH6HpN11ThULhfWTn1ZiUJsR0x7NOtTjXqVC5FFxukW8OGzwjPtA');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (77, 'Marta', 'Durso', 'JakeHummel4@aol.cc', 't8xCoBEOG24OFlOEwxfzIP2YjcN5mxyrVuwBZ1GBoV4zbOcLsdUGvpIiddr0g0');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (78, 'Pauline', 'Linhart', 'J.Tudisco@dolfijn.org', '6Lfu1mogerHSiWVGnKf1TDOg7nazEW7eLcSoQkFAqqP4wVoVdT6WAMU8BPhnf7B5FtadNniwOt77LLBcgRJRU8kyOgoupYSKyyLqQurb64elZ7cQeGvaduVVmF4dwkpSgZ0VfD');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (79, 'Klara', 'Ladaille', 'Stein.Lezniak@msn.be', '65sHgpyTF1G0YHNsJiTMjZrPB72d24c7Opv85QLjmXNENwivLP8FHibW5XUXkQ25');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (80, 'Sophie', 'Sharp', 'R.Goodman3@gawab.es', 'fln7eUckk86BrYlsKr7s2ATIvASBkKMgC1PVNXLJCvp');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (81, 'Joop', 'Makelaar', 'RGriffith3@weboffice.com', 'da8t15sw3yGsdquiU7erxszMkpUyw0R0jHFqKIk88j');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (82, 'Rick', 'Polti', 'D.Daley5@myspace.be', 'daSgM22V5aN22iSLBsmBUYE1WD2U2GBnCh8nVF2Mxrqi30VnCRJz8r1qj2XFyVGkpbX8qpEgY1NjPFTC2IGodKRy7PcUmg4NTgI5cO1wwsbOIXv57dZhOfhSYpzjXYHlLkuBdDgJG0bEUYQ6IuTv4M7Oev7ayhQ8YVk4EJIaRtsGhzuC6JF2JRbxwvfCbpwux5okY');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (83, 'Sanne', 'Naff', 'Pablo.Bright4@hotmail.it', 'fvjjw4VIrVpPDVA8LBbFBAl8IAjA0AKi6Dx7SkFtRkmCQpZDsfGLDkhCKGJ4DH6z4bCLOEdHrIrwW7N8QQ3CeWlFVMf1rL4quW7xiL4YeNACdA1y4WShD46BhzhkHWc61PtnJ5CcABBVVI5wWjunidatWZmlLLyrqE7x0XjUC');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (84, 'Ryan', 'DeBerg', 'JChapman@mail.org', 'bcnIWVDgHWqD3jDVvQkYb6U0DsjAxu27kwE0N64vsUeRHSxaJXVfGoGUoLDCNNnAvpEVBrbomJ3LffwoahbSou5arVXWGYoE8cJGWf2wumminkrhZFoibI5HYVqa6G3xhqPYxpk5dY5Yiei6sUx2QHsT0QcH0VM3wvKtTyjj8iIeh1cJ8lcC3ktEZXm6RPYN6TCBP1nN6J38Ks');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (85, 'Frederik', 'Ladaille', 'HMitchell@lycos.no', '0eaWoeK0JQlG0F5d44wc2QTGZYhpLqyXR5cxPH8gtFTcrclqj3f0Wxb4GuvmqvCMY1cD1DkxRYF67MTurgZwPnRJMKkRVF5wDUTYCyIznZuV0ZKD5RvunAOeRKYWQqks51YVhkBGdVigHgHF8Ts7g2QnKaWO8uuteim4REpkl3J1yeJtCnFsAl7SF7kshadk3VYwN3VWqyJnEzGZkIR2g0p5xZrM');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (86, 'Sarah', 'Korkovski', 'Brent.Jones2@kpn.ca', '061PyNF0Vev7AB4tPrqV1AdbRFLQFmLWFqAkQSArL2OZEwKhUCV5ISrzKIFvaUKRIcukQnvY0BB7l0cuXUZLHSxwN6cLKIRs3TfLocfQQwTWImAavSF855oVAP2Bonz6tqfHbTOJhz4E5yBsWvHONZHPzChxYWabvULdZF30AwgKmP8iyhQdUrzuCnzTsxDjsBZlPE8gluTbf7BiEC1FtHILz6B7C84S3FK');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (87, 'Ester', 'White', 'FransSlater3@freeweb.be', '0FIYHIcOsjeOCTn0sZ2S54Q');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (88, 'Martina', 'Baltec', 'R.Meterson1@hotmail.gov', 'ula23fDOnzInRFSHIftJJAyhrevqcP8n88g8zOMj8iqLzS1ElvAESLkDKZ3i1eEUVt6CimUseNTXHdTJyEjLom70iMHWIgOLygsQYHSBxndnQXJg2iTYL2IFf8dEjIH2LUWzKznPEDThqgOT3kce1nXGXDovE7ucCl186QA3VpMSxpukDfOLtzXUsezuttq5SfghYpliQn0U0Ds1CUWdNrtNCcHjU8R10k6rDKqUhGc');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (89, 'Sid', 'Grote', 'Frans.Shapiro@gmail.de', 'GoFtYTlsNQT1m0ySSbOb2edYMT6NJh5ropCZfhm1QJ2yQSckZOh3VREpV708kYQJVCfkndntvGQoz');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (90, 'Marta', 'Sakurai', 'PatrickArnold3@web.com', 'xn0dKP5VmHfZeyvVXsiVLrV2hICvrRVbiByo1oZxED81ZRfkpcZuxnVbT5xiFZO0xSqvOGwKXnLyfXVZvmXdHiUqyqQHxw1QOLJe2PbVoeecLaHtx3jkwDYe3snBvk7oOBH20BJNyBOK54jeitBuSBRuUrHczW03gdysvJuxJo6z4pJs6MTwUqEs');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (91, 'Cath', 'Morgan', 'Ann.Goodman@weboffice.es', '4TMdeqfZK2bu805a155L7LPTxLEQw2cNXezeurGDbedxEQRkUhbi6N1a6niXe07hozFWAsfbfupMAM34NynQGPedLtvvdlIxfYQ1HSLHRBGgvlt0OAGcdrcvhhWNfriF1k1H7XnMG0kUJCHwaWnbsSn');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (92, 'Andrzej', 'Stevenson', 'E.Brady3@live.co.uk', 'FBXuOnLNneAum8jWBMmqF0ijitnRlFPyVXQj6YOgAylVnWgcvWiTuGVKJLpXY7HilbBsixyzzCoLnmLtnUEiYs6JI5We1SgaNbmVYQB5037Yo4VtsVq5hBPozg5MMdQOX8z18IUFKkKyxZjqHT07fg1GNsxtBsjZpqdi3CQPOLxNPEMAAnZiJbmTobbepXShBGlirQqOku5ETmwXjV3oEEuTEm7ns1u0dXQcFyew8gGiDFi');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (93, 'Milan', 'van Dijk', 'GPrior3@libero.us', 'k2rjshjnYS7amDJe8qZxWrziwLavsPsXgEDuvbn1Fw5MTiQcXlTw');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (94, 'Lincoln', 'Mitchell', 'Dick.Wooten@live.co.uk', 'cq6aZVZ3YHWac0RRqrxwekR7DCut0WKPY1goQLR4Jybnm1aQ2H7JuAmmcTO85O6iFlHQaJ3UJmuzDHV0LC40E53tlh7ZqBWtTaqRFquLtlsFNAsLGiE0e7QfszdD7TfvaHI6AyEUigcXQWtQaNIdNb0rEMkHgIob6xxZLmB06TmBvKw05xLSC5WCcCvOKQw6Tw83COxDmdvOenIx7bf82TMEN3XL0fImS2BKTsFHizvInuq');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (95, 'Richard', 'Forsberg', 'RichardKnopp@hotmail.com', 'DM5jAOlTERJFG7LBQAFq4wJ5e4aWJWDrkeEqmGLbmAfnrX6XUHFNP3Z8');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (96, 'Johnny', 'Blount', 'Brent.Caouette@mymail.cn', 'XyElldXoQP0Rnyjk');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (97, 'Nico', 'Polti', 'Geoffry.Climent@lycos.cc', '1wYDf2quG1Z27LIWSyZ0k7nXtCZ');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (98, 'Mads', 'Liddle', 'WillYinger@weboffice.cn', 'yJ5qdaXvp0MYNnHauTxiejVOowL3uQ2J1gQd062hVoRLzkpWEmh7Z0emiBg6QHnC5lNl4PaFBraS0Qq2Lfatz6eKFYnYNSSUyFfKMuajqI350ZiZPnV78KMDfYOlf8FTW5TFag6vy650cxnbonGia7rqgKvbkCHzS1lsDmoCDoVNrYXf3OwKnlXf7vLufi0JYwqh');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (99, 'Ashley', 'Makelaar', 'S.van Dijk@web.be', 'CuZVh4Bx3AfDhVs7nbQR7NURkDB7vzQ6MbOrZpzBXHIgPwHepWnhfGAwcJwbcvSZDO');

insert into czytelnik (czytelnik_pk, imie, nazwisko, mail, haslo) values (100, 'Jean', 'Hopper', 'IGaskins4@kpn.be', 'Cqt4DpjI4fgN5lHJI4680hSXMwJfkILhuG4AIbt2em8mHtXPTd4DfrYJ0pmIF2UP5iNZhwuUEasmCxS8aZn');







create or replace  view stan as 
select count(a.ksiazka_pk), a.tytul, a.imie, a.nazwisko from 

(select a.imie, a.nazwisko, b.tytul, b.ksiazka_pk from
(select a.autor_pk, b.tytul, b.ksiazka_pk from  (
select a.tytul ,a.ksiazka_pk from 
(select a.ksiazka_pk from wydanie a left join 
stan_katalogowy b on a.wydanie_pk = b.wydanie_pk) b left join
ksiazka a on a.ksiazka_pk = b.ksiazka_pk order by a.tytul
) b left join ksiazka_autor a on a.ksiazka_pk = b.ksiazka_pk) b 
left join autor a on a.autor_pk = b.autor_pk) a group by a.tytul, a.imie, a.nazwisko;

create or replace view dane_szczegolowe as select count as "ilosc_dostepnych_egzemplarzy", tytul, imie, nazwisko, numer_wydania, data_nowego_wydania, nazwa_wydawnictwa, ilosc_stron from (
select a.imie, a.nazwisko, b.*  from (
select a.autor_pk , b.* from (
select a.Nazwa_wydawnictwa, b.* from (
SELECT b.tytul, a.* from (
SELECT count(a.ksiazka_pk),a.ksiazka_pk, a.numer_wydania, a.data_nowego_wydania, a.ilosc_stron , a.wydawnictwo_pk FROM wydanie a 
RIGHT JOIN 
stan_katalogowy b ON a.wydanie_pk = b.wydanie_pk 
group by a.ksiazka_pk, a.numer_wydania, a.data_nowego_wydania , a.ilosc_stron, a.wydawnictwo_pk order by a.ksiazka_pk ) a left join ksiazka b on a.ksiazka_pk = b.ksiazka_pk )
 b left join wydawnictwo a on  a.wydawnictwo_pk = b.wydawnictwo_pk )
  b left join ksiazka_autor a on a.ksiazka_pk = b.ksiazka_pk)
   b left join autor a on a.autor_pk = b.autor_pk order by b.ksiazka_pk ) a;



create or replace view ilosc_ksiazek_napisanych_przez_autora as
select count(a.autor_pk) as "ilosc_napisanych_ksiazek" , a.imie, a.nazwisko from  (
select a.imie, a.nazwisko, a.autor_pk from ( 
select  b.autor_pk, a.tytul from ksiazka a left join ksiazka_autor b on a.ksiazka_pk = b.ksiazka_pk  
) b left join autor a on a.autor_pk = b.autor_pk ) a group by a.nazwisko, a.imie;
