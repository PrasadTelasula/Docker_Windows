# Install and Initialize the Database.
$installFile="C:\postgresql-installer.exe"
$pg_data="C:\PGSQL\PostgreSQL\12"    
Start-Process -filepath $installFile -ArgumentList "--mode unattended --prefix $pg_data --datadir $pg_data\data --superpassword password" -PassThru -Wait 

# Set DB environment Variables
setx /M PATH "C:\PGSQL\PostgreSQL\12\bin;%PATH%"
setx /M DATA_DIR "C:\PGSQL\PostgreSQL\12\data"
setx /M PGPASSWORD "password"

# Monitor Postgresql service
powershell C:\ServiceMonitor.exe postgresql-x64-12
