ALTER TABLE public.users DROP CONSTRAINT users_id_fkey;
ALTER TABLE public.users ADD code_userid text unique;
ALTER TABLE public.users ALTER COLUMN id SET DEFAULT gen_random_uuid();

create table public.code_login (
    id uuid default gen_random_uuid(),
    intent_id text unique,
    created_at timestamptz not null default CURRENT_TIMESTAMP,
    expires_at timestamptz not null default CURRENT_TIMESTAMP + (5 ||' minutes')::interval,

    primary key (id)
);

alter table public.code_login enable row level security;