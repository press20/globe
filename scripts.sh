#!/bin/bash

# remerber to set this file too have permision::
# set chmod 777

echo "Install Chrome Remote Desktop"

curl https://dl.google.com/linux/linux_signing_key.pub \
    | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/chrome-remote-desktop.gpg
echo "deb [arch=amd64] https://dl.google.com/linux/chrome-remote-desktop/deb stable main" \
    | sudo tee /etc/apt/sources.list.d/chrome-remote-desktop.list
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive \
    apt-get install --assume-yes chrome-remote-desktop

echo "X Windows System"
echo "Using Xfce"
sudo DEBIAN_FRONTEND=noninteractive \
    apt install --assume-yes xfce4 desktop-base dbus-x11 xscreensaver

echo "Configure Chrome Remote Desktop to use Xfce by default"
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'

echo "no display so do this:"
sudo systemctl disable lightdm.service

echo "install Chrome for use as browser"

curl -L -o google-chrome-stable_current_amd64.deb \
https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken ./google-chrome-stable_current_amd64.deb

#setup a headless Chrome  ... this is an example
#DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AcvDMrC_P4d62pFye-pdWKDjuwLUTl2nubQzgk4XnGTf6W7zgoF_My8kpUZwPezdfTNt8A" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) 

# PIN: 448988