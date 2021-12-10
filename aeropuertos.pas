{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program airport;

const
   CODIGO_IATA1: string = 'TAD'; //variará dependiendo del aeropuerto que queramos encontrar


function veraeropuerto (cod : string): string;

begin 
   if not (CODIGO_IATA1 = 'MAD') and not (CODIGO_IATA1 = 'ABC') and not (CODIGO_IATA1 = 'RFS') and not (CODIGO_IATA1 = 'TAD') and not (CODIGO_IATA1 = 'MDX') then
   result := 'Aeropuerto desconocido'

   else if CODIGO_IATA1 = 'MAD' then 
   result := 'Madrid-Barajas'


   else if CODIGO_IATA1 = 'ABC' then 
   result := 'Albacete Airport'

   else if CODIGO_IATA1 = 'RFS' then 
   result := 'Rosita Airport'


   else if CODIGO_IATA1 = 'TAD' then 
   result := 'Perry Stockes Airport'


   else if CODIGO_IATA1 = 'MDX' then 
   result := 'Mercedes Airport';

end;



//Programa principal
begin
   write ('El codigo es: ');
   writeln (CODIGO_IATA1);
   write ('El aeropuerto es: ');
   writeln(veraeropuerto(CODIGO_IATA1));
end.
