#!/bin/bash
expect -c "
	set password 314159;
	set arg $1;
	if { \"$arg\" == \"T\" } {
		 spawn ssh-add .ssh/id_rsa.xuxiaolong
		 expect \"*xuxiaolong:\" { send \"$password\r\" }
		 expect eof
	};
	spawn ssh -i ~/.ssh/id_rsa.xuxiaolong -A xuxiaolong#UTF-8@192.168.10.5 -p 222;
	expect \"xuxiaolong:\" { send \"$password\r\" };
	interact
"
exit 0
