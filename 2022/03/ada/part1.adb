with Ada.Text_IO; use Ada.Text_IO;
with Rucksacks; use Rucksacks;

procedure Part1 is
   Total_Priority : Natural := 0;
begin
   loop
      declare
         Ruck : Rucksack := Rucksack(Get_Line);
         Common : Rucksack_Item := Common_Item(Ruck);
         Common_Priority : Item_Priority := Priority(Common);
      begin
         Total_Priority := Total_Priority + Natural(Common_Priority);
      end;
   end loop;
exception
   when End_Error =>
      Put_Line(Natural'Image(Total_Priority));
end Part1;
