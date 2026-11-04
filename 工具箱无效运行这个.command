#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR" || exit 1

chmod +x "$SCRIPT_DIR/adb" "$SCRIPT_DIR"/*.command 2>/dev/null
xattr -cr "$SCRIPT_DIR" 2>/dev/null

ADB="$SCRIPT_DIR/adb"
"$ADB" kill-server
"$ADB" start-server
"$ADB" devices
clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo "等待启动工具箱"
echo ""
echo ""
echo ""
echo "如仍未解决，请查阅“遇到问题请看.txt”"
echo ""
echo ""
echo ""
echo ""
sleep 8
"$ADB" wait-for-device
exec "$SCRIPT_DIR/启动鸿蒙工具箱.command"