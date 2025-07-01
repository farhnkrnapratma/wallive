#!/usr/bin/env sh

echo "Wallive v1.0-20250701 - Installation"

iwallive() {
  # Phase 1
  echo "Copying wallive -> /opt/ ..."
  sudo cp -r ./wallive/ /opt/
  echo "Done."

  # Phase 2
  cd /opt/wallive
  echo "Creating symlink ..."
  echo "wallive -> /usr/bin/"
  sudo ln wallive /usr/bin/
  echo "wallive.desktop -> /usr/share/applications/"
  sudo ln wallive.desktop /usr/share/applications/
  echo "Done."

  # Phase 3
  echo "Creating systemd service ..."
  cd /opt/wallive/service/
  sudo ln wallive.service /home/$USER/.config/systemd/user/
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
