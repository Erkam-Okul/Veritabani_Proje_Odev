--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.1

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
-- Name: delete_ogrenci(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_ogrenci(p_ogrenci_no integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	 delete from ogrenciler
        where ogrenci_no=p_ogrenci_no;
	 return 0;
	END; 
	$$;


ALTER FUNCTION public.delete_ogrenci(p_ogrenci_no integer) OWNER TO postgres;

--
-- Name: delete_ogretmen(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.delete_ogretmen(p_ogretmen_no integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	  
	 delete from ogretmenler
        where ogretmen_no=p_ogretmen_no;
        
	 return 0;
	 
	END; 
	$$;


ALTER FUNCTION public.delete_ogretmen(p_ogretmen_no integer) OWNER TO postgres;

--
-- Name: dersler_gecmis_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.dersler_gecmis_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	  
	 
	 IF (TG_OP = 'DELETE') THEN
	 
	 	 INSERT INTO dersler_gecmis
            (zaman,islem,ders_kodu,ders_adi)
            values
            (now(),TG_OP,OLD.ders_kodu,OLD.ders_adi);
	 
	 ELSIF (TG_OP = 'UPDATE' or TG_OP = 'INSERT' ) THEN
	 
	 	 INSERT INTO dersler_gecmis
            (zaman,islem,ders_kodu,ders_adi)
            values
            (now(),TG_OP,NEW.ders_kodu,NEW.ders_adi);
	 
	 END IF;
	 
	   RETURN NEW;
	 
	END; 
	$$;


ALTER FUNCTION public.dersler_gecmis_insert() OWNER TO postgres;

--
-- Name: ekle_ogrenci(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ekle_ogrenci(p_ogrenci_ad text, p_ogrenci_soyad text, p_ilkod text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
     INSERT INTO ogrenciler 
     (ogrenci_no,ad,soyad,il_kod,ilce_kod,adres)        
        VALUES
      (NEXTVAL('sayac_ogrenci'),p_ogrenci_ad,p_ogrenci_soyad,p_ilkod,p_ilcekod,null); 
      
	 RETURN 0;
	 
	END; 
	$$;


ALTER FUNCTION public.ekle_ogrenci(p_ogrenci_ad text, p_ogrenci_soyad text, p_ilkod text) OWNER TO postgres;

--
-- Name: ekle_ogrenci(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ekle_ogrenci(p_ogrenci_ad text, p_ogrenci_soyad text, p_ilkod text, p_ilcekod text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
     INSERT INTO ogrenciler 
     (ogrenci_no,ad,soyad,il_kod,ilce_kod,adres)        
        VALUES
      (NEXTVAL('sayac_ogrenci'),p_ogrenci_ad,p_ogrenci_soyad,p_ilkod,p_ilcekod,null); 
      
	 RETURN 0;
	 
	END; 
	$$;


ALTER FUNCTION public.ekle_ogrenci(p_ogrenci_ad text, p_ogrenci_soyad text, p_ilkod text, p_ilcekod text) OWNER TO postgres;

--
-- Name: ekle_ogretmen(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ekle_ogretmen(p_ogretmen_ad text, p_ogretmen_soyad text, p_ogretmen_bolum text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	   INSERT INTO ogretmenler 
     (ogretmen_no,ad,soyad,bolum)        
        VALUES
      (NEXTVAL('sayac_ogretmenler'),p_ogretmen_ad,p_ogretmen_soyad,p_ogretmen_bolum ); 
      
	 RETURN 0;
	 
	END; 
	$$;


ALTER FUNCTION public.ekle_ogretmen(p_ogretmen_ad text, p_ogretmen_soyad text, p_ogretmen_bolum text) OWNER TO postgres;

--
-- Name: guncelle_ogrenci(integer, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.guncelle_ogrenci(p_ogrenci_no integer, p_ogrenci_ad text, p_ogrenci_soyad text, p_ilkod text, p_adres text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	    update ogrenciler
           set ad=p_ogrenci_ad,soyad=p_ogrenci_soyad,il_kod= p_ilkod,adres= p_adres
         where ogrenci_no=p_ogrenci_no;
      
	 RETURN 0;
	 
	END; 
	$$;


ALTER FUNCTION public.guncelle_ogrenci(p_ogrenci_no integer, p_ogrenci_ad text, p_ogrenci_soyad text, p_ilkod text, p_adres text) OWNER TO postgres;

--
-- Name: guncelle_ogretmen(text, text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.guncelle_ogretmen(p_ogretmen_ad text, p_ogretmen_soyad text, p_ogretmen_no integer, p_ogretmen_bolum text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	 
	    update ogretmenler
           set ad=p_ogretmen_ad,soyad=p_ogretmen_soyad,bolum= p_ogretmen_bolum
         where ogretmen_no=p_ogretmen_no;
      
	 RETURN 0;
	 
	END; 
	$$;


ALTER FUNCTION public.guncelle_ogretmen(p_ogretmen_ad text, p_ogretmen_soyad text, p_ogretmen_no integer, p_ogretmen_bolum text) OWNER TO postgres;

--
-- Name: ogrenci_gecmis_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ogrenci_gecmis_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	 
	 IF (TG_OP = 'DELETE') THEN
	 
	 	 INSERT INTO ogrenciler_gecmis
            (zaman,islem,ogrenci_no,ad,soyad,ilkod,adres)
            values
            (now(),TG_OP,OLD.ogrenci_no,OLD.ad,OLD.soyad,OLD.il_kod,OLD.adres);
	 
	 ELSIF (TG_OP = 'UPDATE' or TG_OP = 'INSERT' ) THEN
	 
	 	 INSERT INTO ogrenciler_gecmis
            (zaman,islem,ogrenci_no,ad,soyad,ilkod,adres)
            values
            (now(),TG_OP,NEW.ogrenci_no,NEW.ad,NEW.soyad,NEW.il_kod,NEW.adres);
	 
	 END IF;
	 
	 


    RETURN NEW;
	 
	END; 
	$$;


ALTER FUNCTION public.ogrenci_gecmis_insert() OWNER TO postgres;

--
-- Name: ogretmen_gecmis_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ogretmen_gecmis_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	  IF (TG_OP = 'DELETE') THEN
	 
	 	 INSERT INTO ogretmenler_gecmis
            (zaman,islem,ogretmen_no,ad,soyad,bolum)
            values
            (now(),TG_OP,OLD.ogretmen_no,OLD.ad,OLD.soyad,OLD.bolum);
	 
	 ELSIF (TG_OP = 'UPDATE' or TG_OP = 'INSERT' ) THEN
	  
	 	  INSERT INTO ogretmenler_gecmis
            (zaman,islem,ogretmen_no,ad,soyad,bolum)
            values
            (now(),TG_OP,NEW.ogretmen_no,NEW.ad,NEW.soyad,NEW.bolum);
	 
	 END IF;
	 
	 


    RETURN NEW;
	 
	END; 
	$$;


ALTER FUNCTION public.ogretmen_gecmis_insert() OWNER TO postgres;

--
-- Name: sinav_gecmis_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sinav_gecmis_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	 DECLARE BEGIN
	 
	  IF (TG_OP = 'DELETE') THEN
	 
	 	 INSERT INTO sinavlar_gecmis
            (zaman,islem,sinav_no,ders_kodu,sinav_tarihi,sinav_turu)
            values
            (now(),TG_OP,OLD.sinav_no,OLD.ders_kodu,OLD.sinav_tarihi,OLD.sinav_turu);
	 
	 ELSIF (TG_OP = 'UPDATE' or TG_OP = 'INSERT' ) THEN
	  
	 	  INSERT INTO sinavlar_gecmis
              (zaman,islem,sinav_no,ders_kodu,sinav_tarihi,sinav_turu)
            values
            (now(),TG_OP,NEW.sinav_no,NEW.ders_kodu,NEW.sinav_tarihi,NEW.sinav_turu);
	 
	 END IF;
	 
	 


    RETURN NEW;
	 
	END; 
	$$;


ALTER FUNCTION public.sinav_gecmis_insert() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bolumler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bolumler (
    bolum_kodu text NOT NULL,
    bolum_adi text NOT NULL
);


ALTER TABLE public.bolumler OWNER TO postgres;

--
-- Name: dersler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dersler (
    ders_kodu text NOT NULL,
    ders_adi text NOT NULL
);


ALTER TABLE public.dersler OWNER TO postgres;

--
-- Name: dersler_gecmis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dersler_gecmis (
    ders_adi text NOT NULL,
    ders_kodu text NOT NULL,
    islem text NOT NULL,
    zaman timestamp with time zone NOT NULL
);


ALTER TABLE public.dersler_gecmis OWNER TO postgres;

--
-- Name: iller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iller (
    ilkod text NOT NULL,
    il_ismi text
);


ALTER TABLE public.iller OWNER TO postgres;

--
-- Name: kullanici_islem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanici_islem (
    kullanici_kodu text NOT NULL,
    zaman time without time zone NOT NULL,
    islem text NOT NULL
);


ALTER TABLE public.kullanici_islem OWNER TO postgres;

--
-- Name: kullanici_login; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanici_login (
    kullanici_kodu text NOT NULL,
    zaman time without time zone NOT NULL,
    basarilimi text NOT NULL
);


ALTER TABLE public.kullanici_login OWNER TO postgres;

--
-- Name: kullanicilar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanicilar (
    kullanici_kodu text NOT NULL,
    sifre text NOT NULL
);


ALTER TABLE public.kullanicilar OWNER TO postgres;

--
-- Name: ogrenci_alinan_dersler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenci_alinan_dersler (
    ogrenci_no integer NOT NULL,
    ders_kodu text NOT NULL,
    ogretmen_no integer NOT NULL,
    tarih timestamp without time zone NOT NULL
);


ALTER TABLE public.ogrenci_alinan_dersler OWNER TO postgres;

--
-- Name: ogrenci_girilen_sinavlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenci_girilen_sinavlar (
    ogrenci_no integer NOT NULL,
    sinav_no text NOT NULL,
    sinav_puan text NOT NULL
);


ALTER TABLE public.ogrenci_girilen_sinavlar OWNER TO postgres;

--
-- Name: ogrenciler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenciler (
    ogrenci_no integer NOT NULL,
    ad text NOT NULL,
    soyad text NOT NULL,
    il_kod text,
    ilce_kod text,
    adres text
);


ALTER TABLE public.ogrenciler OWNER TO postgres;

--
-- Name: ogrenciler_gecmis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogrenciler_gecmis (
    islem text,
    ogrenci_no integer,
    ad text,
    soyad text,
    ilkod text,
    adres text,
    zaman timestamp without time zone NOT NULL
);


ALTER TABLE public.ogrenciler_gecmis OWNER TO postgres;

--
-- Name: ogretmenler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogretmenler (
    ogretmen_no integer NOT NULL,
    ad text NOT NULL,
    soyad text NOT NULL,
    bolum text NOT NULL
);


ALTER TABLE public.ogretmenler OWNER TO postgres;

--
-- Name: ogretmenler_gecmis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ogretmenler_gecmis (
    islem text,
    ad text,
    bolum text,
    ogretmen_no text,
    soyad text,
    zaman timestamp without time zone
);


ALTER TABLE public.ogretmenler_gecmis OWNER TO postgres;

--
-- Name: sayac_ogrenci; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sayac_ogrenci
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sayac_ogrenci OWNER TO postgres;

--
-- Name: sayac_ogrenci; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sayac_ogrenci OWNED BY public.ogrenciler.ogrenci_no;


--
-- Name: sayac_ogretmenler; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sayac_ogretmenler
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sayac_ogretmenler OWNER TO postgres;

--
-- Name: sayac_ogretmenler; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sayac_ogretmenler OWNED BY public.ogretmenler.ogretmen_no;


--
-- Name: sinavlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sinavlar (
    sinav_no text NOT NULL,
    ders_kodu text NOT NULL,
    sinav_tarihi text NOT NULL,
    sinav_turu text NOT NULL
);


ALTER TABLE public.sinavlar OWNER TO postgres;

--
-- Name: sinavlar_gecmis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sinavlar_gecmis (
    sinav_no text NOT NULL,
    ders_kodu text NOT NULL,
    sinav_tarihi text NOT NULL,
    sinav_turu text NOT NULL,
    islem text NOT NULL,
    zaman timestamp without time zone
);


ALTER TABLE public.sinavlar_gecmis OWNER TO postgres;

--
-- Name: bolumler bolumler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bolumler
    ADD CONSTRAINT bolumler_pkey PRIMARY KEY (bolum_kodu);


--
-- Name: dersler dersler_ders_kodu_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dersler
    ADD CONSTRAINT dersler_ders_kodu_key UNIQUE (ders_kodu);


--
-- Name: dersler dersler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dersler
    ADD CONSTRAINT dersler_pkey PRIMARY KEY (ders_kodu);


--
-- Name: iller iller_ilkod_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iller
    ADD CONSTRAINT iller_ilkod_key UNIQUE (ilkod);


--
-- Name: iller iller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iller
    ADD CONSTRAINT iller_pkey PRIMARY KEY (ilkod);


--
-- Name: kullanicilar kullanicilar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_pkey PRIMARY KEY (kullanici_kodu);


--
-- Name: ogrenciler ogrenciler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenciler
    ADD CONSTRAINT ogrenciler_pkey PRIMARY KEY (ogrenci_no);


--
-- Name: ogretmenler ogretmenler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogretmenler
    ADD CONSTRAINT ogretmenler_pkey PRIMARY KEY (ogretmen_no);


--
-- Name: sinavlar sinavlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinavlar
    ADD CONSTRAINT sinavlar_pkey PRIMARY KEY (sinav_no);


--
-- Name: bolumler unique_bolumler_bolum_adi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bolumler
    ADD CONSTRAINT unique_bolumler_bolum_adi UNIQUE (bolum_adi);


--
-- Name: bolumler unique_bolumler_bolum_kodu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bolumler
    ADD CONSTRAINT unique_bolumler_bolum_kodu UNIQUE (bolum_kodu);


--
-- Name: ogretmenler unique_ogretmenler_ogretmen_no; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogretmenler
    ADD CONSTRAINT unique_ogretmenler_ogretmen_no UNIQUE (ogretmen_no);


--
-- Name: sinavlar_gecmis unique_sinavlar_gecmis_sinav_no; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinavlar_gecmis
    ADD CONSTRAINT unique_sinavlar_gecmis_sinav_no UNIQUE (sinav_no);


--
-- Name: sinavlar unique_sinavlar_sinav_no; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sinavlar
    ADD CONSTRAINT unique_sinavlar_sinav_no UNIQUE (sinav_no);


--
-- Name: dersler trg_ders_guncelle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_ders_guncelle AFTER INSERT OR DELETE OR UPDATE ON public.dersler FOR EACH ROW EXECUTE FUNCTION public.dersler_gecmis_insert();


--
-- Name: ogrenciler trg_ogrenci_guncelle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_ogrenci_guncelle AFTER INSERT OR DELETE OR UPDATE ON public.ogrenciler FOR EACH ROW EXECUTE FUNCTION public.ogrenci_gecmis_insert();


--
-- Name: ogretmenler trg_ogretmen_guncelle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_ogretmen_guncelle AFTER INSERT OR DELETE OR UPDATE ON public.ogretmenler FOR EACH ROW EXECUTE FUNCTION public.ogretmen_gecmis_insert();


--
-- Name: sinavlar trg_sinav_guncelle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_sinav_guncelle AFTER INSERT OR DELETE OR UPDATE ON public.sinavlar FOR EACH ROW EXECUTE FUNCTION public.sinav_gecmis_insert();


--
-- Name: kullanici_islem fk_kullanici_islem; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanici_islem
    ADD CONSTRAINT fk_kullanici_islem FOREIGN KEY (kullanici_kodu) REFERENCES public.kullanicilar(kullanici_kodu);


--
-- Name: kullanici_login fk_kullanici_kodu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanici_login
    ADD CONSTRAINT fk_kullanici_kodu FOREIGN KEY (kullanici_kodu) REFERENCES public.kullanicilar(kullanici_kodu);


--
-- Name: ogrenci_girilen_sinavlar fk_ogr_gir_sinav_ogrno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci_girilen_sinavlar
    ADD CONSTRAINT fk_ogr_gir_sinav_ogrno FOREIGN KEY (ogrenci_no) REFERENCES public.ogrenciler(ogrenci_no);


--
-- Name: ogrenci_girilen_sinavlar fk_ogr_gir_sinav_sinavno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci_girilen_sinavlar
    ADD CONSTRAINT fk_ogr_gir_sinav_sinavno FOREIGN KEY (sinav_no) REFERENCES public.sinavlar(sinav_no);


--
-- Name: ogrenci_alinan_dersler fk_ogrenci_alinan_ders_kodu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci_alinan_dersler
    ADD CONSTRAINT fk_ogrenci_alinan_ders_kodu FOREIGN KEY (ders_kodu) REFERENCES public.dersler(ders_kodu);


--
-- Name: ogrenci_alinan_dersler fk_ogrenci_alinan_ogr_no; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ogrenci_alinan_dersler
    ADD CONSTRAINT fk_ogrenci_alinan_ogr_no FOREIGN KEY (ogrenci_no) REFERENCES public.ogrenciler(ogrenci_no);


--
-- PostgreSQL database dump complete
--

