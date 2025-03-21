import { Task } from "@/api/task/task.model";
import { User } from "@/api/user/user.model";
import {
  Tables,
  TablesInsert,
  TablesUpdate,
} from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

type TopSolutionsView = Tables<typeof Solution.TABLE_NAME> & { sum: number };

export class Solution {
  static readonly TABLE_NAME = "solutions" as const;
  static readonly TOP_SOLUTIONS_VIEW = "solutions_with_vote_sum" as const;

  constructor(private solutionData: Tables<typeof Solution.TABLE_NAME>) {}

  get id() {
    return this.solutionData.id;
  }
  get taskId() {
    return this.solutionData.task_id;
  }
  get createdBy() {
    return this.solutionData.created_by;
  }
  get title() {
    return this.solutionData.title;
  }
  get details() {
    return this.solutionData.details;
  }
  get isWinner() {
    return this.solutionData.is_winner;
  }
  get createdAt() {
    return this.solutionData.created_at;
  }
  get editedAt() {
    return this.solutionData.edited_at;
  }
  get deletedAt() {
    return this.solutionData.deleted_at;
  }

  async getCreator(): Promise<User | null> {
    if (!this.createdBy) return null;
    return await User.getUserById(this.createdBy);
  }

  async getTask(): Promise<Task | null> {
    if (!this.taskId) return null;
    return await Task.getTaskById(this.taskId);
  }

  static async getSolutionById(id: string): Promise<Solution | null> {
    const { data, error } = await supabase
      .from(Solution.TABLE_NAME)
      .select("*")
      .eq("id", id)
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return null;

    return new Solution(data);
  }

  static async getSolutionsByTaskId(
    taskId: string,
    rangeStart: number,
    rangeEnd: number,
    ascending = false,
  ): Promise<{ solutions: Solution[]; totalRecords: number }> {
    const { data, error, count } = await supabase
      .from(Solution.TABLE_NAME)
      .select("*", { count: "estimated" })
      .eq("task_id", taskId)
      .is("deleted_at", null)
      .order("created_at", { ascending })
      .range(rangeStart, rangeEnd);
    if (error) throw new Error(JSON.stringify(error));

    const solutions: Solution[] = [];
    for (const row of data) {
      solutions.push(new Solution(row));
    }
    return { solutions, totalRecords: count ?? solutions.length };
  }

  static async getTopSolutionsByVoteCount(
    taskId: string,
  ): Promise<{ solution: Solution; voteCount: number }[]> {
    const { data, error } = await supabase
      .from(Solution.TOP_SOLUTIONS_VIEW)
      .select("*")
      .eq("task_id", taskId)
      .order("sum", { ascending: false })
      .returns<TopSolutionsView[]>();
    if (error) throw new Error(JSON.stringify(error));

    const solutions: { solution: Solution; voteCount: number }[] = [];
    for (const row of data) {
      const { sum, ...solutionData } = row;
      solutions.push({ solution: new Solution(solutionData), voteCount: sum });
    }
    return solutions;
  }

  static async insert(
    solutionData: TablesInsert<typeof Solution.TABLE_NAME>,
  ): Promise<Solution> {
    const { data, error } = await supabase
      .from(Solution.TABLE_NAME)
      .insert(solutionData)
      .select()
      .single();
    if (error) throw new Error(JSON.stringify(error));

    return new Solution(data);
  }

  async update(
    solutionData: TablesUpdate<typeof Solution.TABLE_NAME>,
  ): Promise<Solution> {
    const { data, error } = await supabase
      .from(Solution.TABLE_NAME)
      .update(solutionData)
      .eq("id", this.id)
      .select()
      .maybeSingle();

    if (error) throw new Error(JSON.stringify(error));
    if (!data) return this;

    this.solutionData = data;
    return this;
  }
}
