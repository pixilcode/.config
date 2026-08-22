# install useful CLI
yay -S nushell helix ripgrep

# install bitwarden
yay -S flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# after downloading the file
flatpak install com.bitwarden.desktop.flatpakref

# install .config from github
