#!/bin/bash

#从仓库把一个image拉到本地
docker pull [remoteURL]:[imageTag]

# 把运行中的容器保存为镜像
docker commit <CONTAIN-ID> <IMAGE-NAME>

# 将镜像 ubuntu:14.04 保存为 ubuntu14.04.tar 文件
docker save -o ubuntu14.04.tar ubuntu:14.04

# 将 ubuntu14.04.tar 文件载入镜像中
docker load -i ubuntu14.04.tar
docker load < ubuntu14.04.tar

# 启动一个container，映射将container的80端口映射到docker server的80端口，设置dns服务器地址，绑定docker server和container的文件，并设置只读，-d设置后台执行
docker run -p 80:80 --name some-nginx --dns=${DNS} -v /home/nginx.conf:/etc/nginx/nginx.conf:ro -v /home/opc/cwd:/usr/share/nginx/html:ro -d nginx