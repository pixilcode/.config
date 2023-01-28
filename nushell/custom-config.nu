# Define personal commands
alias v = nvim

alias hx = helix

def class [name: string] {
    $"/home/brendonb/Documents/classes/($name)"
}

def 'class list' [] {
    ls '/home/brendonb/Documents/classes'
    | get name
    | path basename
}

def 'class id' [id: int] {
    let class = (class list | select $id | get 0);
    class $class
}

def md2pdf [input: path, output: path] {
    pandoc $input --output $output --from markdown --to pdf
}

def cs260server [] {
  "brendonb@64.227.6.254"
}

def cslab [] {
  "bhb49@schizo.cs.byu.edu"
}

# Include the 'twili' CLI
use twili/twili.nu

let-env config = (
    $env.config
    | upsert show_banner false
)
