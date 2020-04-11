FROM mcr.microsoft.com/windows/servercore:ltsc2019
ADD https://cdn.mysql.com//Downloads/MySQLInstaller/mysql-installer-community-5.6.47.0.msi C:\\mysql_install\\mysql.msi
ADD mysql.bat C:\\mysql_install
VOLUME C:\\MySQL
workdir C:\\MySQL
EXPOSE 3306
CMD ["C:\\mysql_install\\mysql.bat"]