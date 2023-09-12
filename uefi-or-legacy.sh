#!/bin/bash

if [ -d "/sys/firmware/efi" ]; then
  echo "UEFI mode"
else
  echo "Legacy (BIOS) mode"
fi
