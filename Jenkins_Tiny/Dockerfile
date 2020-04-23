FROM mcr.microsoft.com/windows/servercore:ltsc2019 as build

RUN mkdir C:\\Dependencies

ADD jdk-8u251-windows-x64.exe C:\\Dependencies\\jdk-8u251-windows-x64.exe

RUN powershell start-process -filepath C:\Dependencies\jdk-8u251-windows-x64.exe -passthru -wait -argumentlist "/s,/L,install64.log"

FROM mcr.microsoft.com/windows/nanoserver:1809

COPY --from=build  ["C:\\\\Program Files\\\\Java", "C:\\\\Program Files\\\\Java"]

RUN mkdir C:\\Jenkins

ADD jenkins.war C:\\Dependencies\\jenkins.war

USER ContainerAdministrator

ENV JAVA_HOME C:\\Program Files\\Java\\jdk1.8.0_251

ENV JENKINS_HOME C:\\Jenkins

EXPOSE 8080 50000

VOLUME C:\\Jenkins

CMD ["C:\\Program Files\\Java\\jdk1.8.0_251\\bin\\java.exe", "-jar", "C:\\Dependencies\\jenkins.war"]

