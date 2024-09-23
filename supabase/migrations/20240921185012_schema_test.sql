create table public.user (
  id uuid not null references auth.users on delete cascade,
  username text,
  reputation smallint,

  primary key (id)
);

alter table public.user enable row level security;

-- inserts a row into public.user
create function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = ''
as $$
begin
  insert into public.user (id)
  values (new.id);
  return new;
end;
$$;

-- trigger the function every time a user is created
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();
