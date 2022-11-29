with Ada.Containers.Vectors;

package Diagnostics is

   type Report_Datum is mod 2 ** 32;
   subtype Bit_Place is Natural range 0 .. Report_Datum'Size - 1;
   type Diagnostic_Report is private;

   -- Make new empty diagnostic report
   function Create return Diagnostic_Report;

   -- Concatenate most common bits in each position
   function Gamma_Rate
     (Report : in Diagnostic_Report)
   return Report_Datum;

   -- Concatenate least common bits in each position
   function Epsilon_Rate
     (Report : in Diagnostic_Report)
   return Report_Datum;

private

   package Report_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Report_Datum);

   type Bit_Counts is array (Bit_Place) of Natural;
   type Diagnostic_Report is record
      Data : Report_Vectors.Vector;
      Set_Bits : Bit_Counts;
      Max_Bit : Bit_Place;
   end record;

   -- Add datum's set bits to counts
   procedure Add
     (Item : in Report_Datum;
      Counts : in out Bit_Counts);

end Diagnostics;
