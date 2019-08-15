CREATE OR REPLACE FUNCTION public.beg_fnc_valida_tempo_rper_l(p_horas integer default 3)
    RETURNS integer
    LANGUAGE 'plpgsql'
	COST 100
    VOLATILE STRICT 
AS 
$BODY$
DECLARE

V_RETORNO integer;
V_DADO_TABELA integer;
BEGIN
select (DATE_PART('Hour', current_timestamp - min(rper_data_cadastro))*60) + DATE_PART('minutes', current_timestamp - min(rper_data_cadastro)) INTO V_DADO_TABELA from rper_recebimento_periferico_l;

IF V_DADO_TABELA >= (p_horas*60) THEN
   RETURN 1;
ELSE
RETURN 0;
END IF;
RETURN 0;
END;
$BODY$;
