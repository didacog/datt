sudo virsh net-destroy dattnet
sudo virsh net-undefine dattnet

sudo ip addr flush dev dattnet
sudo ip link set dattnet down
sudo brctl delbr dattnet
sudo ip link delete datt-dummy type dummy

sudo iptables-restore -c < /tmp/orig.iptables
