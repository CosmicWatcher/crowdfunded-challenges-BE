create table public.solution_votes (
    id uuid default gen_random_uuid(),
    solution_id uuid references public.solutions on delete restrict,
    voted_by uuid references public.users on delete set null,
    vote_count integer not null default 1,
    voted_at timestamptz not null default CURRENT_TIMESTAMP,

    primary key (id)
);

alter table public.solution_votes enable row level security;