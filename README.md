# docker-jenkins

#### 项目介绍
docker-jenkins镜像脚本

#### 默认挂载路径
1、挂载.ssh 目录,方便容器访问gitee和目标机器
    
    VOLUME ["~/.ssh","/root/.ssh"]

2、挂载ansible的配置目录，方便配置目标机器和ansible的基础配置
    
    VOLUME ["/etc/ansible/","/etc/ansible/"]

3、挂载ansible和jenkins的日志目录
    
    VOLUME ["/var/log/jenkins/","/var/log/jenkins/"]

#### 默认的端口

    EXPOSE 9080 8080

#### 下载和运行

    docker pull docker-jenkins:tag
    docker run -d --name [name] -v -p 9080:8080  [image]:[tag] start
