# What do we have so far

After creating our topology with the YAML file, we will have the following configuration below:

[!Topology](images/topology.png)

This is just the barebones topology with only the management interfaces automatically configured thanks to containerlab.

## Goal

Our goal here is to create a fully configured leaf and spine topology with 2 spine and 2 leaf devices that interconnect 3 hosts with BGP as our main routing protocol to create our routes.

We will begin by configuring everything from the 2 spines, down to the 2 leaves, then on to all of the hosts.

# Spine Configuration:

On both spines, we need to configure the interfaces that point towards the leaves as well as their loopback addresses that will also represent the router-id for BGP peering.

```json
--{ running }--[  ]--
A:root@spine1# enter candidate

--{ candidate shared default }--[  ]--
A:root@spine1# 


```
