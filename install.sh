#!/usr/bin/env sh

echo "Wallive v1.0-20250701 - Installation"

chmod +x ./uninstall.sh

iwallive() {
  # Phase 1
  echo "Copying wallive -> /opt/ ..."
  sudo cp -r ./wallive/ /opt/
  echo "Done."

  # Phase 2
  cd /opt/wallive/
  sudo chmod +x ./wallive
  echo "Creating symlink ..."
  echo "wallive -> /usr/bin/"
  sudo ln ./wallive /usr/bin/
  echo "wallive.desktop -> /usr/share/applications/"
  sudo ln ./wallive.desktop /usr/share/applications/
  echo "Done."

  # Phase 3
  echo "Creating systemd service ..."
  sudo cp ./wallive.service /home/$USER/.config/systemd/user/
  cd /home/$USER/.config/systemd/user/
  sudo chown $USER ./wallive.service
  sudo chgrp $USER ./wallive.service
  systemctl --user daemon-reexec
  systemctl --user enable --now wallive.service
  echo "Done."
}

which mpvpaper

if [ $? -eq 0 ]; then
  iwallive
else
  yay -S aur/mpvpaper
  iwallive
fi
