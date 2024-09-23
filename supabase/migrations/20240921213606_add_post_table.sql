create table public.post (
  id uuid default gen_random_uuid(),
  title text,
  content text,

  primary key (id)
);