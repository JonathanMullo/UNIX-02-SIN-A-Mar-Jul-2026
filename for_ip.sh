#!/bin/bash
for ip_address in "$@"; do
 echo "Taking some action on IP address ${ip_address}"

   ping -c 1 "$ip_address"
done

# Private IP address commonly used as a default gateway in local networks
# 10.0.0.1

# Localhost (hostname used to refer to the current machine itself)
# localhost

# Loopback IP address (used for the system to communicate with itself)
# 127.0.0.1

# Private IP address within a local network (example of a host in the network)
# 10.0.13.205