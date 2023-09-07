# allinone
## Bash script to automatically install bug bounty hunting tools.
- download the setup.sh and change file mode
- execute script

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

## Setup Tmux configuration file
- download the .tmux.conf and place it in ~/ directory
- tmux source-file ~/.tmux.conf

## Update .bashrc for colored terminal
### Set a fancy prompt (non-color, unless we know we "want" color)
```
case "$TERM" in
    xterm-color|xterm-256color) color_prompt=yes;;
esac
```
