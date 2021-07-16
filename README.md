# pi-nvr

IaC repo to run a raspberry pi 4 as an NVR/Monitor

# Installation

- Download and install [the Raspberry Pi Imager](https://www.raspberrypi.org/software/)
- Select "Raspberry Pi OS (32-bit)" and write the image to your SD Card
- Insert the SD Card into the Raspberry Pi and boot up. You'll need to run through initial setup (Wi-Fi, timezone, etc) and reboot
- Open a terminal and clone the repo
```bash
git clone https://github.com/crocokyle/pi-nvr.git
```
- Find your Google DDNS Credentials
  - Open your [Google Domains Dashboard](https://domains.google.com/registrar)
  - Select your domain
  - `DNS` > `Show Advanced Settings` > `Manage dynamin DNS` > `View Credentials`

- Run the first installation script
```bash
cd pi-nvr
./install-1.sh
```
  - Follow the prompts and reboot the pi when complete
- Run the second installation script
```bash
cd pi-nvr
./install-2.sh
```

# Configuration

## Touch Screen Configuration
- Open `File Manger` > `Edit` > `Preferences` > `General`
- Check "Open files with single click"
- Check "Don't ask options on launch executable file"

## Xoema Configuration
- Click the `Window Options button` (Bottom-right - 5th button) > `Window Settings`
- Check "Fullscreen mode"
- Click "Ok"
- Click the `Preferences button` (Bottom-right - 1st button) > `Install` > `Install`
- Check "Autorun the client"
- Set a remote access password
- Click "Ok"
- Click the `Preferences button` (Bottom-right - 1st button) > `Remote access` > `Users`
- Set a remote access password
- Click "Ok"

## TODO
- Max storage config
- Camera setup
- Email/SMS Notifications
- Motion Detection
