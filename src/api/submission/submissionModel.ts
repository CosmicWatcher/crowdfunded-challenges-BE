import { Task } from "@/api/task/taskModel";
import { User } from "@/api/user/userModel";
import { Tables, TablesInsert } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class Submission {
  static readonly TABLE_NAME = "task_submissions" as const;

  constructor(private submissionData: Tables<typeof Submission.TABLE_NAME>) {}

  get id() {
    return this.submissionData.id;
  }
  get taskId() {
    return this.submissionData.task_id;
  }
  get createdBy() {
    return this.submissionData.created_by;
  }
  get details() {
    return this.submissionData.details;
  }
  get voteCount() {
    return this.submissionData.vote_count;
  }
  get isWinner() {
    return this.submissionData.is_winner;
  }
  get createdAt() {
    return this.submissionData.created_at;
  }
  get editedAt() {
    return this.submissionData.edited_at;
  }
  get deletedAt() {
    return this.submissionData.deleted_at;
  }

  async getCreator(): Promise<User | null> {
    if (!this.createdBy) return null;
    return await User.getUserById(this.createdBy);
  }

  async getTask(): Promise<Task | null> {
    if (!this.taskId) return null;
    return await Task.getTaskById(this.taskId);
  }

  static async getSubmissionById(id: string): Promise<Submission | null> {
    const { data, error } = await supabase
      .from(Submission.TABLE_NAME)
      .select("*")
      .eq("id", id)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return null;

    return new Submission(data);
  }

  static async getSubmissionsByTaskId(
    taskId: string,
    rangeStart: number,
    rangeEnd: number,
    ascending = false,
  ): Promise<{ submissions: Submission[]; totalRecords: number }> {
    const { data, error, count } = await supabase
      .from(Submission.TABLE_NAME)
      .select("*", { count: "estimated" })
      .eq("task_id", taskId)
      .order("created_at", { ascending })
      .range(rangeStart, rangeEnd);
    if (error) throw new Error(JSON.stringify(error));

    const submissions: Submission[] = [];
    for (const row of data) {
      submissions.push(new Submission(row));
    }
    return { submissions, totalRecords: count ?? submissions.length };
  }

  static async insert(
    submissionData: TablesInsert<typeof Submission.TABLE_NAME>,
  ): Promise<Submission> {
    const { data, error } = await supabase
      .from(Submission.TABLE_NAME)
      .insert(submissionData)
      .select()
      .single();
    if (error) throw new Error(JSON.stringify(error));

    return new Submission(data);
  }
}
