apt-get update
apt-get upgrade -y
apt-get -y install build-essential wget make curl gcc  wget zlib1g-dev tzdata git libreadline-dev libncurses-dev libssl-dev
wget "https://www.softether-download.com/files/softether/v4.43-9799-beta-2023.08.31-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.43-9799-beta-2023.08.31-linux-x64-64bit.tar.gz"
tar xzf "softether-vpnserver-v4.43-9799-beta-2023.08.31-linux-x64-64bit.tar.gz"
cd vpnserver
make
cd ..
mv vpnserver /usr/local
cd /usr/local/vpnserver/
chmod 600 *
chmod 700 vpnserver vpncmd
./vpnserver start
./vpncmd
