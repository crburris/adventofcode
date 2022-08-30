with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Part2 is

   subtype Depth is Integer;
   type Sample_Index is new Natural range 1 .. 3;
   type Sample_Window is array (Sample_Index) of Depth;
   type Sliding_Sample is record
      Items : Sample_Window;
      Oldest_Item : Sample_Index;
   end record;

   procedure Add (Item : in Depth; Sample : in out Sliding_Sample) is
   begin
      Sample.Items(Sample.Oldest_Item) := Item;
      if Sample.Oldest_Item = Sample.Items'Last then
         Sample.Oldest_Item := Sample.Items'First;
      else
         Sample.Oldest_Item := Sample.Oldest_Item + 1;
      end if;
   end Add;

   function Sum (Sample : in Sliding_Sample) return Depth is
      Result : Depth := 0;
   begin
      for Index in Sample.Items'Range loop
         Result := Result + Sample.Items(Index);
      end loop;
      return Result;
   end Sum;
   
   Increases : Natural := 0;
   Last_Sum, Next_Sum : Depth;
   Sample : Sliding_Sample;
   Next_Depth : Depth;
begin
   for Index in Sample.Items'Range loop
      Get(Sample.Items(Index));
   end loop;
   Sample.Oldest_Item := Sample.Items'First;
   Next_Sum := Sum(Sample);
   
   loop
      Get(Next_Depth);
      Add(Next_Depth, Sample);
      Last_Sum := Next_Sum;
      Next_Sum := Sum(Sample);
      if Next_Sum > Last_Sum then
         Increases := Increases + 1;
      end if;
   end loop;
exception
   when End_Error =>
      Put(Item => Increases, Width => 0);
      New_Line;
end Part2;
