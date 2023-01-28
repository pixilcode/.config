# Set up opam
let-env OPAM_SWITCH_PREFIX = $"($env.HOME)/.opam/default"
let-env CAML_LD_LIBRARY_PATH = $"($env.HOME)/.opam/default/lib/stublibs:/usr/lib/ocaml/stublibs:/usr/lib/ocaml"
let-env OCAML_TOPLEVEL_PATH = $"($env.HOME)/.opam/default/lib/toplevel"

# Path variable
let-env PATH = (
  $env.PATH
  | append $"($env.HOME)/.local/bin"
  | append $"($env.HOME)/.cabal/bin"
  | append $"($env.HOME)/.ghcup/bin"
  | append $"($env.HOME)/.local/bin/clion-2022.2.1/bin"
  | append $"($env.HOME)/.local/bin/idea-IU-223.8214.52/bin"
  | append $"($env.HOME)/.opam/default/bin"
  | append $"($env.HOME)/.cargo/bin"
)

let-env EDITOR = "helix"
let-env SHELL = "/usr/bin/nu"

