# cargo plugin is lifted from https://github.com/robbyrussell/oh-my-zsh/pull/3007
# and rustc from
# https://github.com/robbyrussell/oh-my-zsh/pull/3007
# and https://github.com/rust-lang/zsh-config/blob/master/_rust

alias cb="cargo build"
alias cbr="cargo build --release"
alias ct="cargo test"

function _cargo_commands() {
    local ret=1 state
    _arguments ':subcommand:->subcommand' && ret=0

    case $state in
        subcommand)
            subcommands=(
                "build:Build the current project"
                "clean:Clean up after a build"
                "help:Help about available commands"
                "new:Create a new project"
                "test:Run the tests"
                "update:Updates list of known packages"
                "run:Builds and runs the currecnt project"
            )
            _describe -t subcommands 'cargo subcommands' subcommands && ret=0
    esac

    return ret
}

compdef _cargo_commands cargo
