ip addr flush dev eth1 
ip link set dev eth1 address 00:00:00:00:00:12
ip addr add 192.168.101.4/28 brd 192.168.101.15 dev eth1
ip link set dev eth1 up 
ip route del default 
ip route add default via 192.168.101.1
ip link add link eth1 name eth1.102 type vlan id 102
ip addr add 102.1.1.12/24 brd 102.1.1.255 dev eth1.102
ip link set dev eth1.102 up 
ip route add 103.1.1.0/24 via 102.1.1.254

