create table public.task_funding (
    id uuid default gen_random_uuid(),
    task_id uuid references public.tasks on delete restrict,
    funded_by uuid references public.users on delete set null,
    amount_fiat real,
    currency text,
    exchange_rate real,
    amount_quarks bigint,
    destination_address text,
    intent_id text unique,
    funded_at timestamptz not null default CURRENT_TIMESTAMP,

    primary key (id)
);

alter table public.task_funding enable row level security;