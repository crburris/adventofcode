with Ada.Text_IO; use Ada.Text_IO;

package body Expeditions.IO is

   procedure Get(E : in out Elf) is
   begin
      E.Rations.Clear;
      E.Total_Calories := 0;
      loop
         declare
            Input_Line : constant String := Get_Line;
         begin
            if Input_Line'Length = 0 then
               return;
            end if;
            Add_Ration(E, Calories'Value(Input_Line));
         end;
      end loop;
   exception
      when End_Error =>
         if E.Rations.Is_Empty then
            raise;
         end if;
   end Get;

   procedure Get(Ent : in out Entourage) is
   begin
      Ent.Elves.Clear;
      loop
         declare
            Next_Elf : Elf;
         begin
            Get(Next_Elf);
            Ent.Elves.Append(Next_Elf);
         end;
      end loop;
   exception
      when End_Error => null;
   end Get;

end Expeditions.IO;
