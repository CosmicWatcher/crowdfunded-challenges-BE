create table public.task_funding_return (
    tx_signature text not null,
    task_id uuid not null references public.tasks on delete restrict,
    funder_id uuid not null references public.users on delete set null,
    amount_quarks bigint not null,
    destination_address text not null,
    return_at timestamptz not null default CURRENT_TIMESTAMP,

    primary key (tx_signature)
);

alter table public.task_funding_return enable row level security;
