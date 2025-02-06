export const FORM_LIMITS = {
  ACCOUNT: {
    USERNAME: { MIN: 3, MAX: 20 },
  },
  TASK_CREATION: {
    TITLE: { MIN: 3, MAX: 200 },
    DESCRIPTION: { MAX: 20000 },
    MAX_WINNERS: { MIN: 1, MAX: 10 },
  },
  TASK_SOLUTION: {
    TITLE: { MIN: 3, MAX: 200 },
    DESCRIPTION: { MIN: 50, MAX: 10000 },
  },
} as const;

export const GET_TASKS_LIMIT_PER_PAGE = 10;
export const GET_SOLUTIONS_LIMIT_PER_PAGE = 20;

export const CRON_USER_ID = "cron";

export const TASK_SETTLEMENT_TIMEOUT_MS = 1000 * 60 * 60 * 24; // 24 hours
