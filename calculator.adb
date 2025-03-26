with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Calculator is

   type Real is digits 20;

   -- ifadeyi değerlendirip sonucu döndüren fonksiyon
   function Eval_Expression return Real;

   -- kullanıcıdan sayı alan fonksiyon
   function Get_Number return Real is
      Num : Real;
   begin
      Get(Num);
      return Num;
   end Get_Number;

   -- sayı veya parantez içerisindeki ifadeyi değerlendiren fonksiyon
   function Factor return Real is
      Result : Real;
      Ch     : Character;
   begin
      loop
         if End_Of_Line then
            exit;
         end if;

         Look_Ahead(Ch);

         if Ch = '(' then
            Get(Ch); -- '(' karakterini oku
            Result := Eval_Expression;
            Get(Ch); -- ')' karakterini tüket
            exit;
         else
            Result := Get_Number;
            exit;
         end if;
      end loop;

      return Result;
   end Factor;

   -- çarpma veya bölme işlemlerini gerçekleştiren fonksiyon
   function Term return Real is
      Result : Real := Factor;
      Ch     : Character;
   begin
      loop
         exit when End_Of_Line;

         Look_Ahead(Ch);

         case Ch is
            when '*' =>
               Get(Ch);
               Result := Result * Factor;
            when '/' =>
               Get(Ch);
               Result := Result / Factor;
            when others =>
               exit;
         end case;
      end loop;

      return Result;
   end Term;

   -- toplama veya çıkarma işlemlerini gerçekleştiren fonksiyon
   function Eval_Expression return Real is
      Result : Real := Term;
      Ch     : Character;
   begin
      loop
         exit when End_Of_Line;

         Look_Ahead(Ch);

         case Ch is
            when '+' =>
               Get(Ch);
               Result := Result + Term;
            when '-' =>
               Get(Ch);
               Result := Result - Term;
            when others =>
               exit;
         end case;
      end loop;

      return Result;
   end Eval_Expression;

   Result : Real;
begin
   Put_Line("Bir işlem giriniz (örn. (3 + 4) * 2):");

   --işlem yapıp sonucu yazdır
   Result := Eval_Expression;
   Put("Sonuç: ");
   Put(Result, Fore => 1, Aft => 2, Exp => 0);
   New_Line;

end Calculator;
