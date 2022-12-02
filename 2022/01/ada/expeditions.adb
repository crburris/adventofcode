package body Expeditions is

   procedure Add_Ration(E : in out Elf; Ration : in Calories) is
   begin
      E.Rations.Append(Ration);
      E.Total_Calories := E.Total_Calories + Ration;
   end Add_Ration;

   function Compare_Rations(Left, Right : Elf) return Boolean is
     (Left.Total_Calories < Right.Total_Calories);

   package Calorie_Sorting is new Elf_Vectors.Generic_Sorting
     ("<" => Compare_Rations);

   function Max_Calories
     (Ent : in out Entourage;
      Count : in Positive := 1)
   return Calories is
      Sum_Rations : Calories := 0;
      Min_Index : Natural :=
        (if Natural(Ent.Elves.Length) < Count
         then Ent.Elves.First_Index
         else Ent.Elves.Last_Index - Count + 1);
   begin
      Calorie_Sorting.Sort(Ent.Elves);
      for Index in Min_Index .. Ent.Elves.Last_Index loop
         Sum_Rations :=
           (Sum_Rations + Ent.Elves.Element(Index).Total_Calories);
      end loop;
      return Sum_Rations;
   end Max_Calories;

end Expeditions;
