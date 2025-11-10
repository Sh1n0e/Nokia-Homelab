ip addr flush dev eth1
ip link set dev eth1 addr 00:00:00:00:00:11
ip addr add 192.168.101.3/28 brd 192.168.101.15 dev eth1
ip link set dev eth1 up 
ip route del default 
ip route add default 192.168.101.1
ip link add link eth1 name eth1.101 type vlan id 101
ip addr add 101.1.1.11/24 brd 100.1.1.255 dev eth1.101
ip link set dev eth1.101 up 
ip route add 100.1.1.0/24 via 101.1.1.254

