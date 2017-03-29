HOST_MAC=$(hexdump -vn3 -e '/3 "52:54:00"' -e '/1 ":%02x"' -e '"\n"' /dev/urandom)

sudo modprobe dummy
sudo ip link add datt-dummy address "$HOST_MAC" type dummy

sudo brctl addbr dattnet
sudo brctl stp dattnet on
sudo brctl addif dattnet datt-dummy
sudo ip address add 10.100.0.1/24 dev dattnet broadcast 10.100.0.255

sudo sysctl -w net.ipv4.ip_forward=1
sudo sysctl -w net.ipv4.conf.all.forwarding=1

sudo iptables-save -c > /tmp/orig.iptables
sudo iptables-restore -c < libvirt/netconf/datt.iptables


sudo virsh net-define libvirt/netconf/dattnet.xml
sudo virsh net-start dattnet
