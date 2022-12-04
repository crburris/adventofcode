with Ada.Text_IO;

package RPS is

   type Player is (Human, Opponent);
   type Move is (Rock, Paper, Scissors);
   type Round_Moves is array (Player) of Move;
   type Score is new Natural;
   type Round_Scores is array (Player) of Score;

   function Play(Moves : in Round_Moves) return Round_Scores;

end RPS;
