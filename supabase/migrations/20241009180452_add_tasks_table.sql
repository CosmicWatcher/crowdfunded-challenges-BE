CREATE TYPE task_type AS ENUM ('community', 'personal');
CREATE TYPE task_status AS ENUM ('active', 'successful', 'failed', 'deleted');

create table public.tasks (
    id uuid default gen_random_uuid(),
    created_by uuid references public.users on delete set null,
    kind task_type not null default 'personal',
    status task_status not null default 'active',
    title text,
    details text,
    max_winners smallint not null default 1,
    -- deposit_address uuid references public.task_solana_keypairs on delete restrict,
    created_at timestamptz not null default CURRENT_TIMESTAMP,
    edited_at timestamptz,
    ended_at timestamptz,
    deleted_at timestamptz,

    primary key (id)
);

alter table public.tasks enable row level security;