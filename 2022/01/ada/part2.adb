with Ada.Text_IO; use Ada.Text_IO;
with Expeditions; use Expeditions;
with Expeditions.IO; use Expeditions.IO;

procedure Part2 is
   Ent : Entourage;
   Max_Rations : Calories;
begin
   Get(Ent);
   Max_Rations := Max_Calories(Ent, 3);
   Put_Line(Calories'Image(Max_Rations));
end Part2;
