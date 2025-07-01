#!/usr/bin/env sh

# Phase 1

echo "Killing apps ..."
pkill mpvpaper
echo "Done."

# Phase 2
echo "Removing service ..."
systemctl --user disable wallive.service
echo "Done."

# Phase 3
echo "Removing files ..."
sudo rm -rf /opt/wallive/ /usr/bin/wallive /usr/share/applications/wallive.desktop ~/.config/systemd/user/wallive.service
echo "Done."
