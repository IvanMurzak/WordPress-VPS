# WordPress VPS

![License](https://img.shields.io/github/license/IvanMurzak/WordPress-VPS) ![Stars](https://img.shields.io/github/stars/IvanMurzak/WordPress-VPS) [![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)

Deploy WordPress to VPS in Docker with SSL certificate by Let's Encrypt and CertBot. The project designed to simple usage, no advanced tech skills required. It contains scripts that will do all the work for you. You just need to setup some credentials and run the scripts from your local computer.

If you need more control, this project allows you to do it. You can modify the scripts and `docker-compose.yml` file to fit your needs.

**Docker compose layout**

> - `webserver` - Nginx
> - `wordpress` - WordPress application
> - `certbot` - SSL certificate creating and renewing
> - `db` - MySQL database, used by WordPress

## Features

- ✔️ `VPS` support, even extremely cheap ones ($3.5/month - ovhcloud.com)
- ✔️ `Database` local MySQL database that is required for WordPress
- ✔️ `Custom domain name` ability to setup any domain name, don't forget to buy it first
- ✔️ `HTTPS` create and auto-renewal
  - ✔️ `SSL certificate` with auto-renewal
  - ✔️ `Let's Encrypt` as a certificate authority
  - ✔️ `CertBot` as a certificate creating and renewing tool
- ✔️ `Docker` as a containerization platform
- ✔️ `NGINX` as a web server

## Requirements

- 🔴 Own a domain name, default one from any VPS hosting services also works.
- 🔴 VPS instance with Linux OS:
  - ✔️`Centos6` [verified]
  - ✔️`Centos7` [verified]
  - ❔ Another [not yet verified]

|Hardware requirements           |Minimum      |
|:-------------------------------|:------------|
|CPU Cores                       |1 CPU core   |
|Storage                         |20 GB        |
|RAM                             |1 GB         |

## Setup

Everything is build in, just need to setup some credentials in multiple different places. Then you will be able to use scripts to deploy WordPress to your VPS instance. Don't skip any step, each of them is important.

### 1. Prepare VPS

### 2. Nginx

Open file `deployment/nginx-conf/nginx.conf`. Replace `********` by your domain name in 6 different places, make sure you don't miss any. File lines: 5, 52, 57, 58.

> The domain name is doubled two times for `www` and `non-www` versions. Keep it.

### 3. MySQL credentials

Open file `deployment/.env`. Replace `********` by your database credentials. You can use any. At first deployment it will be used to create database and user. For the next times it will be used for authentication. Make sure you don't change this file after first deployment, in other case you may have issues because incorrect credentials.

- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `MYSQL_ROOT_PASSWORD`

> Make sure you have visible hidden files in your file explorer.

### 4. CertBot + Let's Encrypt (SSL)

Open file `deployment/.env`. Replace `********` by your data.

- `SSL_CERTIFICATE_EMAIL` - email address that will be used as owner of domain name
- `SSL_CERTIFICATE_DOMAIN` - your domain name

### 5. SSL certificate: create, use and renew

`CertBot` + `Let's Encrypt` will create SSL certificate for your domain name. It will be used by `NGINX` to serve your website via `HTTPS`. You need to follow this tutorial just once, then it will be auto-renewed.

#### 5.1 🔄 Force renewal

Open file `deployment/.env`. Make sure `SSL_START_MODE` is set to `force-renewal`

```bash
SSL_START_MODE=force-renewal
```

#### 5.2 ☁️ Deploy

Deploy `deployment` folder to VPS using **[Deploy Instruction](https//github.com/IvanMurzak/WordPress-VPS/README_DEPLOY.md)**.

#### 5.3 🔎 Validate

Verify that HTTPS works after 30 seconds by opening your domain name in browser. If doesn't check your domain name DNS settings.

#### 5.4 💠 Staging

Open file `deployment/.env`. Make sure `SSL_START_MODE` is set to `staging`

```bash
SSL_START_MODE=staging
```

#### 5.5 ☁️ Deploy (again)

Deploy `deployment` folder to VPS using **[Deploy Instruction](https//github.com/IvanMurzak/WordPress-VPS/README_DEPLOY.md)**.

## 6. Finish 🏁

All done! You can now open your domain name in browser and see your WordPress website. You can also open `https://www.ssllabs.com/ssltest/analyze.html?d=yourdomainname.com` to verify that your SSL certificate is valid.

---

## Deploy

### Windows

- Install `PuTTY`
  - accept SSH connection with your VPS instance by using IP address and Password
- (optional) Install `WinSCP`

### Linux & Mac [not yet covered]

Contributions are welcome! Need to translate `.bat` scripts to `.sh` and test them.

### 1. VPS connection

Windows: `commands/windows/_configs.bat`
Linux & Mac: `commands/linux/_configs.sh`

Open the `_configs` file related to your OS.
Replace `****` by IP and Password to the VPS instance.

### 4. Setup SSL

## Thanks to

- 🌟 **Denys Budelkov** for his help with scripts creation.
- 🌟 **[DigitalOcean](https://www.digitalocean.com/)** for their great tutorials that helped me to bring all together. **[Hot To Install WordPress With Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose).**
