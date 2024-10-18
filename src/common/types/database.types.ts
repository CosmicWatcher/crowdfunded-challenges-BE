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
      task_funding: {
        Row: {
          amount_fiat: number | null;
          amount_quarks: number | null;
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
          amount_quarks?: number | null;
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
          amount_quarks?: number | null;
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
      task_solana_keypairs: {
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
      task_submission_votes: {
        Row: {
          id: string;
          task_submission_id: string | null;
          vote_count: number;
          voted_at: string;
          voted_by: string | null;
        };
        Insert: {
          id?: string;
          task_submission_id?: string | null;
          vote_count?: number;
          voted_at?: string;
          voted_by?: string | null;
        };
        Update: {
          id?: string;
          task_submission_id?: string | null;
          vote_count?: number;
          voted_at?: string;
          voted_by?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "task_submission_votes_task_submission_id_fkey";
            columns: ["task_submission_id"];
            isOneToOne: false;
            referencedRelation: "task_submissions";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "task_submission_votes_voted_by_fkey";
            columns: ["voted_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
        ];
      };
      task_submissions: {
        Row: {
          created_at: string;
          created_by: string | null;
          deleted_at: string | null;
          details: string | null;
          edited_at: string | null;
          id: string;
          is_winner: boolean;
          task_id: string | null;
          vote_count: number;
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
          vote_count?: number;
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
          vote_count?: number;
        };
        Relationships: [
          {
            foreignKeyName: "task_submissions_created_by_fkey";
            columns: ["created_by"];
            isOneToOne: false;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
          {
            foreignKeyName: "task_submissions_task_id_fkey";
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
            referencedRelation: "task_solana_keypairs";
            referencedColumns: ["id"];
          },
        ];
      };
      users: {
        Row: {
          deposit_address: string | null;
          id: string;
          username: string | null;
        };
        Insert: {
          deposit_address?: string | null;
          id: string;
          username?: string | null;
        };
        Update: {
          deposit_address?: string | null;
          id?: string;
          username?: string | null;
        };
        Relationships: [
          {
            foreignKeyName: "users_id_fkey";
            columns: ["id"];
            isOneToOne: true;
            referencedRelation: "users";
            referencedColumns: ["id"];
          },
        ];
      };
    };
    Views: {
      [_ in never]: never;
    };
    Functions: {
      akeys: {
        Args: {
          "": unknown;
        };
        Returns: string[];
      };
      avals: {
        Args: {
          "": unknown;
        };
        Returns: string[];
      };
      each: {
        Args: {
          hs: unknown;
        };
        Returns: Record<string, unknown>[];
      };
      ghstore_compress: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      ghstore_decompress: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      ghstore_in: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      ghstore_options: {
        Args: {
          "": unknown;
        };
        Returns: undefined;
      };
      ghstore_out: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      hstore:
        | {
            Args: {
              "": string[];
            };
            Returns: unknown;
          }
        | {
            Args: {
              "": Record<string, unknown>;
            };
            Returns: unknown;
          };
      hstore_hash: {
        Args: {
          "": unknown;
        };
        Returns: number;
      };
      hstore_in: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      hstore_out: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      hstore_recv: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      hstore_send: {
        Args: {
          "": unknown;
        };
        Returns: string;
      };
      hstore_subscript_handler: {
        Args: {
          "": unknown;
        };
        Returns: unknown;
      };
      hstore_to_array: {
        Args: {
          "": unknown;
        };
        Returns: string[];
      };
      hstore_to_json: {
        Args: {
          "": unknown;
        };
        Returns: Json;
      };
      hstore_to_json_loose: {
        Args: {
          "": unknown;
        };
        Returns: Json;
      };
      hstore_to_jsonb: {
        Args: {
          "": unknown;
        };
        Returns: Json;
      };
      hstore_to_jsonb_loose: {
        Args: {
          "": unknown;
        };
        Returns: Json;
      };
      hstore_to_matrix: {
        Args: {
          "": unknown;
        };
        Returns: string[];
      };
      hstore_version_diag: {
        Args: {
          "": unknown;
        };
        Returns: number;
      };
      skeys: {
        Args: {
          "": unknown;
        };
        Returns: string[];
      };
      svals: {
        Args: {
          "": unknown;
        };
        Returns: string[];
      };
    };
    Enums: {
      task_status: "active" | "successful" | "failed" | "deleted";
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
