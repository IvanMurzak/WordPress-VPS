# WordPress VPS - Deploy Instruction

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

## Option: Use scripts to handle deployment

This is easy way, highly recommended to use.

1. Establish SSH connection with VPS instance
2. ...

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

---

## Option: Manual deployment

If you want to deploy manually, you can do that.

1. `deployment` folder from this repository should be copies to your VPS instance to this location `~/deployment`
2. execute this commands in terminal at VPS instance

```bash
cd ~/deployment
sudo service docker start
sudo docker-compose down
sudo docker-compose build
sudo docker-compose up -d
```

---

**Docker compose layout**

> - `webserver` - Nginx
> - `wordpress` - WordPress application
> - `certbot` - SSL certificate creating and renewing
> - `db` - MySQL database, used by WordPress
