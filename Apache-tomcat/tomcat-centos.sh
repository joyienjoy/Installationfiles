#The steps below are tested in the new Openlogic CentOS 7 OS

echo "---Check Java Version ---"

java -version

echo "---Install Apache Tomcat---"

yum install tomcat

yum install tomcat-webapps tomcat-admin-webapps

echo "---The Apache Tomcat Server is Active at 8080---"

echo "
------------------------------------------------------------------
STEP TO SET ADMIN USERNAME PASSWORD
vi /etc/tomcat/tomcat-users.xml

--> Add this:
<role rolename="manager-gui"/>
<user username="centostom" password="centos" roles="manager-gui"/>
------------------------------------------------------------------
STEP TO CHANGE PORT
vi /etc/tomcat/server.xml
--> Edit this to replace 8080 to your desired port:
 <Connector port="8080" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" />
------------------------------------------------------------------
"
