with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO; use Ada.Text_IO;

procedure Part1 is
   type Submarine is record
      Depth, Position : Integer;
   end record;
   
   type Direction is (Forward, Down, Up);
   package Direction_IO is new Enumeration_IO(Direction);
   use Direction_IO;
   
   type Command is record
      Where : Direction;
      Amount : Integer;
   end record;
   
   procedure Get(Item : out Command) is
      New_Item : Command;
   begin
      Get(New_Item.Where);
      Get(New_Item.Amount);
      Item := New_Item;
   end Get;
   
   procedure Move(Sub : in out Submarine; Cmd : in Command) is
   begin
      case Cmd.Where is
         when Forward =>
            Sub.Position := Sub.Position + Cmd.Amount;
         when Down =>
            Sub.Depth := Sub.Depth + Cmd.Amount;
         when Up =>
            Sub.Depth := Sub.Depth - Cmd.Amount;
      end case;
   end Move;
   
   Sub : Submarine := (Depth => 0, Position => 0);
   Cmd : Command;
begin
   loop
      Get(Cmd);
      Move(Sub, Cmd);
   end loop;
exception
   when End_Error =>
      Put(Item => Sub.Depth * Sub.Position, Width => 0);
      New_Line;
end Part1;
