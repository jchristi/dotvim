# Vim Configuration
The project is structured using Pathogen in combination with git submodules. See the `bundle/` dir for a list of plugins.

Checkout the project but backup your `.vim` directory first:
```bash
$ mv ~/.vim ~/.vim.bak ; git clone --recursive git@github.com:jchristi/dotvim ~/.vim
```

Install the powerline fonts:
```bash
$ bash ~/.vim/fonts/install.sh
```

Change default mono font to a custom powerline font (ie. `DejaVu Sans Mono for  Powerline Book`). This can be done in gnome terminal profile preferences but preferably use gnome-tweak-tool.

The root directory also includes a `vimrc` file which can be symlinked to:
```bash
$ mv ~/.vimrc ~/.vimrc.bak ; ln -s ~/.vim/vimrc ~/.vimrc
```
