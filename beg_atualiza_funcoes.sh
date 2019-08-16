#!/bin/bash
export diretorio_base='/Users/guilherme/GoogleDrive/BEG/Chapeco-Solucoes/TrafegusZabbix'
export PGUSER=postgres


source $diretorio_base/beg_clientes.sh


for ((cliente=1;cliente<=$nro_clientes;cliente++))
    do
    echo
    echo
    printf "Cliente     : "${backup[$cliente]}
    echo
    printf "Servidor    : "${backup[$cliente,1]}
    servidor=${backup[$cliente,1]}

    nro_portas=${backup[$cliente,0]}

    executa_backup=${backup[$cliente,2]}
    if [ $executa_backup = 1 ]; then
        echo " "
        for ((p=1;p<=$nro_portas;p++))
        do
                porta=${backup[$cliente,1,$p]}
                instancia=${backup[$cliente,1,$p,1]}
                printf "Porta       : "${backup[$cliente,1,$p]}
                echo
                # Loop para gerar arquivos dump
                for i in `psql -h $servidor -p $porta -t -c "select datname from pg_database where datname not in ('postgres','template0','template1')"`; do
                        if [ $i != template1 -a $i != template0 -a $i != postgres ]; then
                                echo "Database    : "$i
                                echo " "
                                psql $i -h $servidor -p $porta -U postgres -c "\i $diretorio_base\funcoes.sql"
				if [ "$?" != "0" ]; then
                                        echo "Problemas no Dump $i = $cliente "
                                fi
                        fi
                done
        done
    fi
done
