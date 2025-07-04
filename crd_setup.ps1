param (
    [string]$authCode = "COLE_SEU_CODIGO_OAUTH_AQUI",
    [string]$pin = "123456",
    [string]$sshKey = "COLE_SUA_CHAVE_SSH_AQUI"
)

$remotingExe = "${Env:PROGRAMFILES(X86)}\Google\Chrome Remote Desktop\CurrentVersion\remoting_start_host.exe"

Write-Host "Configurando Chrome Remote Desktop para $env:COMPUTERNAME..."

if ($sshKey -ne "COLE_SUA_CHAVE_SSH_AQUI") {
    $sshPath = "$env:USERPROFILE\.ssh"
    New-Item -ItemType Directory -Path $sshPath -Force | Out-Null
    $keyPath = "$sshPath\id_rsa"
    Set-Content -Path $keyPath -Value $sshKey
    icacls $keyPath /inheritance:r /grant:r "$env:USERNAME:F" | Out-Null
    Write-Host "Chave SSH salva em $keyPath"
}

if (Test-Path $remotingExe) {
    & $remotingExe `
    --code="$authCode" `
    --redirect-url="https://remotedesktop.google.com/_/oauthredirect" `
    --name="$env:COMPUTERNAME"
    Write-Host "CRD configurado com sucesso!"
} else {
    Write-Host "ERRO: Chrome Remote Desktop não encontrado em $remotingExe"
}
