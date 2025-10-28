# Introduction

This document here is dedicated to getting you started on setting up a spine-and-leaf topology using Nokia routers and SR Linux to develop an understanding of how modern day data centers are structured and configured to ensure constantly fast moving data moves within a data center.

In the initial README you saw, you should have the following already installed before moving on to the next steps:
- Docker downloaded and running 
- Containerlab

## Installing images to be used

With Docker, we need to download the Nokia SR Linux image which can be done by doing the following below:
```sh 
sudo docker pull ghcr.io/nokia/srlinux

sudo docker images # This checks if you have the images installed
```

## Creating Topology file

Containerlab has a function that enables a user to create a basic topology based on entries made in a separate YAML file with the following command:

```sh 
containerlab deploy -t <filename>.yml
```

Within the YAML file itself, when I deployed the topology I had the following parameters within the YAML file:
- **topology**: Overall definition that defines the actual topology that consists of images, links, and nodes.
  - **kinds**: If running multiple types of nodes, this can be used as a way to abbreviate writing the actual image that will be utilized to make rewriting the same image for multiple nodes easier.
  - **nodes**: Self explanatory these are the actual nodes in the topology that can be hosts, routers, switches so long as an image is available for containerlab to read, recognize and deploy.
  - **links**: This is the actual links that will be between any two nodes.

Below is the YAML file that I used to deploy the topology we got to configure (drawing of the topology will be shown after the YAML file)

```YAML 
name: srl-demo

topology:
  kinds:
    nokia_srlinux: 
      image: ghcr.io/nokia/srlinux:latest

    linux:
      image: alpine:latest

  nodes:
    # Spine nodes
    spine1:
      kind: nokia_srlinux
    spine2:
      kind: nokia_srlinux

    # Leaf nodes
    leaf1: 
      kind: nokia_srlinux
    leaf2:
      kind: nokia_srlinux

    # Hosts
    host10:
      kind: linux
    host11:
      kind: linux
    host12:
      kind: linux
    host20:
      kind: linux

  links:
    - endpoints: ["spine1:e1-1", "leaf1:e1-1"]
    - endpoints: ["spine1:e1-2", "leaf2:e1-1"]
    - endpoints: ["spine2:e1-1", "leaf1:e1-2"]
    - endpoints: ["spine2:e1-2", "leaf2:e1-2"]
    - endpoints: ["leaf1:e1-10", "host10:eth1"]
    - endpoints: ["leaf1:e1-11", "host11:eth1"]
    - endpoints: ["leaf1:e1-12", "host12:eth1"]
    - endpoints: ["leaf2:e1-10", "host20:eth1"]
```

<Add drawing of topology here>

After running the command to deploy our topology, we can then run any given node by running the following command:

```Docker exec -it clab-<name-specified-in-YAML-file>-<node-name> <bash/ash/sr_cli/etc...```

Once you are able to enter all nodes and hosts, we are ready to move on to the next steps!
