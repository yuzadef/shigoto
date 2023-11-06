sudo add-apt-repository universe -y
sudo apt update && apt upgrade -y

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
whois
)

echo "[+] Installing APT programs"
for tool in "${programs[@]}"; do
       sudo apt install "$tool" -y
done
echo "[+] Done"

# install go, manually update to latest version
echo "[+] Installing GO"
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
sudo ln -s /usr/local/go/bin/go /usr/local/bin/go
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
github.com/BishopFox/jsluice/cmd/jsluice@latest
)

# install go programs
echo "[+] Installing GO programs"
for url in "${go_programs[@]}"; do
        go install -v "$url"
done

# symlink go programs
echo "[+] Symlinking GO programs"
sudo ln -s ~/go/bin/jsluice /usr/local/bin/jsluice
sudo ln -s ~/go/bin/amass /usr/local/bin/amass
sudo ln -s ~/go/bin/ffuf /usr/local/bin/ffuf
sudo ln -s ~/go/bin/assetfinder /usr/local/bin/assetfinder
sudo ln -s ~/go/bin/gau /usr/local/bin/gau
sudo ln -s ~/go/bin/gf /usr/local/bin/gf
sudo ln -s ~/go/bin/gobuster /usr/local/bin/gobuster
sudo ln -s ~/go/bin/hakrawler /usr/local/bin/hakrawler
sudo ln -s ~/go/bin/httprobe /usr/local/bin/httprobe
sudo ln -s ~/go/bin/subfinder /usr/local/bin/subfinder
sudo ln -s ~/go/bin/waybackurls /usr/local/bin/waybackurls
sudo ln -s ~/go/bin/nuclei /usr/local/bin/nuclei
sudo ln -s ~/go/bin/httpx /usr/local/bin/httpx
sudo ln -s /usr/bin/python3 /usr/bin/python
echo "[+] Done"

# installing sqlmap
pip3 install sqlmap
sudo ln -s ~/.local/bin/sqlmap /usr/local/bin/sqlmap

# installing seclists
sudo git clone https://github.com/danielmiessler/SecLists.git /usr/share/seclists

# install arjun
pip3 install arjun

# install wpscan
sudo gem install wpscan

# installing Ghauri
echo "[+] Installing Ghauri"
sudo git clone https://github.com/r0oth3x49/ghauri.git /opt/ghauri
pip3 install -r requirements.txt
sudo python3 /opt/ghauri/setup.py install
echo "[+] Done"

# installing Paramspider
echo "[+] Installing Paramspider"
sudo git clone https://github.com/devanshbatham/ParamSpider.git /opt/paramspider
sudo python3 /opt/Paramspider/setup.py install
echo "[+] Done"

# post installing GF
echo "[+] Post install GF"
sudo git clone https://github.com/tomnomnom/gf.git /usr/local/go/src/
echo 'source /usr/local/go/src/gf/gf-completion.bash' >> ~/.bashrc
sudo cp /usr/local/go/src/gf/examples/* ~/.gf
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
