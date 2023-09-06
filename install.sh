#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade


sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
cd ~/tools/
echo "done"



#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
					sudo tar -xvf go1.13.4.linux-amd64.tar.gz
					sudo mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
apt install -y awscli
echo "Don't forget to set up AWS credentials!"

#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install amass
go install -v github.com/owasp-amass/amass/v4/...@master
echo "done"

#install assetfinder
go install github.com/tomnomnom/assetfinder@latest
echo "done"

#install chromium
echo "Installing Chromium"
sudo snap install chromium
echo "done"

#install JSParser
echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"

#install Sublist3r
echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"

#install teh_s3_bucketeers
echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"

#install wpscan
echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "done"

#install dirsearch
echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"

#install lazys3
echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

#install virtual host discovery
echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"

#install sqlmap
echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

#install knock.py
echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"

#install lazyrecon
echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

#install nmap
echo "installing nmap"
sudo apt-get install -y nmap
echo "done"

#install massdns
echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

#install asnlookup
echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

#install httprobe
echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"

#install unfurl
echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl 
echo "done"

#install waybackurls
echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

#install crtndstry
echo "installing crtndstry"
git clone https://github.com/nahamsec/crtndstry.git
echo "done"

#download SecLists
echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"

#install hakrawler
echo "installing hakrawler"
go install github.com/hakluke/hakrawler@latest
echo "done"

#install httpx
echo "installing httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
echo "done"

#install nuclei
echo "installing nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
echo "done"

#install subfinder
echo "installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
echo "done"

#install ffuf
echo "installing ffuf"
go install github.com/ffuf/ffuf/v2@latest
echo "done"

#install gobuster
echo "install gobuster"
go install github.com/OJ/gobuster/v3@latest
echo "done"

#install gf
echo "install gf"
go install github.com/tomnomnom/gf@latest
echo "done"

#download gf-patterns

#install gau
echo "install gau"
go install github.com/lc/gau/v2/cmd/gau@latest
echo "done"


echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
