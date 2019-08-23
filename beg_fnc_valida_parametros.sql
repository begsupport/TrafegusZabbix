CREATE OR REPLACE FUNCTION public.beg_fnc_valida_parametros( )
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
select name,trim(setting) as valor,pending_restart from pg_settings where name in ('enable_seqscan','log_lock_waits','huge_pages','work_mem','autovacuum','autovacuum_max_workers','idle_in_transaction_session_timeout','wal_keep_segments','fsync','maintenance_work_mem','statement_timeout','default_tablespace');

BEGIN
V_RETORNO := 'OK';
FOR R_PARAMETRO IN C_PARAMETROS LOOP

	--RAISE NOTICE 'Parâmetro: % ',R_PARAMETRO.name;
	--RAISE NOTICE 'Valor    : % ',R_PARAMETRO.valor;
	
	IF R_PARAMETRO.name='fsync' and R_PARAMETRO.valor <> 'on' THEN
	   V_RETORNO := V_RETORNO ||',fsync = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='huge_pages' and R_PARAMETRO.valor <> 'on' THEN
	   V_RETORNO := V_RETORNO ||',huge_pages = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='autovacuum_max_workers' and R_PARAMETRO.valor <> '5' THEN
	   V_RETORNO := V_RETORNO ||',autovacuum_max_workers = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='autovacuum' and R_PARAMETRO.valor <> 'on' THEN
	   V_RETORNO := V_RETORNO ||',autovacuum = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='idle_in_transaction_session_timeout' and R_PARAMETRO.valor <> '60000' THEN
	   V_RETORNO := V_RETORNO ||',idle_in_transaction_session_timeout = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='wal_keep_segments' and R_PARAMETRO.valor <> '1000' THEN
	   V_RETORNO := V_RETORNO ||',wal_keep_segments = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='maintenance_work_mem' and R_PARAMETRO.valor <> '131072' THEN
	   V_RETORNO := V_RETORNO ||',maintenance_work_mem = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='statement_timeout' and R_PARAMETRO.valor <> '300000' THEN
	   V_RETORNO := V_RETORNO ||',statement_timeout = '||R_PARAMETRO.valor;
	END IF;
	   
	IF R_PARAMETRO.name='default_tablespace' and R_PARAMETRO.valor <> 'trafegus_data' THEN
	   V_RETORNO := V_RETORNO ||',default_tablespace = '||R_PARAMETRO.valor;
	END IF;
        
	IF R_PARAMETRO.name='work_mem' and R_PARAMETRO.valor <> '1024' THEN
	   V_RETORNO := V_RETORNO ||',work_mem = '||R_PARAMETRO.valor;
	END IF;
	IF R_PARAMETRO.name='synchronous_commit' and R_PARAMETRO.valor <> 'on' THEN
	   V_RETORNO := V_RETORNO ||',synchronous_commit = '||R_PARAMETRO.valor;
	END IF;

	IF R_PARAMETRO.name='synchronous_standby_names' and R_PARAMETRO.valor <> 'ANY 1 (hot01,hot02,hot03,backup)' THEN
	   V_RETORNO := V_RETORNO ||',synchronous_standby_names = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='log_lock_waits' and R_PARAMETRO.valor <> 'on' THEN
	   V_RETORNO := V_RETORNO ||',log_lock_waits = '||R_PARAMETRO.valor;
	END IF;
	
	IF R_PARAMETRO.name='enable_seqscan' and R_PARAMETRO.valor <> 'on' THEN
	   V_RETORNO := V_RETORNO ||',enable_seqscan = '||R_PARAMETRO.valor;
	END IF;

        IF V_RETORNO<>'OK' THEN
           V_RETORNO := REPLACE(V_RETORNO,'OK,','');
	END IF;

END LOOP;

RETURN V_RETORNO;

END;
$BODY$;
