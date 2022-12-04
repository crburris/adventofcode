package body RPS is

   Base_Scores : constant array (Move) of Score :=
     (Rock => 1, Paper => 2, Scissors => 3);

   Pair_Scores : constant array (Move, Move) of Score :=
     (Rock     => (Rock => 3, Paper => 0, Scissors => 6),
      Paper    => (Rock => 6, Paper => 3, Scissors => 0),
      Scissors => (Rock => 0, Paper => 6, Scissors => 3));

   function Play(Moves : in Round_Moves) return Round_Scores is
      Hum : Move renames Moves(Human);
      Opp : Move renames Moves(Opponent);
   begin
      return (Human    => Base_Scores(Hum) + Pair_Scores(Hum, Opp),
              Opponent => Base_Scores(Opp) + Pair_Scores(Opp, Hum));
   end Play;

end RPS;
