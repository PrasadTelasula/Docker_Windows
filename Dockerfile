FROM microsoft/mssql-server-windows-developer:2017-latest
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Password@123456
EXPOSE 1433
VOLUME C:\\SQLData


