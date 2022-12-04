with Ada.Text_IO; use Ada.Text_IO;
with Ada.Containers.Generic_Array_Sort;

package body Rucksacks is

   procedure Rucksack_Sort is
      new Ada.Containers.Generic_Array_Sort
        (Index_Type   => Positive,
         Element_Type => Rucksack_Item,
         Array_Type   => Rucksack);

   function Priority(Item : in Rucksack_Item) return Item_Priority is
      Category_Offset, Base_Priority, Item_Offset : Natural;
   begin
      case Item is
         when Lowercase_Item =>
            Category_Offset := Rucksack_Item'Pos(Lowercase_Item'First);
            Base_Priority := 1;
         when Uppercase_Item =>
            Category_Offset := Rucksack_Item'Pos(Uppercase_Item'First);
            Base_Priority := 27;
      end case;
      Item_Offset := Rucksack_Item'Pos(Item) - Category_Offset;
      return Item_Priority(Item_Offset + Base_Priority);
   end Priority;

   function Common_Item(Ruck : in Rucksack) return Rucksack_Item is
      Middle : Positive := Ruck'First + Ruck'Length / 2;
      Comp_A : Rucksack := Ruck(Ruck'First .. Middle - 1);
      Comp_B : Rucksack := Ruck(Middle .. Ruck'Last);
      Head_A : Positive := Comp_A'First;
      Head_B : Positive := Comp_B'First;
   begin
      Rucksack_Sort(Comp_A);
      Rucksack_Sort(Comp_B);
      while Head_A in Comp_A'Range and Head_B in Comp_B'range loop
         if Comp_A(Head_A) = Comp_B(Head_B) then
            return Comp_A(Head_A);
         end if;
         while Head_A in Comp_A'Range and then
               Comp_A(Head_A) < Comp_B(Head_B)
         loop
            Head_A := Head_A + 1;
         end loop;
         while Head_B in Comp_B'Range and then
               Comp_B(Head_B) < Comp_A(Head_A)
         loop
            Head_B := Head_B + 1;
         end loop;
      end loop;
      raise Disjoint_Rucks;
   end Common_Item;

end Rucksacks;
