#!/bin/bash

find /etc/udev/rules.d/ -name "*-net.rules" -exec rm {} \;
cat <<'EOF' > /etc/udev/rules.d/70-persistent-net.rules
SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{dev_id}=="0x0", ATTR{type}=="1", KERNEL=="eth*", NAME="eth0"
EOF

