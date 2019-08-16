CREATE OR REPLACE FUNCTION public.beg_fnc_valida_conexoes(p_percentual integer default 80)
    RETURNS numeric
    LANGUAGE 'plpgsql'
	COST 100
    VOLATILE STRICT 
AS 
$BODY$
DECLARE

V_RETORNO integer;
V_PERCENTUAL NUMERIC;
V_TOTAL_CONEXOES integer;
V_TOTAL_CONEXOES_MAXIMO integer;

BEGIN

select setting::int INTO V_TOTAL_CONEXOES_MAXIMO from pg_settings where name = 'max_connections';

select count(*) INTO V_TOTAL_CONEXOES from pg_stat_activity ;

V_PERCENTUAL := (V_TOTAL_CONEXOES*100)/V_TOTAL_CONEXOES_MAXIMO;

IF V_PERCENTUAL > P_PERCENTUAL THEN
   RETURN V_PERCENTUAL;
ELSE
RETURN 0;
END IF;
RETURN 0;
END;
$BODY$;

