#!/bin/bash

# Website to monitor
URL="https://sduwhv.imigrasi.go.id"
CHECK_INTERVAL=30  # seconds

echo "Starting monitor for: $URL"
echo "Checking every $CHECK_INTERVAL seconds..."
echo "Press Ctrl+C to stop"
echo ""

while true; do
    # Get current timestamp
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

    # Check website status
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 10 --max-time 15 "$URL")

    echo "[$TIMESTAMP] HTTP Status: $HTTP_CODE"

    # Check if website is up (status code 200-299)
    if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
        echo "✓ Website is BACK UP!"

        # Send notification
        notify-send -u critical -i dialog-information "Website is UP!" "sduwhv.imigrasi.go.id is now accessible (HTTP $HTTP_CODE)"

        # Play sound alert (repeat 3 times for emphasis)
        for i in {1..3}; do
            paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null &
            sleep 0.5
        done

        # Exit the script
        exit 0
    fi

    # Wait before next check
    sleep $CHECK_INTERVAL
done
