create view
    public.solution_votes_by_task_and_user
    with (security_invoker=on)
    as
select
    solutions.task_id,
    solution_votes.voted_by,
    solution_votes.vote_count
from
    solutions
    join solution_votes on solutions.id = solution_votes.solution_id;