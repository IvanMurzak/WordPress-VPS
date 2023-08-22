# WordPress VPS

![License](https://img.shields.io/github/license/IvanMurzak/WordPress-VPS) ![Stars](https://img.shields.io/github/stars/IvanMurzak/WordPress-VPS) [![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)

<div>
  <a target="_blank" href="https://docs.docker.com/"><img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" /></a>
  <a target="_blank" href="https://developer.wordpress.org/"><img src="https://img.shields.io/badge/Wordpress-21759B?style=for-the-badge&logo=wordpress&logoColor=white" /></a>
  <a target="_blank" href="https://mysql.com/"><img src="https://img.shields.io/badge/MySQL-3E6E93?style=for-the-badge&logo=mysql&logoColor=white" /></a>
  <a target="_blank" href="https://letsencrypt.org/"><img src="https://img.shields.io/badge/LetsEncrypt-2C3C69?style=for-the-badge&logo=letsencrypt&logoColor=white" /></a>
  <a target="_blank" href="https://nginx.com/"><img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white" /></a>
  <a target="_blank" href="https://certbot.eff.org/"><img src="https://img.shields.io/badge/CertBot-000000?style=for-the-badge&logo=eff&logoColor=white" /></a>
  <a target="_blank" href="https://www.google.com/search?q=virtual+private+server"><img src="https://img.shields.io/badge/VPS-FFFFFF?style=for-the-badge&logo=vps&logoColor=white" /></a>
</div>

## Setup by using local scripts

By using this setup option you may use your local computer as entry point to control and monitor VPS instance much easier 👍

### 1. Clone or [download](https://github.com/IvanMurzak/WordPress-VPS/archive/refs/heads/main.zip) this repository to your local computer

```bash
git clone https://github.com/IvanMurzak/WordPress-VPS.git
```

### 2. Setup required apps

Setup required software to local computer (not VPS instance). It needed for scripts to work.

#### Linux

- [not yet covered]

#### Windows

Make sure each app is added to `PATH` environment variable.

- [PuTTY](https://www.putty.org/) - used to establish SSH connection with VPS instance
- [7z](https://www.7-zip.org/download.html) - used to create archive to deploy `deployment` folder to VPS instance

### 3. Set up SSH credentials

To use scripts you need to setup USER, SERVER (IP), PASSWORD for SSH connection to VPS instance.
Open the file `_configs` to setup your VPS credentials. Replace `********` by your data.

Linux: `./scripts/linux/_configs.sh`
Windows: `./scripts/windows/_configs.bat`

- `USER`: username at VPS instance
- `SERVER`: IP address if VPS instance
- `PASSWORD`: password for SSH connection

#### Windows only - Accept SSH connection

1. Launch PuTTY desktop app
2. Choose `Session` in left column called "Category"
3. Set IP address of VPS instance to `Host Name (or IP address)`
4. Set `Port` to `22` (default SSH port)
5. Choose `Connection` > `SSH`
6. Press `Open` button
7. Accept connection by pressing `Accept` button

### 4. Setup VPS environment

Execute the script `SetupVPS`. Installs required software to VPS instance. Such as Nano, Python, Docker, Docker compose and Tar.

Linux: `./scripts/linux/setup/SetupVPS.sh`
Windows: `./scripts/windows/setup/SetupVPS.bat`

### 5 Deploy 🚀

Execute the script `DockerComposeDownDeployBuildUp`.

Linux: `./scripts/linux/DockerComposeDownDeployBuildUp.sh`
Windows: `./scripts/windows/DockerComposeDownDeployBuildUp.bat`

### 5.1 Validate 🔎

Verify that HTTPS works after 60 seconds by opening your domain name in browser. If doesn't check your domain name DNS settings. And try again to deploy.

## 6. Finish 🏁

All done! You can now open your domain name in browser and see your WordPress website. You can also open `https://www.ssllabs.com/ssltest/analyze.html?d=yourdomainname.com` to verify that your SSL certificate is valid.
