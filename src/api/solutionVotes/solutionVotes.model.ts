import { Solution } from "@/api/solution/solution.model";
import { User } from "@/api/user/user.model";
import { Tables, TablesInsert } from "@/common/types/database.types";
import { supabase } from "@/common/utils/supabase";

export class SolutionVotes {
  static readonly TABLE_NAME = "solution_votes" as const;

  constructor(
    private solutionVotesData: Tables<typeof SolutionVotes.TABLE_NAME>,
  ) {}

  get id() {
    return this.solutionVotesData.id;
  }
  get solutionId() {
    return this.solutionVotesData.solution_id;
  }
  get votedBy() {
    return this.solutionVotesData.voted_by;
  }
  get voteCount() {
    return this.solutionVotesData.vote_count;
  }
  get votedAt() {
    return this.solutionVotesData.voted_at;
  }

  async getVoter(): Promise<User | null> {
    if (!this.votedBy) return null;
    return await User.getUserById(this.votedBy);
  }

  async getSolution(): Promise<Solution | null> {
    if (!this.solutionId) return null;
    return await Solution.getSolutionById(this.solutionId);
  }

  static async totalVotesBySolutionId(
    solutionId: Solution["id"],
  ): Promise<number> {
    const { data, error } = await supabase
      .from(SolutionVotes.TABLE_NAME)
      .select("vote_count.sum()")
      .eq("solution_id", solutionId)
      .returns<{ sum: number | null }[]>()
      .single();

    if (error) throw new Error(JSON.stringify(error));

    return data.sum ?? 0;
  }

  static async insert(
    solutionVotesData: TablesInsert<typeof SolutionVotes.TABLE_NAME>,
  ): Promise<SolutionVotes> {
    const { data, error } = await supabase
      .from(SolutionVotes.TABLE_NAME)
      .insert(solutionVotesData)
      .select()
      .single();
    if (error) throw new Error(JSON.stringify(error));

    return new SolutionVotes(data);
  }
}
