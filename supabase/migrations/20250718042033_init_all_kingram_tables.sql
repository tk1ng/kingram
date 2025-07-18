--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Postgres.app)
-- Dumped by pg_dump version 17.4 (Postgres.app)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pageinspect; Type: EXTENSION; Schema: -; Owner: -
--
-- the role executing this doesn't have permission to add extension
-- CREATE EXTENSION IF NOT EXISTS pageinspect WITH SCHEMA public;


--
-- Name: EXTENSION pageinspect; Type: COMMENT; Schema: -; Owner: 
--

-- COMMENT ON EXTENSION pageinspect IS 'inspect the contents of database pages at a low level';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    balance integer DEFAULT 0 NOT NULL
);


-- ALTER TABLE public.accounts OWNER TO king;

--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.accounts_id_seq OWNER TO king;

--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: caption_tags; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.caption_tags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


-- ALTER TABLE public.caption_tags OWNER TO king;

--
-- Name: caption_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.caption_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.caption_tags_id_seq OWNER TO king;

--
-- Name: caption_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.caption_tags_id_seq OWNED BY public.caption_tags.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    contents character varying(240),
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


-- ALTER TABLE public.comments OWNER TO king;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.comments_id_seq OWNER TO king;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    leader_id integer,
    follower_id integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


-- ALTER TABLE public.followers OWNER TO king;

--
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.followers_id_seq OWNER TO king;

--
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    title character varying(20) NOT NULL
);


-- ALTER TABLE public.hashtags OWNER TO king;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.hashtags_id_seq OWNER TO king;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: hashtags_posts; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.hashtags_posts (
    id integer NOT NULL,
    post_id integer,
    hashtag_id integer
);


-- ALTER TABLE public.hashtags_posts OWNER TO king;

--
-- Name: hashtags_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.hashtags_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.hashtags_posts_id_seq OWNER TO king;

--
-- Name: hashtags_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.hashtags_posts_id_seq OWNED BY public.hashtags_posts.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    comment_id integer,
    post_id integer,
    user_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT likes_check CHECK (((COALESCE(((post_id)::boolean)::integer, 0) + COALESCE(((comment_id)::boolean)::integer, 0)) = 1))
);


-- ALTER TABLE public.likes OWNER TO king;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.likes_id_seq OWNER TO king;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: photo_tags; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.photo_tags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


-- ALTER TABLE public.photo_tags OWNER TO king;

--
-- Name: photo_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.photo_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.photo_tags_id_seq OWNER TO king;

--
-- Name: photo_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.photo_tags_id_seq OWNED BY public.photo_tags.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    caption character varying(240),
    lat real,
    lng real,
    user_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT posts_lat_check CHECK (((lat IS NULL) OR ((lat >= ('-90'::integer)::double precision) AND (lat <= (90)::double precision)))),
    CONSTRAINT posts_lng_check CHECK (((lng IS NULL) OR ((lng >= ('-180'::integer)::double precision) AND (lng <= (180)::double precision))))
);


-- ALTER TABLE public.posts OWNER TO king;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.posts_id_seq OWNER TO king;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: recent_posts; Type: VIEW; Schema: public; Owner: king
--

CREATE VIEW public.recent_posts AS
 SELECT id,
    url,
    caption,
    lat,
    lng,
    user_id,
    created_at,
    updated_at
   FROM public.posts
  ORDER BY created_at DESC
 LIMIT 15;


-- ALTER VIEW public.recent_posts OWNER TO king;

--
-- Name: tags; Type: VIEW; Schema: public; Owner: king
--

CREATE VIEW public.tags AS
 SELECT photo_tags.id,
    photo_tags.created_at,
    photo_tags.user_id,
    photo_tags.post_id,
    'photo_tag'::text AS type
   FROM public.photo_tags
UNION ALL
 SELECT caption_tags.id,
    caption_tags.created_at,
    caption_tags.user_id,
    caption_tags.post_id,
    'caption_tag'::text AS type
   FROM public.caption_tags;


-- ALTER VIEW public.tags OWNER TO king;

--
-- Name: users; Type: TABLE; Schema: public; Owner: king
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    email character varying(100),
    phone character varying(25),
    password character varying(50),
    bio character varying(400),
    avatar character varying(200),
    status character varying(15),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_check CHECK ((COALESCE(phone, email) IS NOT NULL))
);


-- ALTER TABLE public.users OWNER TO king;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: king
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER SEQUENCE public.users_id_seq OWNER TO king;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: king
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: weekly_likes; Type: MATERIALIZED VIEW; Schema: public; Owner: king
--

CREATE MATERIALIZED VIEW public.weekly_likes AS
 SELECT date_trunc('week'::text, COALESCE(posts.created_at, comments.created_at)) AS week,
    count(posts.id) AS num_likes_for_posts,
    count(comments.id) AS num_likes_for_comments
   FROM ((public.likes
     LEFT JOIN public.posts ON ((posts.id = likes.post_id)))
     LEFT JOIN public.comments ON ((comments.id = likes.comment_id)))
  GROUP BY (date_trunc('week'::text, COALESCE(posts.created_at, comments.created_at)))
  ORDER BY (date_trunc('week'::text, COALESCE(posts.created_at, comments.created_at)))
  WITH NO DATA;


-- ALTER MATERIALIZED VIEW public.weekly_likes OWNER TO king;

--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: caption_tags id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.caption_tags ALTER COLUMN id SET DEFAULT nextval('public.caption_tags_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: hashtags_posts id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags_posts ALTER COLUMN id SET DEFAULT nextval('public.hashtags_posts_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: photo_tags id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.photo_tags ALTER COLUMN id SET DEFAULT nextval('public.photo_tags_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: caption_tags caption_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.caption_tags
    ADD CONSTRAINT caption_tags_pkey PRIMARY KEY (id);


--
-- Name: caption_tags caption_tags_user_id_post_id_key; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.caption_tags
    ADD CONSTRAINT caption_tags_user_id_post_id_key UNIQUE (user_id, post_id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: followers followers_leader_id_follower_id_key; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_leader_id_follower_id_key UNIQUE (leader_id, follower_id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: hashtags_posts hashtags_posts_hashtag_id_post_id_key; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags_posts
    ADD CONSTRAINT hashtags_posts_hashtag_id_post_id_key UNIQUE (hashtag_id, post_id);


--
-- Name: hashtags_posts hashtags_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags_posts
    ADD CONSTRAINT hashtags_posts_pkey PRIMARY KEY (id);


--
-- Name: hashtags hashtags_title_key; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_title_key UNIQUE (title);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: likes likes_user_id_post_id_comment_id_key; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_post_id_comment_id_key UNIQUE (user_id, post_id, comment_id);


--
-- Name: photo_tags photo_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.photo_tags
    ADD CONSTRAINT photo_tags_pkey PRIMARY KEY (id);


--
-- Name: photo_tags photo_tags_user_id_post_id_key; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.photo_tags
    ADD CONSTRAINT photo_tags_user_id_post_id_key UNIQUE (user_id, post_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_idx; Type: INDEX; Schema: public; Owner: king
--

CREATE INDEX users_username_idx ON public.users USING btree (username);


--
-- Name: caption_tags caption_tags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.caption_tags
    ADD CONSTRAINT caption_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: caption_tags caption_tags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.caption_tags
    ADD CONSTRAINT caption_tags_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: followers followers_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: followers followers_leader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_leader_id_fkey FOREIGN KEY (leader_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: hashtags_posts hashtags_posts_hashtag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags_posts
    ADD CONSTRAINT hashtags_posts_hashtag_id_fkey FOREIGN KEY (hashtag_id) REFERENCES public.hashtags(id) ON DELETE CASCADE;


--
-- Name: hashtags_posts hashtags_posts_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.hashtags_posts
    ADD CONSTRAINT hashtags_posts_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: likes likes_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comments(id) ON DELETE CASCADE;


--
-- Name: likes likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: photo_tags photo_tags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.photo_tags
    ADD CONSTRAINT photo_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: photo_tags photo_tags_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.photo_tags
    ADD CONSTRAINT photo_tags_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: king
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

