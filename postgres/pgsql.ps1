$installFile="C:\postgresql-installer.exe"
$pg_data="C:\PGSQL\PostgreSQL\9.6"    
Start-Process -filepath $installFile -ArgumentList "--mode unattended --prefix $pg_data --datadir $pg_data\data --superpassword password" -PassThru -Wait 
#setx /M PATH "C:\Program Files\PostgreSQL\9.6\bin;%PATH%"
#setx /M DATA_DIR "C:\Program Files\PostgreSQL\9.6\data"
#setx /M PGPASSWORD "password"
setx /M PATH "C:\PGSQL\PostgreSQL\9.6\bin;%PATH%"
setx /M DATA_DIR "C:\PGSQL\PostgreSQL\9.6\data"
setx /M PGPASSWORD "password"

powershell -Command "Do { pg_isready -q } Until ($?)" ; `
    echo listen_addresses = '*' >> "%DATA_DIR%\\postgresql.conf" ; `
    echo host  all  all  0.0.0.0/0  trust >> "%DATA_DIR%\\pg_hba.conf" ; `
    echo host  all  all  0.0.0.0/0	md5   >> "%DATA_DIR%\\pg_hba.conf" ; `
    echo host  all  all  ::0/0      trust >> "%DATA_DIR%\\pg_hba.conf" ; `
    net stop postgresql-x64-9.6

powershell C:\ServiceMonitor.exe postgresql-x64-9.6 
