# Open the neovim editor
alias v = nvim

# Grep for a given text
alias grep = rg

# Search for a file
#alias fd = findfd

# Search for a file
alias find = fd

# Read a file to the console
alias cat = bat

# A post-modern text editor
alias hx = helix

# Get the location of a class with the given name
def class [name: string] {
    $"($env.HOME)/Documents/classes/($name)"
}

# List all classes
def 'class list' [] {
    ls $"($env.HOME)/Documents/classes"
    | get name
    | path basename
}

# Get a class by it's ID (based on `class list`)
def 'class id' [id: int] {
    let class = (class list | select $id | get 0);
    class $class
}

def cs260server [] {
  "brendonb@64.227.6.254"
}

def cslab [] {
  "bhb49@moat.cs.byu.edu"
}

# Run `opam env` and convert it to a record
def opam-env [] {
    opam env
    | split row ';'
    | str trim
    | where { |row| $row | str contains '=' }
    | split column '='
    | rename key value
    | each { |row|
        let value = ($row.value | str trim --char "'")
        { $row.key: $value }
    }
    | reduce { |row, result| $result | merge $row }
}

# Load the opam environment
# opam-env | load-env

$env.config = (
    $env.config
    | upsert show_banner false
)

# setup zoxide
source ~/.zoxide.generated.nu

# Set custom completions for `helix`
# Completions for Helix: <https://github.com/helix-editor/helix>
#
# NOTE: the `+N` syntax is not supported in Nushell (https://github.com/nushell/nushell/issues/13418)
#       so it has not been specified here and will not be proposed in the autocompletion of Nushell.
#       The help message won't be overriden though, so it will still be present here

def health_categories [] {
    let languages = ^helix --health languages | detect columns | get Language | where { $in != null }
    let completions = [ "all", "clipboard", "languages" ] | append $languages
    return $completions
}

def grammar_categories [] { ["fetch", "build"] }

# A post-modern text editor
export extern helix [
    --help(-h),                                 # Prints help information
    --tutor,                                    # Loads the tutorial
    --health: string@health_categories,         # Checks for potential errors in editor setup
    --grammar(-g): string@grammar_categories,   # Fetches or builds tree-sitter grammars listed in `languages.toml`
    --config(-c): glob,                         # Specifies a file to use for configuration
    -v,                                         # Increases logging verbosity each use for up to 3 times
    --log: glob,                                # Specifies a file to use for logging
    --version(-V),                              # Prints version information
    --vsplit,                                   # Splits all given files vertically into different windows
    --hsplit,                                   # Splits all given files horizontally into different windows
    --working-dir(-w): glob,                    # Specify an initial working directory
    ...files: glob,                             # Sets the input file to use, position can also be specified via file[:row[:col]]
]
