create table public.solana_keypair (
    id uuid default gen_random_uuid(),
    private_key text,
    public_key text,
    created_at timestamptz not null default CURRENT_TIMESTAMP,

    primary key (id)
);

alter table public.solana_keypair enable row level security;