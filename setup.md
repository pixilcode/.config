- update `~/.bashrc` (or similar file) to source `~/.config/profile`
- create a symlink `~/Pictures/backgrounds/selected-background` for
  the selected wallpaper
  - `ln <background-of-choice> selected-background`
- set up Git SSH/GPG
  - `git config --global init.defaultBranch main`
  - setup SSH with texttotypes server
- login to Firefox
- download .config
- setup screenshot for sway
  - `~/.config/sway/scripts/grimshot check`
- ensure that you have the correct polkit authentication agent
  (see `.config/sway/config.d/autostart_applications` for more
  details)
- install `pandoc`
  - `yay -S pandoc-cli`
  - install texlive
    - `yay -S texlive-bin texlive-latexrecommended texlive-fontsrecommended`
- install:
  - nushell
  - helix
  - bat
  - fd
  - ripgrep
  - zed
  - just
  - zoxide
  - fzf
  - vlc
    - yay -S vlc-plugin-ffmpeg - installs mp4 support
  - miniserve - `yay -S miniserve`
- optional install:
  - npm
    - don't forget to run `mkdir ~/.npm-global; npm config set prefix '~/.npm-global'`
  - wf-recorder - yay -S wf-recorder
  - rust
  - ocaml
    - yay -S opam
    - opam install dune ocaml-lsp-server odoc ocamlformat utop
  - bun - curl -fsSL https://bun.com/install | bash
  - nim - yay -S choosenim-bin; choosenim stable
    - nhp (formatter)- nimble install nhp
    - nimlangserver (lsp) - nimble install nimlangserver
  - gleam - yay -S gleam
  - elm - yay -S elm-bin

TODO: update nu config to only run parts if the required programs are available
  
