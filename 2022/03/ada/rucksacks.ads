package Rucksacks is

   subtype Lowercase_Item is Character range 'a' .. 'z';
   subtype Uppercase_Item is Character range 'A' .. 'Z';
   subtype Rucksack_Item is Character with
      Static_Predicate =>
         Rucksack_Item in Lowercase_Item or
         Rucksack_Item in Uppercase_Item;
   type Item_Priority is range 1 .. 52;

   function Priority(Item : in Rucksack_Item) return Item_Priority;

   type Rucksack is new String with
      Dynamic_Predicate =>
         (for all Item of Rucksack => Item in Rucksack_Item);

   Disjoint_Rucks : exception;
   function Common_Item(Ruck : in Rucksack) return Rucksack_Item;

end Rucksacks;
