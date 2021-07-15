# pi-nvr Installation

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
  - DNS > Show Advanced Settings > Manage dynamin DNS > View Credentials
- Edit the DDNS configuration file and add your username/password
```bash
nano inadyn.conf
```
  - `CTRL + X > Y > ENTER` to save
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
