ip addr flush dev eth1
ip link set dev eth1 address 00:00:00:00:00:20
ip link add link eth1 name eth1.1 type vlan id 1
ip addr add 192.168.201.2/30 brd 192.168.201.3 dev eth1.1
ip link set dev eth1.1 up 
ip route del default 
ip route add default via 192.168.201.1
ip link add link eth1 name eth1.100 type vlan id 100
ip addr add 100.1.1.20/24 brd 100.1.1.255 dev eth1.100
ip link set dev eth1.100 up 
ip route add 101.1.1.0/24 via 100.1.1.253

