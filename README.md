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
</div><br/>

Self-hosting is the cheapest way to have a WordPress web page. But at the same time, it requires to have tech skills and waste some time on it. This project was done with the idea to fix this issue. 

It contains a bunch of scripts and configuration files that could be easily updated to your need and launched directly from your local computer. It creates a WordPress instance in a remote Virtual Private Server(VPS) instance, creates a local database at that VPS, and generates an SSL certificate to allow HTTPS access. Also supports custom domain names. All of that works out of the box. Just follow the instructions.

Deploy WordPress to VPS in Docker with SSL certificate by Let's Encrypt and CertBot. The project is designed for simple usage, no advanced tech skills are required. It contains scripts that will do all the work for you. Still need to setup credentials and run the scripts from your local computer.

If you need more control, this project allows you to do it. You can modify the scripts and `docker-compose.yml` file to fit your needs.

## Features

- ✔️ `VPS` support, even extremely cheap ones ($3.5/month - ovhcloud.com)
- ✔️ `Database` local MySQL database that is required for WordPress
- ✔️ `Custom domain name` ability to setup any domain name, don't forget to buy it first
- ✔️ `HTTPS` create and auto-renewal
  - ✔️ `SSL certificate` with auto-renewal
  - ✔️ `Let's Encrypt` as a certificate authority
  - ✔️ `CertBot` as a certificate-creating and renewing tool
- ✔️ `Docker` as a containerization platform
- ✔️ `NGINX` as a web server

![GitHub-Terminal-1](https://github.com/IvanMurzak/WordPress-VPS/assets/9135028/c2b184c7-a33a-4c6b-8ae4-2d64a46eb4ce)

## Requirements

- 🔴 Own a domain name, a default one from any VPS hosting service also works.
- 🔴 Verified Linux OS:
  - ✔️`Ubuntu 20.04`, ✔️`Ubuntu 21.04`, ✔️`Ubuntu 22.04`, ✔️`Ubuntu 23.04`
  - ✔️`Fedora 37`, ✔️`Fedora 38`
  - ✔️`Centos 6`, ✔️`Centos 7`
  - ✔️`Debian 12`
  - ❔ Another [not yet tried]

| Hardware requirements     | Minimum    |
| :------------------------ | :--------- |
| CPU Cores                 | 1 CPU core |
| Storage                   | 10 GB      |
| RAM                       | 1 GB       |

---

**Docker compose layout**

> - `nginx-certbot` - NGINX web server & CertBot SSL certificate creating and renewing
> - `wordpress` - WordPress application
> - `db` - MySQL Server, used by WordPress

## Scripts

There are a bunch of scripts to help you with the setup, maintenance, debugging, and monitoring.

| Script Type       | Location<br/><br/>     | Description<br/><br/> |
| :---------------- | :--------------------- | :-------------------- |
| `Local`<br/><br/> | `./scripts/linux`<br/>`./scripts/windows`  | This script should be executed on a local computer (not VPS). It opens SSH connection automatically with VPS and forwards commands to execute remotely |
| `Deployed`        | `./deployment/scripts` | Designed to be executed in a VPS environment, also could be executed remotely by `Local Script` |

### Scripts list

| Local | Deployed | Script | Description |
| :---: | :------: | :----- | :---------- |
|✔️|✔️|`SetupVPS`|setup VPS environment with all needed apps|
|✔️|✔️|`DockerAddUserCentos`|adds user with name `centos` to docker|
|✔️|✔️|`DockerComposeDown`|runs `down` command for docker compose|
|✔️|✔️|`DockerComposeDownBuildUp`|runs `down`, `build up` commands for docker compose|
|✔️<br/><br/><br/><br/><br/><br/>|✔️<br/><br/><br/><br/><br/><br/>|`DockerComposeDownDeployBuildUp`<br/><br/><br/><br/><br/><br/>|`Local Script`:<br/>1. archive `deployment` at local computer,<br/>2. sends it to VPS.<br/>`Deployed script`:<br/>1. unpack archive<br/>2. runs `down`, `build up` for docker compose|
|✔️|✔️|`DockerComposeDownRemoveAll`|runs `down`, `build up` commands for docker compose|
|✔️|✔️|`DockerComposeStopStart`|runs `down`, `build up` commands for docker compose|
|✔️|✔️|`DockerRemoveVolumes`|runs `down`, `build up` commands for docker compose|
|✔️|✔️|`LogNGINX_CertBot`|Opens log stream for `nginx-certbot` docker instance|
|✔️|✔️|`LogMySQL_Server`|Opens log stream for `db` docker instance|
|✔️|✔️|`LogWordPress`|Opens log stream for `wordpress` docker instance|
|✔️|❌|`Terminal`|Opens SSH connection, allows to type commands|
|✔️|❌|`TerminalDedicated`|Opens SSH connection, allows to type commands in dedicated window|

## Get started 🚀

### 1. Setup domain name

Open an admin panel of your domain name provider. Find DNS settings. Let's use demo domain name **`my-domain.com`** with demo IP address **`123.123.123.123`** to fill records. Please use your own domain name and IP address.

- Setup `A` record to point to **`123.123.123.123`**
- Setup `CNAME` record to point to **`my-domain.com`** record
- Setup `AAAA` record to point to **`IP v6 address`** (optional)

It will forward internet traffic from your domain name to the VPS instance. It may take up to 24 hours to apply changes.

| TYPE  | HOST                                | ANSWER                | TTL |
| :---- | :---------------------------------- | :-------------------- | :-- |
| A     | **`my-domain.com`**                 | **`123.123.123.123`** | 600 |
| AAAA  | **`my-domain.com`**                 | **`IP v6 address`**   | 600 |
| CNAME | *.**`my-domain.com`**               | **`my-domain.com`**   | 600 |

### 2. Setup configuration files

1. Open the file `./deployment/nginx-conf/nginx.conf` and replace `********` with your domain name in 6 different places. Make sure you don't miss any. File lines: 5 (twice), 25 (twice), 30, 31.

    > The domain name is doubled two times for `www` and `non-www` versions. Keep it.

2. Open the file `./deployment/.env` and replace `********` by your database credentials. You can use any.

    > Make sure you have visible hidden files in your file explorer.

#### Required by MySQL

- `MYSQL_USER`: The name of the MySQL user (choose any)
- `MYSQL_PASSWORD`: The password of the MySQL user (choose any)
- `MYSQL_ROOT_PASSWORD`: The password of the MySQL root user (choose any)

> At first deployment it will be used to create a database and user. The next time, it will be used for authentication. Make sure you don't change this file after the first deployment, in another case you may have issues because of incorrect credentials.

#### Required by Certbot

- `CERTBOT_EMAIL`: Your e-mail address. Used by Let's Encrypt to contact you in case of security issues.

#### Optional

- `DHPARAM_SIZE`: The size of the [Diffie-Hellman parameters](https://github.com/JonasAlfredsson/docker-nginx-certbot/blob/master/docs/good_to_know.md#diffie-hellman-parameters) (default: `2048`)
- `ELLIPTIC_CURVE`: The size / [curve] [15] of the ECDSA keys (default: `secp256r1`)
- `RENEWAL_INTERVAL`: Time interval between certbot's [renewal checks](https://github.com/JonasAlfredsson/docker-nginx-certbot/blob/master/docs/good_to_know.md#renewal-check-interval) (default: `8d`)
- `RSA_KEY_SIZE`: The size of the RSA encryption keys (default: `2048`)
- `STAGING`: Set to `1` to use Let's Encrypt's [staging servers](https://github.com/JonasAlfredsson/docker-nginx-certbot/blob/master/docs/good_to_know.md#initial-testing) (default: `0`)
- `USE_ECDSA`: Set to `0` to have certbot use [RSA instead of ECDSA](https://github.com/JonasAlfredsson/docker-nginx-certbot/blob/master/docs/good_to_know.md#ecdsa-and-rsa-certificates) (default: `1`)

#### Advanced

- `CERTBOT_AUTHENTICATOR`: The [authenticator plugin](https://github.com/JonasAlfredsson/docker-nginx-certbot/blob/master/docs/certbot_authenticators.md) to use when responding to challenges (default: `webroot`)
- `CERTBOT_DNS_PROPAGATION_SECONDS`: The number of seconds to wait for the DNS challenge to [propagate](https://github.com/JonasAlfredsson/docker-nginx-certbot/blob/masterdocs/certbot_authenticators.md#troubleshooting-tips) (default: certbot's default)
- `DEBUG`: Set to `1` to enable debug messages and use the [`nginx-debug`] [10] binary (default: `0`)
- `USE_LOCAL_CA`: Set to `1` to enable the use of a [local certificate authority](https://github.com/JonasAlfredsson/docker-nginx-certbot/blob/master/docs/advanced_usage.md#local-ca) (default: `0`)

### 3. Deploy & Start

Please follow the instructions in the right order. Don't skip any step, each of them is important. There are two setup options. I personally recommend using the first one, it's longer to set up and much easier to use.

#### Deploy Option 1: **[Deploy by scripts](./README_DEPLOY_BY_SCRIPTS.md)**

Execute local scripts at your local computer that automatically open SSH connection and send commands to VPS. It's much easier to use but requires more time to setup. **[Deploy by scripts](./README_DEPLOY_BY_SCRIPTS.md)**.

<details>
  <summary>✔️Pros & ❌Cons</summary>
  
  | Pros | Cons |
  | :--- | :--- |
  |✔️ Fast access to bunch of scripts from your computer|❌ Requires more time to install|
  |✔️ Executing scripts by mouse double click|❌ Complicated at Windows OS|
  |✔️ No need to open SSH connection manually||
  |✔️ Good for long-term support||
  |✔️ Allows to run custom commands by `Local Script`:<br/>---- `Terminal`<br/>---- `TerminalDedicated`||

</details>

#### Deploy Option 2: **[Deploy manually](./README_DEPLOY_MANUALLY.md)**

Open SSH connection with VPS on your own and type commands manually. It's much faster to setup, but requires more time to use. **[Deploy manually](./README_DEPLOY_MANUALLY.md)**.

<details>
  <summary>✔️Pros & ❌Cons</summary>

  | Pros | Cons |
  | :--- | :--- |
  |✔️ Easy to setup|❌ Need manually type commands|
  |✔️ Allows to run custom commands|❌ Need manually open SSH connection|

</details>

---

## Thanks

- 🌟 **Denys Svitelskyi** for his help with bash script creation.
- 🌟 **[DigitalOcean](https://www.digitalocean.com/)** for their great tutorials that helped me bring everything together. **[Hot To Install WordPress With Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose).**
