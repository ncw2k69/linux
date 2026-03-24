#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <MAC_ADDRESS>"
    exit 1
fi

MAC="$1"
MAC_CLEAN=$(echo "$MAC" | tr -d ':-')

if [ ${#MAC_CLEAN} -ne 12 ]; then
    echo "Error: Invalid MAC address."
    exit 1
fi

# 1. Sync Stream: 6 bytes of 0xFF
HEADER=$(printf '\xFF\xFF\xFF\xFF\xFF\xFF')

# 2. Payload: MAC address repeated 16 times
PAYLOAD=""
for i in {1..16}; do
    PAYLOAD+=$(printf '\\x%s\\x%s\\x%s\\x%s\\x%s\\x%s' \
        ${MAC_CLEAN:0:2} ${MAC_CLEAN:2:2} ${MAC_CLEAN:4:2} \
        ${MAC_CLEAN:6:2} ${MAC_CLEAN:8:2} ${MAC_CLEAN:10:2})
done

# Network settings
BROADCAST_IP="255.255.255.255"  # ⚠️ Change to match your subnet
PORT="9"

echo "Sending Magic Packet to $MAC via $BROADCAST_IP:$PORT..."

# Send packet and exit immediately after
printf "$HEADER$PAYLOAD" | nc -u -b -q 0 "$BROADCAST_IP" "$PORT"

echo "Done."
