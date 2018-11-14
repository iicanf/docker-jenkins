FROM maven:3.6.0-jdk-8

#JAVA_HOME: /docker-java-home
#MAVEN_HOME: /usr/share/maven


#安装vim
RUN set -ex; \
    apt-get update; \
    apt-get -y install vim; \
    apt-get -y install ansible; 

RUN set -ex; \
    mkdir -p /data/jenkins/; \
    mkdir -p /var/log/jenkins/; \
    wget -nv -O /data/jenkins/ https://mirrors.tuna.tsinghua.edu.cn/jenkins/war-stable/2.138.2/jenkins.war 

#挂载.ssh 目录,方便容器访问gitee和目标机器
VOLUME ["~/.ssh","/root/.ssh"]
##########
# host_key_checking = False 
# log_path = /var/log/jenkins/ansible.log
# accelerate_port = 10000
# accelerate_multi_key = yes
########

#挂载ansible的配置目录，方便配置目标机器和ansible的基础配置
VOLUME ["/etc/ansible/","/etc/ansible/"]
#挂载ansible和jenkins的日志目录
VOLUME ["/var/log/jenkins/","/var/log/jenkins/"]


COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 18080 8080
