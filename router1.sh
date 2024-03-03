systemctl stop ufw 
systemctl disable ufw
curl -s https://deb.frrouting.org/frr/keys.asc | sudo apt-key add -
echo deb https://deb.frrouting.org/frr $(lsb_release -s -c) frr-stable > /etc/apt/sources.list.d/frr.list
apt update
apt install frr -y
echo "net.ipv4.conf.all.forwarding = 1" >> /etc/sysctl.conf
sysctl -p
sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons







