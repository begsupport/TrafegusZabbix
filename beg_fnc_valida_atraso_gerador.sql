CREATE OR REPLACE FUNCTION public.beg_fnc_valida_atraso_gerador(p_atraso time default '00:05:00.000000')
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
select cgev_descricao||' = '||current_timestamp-cgev_data_ultima_execucao valor from public.cgev_controle_gerador_eventos
where current_timestamp-cgev_data_ultima_execucao=(select max(current_timestamp-cgev_data_ultima_execucao) as valor from public.cgev_controle_gerador_eventos where (current_timestamp-cgev_data_ultima_execucao) >= p_atraso);

BEGIN
V_RETORNO := 'OK';
FOR R_PARAMETRO IN C_PARAMETROS LOOP

	--RAISE NOTICE 'Parâmetro: % ',R_PARAMETRO.name;
	--RAISE NOTICE 'Valor    : % ',R_PARAMETRO.valor;
	
	V_RETORNO := V_RETORNO ||' '||R_PARAMETRO.valor;

        IF V_RETORNO<>'OK' THEN
           V_RETORNO := REPLACE(V_RETORNO,'OK ','');
        END IF;
	

END LOOP;

IF V_RETORNO IS NULL  THEN
   V_RETORNO := 'OK';
END IF;

RETURN V_RETORNO;

END;
$BODY$;
