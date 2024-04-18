#!/usr/bin/bash

# script to install tools (Kali Linux)
# if not running on Kali, remove the comment
# the commented lines mean the tools are already installed

cd /tmp
sudo apt update && sudo apt upgrade -y

programs=(
# curl
# net-tools
# python3-pip
# git
# python3
# default-jre
# default-jdk
python3-impacket
# nmap
# tree
# tmux
# ruby-full
apt-transport-https
# libcap2-bin
# traceroute
# gnupg
docker.io
# cewl
# john
# hashcat
# nikto
# wfuzz
# masscan
# hydra
# whois
# sqlmap
arjun
# wpscan
)

echo "[+] INSTALL APT BINARIES"
for tool in "${programs[@]}"; do
       sudo apt install "$tool" -y
done
echo "[+] DONE"


echo "[+] INSTALL GO"
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
sudo ln -s /usr/local/go/bin/go /usr/bin/go
rm go1.21.0.linux-amd64.tar.gz
echo "[+] DONE"


go_programs=(
# github.com/owasp-amass/amass/v4/...@master
# github.com/ffuf/ffuf/v2@latest
github.com/tomnomnom/assetfinder@latest
github.com/lc/gau/v2/cmd/gau@latest
github.com/tomnomnom/gf@latest
github.com/OJ/gobuster/v3@latest
github.com/hakluke/hakrawler@latest
github.com/tomnomnom/httprobe@latest
github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
github.com/tomnomnom/waybackurls@latest
github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
# github.com/projectdiscovery/httpx/cmd/httpx@latest
github.com/BishopFox/jsluice/cmd/jsluice@latest
)


echo "[+] INSTALL GO BINARIES"
for url in "${go_programs[@]}"; do
        go install -v "$url"
done
echo "[+] DONE"


echo "[+] SYMLINKING GO BINARIES"
# sudo ln -s ~/go/bin/amass /usr/local/bin/amass
# sudo ln -s ~/go/bin/ffuf /usr/local/bin/ffuf
sudo ln -s ~/go/bin/assetfinder /usr/bin/assetfinder
sudo ln -s ~/go/bin/gau /usr/bin/gau
sudo ln -s ~/go/bin/gf /usr/bin/gf
sudo ln -s ~/go/bin/gobuster /usr/bin/gobuster
sudo ln -s ~/go/bin/hakrawler /usr/bin/hakrawler
sudo ln -s ~/go/bin/httprobe /usr/bin/httprobe
sudo ln -s ~/go/bin/subfinder /usr/bin/subfinder
sudo ln -s ~/go/bin/waybackurls /usr/bin/waybackurls
sudo ln -s ~/go/bin/nuclei /usr/bin/nuclei
sudo ln -s ~/go/bin/jsluice /usr/bin/jsluice
echo "[+] DONE"


echo "[+] DOWNLOAD SECLISTS WORDLISTS"
sudo git clone https://github.com/danielmiessler/SecLists.git /usr/share/seclists
echo "[+] DONE"


echo "[+] INSTALL GHAURI"
sudo git clone https://github.com/r0oth3x49/ghauri.git /opt/ghauri
pip3 install -r /opt/ghauri/requirements.txt
sudo python3 /opt/ghauri/setup.py install
echo "[+] DONE"


echo "[+] INSTALL PARAMSPIDER"
sudo git clone https://github.com/devanshbatham/ParamSpider.git /opt/paramspider
sudo python3 /opt/paramspider/setup.py install
echo "[+] DONE"


echo "[+] INSTALL GF TEMPLATES"
sudo git clone https://github.com/tomnomnom/gf.git /opt/gf
echo 'source /opt/gf/gf-completion.bash' >> ~/.bashrc
sudo echo 'source /opt/gf/gf-completion.bash' >> /root/.bashrc
mkdir ~/.gf && sudo cp /opt/gf/examples/* ~/.gf
sudo mkdir /root/.gf && sudo cp /opt/gf/examples/* /root/.gf
echo "[+] DONE"
