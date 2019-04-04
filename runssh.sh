#!/bin/bash
# 通过ssh 嵌套 expect 
expect -c "
	set password ******;
	set arg $1;
	if { \"$arg\" == \"T\" } {
		 spawn ssh-add .ssh/id_rsa.xuxiaolong
		 expect \"*xuxiaolong:\" { send \"$password\r\" }
		 expect eof
	};
	spawn ssh -i ~/.ssh/id_rsa.xuxiaolong -A xuxiaolong#UTF-8@ip -p 222;
	expect \"xuxiaolong:\" { send \"$password\r\" };
	interact
"
exit 0
