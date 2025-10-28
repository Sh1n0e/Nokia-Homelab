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


