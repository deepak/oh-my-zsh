# cargo plugin is lifted from https://github.com/robbyrussell/oh-my-zsh/pull/3007
# and rustc from
# https://github.com/robbyrussell/oh-my-zsh/pull/3007
# and https://github.com/rust-lang/zsh-config/blob/master/_rust

# aliases for cargo
alias cb="cargo build"
alias cbr="cargo build --release"
alias ct="cargo test"
alias cr="cargo run"

# Add Cargo's global binaries to PATH
export PATH=$PATH:~/.cargo/bin

# Needed by [racer](https://github.com/phildawes/racer)
# test with, racer complete std::io::B (should show some completions)
export RUST_SRC_PATH=/usr/local/var/rust/src/src

# aliases for rustc
function rce() {
    if [[ -z $@ ]]; then
        echo "Usage: $0:t <Error-Message-Code>"
        echo "Example: rce E0425"
        return 1
    else
        rustc --explain "$@" | less
    fi
}
