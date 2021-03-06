# Docker_Windows
Docker on Windows Server

# Install chocolatey package manager
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Docker on Windows server

	# Check the version of windows server
      	   winver

     # Check Hyper-V is installed or not
	   Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V


      # Install Hyper-V virtualisation
	   Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart

      # if above command not working use below commands to install Hyper-V
	   Enable-WindowsOptionalFeature –Online -FeatureName Microsoft-Hyper-V –All -NoRestart         
	   Install-WindowsFeature RSAT-Hyper-V-Tools -IncludeAllSubFeature


      # Install the OneGet PowerShell module.
	   Install-Module -Name DockerMsftProvider -Repository PSGallery -Force

      # To see the Installed package provider and the Docker package made available through it.
           Get-PackageProvider -ListAvailable
           Get-PackageProvider -ListAvailable -Name DockerMsftProvider
           Get-PackageSource -ProviderName DockerMsftProvider

      # Use OneGet to install the latest version of Docker.
	   Install-Package -Name docker -ProviderName DockerMsftProvider

      # When the installation is complete, reboot the computer.
	   Restart-Computer -Force

       # Check Docker service status
           Get-Service -Name docker

       # Start Docker Service
           Start-Service Docker

        # Check the version of Docker version
            docker version 

         
# Docker command auto-completion
      Install-Module -Scope CurrentUser posh-docker
      Import-Module posh-docker

# Docker commands
	docker version
	docker version --short
	docker info
	docker system df -v
	docker stats

# 
	mkdir c:\docker-stuff
      cd :\docker-stuff
      Invoke-WebRequest http://ftp-nyc.osuosl.org/pub/jenkins/windows-stable/jenkins-2.222.1.zip -OutFile jenkins-2.222.1.zip

# MSBuild Download Link 
https://download.microsoft.com/download/9/B/B/9BB1309E-1A8F-4A47-A6C5-ECF76672A3B3/BuildTools_Full.exe
