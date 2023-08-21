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

- `USER` - username at VPS instance
- `SERVER` - IP address if VPS instance
- `PASSWORD` - password for SSH connection

#### Windows only - Accept SSH connection

1. Launch PuTTY desktop app
2. Choose `Session` in left column called "Category"
3. Set IP address of VPS instance to `Host Name (or IP address)`
4. Set `Port` to `22` (default SSH port)
5. Choose `Connection` > `SSH`
6. Press `Open` button
7. Accept connection by pressing `Accept` button

### 4. Setup VPS environment

VPS instance has to have required software such as Python, Docker, Docker compose and archive extractor. To setup everything **execute the script**.

Linux: `./scripts/linux/setup/SetupVPS.sh`
Windows: `./scripts/windows/setup/SetupVPS.bat`

### 5. NGINX configuration

Open the file `deployment/nginx-conf/nginx.conf` and replace `********` by your domain name in 6 different places. Make sure you don't miss any. File lines: 5 (twice), 52 (twice), 57, 58.

> The domain name is doubled two times for `www` and `non-www` versions. Keep it.

### 6. MySQL credentials

Open the file `deployment/.env` and replace `********` by your database credentials. You can use any. At first deployment it will be used to create database and user. For the next times it will be used for authentication. Make sure you don't change this file after first deployment, in other case you may have issues because incorrect credentials.

- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `MYSQL_ROOT_PASSWORD`

> Make sure you have visible hidden files in your file explorer.

### 7. CertBot & Let's Encrypt (SSL certificate)

Open the file `deployment/.env` and replace `********` by your data.

- `SSL_CERTIFICATE_EMAIL` - email address that will be used as owner of domain name
- `SSL_CERTIFICATE_DOMAIN` - your domain name

### 8. SSL certificate: create, use and renew

`CertBot` + `Let's Encrypt` will create SSL certificate for your domain name. It will be used by `NGINX` to serve your website via `HTTPS`. You need to follow this tutorial just once, then it will be auto-renewed.

#### 8.1 🔄 Force renewal

Open the file `deployment/.env`. Make sure `SSL_START_MODE` is set to `force-renewal`

```bash
SSL_START_MODE=force-renewal
```

#### 8.2 🚀 Deploy

Execute the script `DockerComposeDownDeployBuildUp`.

Linux: `./scripts/linux/DockerComposeDownDeployBuildUp.sh`
Windows: `./scripts/windows/DockerComposeDownDeployBuildUp.bat`

#### 8.3 🔎 Validate

Verify that HTTPS works after 30 seconds by opening your domain name in browser. If doesn't check your domain name DNS settings. And try again to deploy.

#### 8.4 💠 Setup auto-renewal SSL certificate

Open file `deployment/.env`. Make sure `SSL_START_MODE` is set to `staging`.

```bash
SSL_START_MODE=staging
```

#### 8.5 🚀 Deploy (again)

Execute the script `DockerComposeDownDeployBuildUp`.

Linux: `./scripts/linux/DockerComposeDownDeployBuildUp.sh`
Windows: `./scripts/windows/DockerComposeDownDeployBuildUp.bat`

## 9. Finish 🏁

All done! You can now open your domain name in browser and see your WordPress website. You can also open `https://www.ssllabs.com/ssltest/analyze.html?d=yourdomainname.com` to verify that your SSL certificate is valid.
