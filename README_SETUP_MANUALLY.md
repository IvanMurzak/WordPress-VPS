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

## Setup VPS Instance - work with VPS instance directly

This setup option allows to work directly in terminal of VPS instance. You need to establish SSH connection and execute commands manually at VPS instance. I personally don't recommend this option for long term project because it is wasting time to connect to VPS and manually execute commands.

### 1. Clone the project to VPS

Need to have the `deployment` folder from this repository to VPS instance at this location `~/deployment`. Execute these commands to make it done.

```bash
cd ~
git init
git remote add origin https://github.com/IvanMurzak/WordPress-VPS.git
git fetch

# Required when the versioned files existed in path before "git init" of this repo.
# git reset origin/main

git checkout -t origin/main
```

### 2. Setup VPS environment

Execute the script `~/deployment/scripts/setup/SetupVPS.sh` at VPS instance. To setup Python, Docker, Docker compose and archive extractor apps.

```bash
sh ~/deployment/scripts/setup/SetupVPS.sh
```

### 3. NGINX configuration

Open the file `~/deployment/nginx-conf/nginx.conf` and replace `********` by your domain name in 6 different places. Make sure you don't miss any. File lines: 5 (twice), 52 (twice), 57, 58.

> The domain name is doubled two times for `www` and `non-www` versions. Keep it.

### 4. MySQL credentials

Open the file `deployment/.env` and replace `********` by your database credentials. You can use any. At first deployment it will be used to create database and user. For the next times it will be used for authentication. Make sure you don't change this file after first deployment, in other case you may have issues because incorrect credentials.

- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `MYSQL_ROOT_PASSWORD`

> Make sure you have visible hidden files in your file explorer.

### 5. CertBot & Let's Encrypt (SSL certificate)

Open the file `~/deployment/.env` and replace `********` by your data.

- `SSL_CERTIFICATE_EMAIL` - email address that will be used as owner of domain name
- `SSL_CERTIFICATE_DOMAIN` - your domain name

### 6. SSL certificate: create, use and renew

`CertBot` + `Let's Encrypt` will create SSL certificate for your domain name. It will be used by `NGINX` to serve your website via `HTTPS`. You need to follow this tutorial just once, then it will be auto-renewed.

#### 6.1 🔄 Force renewal

Open the file `~/deployment/.env`. Make sure `SSL_START_MODE` is set to `force-renewal`

```bash
SSL_START_MODE=force-renewal
```

#### 6.2 🚀 Deploy

Execute the script

```bash
sh ~/deployment/scripts/DockerComposeDownBuildUp.sh
```

<details>
  <summary>Script content</summary>
  
  ```bash
  cd ~/deployment
  sudo service docker start
  sudo docker-compose down
  sudo docker-compose build
  sudo docker-compose up -d
  ```

</details>

#### 6.3 🔎 Validate

Verify that HTTPS works after 30 seconds by opening your domain name in browser. If doesn't check your domain name DNS settings. And try again to deploy.

#### 6.4 💠 Setup auto-renewal SSL certificate

Open file `~/deployment/.env`. Make sure `SSL_START_MODE` is set to `staging`.

```bash
SSL_START_MODE=staging
```

#### 6.5 🚀 Deploy (again)

Execute the script

```bash
sh ~/deployment/scripts/DockerComposeDownBuildUp.sh
```

<details>
  <summary>Script content</summary>
  
  ```bash
  cd ~/deployment
  sudo service docker start
  sudo docker-compose down
  sudo docker-compose build
  sudo docker-compose up -d
  ```

</details>

## 7. Finish 🏁

All done! You can now open your domain name in browser and see your WordPress website. You can also open `https://www.ssllabs.com/ssltest/analyze.html?d=yourdomainname.com` to verify that your SSL certificate is valid.
