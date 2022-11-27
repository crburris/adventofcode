package body Diagnostics is

   procedure Add
     (Item : in Report_Datum;
      Counts : in out Bit_Counts) is
   begin
      for Place in Bit_Place loop
         if (Item and 2 ** Place) /= 0 then
            Counts(Place) := Counts(Place) + 1;
         end if;
      end loop;
   end Add;

   function Create return Diagnostic_Report is
   begin
      return Report : Diagnostic_Report do
         Report.Data.Clear;
         Report.Set_Bits := (others => 0);
         Report.Max_Bit := 0;
      end return;
   end Create;

   function Gamma_Bit
     (Report : in Diagnostic_Report;
      Place : in Bit_Place)
   return Report_Datum is
      Majority : constant Natural := Natural(Report.Data.Length) / 2;
   begin
      if Place > Report.Max_Bit or Report.Set_Bits(Place) < Majority then
         return 0;
      else
         return 2 ** Place;
      end if;
   end Gamma_Bit;

   function Gamma_Rate
     (Report : in Diagnostic_Report)
   return Report_Datum is
      Majority : constant Natural := Natural(Report.Data.Length) / 2;
      Gamma : Report_Datum := 0;
   begin
      if not Report.Data.Is_Empty then
         for Place in Report.Set_Bits'First .. Report.Max_Bit loop
            Gamma := Gamma or Gamma_Bit(Report, Place);
         end loop;
      end if;
      return Gamma;
   end Gamma_Rate;

   function Epsilon_Bit
     (Report : in Diagnostic_Report;
      Place : in Bit_Place)
   return Report_Datum is
      Majority : constant Natural := Natural(Report.Data.Length) / 2;
   begin
      if Place > Report.Max_Bit or Report.Set_Bits(Place) > Majority then
         return 0;
      else
         return 2 ** Place;
      end if;
   end Epsilon_Bit;

   function Epsilon_Rate
     (Report : in Diagnostic_Report)
   return Report_Datum is
      Majority : constant Natural := Natural(Report.Data.Length) / 2;
      Epsilon : Report_Datum := 0;
   begin
      if not Report.Data.Is_Empty then
         for Place in Report.Set_Bits'First .. Report.Max_Bit loop
            Epsilon := Epsilon or Epsilon_Bit(Report, Place);
         end loop;
      end if;
      return Epsilon;
   end Epsilon_Rate;

end Diagnostics;
