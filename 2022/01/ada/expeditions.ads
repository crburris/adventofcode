with Ada.Containers.Vectors;

package Expeditions is

   type Calories is new Natural;

   package Calories_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Calories);

   type Elf is record
      Rations : Calories_Vectors.Vector;
      Total_Calories : Calories;
   end record;

   package Elf_Vectors is new Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Elf);

   procedure Add_Ration(E : in out Elf; Ration : in Calories);

   type Entourage is record
      Elves : Elf_Vectors.Vector;
   end record;

   function Max_Calories
     (Ent : in out Entourage;
      Count : in Positive := 1) return Calories;

end Expeditions;
