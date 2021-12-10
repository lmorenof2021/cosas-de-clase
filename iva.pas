{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program importes;
const
   IVA: real = 21;

// calculo del primer producto (calcular iva y precio con iva)
procedure Iva1 (var precio_sin_iva: real); //Usaría funciones 
begin
   write ('IVA: ');
   write (precio_sin_iva * (IVA/100):0:2);
   writeln ('€');
end;
   
procedure Preciocon_iva (var precio_sin_iva: real); //Usaría procedimientos
begin
   write ('Precio con IVA: ');
   write (precio_sin_iva + (precio_sin_iva * (IVA/100)):0:2);
   writeln ('€');
end;


// calculo del segundo producto (calcular iva y precio sin iva)
procedure Iva2 (var precio_con_iva: real); //Usaría funciones
begin
   write ('Precio sin IVA: ');
   write ((precio_con_iva * 100) / (100+IVA):0:2);
   writeln ('€');
end;

procedure Preciosin_iva (var precio_con_iva: real); //Usaría procedimientos
begin
   write ('IVA: ');
   write (precio_con_iva - (precio_con_iva * 100)/(100+IVA):0:2);
   writeln ('€');
end;


var
   precio_sin_iva: real;
   precio_con_iva: real;
   cadenaleida: string;
   codigo: integer;
   
//Programa principal

begin

   write ('Introduzca un precio sin IVA: ');
   readln (cadenaleida);
   val (cadenaleida, precio_sin_iva, codigo);
   if (codigo) = 0 then
   begin
      Iva1 (precio_sin_iva);
      Preciocon_iva (precio_sin_iva);
   end
   else
      writeln('Error, ',cadenaleida,' no es un numero entero.');


   write ('Introduzca un precio con IVA: ');
   readln (cadenaleida);
   val (cadenaleida, precio_con_iva, codigo);
   if (codigo) = 0 then
   begin
   Iva2 (precio_con_iva);
   Preciosin_iva (precio_con_iva);
   end
   else
      writeln('Error, ',cadenaleida,' no es un numero entero.');

end.



