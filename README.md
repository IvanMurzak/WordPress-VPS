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

Deploy WordPress to VPS in Docker with SSL certificate by Let's Encrypt and CertBot. The project designed for simple usage, no advanced tech skills required. It contains scripts that will do all the work for you. Still need to setup credentials and run the scripts from your local computer.

If you need more control, this project allows you to do it. You can modify the scripts and `docker-compose.yml` file to fit your needs.

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

---

**Docker compose layout**

> - `webserver` - NGINX web server
> - `wordpress` - WordPress application
> - `certbot` - SSL certificate creating and renewing
> - `db` - MySQL database, used by WordPress

## Usage by scripts

There are bunch of scripts to help you with the setup, maintenance, debugging and monitoring.

1. `Deployed script` for VPS's terminal. Located: `./deployment/scripts`. This scripts should be at VPS instance and be executed. You can run them manually at VPS's terminal, or use `Local Script` to do that automatically.
2. `Local script` opens SSH connection automatically with VPS and send commands to VPS to execute.You can find them in the `./scripts` folder.
     - `Local script` for Windows OS. Located: `./scripts/windows`
     - `Local script` for Linux OS. Located: `./scripts/linux`

| Local | Deployed | Script | Description |
| :---: | :------: | :----- | :----       |
|✔️|✔️|`SetupVPS`|setup VPS environment with all needed apps|
|✔️|✔️|`DockerAddUserCentos`|adds user with name `centos` to docker|
|✔️|✔️|`DockerComposeDown`|runs `down` command for docker compose|
|✔️|✔️|`DockerComposeDownBuildUp`|runs `down`, `build up` commands for docker compose|
|✔️<br/><br/><br/><br/><br/><br/>|✔️<br/><br/><br/><br/><br/><br/>|`DockerComposeDownDeployBuildUp`<br/><br/><br/><br/><br/><br/>|`Local Script`:<br/>1. archive `deployment` at local computer,<br/>2. sends it to VPS.<br/>`Deployed script`:<br/>1. unpack archive<br/>2. runs `down`, `build up` for docker compose|
|✔️|✔️|`DockerComposeDownRemoveAll`|runs `down`, `build up` commands for docker compose|
|✔️|✔️|`DockerComposeStopStart`|runs `down`, `build up` commands for docker compose|
|✔️|✔️|`DockerRemoveVolumes`|runs `down`, `build up` commands for docker compose|
|✔️|✔️|`LogStreamWebServer`|Opens log stream for `webserver` docker instance|
|✔️|✔️|`LogStreamWordPress`|Opens log stream for `wordpress` docker instance|
|✔️|✔️|`LogStreamCertBot`|Opens log stream for `certbot` docker instance|
|✔️|✔️|`LogStreamDB`|Opens log stream for `db` docker instance|
|✔️|❌|`Terminal`|Opens SSH connection, allows to type commands|
|✔️|❌|`TerminalDedicated`|Opens SSH connection, allows to type commands in dedicated window|

## Setup

Please follow instruction in the right order. Don't skip any step, each of them is important. There are two setup options. I personally recommend to use the first one, it's longer to setup and much easier to use.

### Option 1: **[Setup by scripts](https://github.com/IvanMurzak/WordPress-VPS/blob/main/README_SETUP_BY_SCRIPTS.md)**

Execute local scripts at your local computer that automatically open SSH connection and send commands to VPS. It's much easier to use, but requires more time to setup.

|Pros|Cons|
|:---|:---|
|✔️ Fast access to bunch of scripts from your computer|❌ Requires more time to install|
|✔️ Executing scripts by mouse double click|❌ Complicated at Windows OS|
|✔️ No need to open SSH connection manually||
|✔️ Good for long term support||
|✔️ Allows to run custom commands by `Local Script`:<br/>---- `Terminal`<br/>---- `TerminalDedicated`||

### Option 2: **[Setup manually](https://github.com/IvanMurzak/WordPress-VPS/blob/main/https/github.com/IvanMurzak/WordPress-VPS/README_SETUP_MANUALLY.md)**

Open SSH connection with VPS on your own and type commands manually. It's much faster to setup, but requires more time to use.

|Pros|Cons|
|:---|:---|
|✔️ Easy to setup|❌ Need manually type commands|
|✔️ Allows to run custom commands|❌ Need manually open SSH connection|

---

## Thanks

- 🌟 **Denys Svitelskyi** for his help with bash scripts creation.
- 🌟 **[DigitalOcean](https://www.digitalocean.com/)** for their great tutorials that helped me to bring all together. **[Hot To Install WordPress With Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose).**
