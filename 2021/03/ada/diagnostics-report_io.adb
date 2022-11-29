with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

package body Diagnostics.Report_IO is

   -- Construct error message with current input line number
   function Error_Message(Reason : in String) return String is
     (Reason & " at line" & Integer'Image(Integer(Line)));

   procedure Get
     (Datum : out Report_Datum;
      Max_Bit : out Bit_Place)
   is
      Input_Line : String := Trim(Get_Line, Side => Both);
      Result_Datum : Report_Datum := 0;
   begin
      if Input_Line'Length = 0 then
         raise Constraint_Error with Error_Message
           ("Input datum empty");
      elsif Input_Line'Length > Report_Datum'Size then
         raise Constraint_Error with Error_Message
           ("Input datum exceeds max width");
      end if;
      for C of Input_Line loop
         case C is
            when '0' => Result_Datum := Result_Datum * 2;
            when '1' => Result_Datum := Result_Datum * 2 + 1;
            when others =>
               raise Data_Error with Error_Message
                 ("Unexpected character " & Character'Image(C));
         end case;
      end loop;
      Datum := Result_Datum;
      Max_Bit := Input_Line'Length - 1;
   end Get;

   procedure Get(Report : in out Diagnostic_Report) is
      Next_Datum : Report_Datum;
      Next_Max_Bit : Bit_Place;
   begin
      loop
         Get(Next_Datum, Next_Max_Bit);
         Report.Data.Append(Next_Datum);
         Add(Next_Datum, Report.Set_Bits);
         if Next_Max_Bit > Report.Max_Bit then
            Report.Max_Bit := Next_Max_Bit;
         end if;
      end loop;
   exception
      when End_Error => null;
   end Get;

end Diagnostics.Report_IO;
