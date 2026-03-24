#!/bin/bash

# Wake-on-LAN script using netcat (nc)
# Usage: $0 <MAC address> [broadcast IP] [port]
# Default broadcast: 255.255.255.255, default port: 9

set -euo pipefail

# Check for nc
if ! command -v nc >/dev/null 2>&1; then
    echo "Error: netcat (nc) is not installed. Install it with: sudo apt install netcat-openbsd" >&2
    exit 1
fi

# Validate MAC address
mac="$1"
if [[ ! "$mac" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]; then
    echo "Error: Invalid MAC address format. Use xx:xx:xx:xx:xx:xx" >&2
    exit 1
fi

# Set broadcast and port (with defaults)
broadcast="${2:-255.255.255.255}"
port="${3:-9}"

# Convert MAC to binary bytes in hex format
# Example: 00:11:22:33:44:55 -> \x00\x11\x22\x33\x44\x55
mac_hex=$(echo -n "$mac" | sed 's/:/\\x/g; s/^/\\x/')

# Build the magic packet:
# 6 bytes of 0xFF followed by 16 copies of the MAC in binary
packet=""
packet+=$(printf '\xff\xff\xff\xff\xff\xff')
for i in {1..16}; do
    packet+=$(printf "$mac_hex")
done

# Send via UDP broadcast
# -u: UDP mode, -b: allow broadcast, -w1: 1 second timeout
echo -n "$packet" | nc -u -b -w1 "$broadcast" "$port"

if [ $? -eq 0 ]; then
    echo "Magic packet sent to $mac via $broadcast:$port"
else
    echo "Error: Failed to send magic packet. Ensure broadcast is allowed and the network interface is up." >&2
    exit 1
fi