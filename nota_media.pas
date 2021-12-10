{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program nota;

type 
TipoNota = record           //nota entrega,terira,pract
   entrega: real;
   teoria:real;
   practica: real;
end;

TipoPesos = record 
   compensable: real;
   pesoentrega: real;
   pesoteoria: real;
   pesopractica: real;
end;

function hace_media(compensable, entrega, teoria, prac: real): boolean;
begin
    result :=  (entrega >= compensable) and (teoria >= compensable)
            and (prac >= compensable)
end;

function media(peso_entrega, peso_teoria, peso_prac, entrega, teoria, 
               prac: real): real;
begin
    result := entrega * peso_entrega + teoria * peso_teoria + 
                  prac * peso_prac
end;

procedure pedir_dato (var dato: real);
var
   cadenaleida: string;
   codigo: integer;
   
begin
   readln (cadenaleida);
   val (cadenaleida, dato, codigo);
   if (codigo = 0) and (dato >= 0) then
   begin
   writeln();
   
   end
   else
   begin
      writeln ('Error, ',cadenaleida,' no es un numero entero o es negativo.');
      HALT;
   end;

end;

procedure ver_datos (var compensable, peso_entrega, peso_teoria, peso_practica: real);
begin
   write ('Escriba el compensable: ');
   pedir_dato (compensable);
   write ('Escriba el peso de entrega: ');
   pedir_dato (peso_entrega);
      if (peso_entrega >= 0) and (peso_entrega <= 1) then
   begin
   write();
   
   end
   else
   begin
      writeln ('Error, ',peso_entrega:0:2,' compruebe que el número esta entre 0 y 1.');
      HALT;
   end;

   write ('Escriba el peso de teoría: ');
   pedir_dato (peso_teoria);
      if (peso_teoria >= 0) and (peso_teoria <= 1) then
   begin
   write();
   end
   else
   begin
      writeln ('Error, ',peso_teoria:0:2,' compruebe que el número esta entre 0 y 1.');
      HALT;
   end;

   write ('Escriba el peso de practica: ');
   pedir_dato (peso_practica);
      if (peso_practica >= 0) and (peso_practica <= 1) then
   begin
   write();
   end
   else
   begin
      writeln ('Error, ',peso_practica:0:2,' compruebe que el número esta entre 0 y 1.');
      HALT;
   end;
   writeln ();
   if (peso_entrega + peso_teoria + peso_practica) = 1 then
   begin
   writeln ('Datos:');
   writeln ('Compensable: ', compensable:0:2, ' Peso entrega: ', peso_entrega:0:2, ' Peso teoría: ', peso_teoria:0:2, ' Peso práctica: ', peso_practica:0:2);
   end
   else
   begin
   writeln ('Por favor, compruebe si la suma de sus pesos es igual a 1');
   HALT;
   end;
end;

procedure ver_notas (var nota_entrega, nota_teoria, nota_practica: real);
begin
   writeln();
   writeln ('Las notas que escriba a continuación deberán estar entre 0 y 10');
   write ('Escriba la nota de entrega: ');
   pedir_dato (nota_entrega);


   

   write ('Escriba la nota de teoría: ');
   pedir_dato (nota_teoria);



   write ('Escriba la nota de practica: ');
   pedir_dato (nota_practica);

   
   writeln ();
   if (nota_entrega + nota_teoria + nota_practica) <= 30 then
   begin
   writeln ('Notas:');
   writeln ('Nota entrega: ', nota_entrega:0:2, ' Nota teoría: ', nota_teoria:0:2, ' Nota práctica: ', nota_practica:0:2);
   end
   else
   begin
      writeln ('Por favor, compruebe que sus notas estén entre 0 y 10.');
      HALT;
   end;
end;

procedure ver_nota_final (var compensable, peso_entrega, peso_teoria, peso_practica, nota_entrega, nota_teoria, nota_practica: real);
begin
    write('Nota final: ');
    if (hace_media( compensable, nota_entrega, nota_teoria, nota_practica))
    then writeln( media(peso_entrega, peso_teoria, peso_practica, nota_entrega, nota_teoria, nota_practica):0:2)
    else writeln( 'No apto' );
end;

var
   datos: TipoPesos;
   notas: TipoNota;


begin
   datos.compensable:= 0.0;
   datos.pesoentrega:= 0.0;
   datos.pesoteoria:= 0.0;
   datos.pesopractica:= 0.0;
   notas.entrega:= 0.0;
   notas.teoria:= 0.0;
   notas.practica:= 0.0;
   ver_datos(datos.compensable,datos.pesoentrega,datos.pesoteoria,datos.pesopractica);
   ver_notas(notas.entrega,notas.teoria,notas.practica);
   ver_nota_final(datos.compensable,datos.pesoentrega,datos.pesoteoria,datos.pesopractica,notas.entrega,notas.teoria,notas.practica);
end.


