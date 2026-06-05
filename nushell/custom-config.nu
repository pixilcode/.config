# Open the neovim editor
alias v = nvim

# Grep for a given text
alias grep = rg

# Search for a file
#alias fd = findfd

# Search for a file
alias find-core = find
alias find = fd

# Read a file to the console
alias cat = bat

# A post-modern text editor
alias hx = helix

def ttt-server [] {
  "brendonb@64.227.6.254"
}

def command-exists [command: string, ...args: string] {
    do --ignore-errors {
        # try and run the command
        run-external $command ...$args | ignore;

        # return true if it succeeds
        true
    }
    # return false if it does not
    | default false
}

def ocaml-new [project_name: string] {
    dune init proj $project_name
    cd $project_name
    opam switch create .

    print "Created! Don't forget to run `opam-env` to activate the switch."
}

# Load `opam env` into the environment
def --env opam-env [] {
    if not (command-exists "opam" "--version") {
        return
    }

    opam env
    | split row ';'
    | str trim
    | where { |row| $row | str contains '=' }
    | split column '='
    | rename key value
    | each { |row|
        let value = if $row.key == "PATH" {
                # split the string into a list of paths
                ($row.value | str trim --char "'" | split row ":")
            } else {
                ($row.value | str trim --char "'")
            }

        { $row.key: $value }
    }
    | reduce { |row, result| $result | merge $row }
    | load-env
}

# Load the opam environment
opam-env

$env.config = (
    $env.config
    | upsert show_banner false
)

# setup zoxide
source ~/.zoxide.generated.nu


export use completions *
