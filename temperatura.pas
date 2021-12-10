{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}

program temperatura;

const

   TEMPERATURA_PACIENTE: real = 37; //variará según la temperatura que queramos poner

function ver_estado_paciente (temperatura: real): string;

begin 
   if (TEMPERATURA_PACIENTE < 36) then
   result := 'hipotermia';
   if (TEMPERATURA_PACIENTE >= 36) and (TEMPERATURA_PACIENTE < 37) then
   result := 'temperatura normal';
   if (TEMPERATURA_PACIENTE >= 37) and (TEMPERATURA_PACIENTE < 37.5) then
   result := 'febricula';
   if (TEMPERATURA_PACIENTE >= 37.5) and (TEMPERATURA_PACIENTE < 41) then
   result := 'fiebre';
   if (TEMPERATURA_PACIENTE >= 41) then
   result := 'hiperpirexia';
end;

//Programa principal
begin
   write ('La temperatura del paciente es: ');
   write ((TEMPERATURA_PACIENTE):0:2);
   writeln ('º');
   write ('Entonces tiene: ');
   writeln(ver_estado_paciente(TEMPERATURA_PACIENTE));
end.
