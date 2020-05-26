# backup

export DOTFILES=~/dotfiles

dotfiles-count() {
        pushd >/dev/null 2>&1
        cd $HOME
        ls -ald .* | grep -v ^l | tee >(wc -l)
        popd >/dev/null 2>&1
}

dotfiles-init() {
        pushd >/dev/null 2>&1
        cd $HOME
        ls -ald .$1*;
        mkdir -p $DOTFILES/$1;
        mv .$1* $DOTFILES/$1;
        stow --dir=$DOTFILES --target=$HOME -vv $1
        popd >/dev/null 2>&1
}

dotfiles-rebuild() {
        stow --dir=$DOTFILES --target=$HOME -vv $@
}
