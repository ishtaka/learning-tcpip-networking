#!/bin/sh

ip netns add ns1
ip netns add ns2

ip link add ns1-veth0 type veth peer name ns2-veth0
ip link set ns1-veth0 netns ns1
ip link set ns2-veth0 netns ns2

ip netns exec ns1 ip address add 192.0.2.1/24 dev ns1-veth0
ip netns exec ns2 ip address add 192.0.2.2/24 dev ns2-veth0

ip netns exec ns1 ip link set ns1-veth0 up
ip netns exec ns2 ip link set ns2-veth0 up

ip netns exec ns1 ip link set dev ns1-veth0 address 00:00:5E:00:53:01
ip netns exec ns2 ip link set dev ns2-veth0 address 00:00:5E:00:53:02
