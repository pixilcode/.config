# Path variable
let paths_to_append = open $"($env.HOME)/.config/path" | lines | str replace "HOME" $env.HOME
$env.PATH = (
  $env.PATH
  | append $paths_to_append
)

$env.EDITOR = "helix"

# generate zoxide config
zoxide init nushell --cmd cd | save -f ~/.zoxide.generated.nu
