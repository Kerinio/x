#!/bin/bash

# This is for a VM for multiple parties and bridged networking.
# On distribution it should fetch an IP address from the router.
# Problem: When changing the MAC address, the interface name changes
# which then is not configured for DHCP.
# Solution: One "eth0" to rule them all.

# WARNING! This only works for VMs with a single interface!

find /etc/udev/rules.d/ -name "*-net.rules" -exec rm {} \;
cat <<'EOF' > /etc/udev/rules.d/70-persistent-net.rules
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
EOF

