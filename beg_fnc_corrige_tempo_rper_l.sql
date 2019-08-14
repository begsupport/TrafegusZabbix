CREATE OR REPLACE FUNCTION public.beg_fnc_corrige_tempo_rper_l(p_horas integer default 3)
    RETURNS integer
    LANGUAGE 'plpgsql'
	COST 100
    VOLATILE STRICT 
AS 
$BODY$
DECLARE

V_RETORNO integer;
V_DADO_TABELA integer;
V_SQL varchar(300);
BEGIN
v_sql:='set statement_timeout to 0';
execute v_sql;
v_sql:='delete from rper_recebimento_periferico_l WHERE RPER_Data_Cadastro < current_timestamp - INTERVAL '||''''||p_horas||' Hours'||'''';
execute v_sql;
RETURN 0;
END;
$BODY$;

select beg_fnc_corrige_tempo_rper_l();