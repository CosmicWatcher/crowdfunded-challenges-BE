create table public.solutions (
    id uuid default gen_random_uuid(),
    task_id uuid references public.tasks on delete restrict,
    created_by uuid references public.users on delete set null,
    title text,
    details text,
    is_winner boolean not null default false,
    created_at timestamptz not null default CURRENT_TIMESTAMP,
    edited_at timestamptz,
    deleted_at timestamptz,

    primary key (id)
);

alter table public.solutions enable row level security;