export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[];

export interface Database {
  graphql_public: {
    Tables: {
      [_ in never]: never;
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      graphql: {
        Args: {
          operationName?: string;
          query?: string;
          variables?: Json;
          extensions?: Json;
        };
        Returns: Json;
      };
    };
    Enums: {
      [_ in never]: never;
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
  public: {
    Tables: {
      solana_accounts: {
        Row: {
          created_at: string;
          id: string;
          private_key: string;
          public_key: string;
        };
        Insert: {
          created_at?: string;
          id?: string;
          private_key: string;
          public_key: string;
        };
        Update: {
          created_at?: string;
          id?: string;
          private_key?: string;
          public_key?: string;
        };
        Relationships: [];
      };
      solution_votes: {
        Row: {
          id: string;
          solution_id: string | null;
          vote_count: number;
          voted_at: string;
          voted_by: string | null;
        };
        Insert: {
          id?: string;
          solution_id?: string | null;
          vote_count?: number;
          voted_at?: string;
          voted_by?: string | null;
        };
        Update: {
          id?: string;
          solution_id?: string | null;
          vote_count?: number;
          voted_at?: string;
          voted_by?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "solution_votes_solution_id_fkey";
            columns: ["solution_id"];
            isOneToOne: false;
            referencedRelation: "solutions";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "solution_votes_solution_id_fkey";
            columns: ["solution_id"];
            isOneToOne: false;
            referencedRelation: "solutions_with_vote_sum";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "solution_votes_voted_by_fkey";
            columns: ["voted_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
        ];
      };
      solutions: {
        Row: {
          created_at: string;
          created_by: string | null;
          deleted_at: string | null;
          details: string | null;
          edited_at: string | null;
          id: string;
          is_winner: boolean;
          task_id: string | null;
          title: string | null;
        };
        Insert: {
          created_at?: string;
          created_by?: string | null;
          deleted_at?: string | null;
          details?: string | null;
          edited_at?: string | null;
          id?: string;
          is_winner?: boolean;
          task_id?: string | null;
          title?: string | null;
        };
        Update: {
          created_at?: string;
          created_by?: string | null;
          deleted_at?: string | null;
          details?: string | null;
          edited_at?: string | null;
          id?: string;
          is_winner?: boolean;
          task_id?: string | null;
          title?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "solutions_created_by_fkey";
            columns: ["created_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "solutions_task_id_fkey";
            columns: ["task_id"];
            isOneToOne: false;
            referencedRelation: "tasks";
            referencedColumns: ["id"];
          },
        ];
      };
      task_funding: {
        Row: {
          amount_fiat: number | null;
          amount_quarks: number;
          currency: string | null;
          destination_address: string | null;
          exchange_rate: number | null;
          funded_at: string;
          funded_by: string | null;
          id: string;
          intent_id: string | null;
          task_id: string | null;
        };
        Insert: {
          amount_fiat?: number | null;
          amount_quarks?: number;
          currency?: string | null;
          destination_address?: string | null;
          exchange_rate?: number | null;
          funded_at?: string;
          funded_by?: string | null;
          id?: string;
          intent_id?: string | null;
          task_id?: string | null;
        };
        Update: {
          amount_fiat?: number | null;
          amount_quarks?: number;
          currency?: string | null;
          destination_address?: string | null;
          exchange_rate?: number | null;
          funded_at?: string;
          funded_by?: string | null;
          id?: string;
          intent_id?: string | null;
          task_id?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "task_funding_funded_by_fkey";
            columns: ["funded_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "task_funding_task_id_fkey";
            columns: ["task_id"];
            isOneToOne: false;
            referencedRelation: "tasks";
            referencedColumns: ["id"];
          },
        ];
      };
      task_funding_return: {
        Row: {
          amount_quarks: number;
          destination_address: string;
          funder_id: string;
          return_at: string;
          task_id: string;
          tx_signature: string;
        };
        Insert: {
          amount_quarks: number;
          destination_address: string;
          funder_id: string;
          return_at?: string;
          task_id: string;
          tx_signature: string;
        };
        Update: {
          amount_quarks?: number;
          destination_address?: string;
          funder_id?: string;
          return_at?: string;
          task_id?: string;
          tx_signature?: string;
        };
        Relationships: [
          {
            foreignKeyName: "task_funding_return_funder_id_fkey";
            columns: ["funder_id"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "task_funding_return_task_id_fkey";
            columns: ["task_id"];
            isOneToOne: false;
            referencedRelation: "tasks";
            referencedColumns: ["id"];
          },
        ];
      };
      task_payout: {
        Row: {
          amount_quarks: number;
          destination_address: string;
          payee: string;
          payout_at: string;
          task_id: string;
          tx_signature: string;
        };
        Insert: {
          amount_quarks: number;
          destination_address: string;
          payee: string;
          payout_at?: string;
          task_id: string;
          tx_signature: string;
        };
        Update: {
          amount_quarks?: number;
          destination_address?: string;
          payee?: string;
          payout_at?: string;
          task_id?: string;
          tx_signature?: string;
        };
        Relationships: [
          {
            foreignKeyName: "task_payout_payee_fkey";
            columns: ["payee"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "task_payout_task_id_fkey";
            columns: ["task_id"];
            isOneToOne: false;
            referencedRelation: "tasks";
            referencedColumns: ["id"];
          },
        ];
      };
      tasks: {
        Row: {
          created_at: string;
          created_by: string | null;
          deleted_at: string | null;
          deposit_address: string | null;
          details: string | null;
          edited_at: string | null;
          ended_at: string | null;
          id: string;
          kind: Database["public"]["Enums"]["task_type"];
          max_winners: number;
          status: Database["public"]["Enums"]["task_status"];
          title: string | null;
        };
        Insert: {
          created_at?: string;
          created_by?: string | null;
          deleted_at?: string | null;
          deposit_address?: string | null;
          details?: string | null;
          edited_at?: string | null;
          ended_at?: string | null;
          id?: string;
          kind?: Database["public"]["Enums"]["task_type"];
          max_winners?: number;
          status?: Database["public"]["Enums"]["task_status"];
          title?: string | null;
        };
        Update: {
          created_at?: string;
          created_by?: string | null;
          deleted_at?: string | null;
          deposit_address?: string | null;
          details?: string | null;
          edited_at?: string | null;
          ended_at?: string | null;
          id?: string;
          kind?: Database["public"]["Enums"]["task_type"];
          max_winners?: number;
          status?: Database["public"]["Enums"]["task_status"];
          title?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "tasks_created_by_fkey";
            columns: ["created_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "tasks_deposit_address_fkey";
            columns: ["deposit_address"];
            isOneToOne: false;
            referencedRelation: "solana_accounts";
            referencedColumns: ["id"];
          },
        ];
      };
      temp_wallets: {
        Row: {
          created_at: string;
          id: string;
          private_key: string;
          public_key: string;
          user_id: string | null;
        };
        Insert: {
          created_at?: string;
          id?: string;
          private_key: string;
          public_key: string;
          user_id?: string | null;
        };
        Update: {
          created_at?: string;
          id?: string;
          private_key?: string;
          public_key?: string;
          user_id?: string | null;
        };
        Relationships: [];
      };
      users: {
        Row: {
          deposit_address: string | null;
          deposit_address_type: Database["public"]["Enums"]["solana_address_type"];
          id: string;
          username: string | null;
        };
        Insert: {
          deposit_address?: string | null;
          deposit_address_type?: Database["public"]["Enums"]["solana_address_type"];
          id: string;
          username?: string | null;
        };
        Update: {
          deposit_address?: string | null;
          deposit_address_type?: Database["public"]["Enums"]["solana_address_type"];
          id?: string;
          username?: string | null;
        };
        Relationships: [];
      };
    };
    Views: {
      solution_votes_by_task_and_user: {
        Row: {
          task_id: string | null;
          vote_count: number | null;
          voted_by: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "solution_votes_voted_by_fkey";
            columns: ["voted_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "solutions_task_id_fkey";
            columns: ["task_id"];
            isOneToOne: false;
            referencedRelation: "tasks";
            referencedColumns: ["id"];
          },
        ];
      };
      solutions_with_vote_sum: {
        Row: {
          created_at: string | null;
          created_by: string | null;
          deleted_at: string | null;
          details: string | null;
          edited_at: string | null;
          id: string | null;
          is_winner: boolean | null;
          sum: number | null;
          task_id: string | null;
          title: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "solutions_created_by_fkey";
            columns: ["created_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "solutions_task_id_fkey";
            columns: ["task_id"];
            isOneToOne: false;
            referencedRelation: "tasks";
            referencedColumns: ["id"];
          },
        ];
      };
    };
    Functions: {
      [_ in never]: never;
    };
    Enums: {
      solana_address_type: "solana" | "token";
      task_status: "active" | "ended" | "successful" | "failed" | "deleted";
      task_type: "community" | "personal";
    };
    CompositeTypes: {
      [_ in never]: never;
    };
  };
}

type PublicSchema = Database[Extract<keyof Database, "public">];

export type Tables<
  PublicTableNameOrOptions extends
    | keyof (PublicSchema["Tables"] & PublicSchema["Views"])
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
        Database[PublicTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? (Database[PublicTableNameOrOptions["schema"]]["Tables"] &
      Database[PublicTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R;
    }
    ? R
    : never
  : PublicTableNameOrOptions extends keyof (PublicSchema["Tables"] &
        PublicSchema["Views"])
    ? (PublicSchema["Tables"] &
        PublicSchema["Views"])[PublicTableNameOrOptions] extends {
        Row: infer R;
      }
      ? R
      : never
    : never;

export type TablesInsert<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I;
    }
    ? I
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Insert: infer I;
      }
      ? I
      : never
    : never;

export type TablesUpdate<
  PublicTableNameOrOptions extends
    | keyof PublicSchema["Tables"]
    | { schema: keyof Database },
  TableName extends PublicTableNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = PublicTableNameOrOptions extends { schema: keyof Database }
  ? Database[PublicTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U;
    }
    ? U
    : never
  : PublicTableNameOrOptions extends keyof PublicSchema["Tables"]
    ? PublicSchema["Tables"][PublicTableNameOrOptions] extends {
        Update: infer U;
      }
      ? U
      : never
    : never;

export type Enums<
  PublicEnumNameOrOptions extends
    | keyof PublicSchema["Enums"]
    | { schema: keyof Database },
  EnumName extends PublicEnumNameOrOptions extends { schema: keyof Database }
    ? keyof Database[PublicEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = PublicEnumNameOrOptions extends { schema: keyof Database }
  ? Database[PublicEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : PublicEnumNameOrOptions extends keyof PublicSchema["Enums"]
    ? PublicSchema["Enums"][PublicEnumNameOrOptions]
    : never;

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    // eslint-disable-next-line @typescript-eslint/no-redundant-type-constituents
    keyof PublicSchema["CompositeTypes"] | { schema: keyof Database },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof Database;
  }
    ? keyof Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof Database }
  ? Database[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof PublicSchema["CompositeTypes"]
    ? PublicSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never;
