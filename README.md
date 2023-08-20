# WordPress VPS

- WordPress at `VPS` in `Docker`
- Auto-renewal SSL certificate (HTTPS) by `Let's Encrypt` and `CertBot`
- Custom Domain name
- Build-in `Nginx`

## Requirements

- VPS instance
  - Centos6 [Verified]
  - Centos7 [Verified]
- IP address and Password of the VPS instance
- To have any Domain name

---

## Setup

Everything is build in, just need to setup some credentials in multiple different places. Then you will be able to use scripts to deploy WordPress to your VPS instance. Don't skip any step, each of them is important.

### 1. Nginx

Open file `deployment/nginx-conf/nginx.conf`. Replace `********` by your domain name in 6 different places, make sure you don't miss any. File lines: 5, 52, 57, 58.

> The domain name is doubled two times for `www` and `non-www` versions. Keep it.

### 2. MySQL credentials

Open file `deployment/.env`. Replace `********` by your database credentials. You can use any.

- `MYSQL_USER`
- `MYSQL_PASSWORD`
- `MYSQL_ROOT_PASSWORD`

> At first deployment it will be used to create database and user. For the next times it will be used for authentication. Make sure you don't change this file after first deployment, in other case you may have issues because incorrect credentials.

> Make sure you have visible hidden files in your file explorer.

### 3. CertBot + Let's Encrypt (SSL)

Open file `deployment/.env`. Replace `********` by your data.

- `SSL_CERTIFICATE_EMAIL` - email address that will be used as owner of domain name
- `SSL_CERTIFICATE_DOMAIN` - your domain name

### 4. Create and use SSL certificate

CertBot + Let's Encrypt will create SSL certificate for your domain name. It will be used by Nginx to serve your website via HTTPS. You need to run this command only once, then it will be auto-renewed.

#### Step 1

Open file `deployment/.env`. Make sure `SSL_START_MODE` is set to `--force-renewal`

```bash
SSL_START_MODE=--force-renewal
```

#### Step 2
Deploy `deployment` folder to VPS using one of the methods described below.

## Deploy to VPS from Windows

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
