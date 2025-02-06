CREATE OR REPLACE FUNCTION call_task_end_api()
RETURNS void 
LANGUAGE plpgsql
SET search_path = ''
AS $$
DECLARE
    task_id uuid;
    response text;
BEGIN
    FOR task_id IN
        SELECT
            id
        FROM
            public.tasks
        WHERE
            status = 'active'
            AND ended_at <= NOW()
    LOOP
        response := extensions.http_post('https://api.kinquest.app/tasks/' || task_id || '/end', '', 'application/json');
        RAISE NOTICE 'Task End Response for task_id %: %', task_id, response; -- Log the response
    END LOOP;
END;
$$;
