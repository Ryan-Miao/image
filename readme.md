我的图片仓库
======





## 本地博客编写时图片如何引用

由于我们的图片必须推送到coding仓库，然后等一段时间部署，通常是几分钟甚至10几分钟，这很影响博客的编写体验。所以，想要先把图片放本地，然后等博客写完后，推送到仓库。


### 使用http-server启动静态服务器代理

当然可以本地开启nginx。这里使用http-server

```
npm install http-server -g
```

然后，我的图片仓库在本地的文件夹叫img, 在img下创建一个local-server-start.bat

```
http-server . -p 80
```

创建一个设置域名代理的hosts.bat
```
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

```




双击local-server-start.bat启动， 然后管理员运行 hosts.bat即可。此时，所有应该访问coding page的请求都被拦截到本地。等博客编写结束后，可以停止服务，管理员运行revert-hosts.bat还原hosts。