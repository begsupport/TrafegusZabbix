#!/bin/bash


## LISTA DE CLIENTES A PERCORRER
declare -a backup


# backup[x]       = Cliente
# backup[x,0]     = Total de Bancos de dados
# backup[x,1]     = Ip do Servidor
# backup[x,1,y]   = Banco de dados
# backup[x,1,y,1] = Porta do Banco de dados

: '
nro_clientes=1
backup[1]='controlrisk'
backup[1,0]=1
backup[1,1]='hachp.begcloud.com'
backup[1,1,1]='5439'
backup[1,1,1,1]='controlrisk'
'
nro_clientes=10
### TRAFEGUSGR  ###
backup[1]='trafegusgr'
backup[1,0]=1
backup[1,1]='hachp.begcloud.com'
backup[1,1,1]='5440'
backup[1,1,1,1]='trafegusgr'
backup[1,2]=1

### CONTROLRISK ###
backup[2]='controlrisk'
backup[2,0]=1
backup[2,1]='hachp.begcloud.com'
backup[2,1,1]='5439'
backup[2,1,1,1]='controlrisk'
backup[2,2]=1

### HAMMES  ###
backup[3]='hammes'
backup[3,0]=1
backup[3,1]='hachp.begcloud.com'
backup[3,1,1]='5441'
backup[3,1,1,1]='hammes'
backup[3,2]=1

### APROCEG  ###
backup[4]='aproceg'
backup[4,0]=1
backup[4,1]='hachp.begcloud.com'
backup[4,1,1]='5442'
backup[4,1,1,1]='aproceg'
backup[4,2]=1

### SKYTECH  ###
backup[5]='skytech'
backup[5,0]=1
backup[5,1]='hachp.begcloud.com'
backup[5,1,1]='5437'
backup[5,1,1,1]='skytech'
backup[5,2]=1

### DEFENDER ###
backup[6]='defender'
backup[6,0]=1
backup[6,1]='hachp.begcloud.com'
backup[6,1,1]='5433'
backup[6,1,1,1]='defender'
backup[6,2]=1

### UPPER  ###
backup[7]='upper'
backup[7,0]=1
backup[7,1]='hachp.begcloud.com'
backup[7,1,1]='5438'
backup[7,1,1,1]='upper'
backup[7,2]=1

### ELITE  ###
backup[8]='elite'
backup[8,0]=1
backup[8,1]='hachp.begcloud.com'
backup[8,1,1]='5434'
backup[8,1,1,1]='elite'
backup[8,2]=1

### MUNDIALRISK ###
backup[9]='mundialrisk'
backup[9,0]=2
backup[9,1]='hachp.begcloud.com'
backup[9,1,1]='5435'
backup[9,2]=1

### TOTAL  ###
backup[10]='total'
backup[10,0]=1
backup[10,1]='hachp.begcloud.com'
backup[10,1,1]='5451'
backup[10,1,1,1]='total'
backup[10,2]=1
