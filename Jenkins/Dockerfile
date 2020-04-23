FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN mkdir C:\\Jenkins && mkdir C:\\Dependencies

ADD . C:\\Dependencies

RUN powershell start-process -filepath C:\Dependencies\jdk-8u251-windows-x64.exe -passthru -wait -argumentlist "/s,/L,install64.log"

ENV JAVA_HOME C:\\Program Files\\Java\\jdk1.8.0_251

ENV JENKINS_HOME C:\\Jenkins

EXPOSE 8080 50000

VOLUME C:\\Jenkins

CMD java -jar C:\\Dependencies\\jenkins.war