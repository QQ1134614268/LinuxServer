
find / -name jenkins*
# /usr/local/src/jenkins.war
scp -P 50221 /usr/local/src/jenkins.war root@44.39.19.14:/usr/local/src/jenkins.war

scp -r -P 50221 /root/.jenkins root@44.39.19.14:/root/.jenkins

#jenkins： http://44.39.19.14:9099
