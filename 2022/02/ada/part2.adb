with Ada.Text_IO; use Ada.Text_IO;
with RPS; use RPS;

procedure Part2 is

   type Encoded_Move is (A, B, C);
   package Encoded_Move_IO is new Enumeration_IO(Encoded_Move);
   use Encoded_Move_IO;

   procedure Get(M : out Move) is
      Encoded : Encoded_Move;
   begin
      Get(Encoded);
      M := (case Encoded is
               when A => Rock,
               when B => Paper,
               when C => Scissors);
   end Get;

   type Round_Strategy is (X, Y, Z);  -- X => loss, Y => draw, Z => win
   package Round_Strategy_IO is new Enumeration_IO(Round_Strategy);
   use Round_Strategy_IO;

   -- What to play given opponent's move and chosen strategy
   Required_Moves : constant array (Move, Round_Strategy) of Move :=
     (Rock     => (X => Scissors, Y => Rock,     Z => Paper),
      Paper    => (X => Rock,     Y => Paper,    Z => Scissors),
      Scissors => (X => Paper,    Y => Scissors, Z => Rock));

   Total_Score : Score := 0;
   Strategy : Round_Strategy;
   Next_Moves : Round_Moves;
   Next_Scores : Round_Scores;
begin
   loop
      Get(Next_Moves(Opponent));
      Get(Strategy);
      Next_Moves(Human) := Required_Moves(Next_Moves(Opponent), Strategy);
      Next_Scores := Play(Next_Moves);
      Total_Score := Total_Score + Next_Scores(Human);
   end loop;
exception
   when End_Error =>
      Put_Line(Score'Image(Total_Score));
end Part2;
