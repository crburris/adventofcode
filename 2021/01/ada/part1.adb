with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Part1 is
   subtype Depth is Integer;
   Last_Depth, Next_Depth : Depth;
   Increases : Natural := 0;
begin
   Get(Next_Depth);
   loop
      Last_Depth := Next_Depth;
      Get(Next_Depth);
      if Next_Depth > Last_Depth then
         Increases := Increases + 1;
      end if;
   end loop;
exception
   when End_Error =>
      Put(Item => Increases, Width => 0);
      New_Line;
end Part1;
