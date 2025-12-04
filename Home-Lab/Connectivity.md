# Enable connections in Topology

In the previous file, we configured all the interfaces connected to each other. However when trying to get the devices to ping each other the packets get dropped.

This is because Nokia routing devices require a network-instance in order to be able to route internet traffic between devices. Luckily for us, a default instance is always included so all we need to do is apply all the relevant ethernet interfaces as well as each devices loopbacks into the network instance.

```
--{ candidate shared default }--[ network-instance default ]--
A:root@leaf1# network-instance default 

--{ candidate shared default }--[ network-instance default ]--
A:root@leaf1# (Use each command separately between pipes){ interface ethernet-1/1.0 | interface ethernet-1/2.0 | interface lo0.0}

## Repeat for leaf2 using the appropriate interfaces 
```

Now if you run the ```ping 10.x.x.x (address depends on which device ... i.e leaf1 to spine1 = 10.2.1.0``` now the pings should work successfully!
