#!/bin/bash
if bluetoothctl show | grep -q "Powered: yes"; then
  echo "bluetooth On"
else
  echo "blutooth Off"
fi
