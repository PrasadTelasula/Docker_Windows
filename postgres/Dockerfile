#FROM mcr.microsoft.com/windows/servercore:ltsc2019
#ADD http://get.enterprisedb.com/postgresql/postgresql-12.2-2-windows-x64-binaries.zip C:\\PostgreSQL_Install\\postgresql-12.2-2-windows-x64-binaries.zip
#ADD https://mirrors.download3k.com/token/2994941a647bb8e086a96cd90bff951b/postgresql-12.2-1-windows-x64.exe C:\\PostgreSQL_Install\\postgresql-12.2-1-windows-x64.exe
# Download URL
#ADD postgresql-12.2-1-windows-x64.exe C:\\PostgreSQL_Install\\postgresql-12.2-1-windows-x64.exe


#ADD pgsql.ps1 C:\\PostgreSQL_Install\\pgsql.ps1
#RUN mkdir C:\\PGSQL

#VOLUME C:\\PGSQL

#EXPOSE 5432

#RUN powershell C:\\PostgreSQL_Install\\pgsql.ps1

#CMD C:\\PGSQL\\bin\\pg_ctl start
#------------------



FROM mcr.microsoft.com/windows/servercore:ltsc2019

RUN mkdir C:\\PGSQL\\PostgreSQL\\9.6\\data

COPY pgsql.ps1 .



SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN [Net.ServicePointManager]::SecurityProtocol = 'Tls12, Tls11, Tls' ; \
    Invoke-WebRequest -UseBasicParsing -Uri 'https://get.enterprisedb.com/postgresql/postgresql-9.6.10-2-windows-x64.exe' -OutFile 'postgresql-installer.exe' ; 
    #Start-Process postgresql-installer.exe -ArgumentList '--mode unattended --superpassword password' -Wait ; \
    #Remove-Item postgresql-installer.exe -Force

RUN Invoke-WebRequest -UseBasicParsing -Uri 'https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.3/ServiceMonitor.exe' -OutFile 'ServiceMonitor.exe'

SHELL ["cmd", "/S", "/C"]

EXPOSE 5432


CMD ["powershell", "C:\\pgsql.ps1"]