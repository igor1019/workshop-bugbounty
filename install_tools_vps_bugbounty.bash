#!/bin/bash
# Bash script to automate install v0.1
# Created by Igor Rossi 08/28/2022
# Tested on Ubuntu 22.04 in Digital Ocean

# Remove needrestart
apt remove needrestart -y

# Update e upgrade ubuntu

apt update && apt upgrade -y

# Install golang
cd ~
wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz 
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc
sleep 1
rm -rf go1.19.linux-amd64.tar.gz

# Install pip
apt install python3-pip -y

# Install amass
snap install amass 

# Install uro
pip3 --disable-pip-version-check install uro

# Install bhedak (similar qsreplace)
pip3 --disable-pip-version-check install bhedak

# Install unzip
apt install unzip -y

# Install coreutils
apt install coreutils -y

# Install net-tools
apt install net-tools -y

# Install sqlmap
apt install sqlmap -y

sleep 1

# Install golang tools

cd ~
go install github.com/tomnomnom/assetfinder@latest
go install -v github.com/tomnomnom/anew@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install github.com/bp0lr/gauplus@latest
go install github.com/deletescape/goop@latest
go install github.com/hakluke/hakcheckurl@latest
go install github.com/tomnomnom/meg@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/waybackurls@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/takshal/freq@latest
go install github.com/j3ssie/sdlookup@latest
go install github.com/d3mondev/puredns/v2@latest
go install -v github.com/hueristiq/hqurlfind3r/cmd/hqurlfind3r@latest
go install github.com/ferreiraklet/airixss@latest
go install github.com/tomnomnom/qsreplace@latest
go install github.com/ferreiraklet/nilo@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/hakluke/hakrawler@latest
go install github.com/lc/subjs@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install github.com/tomnomnom/unfurl@latest
go install github.com/tomnomnom/gf@latest
go install -v github.com/lukasikic/subzy@latest
go install github.com/hahwul/dalfox/v2@latest
go install github.com/ferreiraklet/nilo@latest

mv ~/go/bin/* /usr/bin/

sleep 1


# Install git tools

mkdir -p ~/tools
cd ~/tools

curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip
chmod +x findomain
mv findomain /usr/bin/
rm findomain-linux.zip


git clone https://github.com/guelfoweb/knock.git
pip3 --disable-pip-version-check install -r knock/requirements.txt


git clone https://github.com/s0md3v/Photon.git
pip3 --disable-pip-version-check install -r Photon/requirements.txt


git clone --recursive https://github.com/screetsec/Sudomy.git
pip3 --disable-pip-version-check install -r Sudomy/requirements.txt


git clone https://github.com/vortexau/dnsvalidator.git
cd dnsvalidator/
python3 setup.py install
cd ~/tools

git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
make install
cd ~/tools

git clone https://github.com/devanshbatham/ParamSpider
pip3 --disable-pip-version-check install -r ParamSpider/requirements.txt

git clone https://github.com/tomnomnom/gf.git
echo 'source ~/tools/gf/gf-completion.bash' >> ~/.bashrc
cp -r ~/tools/gf/examples ~/.gf

git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/tools/Gf-Patterns/*.json ~/.gf

# Remove some junk

apt autoremove -y