CREATE OR REPLACE FUNCTION public.beg_fnc_valida_parametros_pendentes( )
    RETURNS VARCHAR
    LANGUAGE 'plpgsql'
	COST 100
    VOLATILE STRICT 
AS 
$BODY$
DECLARE

V_RETORNO VARCHAR;
V_DADO_TABELA integer;

C_PARAMETROS CURSOR FOR
select name,trim(setting) as valor,pending_restart from pg_settings where pending_restart='t';

BEGIN
V_RETORNO := 'OK';
FOR R_PARAMETRO IN C_PARAMETROS LOOP
	V_RETORNO := V_RETORNO ||','||R_PARAMETRO.name||' = '||R_PARAMETRO.valor;
END LOOP;

IF V_RETORNO<>'OK' THEN
   V_RETORNO := REPLACE(V_RETORNO,'OK,','');
END IF;

RETURN V_RETORNO;

END;
$BODY$;
