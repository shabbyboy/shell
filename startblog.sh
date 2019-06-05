#!bin/bash

docker pull kayizhu/mysql

docker run --name mysqllog -e MYSQL_ROOT_PASSWORD=tugame -p 3306:3306  -d mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_cimysql

docker pull b3log/pipe

docker run --detach --name pipe -p 8080:8080 b3log/pipe --mysql="root:tugame@(127.0.0.1:3306)/pipe?charset=utf8mb4&parseTime=True&loc=Local" --runtime_mode=prod --port=8080 --server=http://localhost:8080

