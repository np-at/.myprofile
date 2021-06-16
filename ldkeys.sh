#!/bin/zsh

# check if config folder exists where the veracrypt volume should be mounted, if not then attempt to mount
if [[ ! -a /tmp/vc/config    ]]; then
 #   veracrypt -t -k "" -m=nokernelcrypto,ts --protect-hidden=no --pim=0 /mnt/c/Users/npraskins.cforat/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc

    if [[ $(uname -s) == 'Darwin' ]]; then
        veracrypt -t -k "" -m=ts --protect-hidden=no --pim=0 ~/local_keys  ~/.ssh

        # If keep flag is passed, we need to use ntfs-3g to mount filesystem in read/write mode
        if [[ $1 == '-k'  ]]; then

            veracrypt -t -k "" -m=ts --filesystem=none --protect-hidden=no --pim=0 ~/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys;
            KeysVol=$(VeraCrypt -t -l | grep -e "OneDrive - Center for Accessible Technology/tools/keys" |  sed 's/ /\n/g' | grep "/dev/") ;
            sudo ntfs-3g $KeysVol /tmp/vc -o local -o allow_other -o auto_xattr -o auto_cache ;
        else
            veracrypt -t -k "" -m=ts --protect-hidden=no --pim=0 ~/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc ;
        fi
    else
        veracrypt -t -k "" -m=nokernelcrypto,ts --protect-hidden=no --pim=0 ~/local_keys  ~/.ssh
        if [[ -a /mnt/c/Users/npraskins.cforat ]]; then
            veracrypt -t -k "" -m=nokernelcrypto,ts --protect-hidden=no --pim=0 /mnt/c/Users/npraskins.cforat/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc
        else
            if [[ -a /mnt/c/Users/curio ]]; then

                veracrypt -t -k "" -m=nokernelcrypto,ts --protect-hidden=no --pim=0 /mnt/c/Users/curio/OneDrive\ -\ Center\ for\ Accessible\ Technology/tools/keys /tmp/vc

            fi
        fi
    fi
    if [[ -a /tmp/vc/config ]]; then
        sed 's/M\:\/ssh_keys\//~\/\.ssh\//g' /tmp/vc/config | sed 's/C\:\\Windows\\System32\\OpenSSH\\ssh\.exe/ssh/g' > ~/.ssh/config
        cp -r /tmp/vc/ssh_keys/* ~/.ssh
        # fix permissions
        chmod 0600 ~/.ssh/*
    else
        echo "config file was not found"
    fi

        if [[ $1 == '-k'  ]]; then
            echo "keeping veracrypt vol mounted"
            echo $1
        elif [[ $1 == '-l' ]]; then
            echo "dismounting onedrive veracrypt file, keeping local ssh ssh_keys"
            if [[ -d '/private/tmp/vc' ]]; then
                veracrypt -d '/private/tmp/vc'
            else
                veracrypt -d '/tmp/vc'
            fi
        else
            echo "mounted vol and copied keys, dismounting now"
            veracrypt -d
        fi


fi

