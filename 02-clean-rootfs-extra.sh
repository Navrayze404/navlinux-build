#!/bin/bash
set -e

ROOTFS="/opt/navlinux-release/rootfs"

echo "[1/3] Cleaning cache..."
rm -rf "$ROOTFS/var/cache/"*
rm -rf "$ROOTFS/var/cache/man/"*

echo "[2/3] Cleaning systemd runtime data..."
rm -f "$ROOTFS/var/lib/systemd/random-seed"
rm -f "$ROOTFS/var/lib/systemd/catalog/database"
rm -rf "$ROOTFS/var/lib/systemd/coredump/"*

echo "[3/3] Cleaning NetworkManager runtime data..."
rm -f "$ROOTFS/var/lib/NetworkManager/"*.lease
rm -f "$ROOTFS/var/lib/NetworkManager/NetworkManager.state"
rm -f "$ROOTFS/var/lib/NetworkManager/seen-bssids"
rm -f "$ROOTFS/var/lib/NetworkManager/timestamps"
rm -f "$ROOTFS/var/lib/NetworkManager/secret_key"

echo "Extra rootfs cleanup done."
