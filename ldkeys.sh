#!/bin/zsh

# check if config folder exists where the veracrypt volume should be mounted, if not then attempt to mount
if [[ ! -a /tmp/vc/config    ]]; then
 #   veracrypt -t -k "" -m=nokernelcrypto,ts --protect-hidden=no --pim=0 /mnt/c/Users/npraskins.cforat/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc

    if [[ $(uname -s) == 'Darwin' ]]; then
        veracrypt -t -k "" -m=ts --protect-hidden=no --pim=0 ~/local_keys  ~/.ssh
        veracrypt -t -k "" -m=ts --protect-hidden=no --pim=0 ~/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc
    else
        veracrypt -t -k "" -m=nokernelcrypto,ts --protect-hidden=no --pim=0 /mnt/c/Users/npraskins.cforat/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc
    fi
    sed 's/M\:\/ssh_keys\//~\/\.ssh\//g' /tmp/vc/config | sed 's/C\:\\Windows\\System32\\OpenSSH\\ssh\.exe/ssh/g' > ~/.ssh/config
    cp -r /tmp/vc/ssh_keys/* ~/.ssh
    # fix permissions
    chmod 0600 ~/.ssh/*

    # if no arguments provided
    if [[ ! $1 ]]; then
        echo "mounted vol and copied keys, dismounting now"
        veracrypt -d
    else
        if [[ $1 == '-k'  ]]; then
            echo "keeping veracrypt vol mounted"
            echo $1
        elif [[ $1 == '-l' ]]; then
            echo "dismounting onedrive veracrypt file, keeping local ssh ssh_keys"
            veracrypt -d '/tmp/vc'
        fi
    fi
fi

