CREATE OR REPLACE FUNCTION public.beg_fnc_valida_unlogged_tables( )
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
select relname valor from pg_class where relpersistence='u' and relkind='r' order by 1;
BEGIN
V_RETORNO := 'OK';
FOR R_PARAMETRO IN C_PARAMETROS LOOP

	--RAISE NOTICE 'Parâmetro: % ',R_PARAMETRO.name;
	--RAISE NOTICE 'Valor    : % ',R_PARAMETRO.valor;
	
	V_RETORNO := V_RETORNO ||' '||R_PARAMETRO.valor;
        V_RETORNO := REPLACE(V_RETORNO,'/32','');


        IF V_RETORNO<>'OK' THEN
           V_RETORNO := REPLACE(V_RETORNO,'OK ','');
        END IF;
	

END LOOP;

RETURN V_RETORNO;

END;
$BODY$;
