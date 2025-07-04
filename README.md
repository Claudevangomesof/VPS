# Florkis Windows CRD Orchestrator

Este projeto permite usar o Florkis (Linux) para orquestrar a configuração do **Chrome Remote Desktop** em uma máquina Windows remota.

## Como usar

### 1. Ajuste as variáveis no `deploy_crd.sh`:

- `WIN_USER`: usuário da máquina Windows
- `WIN_PASS`: senha (se usar winrm, não usado no ssh)
- `WIN_HOST`: IP ou hostname da máquina Windows

### 2. Configure a máquina Windows para aceitar conexões SSH:

- Instale o OpenSSH Server no Windows
- Habilite o serviço SSH

### 3. Coloque seu código OAuth no `crd_setup.ps1` na variável `$authCode`.

### 4. Faça commit e push para seu repositório GitHub.

### 5. No Florkis:

- Crie um projeto conectado ao seu repositório
- Configure o projeto para executar o script `deploy_crd.sh` automaticamente ou manualmente

### 6. O script `deploy_crd.sh` copiará o script PowerShell para o Windows e executará ele remotamente, registrando a máquina no Chrome Remote Desktop.

## Observações

- Para usar WinRM ao invés de SSH, o script `deploy_crd.sh` deve ser adaptado.
- Mantenha a segurança das suas credenciais.

---

Se quiser ajuda para adaptar para WinRM, me avise!
