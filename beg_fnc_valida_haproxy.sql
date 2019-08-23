CREATE OR REPLACE FUNCTION public.beg_fnc_valida_haproxy( )
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
select distinct client_addr::varchar as valor from pg_stat_activity where client_addr::varchar not like '172.17%' and client_addr::varchar not like '172.25%'and client_addr not in ('144.22.116.101','144.22.116.5','144.22.116.105') order by 1;

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
