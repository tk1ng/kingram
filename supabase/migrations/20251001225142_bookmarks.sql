create table public.bookmarks (
    id integer primary key generated always as identity,
    name text,
    url text
);

alter table public.bookmarks
enable row level security;