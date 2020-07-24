#!/bin/zsh

# check if config folder exists where the veracrypt volume should be mounted, if not then attempt to mount
if [[ ! -a /tmp/vc/config    ]]; then
    veracrypt -t -k "" -m=nokernelcrypto,ts --protect-hidden=no --pim=0 /mnt/c/Users/npraskins.cforat/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc
    sed 's/M\:\/ssh_keys\//~\/\.ssh\//g' /tmp/vc/config | sed 's/C\:\\Windows\\System32\\OpenSSH\\ssh\.exe/ssh/g' > ~/.ssh/config
    cp -r /tmp/vc/ssh_keys/* ~/.ssh
    # fix permissions
    chmod 0600 ~/.ssh/*
    if [[ ! $1 ]]; then
        echo "mounted vol and copied keys, dismounting now"
        veracrypt -d
    else
        echo "keeping veracrypt vol mounted"
        echo $1
    fi
fi

