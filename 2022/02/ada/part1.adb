with Ada.Text_IO; use Ada.Text_IO;
with RPS; use RPS;

procedure Part1 is

   type Encoded_Human_Move is (X, Y, Z);
   package Human_Move_IO is new Enumeration_IO(Encoded_Human_Move);
   use Human_Move_IO;

   function Decode(M : in Encoded_Human_Move) return Move is
     (case M is
         when X => Rock,
         when Y => Paper,
         when Z => Scissors);

   type Encoded_Opponent_Move is (A, B, C);
   package Opponent_Move_IO is new Enumeration_IO(Encoded_Opponent_Move);
   use Opponent_Move_IO;

   function Decode(M : in Encoded_Opponent_Move) return Move is
     (case M is
         when A => Rock,
         when B => Paper,
         when C => Scissors);

   Human_Score : Score := 0;
   Next_Moves : Round_Moves;
   Next_Scores : Round_Scores;
   Hum_Move : Encoded_Human_Move;
   Opp_Move : Encoded_Opponent_Move;
begin
   loop
      Get(Opp_Move);
      Get(Hum_Move);
      Next_Moves := (Human    => Decode(Hum_Move),
                     Opponent => Decode(Opp_Move));
      Next_Scores := Play(Next_Moves);
      Human_Score := Human_Score + Next_Scores(Human);
   end loop;
exception
   when End_Error =>
      Put_Line(Score'Image(Human_Score));
end Part1;
