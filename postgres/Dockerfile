FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Directory for Database
RUN mkdir C:\\PGSQL\\PostgreSQL\\9.6\\data

COPY pgsql.ps1 .

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Download PostgreSQL exe file.
RUN [Net.ServicePointManager]::SecurityProtocol = 'Tls12, Tls11, Tls' ; \
    Invoke-WebRequest -UseBasicParsing -Uri 'https://get.enterprisedb.com/postgresql/postgresql-12.2-2-windows-x64.exe' -OutFile 'postgresql-installer.exe' ; 
    
# Downloading ServiceMontor Tool. 
RUN Invoke-WebRequest -UseBasicParsing -Uri 'https://dotnetbinaries.blob.core.windows.net/servicemonitor/2.0.1.3/ServiceMonitor.exe' -OutFile 'ServiceMonitor.exe'

SHELL ["cmd", "/S", "/C"]

EXPOSE 5432

CMD ["powershell", "C:\\pgsql.ps1"]
