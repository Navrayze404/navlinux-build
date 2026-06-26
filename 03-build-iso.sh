#!/bin/bash
set -e

ISO_DIR="/opt/navlinux-release/iso"
OUT_DIR="/opt/navlinux-release/output"
ISO_NAME="NavLinux-1.0.iso"

mkdir -p "$ISO_DIR/boot/grub" "$ISO_DIR/EFI/BOOT" "$OUT_DIR"

echo "[1/4] Checking live files..."
test -f "$ISO_DIR/live/vmlinuz"
test -f "$ISO_DIR/live/initrd.img"
test -f "$ISO_DIR/live/filesystem.squashfs"

echo "[2/4] Creating GRUB config..."
cat > "$ISO_DIR/boot/grub/grub.cfg" <<'GRUBEOF'
set timeout=5
set default=0

menuentry "Nav Linux Live" {
    linux /live/vmlinuz root=live:CDLABEL=NAVLINUX rd.live.image quiet
    initrd /live/initrd.img
}
GRUBEOF

echo "[3/4] Building ISO..."
grub-mkrescue -o "$OUT_DIR/$ISO_NAME" "$ISO_DIR"

echo "[4/4] Done."
echo "$OUT_DIR/$ISO_NAME"
