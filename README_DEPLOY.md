# WordPress VPS - Deploy Instruction

![License](https://img.shields.io/github/license/IvanMurzak/WordPress-VPS) ![Stars](https://img.shields.io/github/stars/IvanMurzak/WordPress-VPS) [![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)

1. Establish SSH connection with VPS instance
2. 

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

**Docker compose layout**

> - `webserver` - Nginx
> - `wordpress` - WordPress application
> - `certbot` - SSL certificate creating and renewing
> - `db` - MySQL database, used by WordPress