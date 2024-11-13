create table public.solana_accounts (
    id uuid default gen_random_uuid(),
    private_key text not null unique,
    public_key text not null unique,
    is_on_chain boolean not null default false,
    created_at timestamptz not null default CURRENT_TIMESTAMP,

    primary key (id)
);

alter table public.solana_accounts enable row level security;