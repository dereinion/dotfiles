# Tearing remove
## Try this
Open file:
$ sudo nano /etc/modprobe.d/nvidia-drm-nomodeset.conf

Paste in file:
$ options nvidia-drm modeset=1

After that:
$ sudo update-initramfs -u

Check with this command (should be Y):
$ sudo cat /sys/module/nvidia_drm/parameters/modeset

## Also can try
Force composition pipeline
$ nvidia-settings --assign CurrentMetaMode="$(xrandr | sed -nr '/(\S+) connected (primary )?([0-9]+x[0-9]+)(\+\S+).*/{ s//\1: \3 \4 { ForceCompositionPipeline = On }, /; H}; ${ g; s/\n//g; s/, $//; p }')"

Force full composition pipeline
$ nvidia-settings --assign CurrentMetaMode="$(xrandr | sed -nr '/(\S+) connected (primary )?([0-9]+x[0-9]+)(\+\S+).*/{ s//\1: \3 \4 { ForceFullCompositionPipeline = On }, /; H}; ${ g; s/\n//g; s/, $//; p }')"

To enable after reboot:
$ bash -c "sleep 10 && nvidia-settings --assign CurrentMetaMode=\"$(xrandr | sed -nr '/(\S+) connected (primary )?([0-9]+x[0-9]+)(\+\S+).*/{ s//\1: \3 \4 { ForceCompositionPipeline = On }, /; H}; ${ g; s/\n//g; s/, $//; p }')\""

or

$ bash -c "sleep 10 && nvidia-settings --assign CurrentMetaMode=\"$(xrandr | sed -nr '/(\S+) connected (primary )?([0-9]+x[0-9]+)(\+\S+).*/{ s//\1: \3 \4 { ForceFullCompositionPipeline = On }, /; H}; ${ g; s/\n//g; s/, $//; p }')\""

## In Firefox
Type "about:config" on the address bar.
Search for layers.acceleration.force-enabled (default is false).
Change it to true by double-clicking.
Save and restart Firefox.

Scale content with layout.css.devPixelsPerPx change (to 1.25)

# Other useful things
List packages installed by user:
$ apt-mark showmanual

List all packages:
$ apt list --installed

# Log in Github
Open a terminal/shell and type:

$ git config --global user.name "Your name here"
$ git config --global user.email "your_email@example.com"


I also do:

$ git config --global color.ui true
$ git config --global core.editor nvim 

Set up ssh on your computer. I like Roger Peng’s guide to setting up password-less logins. Also see github’s guide to generating SSH keys.
Look to see if you have files ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub.

If not, create such public/private keys: Open a terminal/shell and type:

$ ssh-keygen -t rsa -C "your_email@example.com"

Copy your public key (the contents of the newly-created id_rsa.pub file) into your clipboard. On a Mac, in the terminal/shell, type:

$ pbcopy < ~/.ssh/id_rsa.pub

Paste your ssh public key into your github account settings.
Go to your github Account Settings
Click “SSH Keys” on the left.
Click “Add SSH Key” on the right.
Add a label (like “My laptop”) and paste the public key into the big text box.

In a terminal/shell, type the following to test it:

$ ssh -T git@github.com

If it says something like the following, it worked:

Hi username! You've successfully authenticated, but Github does not provide shell access.

## Sync time dualboot Windows 
$ timedatectl set-local-rtc 1 --adjust-system-clock

# Noise cancellation
Edit /etc/pulse/default.pa and add the following text at the bottom (Just what's between the lines)

$ load-module module-echo-cancel source_name=noechosource sink_name=noechosink
$ set-default-source noechosource
$ set-default-sink noechosink

Then run: 
$ pulseaudio -k

## For sound fix
$ sudo apt-get install pavucontrol
Go to input devices, unlock channels and mute the front right channel
