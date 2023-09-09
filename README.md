# allinone
## Working with VPS
### connect via ssh
```
root@ip_address
```

### upload file to vps
```
scp /path/to/local-file root@ip_address:/remote/path/to/upload/to
```

### download file from vps
```
scp root@ip_address:/path/to/remote/file /local/path/to/download/to
```

### setup notification
```
https://anubhav-singh.medium.com/notification-system-for-your-bug-bounty-automation-7b13af1b7372
```

## Bash script to automatically install testing tools.
- download the setup.sh and change file mode
- execute script

## Setup Tmux configuration file
- download the .tmux.conf and place it in ~/ directory
- tmux source-file ~/.tmux.conf

## set a fancy prompt in .bashrc
```
case "$TERM" in
    xterm-color|xterm-256color) color_prompt=yes;;
esac

force_color_prompt=yes
```
