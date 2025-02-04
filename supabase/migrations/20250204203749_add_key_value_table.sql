create table public.key_values (
    id uuid default gen_random_uuid(),
    data jsonb,

    primary key (id)
);

alter table public.key_values enable row level security;