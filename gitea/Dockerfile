FROM mcr.microsoft.com/windows/servercore:ltsc2019
ADD https://github.com/go-gitea/gitea/releases/download/v1.11.4/gitea-1.11.4-windows-4.0-amd64.exe C:\\gitea_install\\gitea.exe
ADD app.ini C:\\gitea_install\\app.ini
RUN cmd /c echo y | powershell [System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultCredentials; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN powershell choco install  git make -y
RUN cmd $env:Path += ";C:\Program Files\Git\bin"
WORKDIR C:\\gitea
VOLUME C:\\gitea
ENV GITEA_CUSTOM C:\\gitea
ENV ROOT C:\\gitea
CMD ["C:\\gitea_install\\gitea.exe", "web"]
EXPOSE 3000
