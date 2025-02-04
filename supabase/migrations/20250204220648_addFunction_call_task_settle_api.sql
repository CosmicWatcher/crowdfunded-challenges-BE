CREATE
OR REPLACE FUNCTION call_task_settle_api () RETURNS void AS $$
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
            status = 'ended'
            AND (EXTRACT(EPOCH FROM NOW()) - EXTRACT(EPOCH FROM ended_at)) >= (select (data ->> 'TASK_SETTLEMENT_TIMEOUT_SEC')::integer from key_values)
    LOOP
        response := http (
            (
                'POST',
                'https://api.kinquest.app/tasks/' || task_id || '/fail',
                ARRAY[
                http_header (
                    'cron-secret',
                    (select (data ->> 'CRON_SECRET') from key_values))],
                'application/json',
                ''
            )::http_request);
        RAISE NOTICE 'Task Settle Response for task_id %: %', task_id, response; -- Log the response
    END LOOP;
END;
$$ LANGUAGE plpgsql;
