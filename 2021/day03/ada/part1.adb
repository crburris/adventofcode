with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

with Diagnostics; use Diagnostics;
with Diagnostics.Report_IO; use Diagnostics.Report_IO;

procedure Part1 is
   Sub_Diag : Diagnostic_Report := Create;
   Gamma, Epsilon : Report_Datum;
   Power_Consumption : Natural;
begin
   Get(Sub_Diag);
   Gamma := Gamma_Rate(Sub_Diag);
   Epsilon := Epsilon_Rate(Sub_Diag);
   Power_Consumption := Natural(Gamma) * Natural(Epsilon);
   Put_Line("G:" & Natural'Image(Natural(Gamma)));
   Put_Line("E:" & Natural'Image(Natural(Epsilon)));
   Put(Power_Consumption, Width => 0);
   New_Line;
end Part1;
