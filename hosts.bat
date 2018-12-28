@echo off
echo "please allow"
@echo  ########################################
@xcopy C:\Windows\system32\drivers\etc\hosts C:\Windows\system32\drivers\etc\hosts.bak\ /d /c /i /y
@echo  ########################################
@echo  hosts backup finished!
@echo
@echo 127.0.0.1   img.rmiao.top >>C:\Windows\System32\drivers\etc\hosts

echo   "add img.rmiao.top done"
@ipconfig /flushdns
@echo   "flush dns done"
 
echo  input any character to revert hosts
@echo
@echo  ########################################
@pause > nul
@copy C:\Windows\System32\drivers\etc\hosts.bak\hosts C:\Windows\System32\drivers\etc\hosts /y
@echo
@echo off
echo  hosts reverted
@echo
@pause > nul
@exit