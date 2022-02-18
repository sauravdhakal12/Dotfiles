# Installation Instruction

1. Clone the bare repository:
    git clone --bare https://github.com/sauravdhakal12/Dotfiles.git $HOME/Dotfiles

2. Define an alias to easily use git commands on your repository:
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

3. Next, configure git to ignore Untracked files:
    dotfiles config --local status.showUntrackedFiles no

4. Finally, apply the changes from the repository to your system:
    dotfiles checkout
