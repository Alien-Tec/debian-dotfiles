<h1 align="center">My Desktop Setup</h1>

<img src="/.github/screenshots/desktop.png" width="100%" />

## Run installer

```
git clone https://github.com/agung-satria/debian-dotfiles.git ~/.dotfiles
cd ~/.dotfiles/
./install-bspwm.sh
```

## Settings

### Disable power button

- **edit:** `sudo nvim /etc/systemd/logind.conf`
- **set:** `HandlePowerKey=ignore`

### Enable tap to click

```sh
sudo cp /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/
sudo nvim /etc/X11/xorg.conf.d/40-libinput.conf
```

Add this section

```sh
# for touchpad
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "True"
EndSection

# for mouse
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "False"
EndSection
```

Then logout and login to apply.
