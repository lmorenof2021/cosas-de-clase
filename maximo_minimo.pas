{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program maximo_minimo;

type
   TipoNumeros = record
      c1: real;
      numeroMaximo: real;
      numeroMinimo: real;
   end;

// comprobar que el numero introducido no sea negativo ni una letra. Si es así, pondrá valor no válido y continuará pidiendo números.
procedure comprobarNumero(var numero:real);
var
cadenaLeida : string;
codigo : integer;

begin
   repeat
      write('Introduzca un número real positivo:');
      writeln;
      readln(cadenaLeida) ;
      val(cadenaLeida, numero, codigo);
      if (codigo = 0 )  then begin
      if (numero < 0) then
         writeln ('valor no válido porque es un número negativo.');
      end
      else
         writeln('Valor no válido porque es una letra.');
   until codigo = 0;
end;


// Para encontrar el número máximo y el mínimo.
procedure verMaximoMinimo (var minimoHastaAhora, maximoHastaAhora, numero : real);
begin

   if ((numero < minimoHastaAhora) and (numero > 0)) then
      minimoHastaAhora := numero;
   if ((numero > maximoHastaAhora) and (numero > 0)) then
      maximoHastaAhora := numero;

end;

//PROGRAMA PRINCIPAL
var
   numeros:TipoNumeros;
begin
   writeln ('Instrucciones: este programa lo que hará será coger de los números escritos, el máximo y el mínimo. Podrá escribir los números que quiera, y cuando quiera finalizar tendrá que escribir un 0.');
numeros.numeroMinimo := 9999999999999999.0;
numeros.numeroMaximo := 0.0;
   repeat
      comprobarNumero (numeros.c1);
      verMaximoMinimo (numeros.numeroMinimo,numeros.numeroMaximo, numeros.c1);
   until numeros.c1 = 0.0;
if numeros.numeroMaximo = 0 then
   writeln ('Error. Introduzca al menos un número real positivo para que el programa pueda seleccionar el máximo y el mínimo.')
else 
   begin
      write('Máximo: ');
      writeln (numeros.numeroMaximo:0:2);
      write ('Mínimo: ');
      writeln (numeros.numeroMinimo:0:2);
   end;

end.
