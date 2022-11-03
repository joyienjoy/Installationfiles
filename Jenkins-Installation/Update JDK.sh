#To attach a Node, The node machine must have a JDK with version 15 or above.

wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm

yum localinstall jdk-17_linux-x64_bin.rpm

java -version

alternatives --config java     (It shows versions in machine. Select the one in machine)

