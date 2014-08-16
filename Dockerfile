FROM ubuntu:14.04
MAINTAINER jia.huang@geneegroup.com

ENV DEBIAN_FRONTEND noninteractive

# Install Java
RUN apt-get update && apt-get install -y openjdk-7-jre

# Install Selenium Server
RUN apt-get install -y curl && mkdir -p /usr/local/share/selenium && \
	curl -sLo /usr/local/share/selenium/selenium-server.jar http://selenium-release.storage.googleapis.com/2.42/selenium-server-standalone-2.42.2.jar

# Selenium Port
EXPOSE 4444

CMD ["/usr/bin/java", "-jar", "/usr/local/share/selenium/selenium-server.jar", "-role", "hub"]
