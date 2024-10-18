create table public.task_solana_keypairs (
    id uuid default gen_random_uuid(),
    private_key text not null unique,
    public_key text not null unique,
    created_at timestamptz not null default CURRENT_TIMESTAMP,

    primary key (id)
);

alter table public.task_solana_keypairs enable row level security;