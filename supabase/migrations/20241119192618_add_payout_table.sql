create table public.task_payout (
    tx_signature text not null,
    task_id uuid not null references public.tasks on delete restrict,
    payee uuid not null references public.users on delete set null,
    amount_quarks bigint not null,
    destination_address text not null,
    payout_at timestamptz not null default CURRENT_TIMESTAMP,

    primary key (tx_signature)
);

alter table public.task_payout enable row level security;