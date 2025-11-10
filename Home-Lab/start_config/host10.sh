ip addr flush dev eth1
ip link set dev eth1 address 00:00:00:00:00:10
ip addr add 192.168.101.2/28 brd 192.168.101.15 dev eth1
ip link set dev eth1 up 
ip route del default 
ip route add default via 192.168.101.1
ip link add link eth1 name eth1.100 type vlan id 100
ip addr add 100.1.1.10/24 brd 100.1.1.255 dev eth1.100
ip link set dev eth1.100 up 
ip route add 101.1.1.0/24 via 100.1.1.254
