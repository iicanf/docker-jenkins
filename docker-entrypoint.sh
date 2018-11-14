#!/bin/sh
JENKINSFILENAME=jenkins.war

stop(){  
    echo "Stoping $JENKINSFILENAME "  
     ps -ax | grep "jenkins" | grep -v grep | grep java | awk '{print $1}' | while read pid
    do  
       kill -9 $pid  
       echo " $pid killing"  
    done  
} 

case "$1" in  
start)  
    echo "Starting $JENKINSFILENAME "  
    #exec nohup java -jar /data/jenkins/jenkins.war --httpPort=8080 >> /var/log/jenkins/jenkins.log.out 2>&1 & sleep 1   
    exec java -jar /data/jenkins/jenkins.war --httpPort=8080 2>&1 | tee -a /var/log/jenkins/jenkins.log.out  
    exit 0
    ;;  
stop)  
    exec stop  
    ;;  
restart)  
    stop  
    start  
    ;;  
status)  
    ps -ef|grep $JENKINSFILENAME  
    ;;  
*)  
    printf 'Usage: %s {start|stop|restart|status}\n' "$prog"  
    exit 1  
    ;;  
esac

exec "$@"
