# Running Dotfiles
alias ansible-run='ansible-playbook -i ~/.playbooks/inventory.conf -c local $@ ~/.playbooks/site.yml --ask-vault-pass'
alias ansible-sudo='ansible-run -K'
alias ansible-system='ansible-sudo --tags=dotfiles'
alias ansible-dotfiles='ansible-run --tags=dotfiles'
alias ansible-vim='ansible-run --tags=vim'

# Mounting/unmounting secure

lock() {
    sudo umount /media/lockbox && echo "Locked"
}

unlock() {
    bindfs -n -p 0700 -u $(id -u) -g $(id -g) /media/DATASHUR /media/lockbox
    echo "Unlocked"
}

# Default options
alias ls='ls --color'

# Other useful aliases
alias open='xdg-open'

# VPN management
v(){
    ps aux | grep "[v]pnc /etc/vpnc/vpn-ds-$1.conf" > /dev/null;
    if [ $? -eq 1 ]; then
        echo "Starting $1 VPN"
        sudo netctl stop vpn-ds-$1
        sudo netctl start vpn-ds-$1
    else
        echo "Stopping $1 VPN"
        sudo netctl stop vpn-ds-$1
    fi
}

vs() {
    v staging
}

vo() {
    v openstack
}
