#!/bin/bash
# script to setup hunting tools

if [ "$EUID" -ne 0 ]
    then echo "Run as root!"
    exit
fi

cd ~/

add-apt-repository universe -y
apt update && apt upgrade -y

programs=(
curl
net-tools
python3-pip
git
python3
default-jre
default-jdk
python3-impacket
nmap
tree
tmux
ruby-full
ruby-railties
apt-transport-https
libcap2-bin
mlocate
traceroute
gnupg
ca-certificates
docker
docker-compose
cewl
john
hashcat
nikto
wfuzz
masscan
hydra
cewl
whois
)

# install each tools using APT
echo "[+] Installing APT programs"
for tool in "${programs[@]}"; do
       apt install "$tool" -y
done
echo "[+] Done"

# install go, manually update to latest version
echo "[+] Installing GO"
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
ln -s /usr/local/go/bin/go /usr/local/bin/go
echo "[+] Done"

go_programs=(
github.com/owasp-amass/amass/v4/...@master
github.com/ffuf/ffuf/v2@latest
github.com/tomnomnom/assetfinder@latest
github.com/lc/gau/v2/cmd/gau@latest
github.com/tomnomnom/gf@latest
github.com/OJ/gobuster/v3@latest
github.com/hakluke/hakrawler@latest
github.com/tomnomnom/httprobe@latest
github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
github.com/tomnomnom/waybackurls@latest
github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
github.com/projectdiscovery/httpx/cmd/httpx@latest
)

# install go programs
echo "[+] Installing GO programs"
for url in "${go_programs[@]}"; do
	go install -v "$url"
done
echo "[+] Done"

# symlink go programs
echo "[+] Symlinking GO programs"
ln -s /root/go/bin/amass /usr/local/bin/amass
ln -s /root/go/bin/ffuf /usr/local/bin/ffuf
ln -s /root/go/bin/assetfinder /usr/local/bin/assetfinder
ln -s /root/go/bin/gau /usr/local/bin/gau
ln -s /root/go/bin/gf /usr/local/bin/gf
ln -s /root/go/bin/gobuster /usr/local/bin/gobuster
ln -s /root/go/bin/hakrawler /usr/local/bin/hakrawler
ln -s /root/go/bin/httprobe /usr/local/bin/httprobe
ln -s /root/go/bin/subfinder /usr/local/bin/subfinder
ln -s /root/go/bin/waybackurls /usr/local/bin/waybackurls
ln -s /root/go/bin/nuclei /usr/local/bin/nuclei
ln -s /root/go/bin/httpx /usr/local/bin/httpx
ln -s /root/usr/bin/python3 /usr/bin/python
echo "[+] Done"

# installing Sqlmap
echo "[+] Installing Sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git /opt/Sqlmap
echo 'alias sqlmap="python3 /opt/sqlmap-dev/sqlmap.py"' >> ~/.bashrc
source ~/.bashrc
echo "[+] Done"

# installing Ghauri
echo "[+] Installing Ghauri"
git clone https://github.com/r0oth3x49/ghauri.git /opt/Ghauri
python3 /opt/ghauri/setup.py install
echo "[+] Done"

# installing Paramspider
echo "[+] Installing Paramspider"
git clone https://github.com/devanshbatham/ParamSpider.git /opt/Paramspider
python3 /opt/Paramspider/setup.py install
echo "[+] Done"

# installing dirsearch
echo "[+] Installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch
python3 /opt/dirsearch/setup.py install
echo "[+] Done"

# installing seclists
echo "[+] Installing SecLists"
git clone https://github.com/danielmiessler/SecLists.git /opt/seclists
echo "[+] Done"

# installing metasploit-framework
echo "[+] Installing metasploit"
mkdir /opt/metasploit-framework
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /opt/metasploit-framework/msfinstall
chmod 755 /opt/msfinstall
/opt/msfinstall
echo "[+] Done"

# installing Arjun
echo "[+] Installing Arjun"
pip3 install arjun
echo "[+] Done"

# install WpScan
echo "[+] Installing WpScan"
gem install wpscan
echo "[+] Done"

# post installing GF
echo "[+] Post install GF"
git clone https://github.com/tomnomnom/gf.git /usr/local/go/src/
echo 'source /usr/local/go/src/gf/gf-completion.bash' >> ~/.bashrc
git clone https://github.com/emadshanab/Gf-Patterns-Collection.git
cd Gf-Patterns-Collection && chmod +x set-all.sh && ./set-all.sh
echo "[+] Done"

# post installing python3-impacket
echo "[+] Post install python3-impacket"
cp /usr/share/doc/python3-impacket/examples/* /usr/bin/
echo "[+] Done"

# setup tmux configuration file
echo "[+] Setting up Tmux configuration"
echo """
set -g mouse on
set-option -g prefix C-a

# use xclip to copy and paste with the system clipboard
bind C-c run "tmux save-buffer - | xclip -i -sel clip"
bind C-v run "tmux set-buffer $(xclip -o -sel clip); tmux paste-buffer"

# split panes
bind-key Down split-window -v
bind-key Right split-window -h

# navigating panes
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
""" > ~/.tmux.conf
echo "[+] Done"

# setup colored prompt
echo "[+] Setting up fancy prompt"
echo """
case "$TERM" in
    xterm-color|xterm-256color) color_prompt=yes;;
esac
""" >> ~/.bashrc
echo "[+] Done"

# update ~/.bash_profile
echo "[+] Updating bash_profile"
echo """
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -f ~/.tmux.conf ]; then
    tmux source-file ~/.tmux.conf
fi
""" >> ~/.bash_profile
echo "[+] Done"
