#!/bin/sh
# ============================================
# OpenWrt NetFlow Dashboard - Installer
# Compatible: OpenWrt 21.x / 22.x / 23.x
# ============================================
# Usage: wget -O- https://raw.githubusercontent.com/electronvalley/openwrt-netflow-dashboard/main/install.sh | sh

REPO="https://raw.githubusercontent.com/electronvalley/openwrt-netflow-dashboard/main"
DEST="/www/netflow"

echo "========================================"
echo " OpenWrt NetFlow Dashboard - Installer"
echo "========================================"
echo ""

# Create directory
mkdir -p "$DEST"

# Download dashboard
echo "[1/2] Downloading dashboard..."
wget -q -O "$DEST/index.html" "$REPO/htdocs/netflow/index.html"

if [ $? -ne 0 ]; then
  echo "ERROR: Download failed. Check your internet connection."
    exit 1
    fi

    echo "[2/2] Setting permissions..."
    chmod 644 "$DEST/index.html"

    # Restart uhttpd
    /etc/init.d/uhttpd restart 2>/dev/null

    IP=$(uci get network.lan.ipaddr 2>/dev/null || echo "192.168.1.1")

    echo ""
    echo "========================================"
    echo " Installation complete!"
    echo "========================================"
    echo ""
    echo " Access your dashboard at:"
    echo "   http://$IP/netflow/"
    echo ""
    echo " To uninstall:"
    echo "   rm -rf /www/netflow"
    echo "========================================"
