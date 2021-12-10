{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program multiplos;
uses math;
const
   C1: char = '0';
   C2: char = '2';
   C3: char = '0';
   ADAPTACION_ASCII: integer = 48; //usamos la tabla ASCII para que empiece a contar desde el 0




function char_a_integer (c: char): integer; 
begin
   result := integer(c) - ADAPTACION_ASCII;
end;

function numero_a_decimal (n1, n2, n3: integer): integer;
begin
   result := (n1 * 10**2) + (n2 * 10) + n3; //en base 10
end;

function multiplo_5 (numero_a_decimal: integer): boolean;
begin
   result := (numero_a_decimal mod 5 = 0);  //comprobacion si la división entera del número entre 5 es 0
end;

function prechar_a_integer (c: char):boolean; //comprobación para ver que es un número y no otra cosa. si no es un número no será correcto
begin
   result:= (char_a_integer(c)>= 0) and (char_a_integer(c)<= 9);
end;

//programa principal
begin
if ((prechar_a_integer(C1)) and (prechar_a_integer(C2)) and (prechar_a_integer(C3))) 
 then
  begin
    if (multiplo_5(numero_a_decimal (char_a_integer(C1), char_a_integer(C2), char_a_integer(C3))))
     then
       writeln('El número seleccionado es múltiplo de 5.')
    else 
      writeln('El número seleccionado no es múltiplo de 5.')
    end
else
 begin
   writeln ('Los datos introducidos no son correctos.');
 end;
end.
