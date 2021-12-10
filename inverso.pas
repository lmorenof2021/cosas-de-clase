{$mode objfpc}{$H-}{$R+}{$T+}{$Q+}{$V+}{$D+}{$X-}{$warnings on}
program inverso_02;

type 
    TipoResultado= record
        codigo:string; 
        valor: real;
    end;

function inverso(x: real): TipoResultado;
var resultado : TipoResultado;
begin
    if x = 0 then 
        resultado.codigo := ('Error, el divisor no puede ser nulo')
    else begin
        resultado.codigo := ('ok');
        resultado.valor := 1/x;
    end;

    result := resultado;
    
end;

var 
    x : real;
    y : TipoResultado;

begin
    writeln('Escribe un número');
    readln(x);
    
    y := inverso(x);
    if y.codigo = 'ok' then begin
        write('El inverso de ', x:0:3 );
        writeln(' es ', y.valor:0:3);
    end
    else
        writeln( y.codigo );
end.

