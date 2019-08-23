CREATE OR REPLACE FUNCTION public.beg_fnc_valida_particoes(p_dias integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
	COST 100
    VOLATILE STRICT 
AS 
$BODY$
DECLARE
V_TABELA  VARCHAR(30);
V_DIA  VARCHAR(30);
V_RETORNO integer;
BEGIN



FOR I IN 1..P_DIAS LOOP
	V_DIA :=to_char(current_date+I,'YYYYMMDD');
	
	/**** Validando tabela RPER ***/
	V_TABELA='rper_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
	END IF;


	/**** Validando tabela RPOS ***/
	V_TABELA='rpos_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
	END IF;


	/**** Validando tabela RMAC ***/
	V_TABELA='rmac_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
	END IF;


	/**** Validando tabela RECE ***/
	V_TABELA='rece_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
	END IF;
	
	/**** Validando tabela RMLI ***/
	V_TABELA='rmli_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
	END IF;
		
	/**** Validando tabela RPRE ***/
	V_TABELA='rpre_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
		END IF;
		
	/**** Validando tabela EECO ***/
	V_TABELA='eeco_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		RAISE NOTICE 'TABELA : %', V_TABELA;
		--RETURN 1;
		END IF;
	
	
	/**** Validando tabela EMCO ***/
	V_TABELA='emco_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		RAISE NOTICE 'TABELA : %', V_TABELA;
		--RETURN 1;
		END IF;
	
	
	/**** Validando tabela EOCO ***/
	V_TABELA='eoco_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
		END IF;
	
	/**** Validando tabela RPVE ***/
	V_TABELA='rpve_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
		END IF;
		
		
	/**** Validando tabela ESIS ***/
	V_TABELA='esis_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
		END IF;
		
		
	/**** Validando tabela ENVI ***/
	V_TABELA='envi_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
		END IF;
		
		
	/**** Validando tabela ELCO ***/
	V_TABELA='elco_'||V_DIA;
	V_RETORNO=0;
	select 1 into V_RETORNO from pg_tables where tablename = V_TABELA;
	IF COALESCE(V_RETORNO,0)=0 THEN
		--RAISE NOTICE 'TABELA : %', V_TABELA;
		RETURN 1;
		END IF;
		
	
		

END LOOP;

/*** OK ***/
RETURN 0;
END;

$BODY$;

