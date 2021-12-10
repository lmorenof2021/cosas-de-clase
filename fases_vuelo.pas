{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program fases_vuelo;

const //estas constantes pueden variar según queramos

   VELOCIDAD: integer = 56;
   UNIDAD_V: string = 'kn';
   ACELERACION: boolean = FALSE ;
   

function comprobar_unidad_velocidad (UV: string): boolean;
begin
   if not (UV = 'm/s') and not (UV = 'km/h') and not (UV = 'kn') then
   begin
      writeln(' ERROR. La unidad introducida es incorrecta'); //si la unidad introducina no es m/s ni km/h ni kn dara error
      result := TRUE
   end;
end;

//necesitamos pasar a nudos las unidades porque el enunciado dice que el programa trabajará en nudos
function pasar_a_nudos(v:integer; u: string): real;
begin
   if u = 'm/s' then
      result := (v * 1.944) //para pasar de m/s a kn hay que multiplicar por 1,944
   else if u = 'km/h' then 
      result := (v * 0.54) //para pasar de km/h a kn hay que multiplicar por 0,54
   else if u = 'kn' then
      result := v

end;


function ver_fase (v: real; a: boolean): string;
begin
   if v = 0 then
      result := 'estacionamiento'
   else if (v < 150) and a then 
      result := 'despegue'
   else if (v > 150) and (v <= 240)and a then 
      result := 'ascenso inicial'
   else if (v > 240) and (v <= 520) and a then
      result := 'ascenso final'
   else if (v > 520) then 
      result := 'crucero'
   else if (v > 300) and (v <= 520) and not a then
      result := 'descenso inicial'
   else if (v >= 140) and (v <= 300) and not a then
      result := 'descenso inicial'
   else if not (v = 0) and not a then
      result := 'aterrizaje'
end;



//Programa principal
begin 
   if (comprobar_unidad_velocidad (UNIDAD_V) = FALSE) then
   begin
      write ('La velocidad es: ');
      writeln (VELOCIDAD, UNIDAD_V);

      write ('La velocidad en nudos es: ');
      write (pasar_a_nudos (VELOCIDAD, UNIDAD_V):0:2);
      writeln (' kn');

      write ('La fase de vuelo en la que esta es: ');
      writeln (ver_fase (pasar_a_nudos(VELOCIDAD, UNIDAD_V), ACELERACION));
   end;
end.












