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
echo "1\n"
echo "ServerPasswordSet\n"
echo "Press Enter to continue."
read
sudo cat >> /lib/systemd/system/vpnserver.service << EOF
[Unit]
Description=SoftEther VPN Server
After=network.target
[Service]
Type=forking
ExecStart=
ExecStart=/usr/local/vpnserver/vpnserver start
ExecStop=/usr/local/vpnserver/vpnserver stop
[Install]
WantedBy=multi-user.target
EOF
echo "\n"
echo net.ipv4.ip_forward = 1 | ${SUDO} tee -a /etc/sysctl.conf
systemctl enable vpnserver
systemctl start vpnserver
systemctl status vpnserver
ufw allow 443
ufw allow 500,4500/udp
ufw allow 1701
ufw allow 1194
ufw allow 5555
systemctl enable vpnserver
systemctl start vpnserver
systemctl status vpnserver
