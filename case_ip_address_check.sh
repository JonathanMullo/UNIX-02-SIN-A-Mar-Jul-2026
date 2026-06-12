#!/bin/bash
# Assign the first command-line argument to the variable IP_ADDRESS
IP_ADDRESS="${1}"
# Check the value of IP_ADDRESS and match it against different network patterns
case ${IP_ADDRESS} in
    # If the IP starts with 192.168., identify it as a private 192.168.x.x network
    192.168.*)
        echo "Network is 192.168.x.x"
        ;;
    # If the IP starts with 10.0., identify it as a private 10.0.x.x network
    10.0.*)
        echo "Network is 10.0.x.x"
        ;;
    # If the IP does not match any known pattern, mark it as unidentified
    *)
        echo "Could not identify the network"
        ;;
esac
#192.168.5.KLK
#10.0.5.kl
#127.0.109