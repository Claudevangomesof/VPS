#!/bin/bash

# Configurar seus dados aqui
WIN_USER="Administrador"
WIN_PASS="SENHA_DA_MAQUINA"
WIN_HOST="IP_OU_HOSTNAME_DA_MAQUINA"

LOCAL_SCRIPT="crd_setup.ps1"
REMOTE_PATH="C:/Users/Administrador/Desktop/crd_setup.ps1"

echo "Copiando script PowerShell para a máquina Windows..."

# Se SSH habilitado na máquina Windows
scp $LOCAL_SCRIPT $WIN_USER@$WIN_HOST:"/c/Users/Administrador/Desktop/crd_setup.ps1"

echo "Executando script remotamente..."

# Usando SSH para executar o script PowerShell remotamente
ssh $WIN_USER@$WIN_HOST "powershell -ExecutionPolicy Bypass -File C:\Users\Administrador\Desktop\crd_setup.ps1"
