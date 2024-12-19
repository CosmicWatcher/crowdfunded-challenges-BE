create view
    public.solutions_with_vote_sum
    with (security_invoker=on)
    as
select
    solutions.id,
    solutions.task_id,
    solutions.created_by,
    solutions.details,
    solutions.is_winner,
    solutions.created_at,
    solutions.edited_at,
    solutions.deleted_at,
    solutions.title,
    votes.sum
from
    solutions
    join (
        select
            solution_votes.solution_id,
            sum(solution_votes.vote_count) as sum
        from
            solution_votes
        group by
            solution_votes.solution_id
    ) votes on solutions.id = votes.solution_id
where
    solutions.deleted_at is null;