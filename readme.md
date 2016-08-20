# My dotfiles

* `mkdir git && cd git/`
* `git clone git@github.com:mattfoxxx/dotfiles.git`
* `cd dotfiles`
* `git submodule init`
* `git submodule update`
* `./make_symlinks.sh`
  copies all existing files to a backup dir `~/dotfiles_old` and creates symlinks to the repository
