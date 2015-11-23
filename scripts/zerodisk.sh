#!/bin/sh

echo "Running $0 ($(date))"

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

echo "Done running $0 ($(date))"
