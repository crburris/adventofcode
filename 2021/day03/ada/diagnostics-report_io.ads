package Diagnostics.Report_IO is

   -- Read single report datum from stdin, saving its actual width
   procedure Get
     (Datum : out Report_Datum;
      Max_Bit : out Bit_Place);

   -- Read report data from stdin until EOF
   procedure Get(Report : in out Diagnostic_Report);

end Diagnostics.Report_IO;
