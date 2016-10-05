# Vim Configuration
The project is structured using Pathogen in combination with git submodules. See the `bundle/` dir for a list of plugins.

Checkout the project but backup `~/.vim` directory first:
```bash
mv ~/.vim ~/.vim.bak ; git clone --recursive git@github.com:jchristi/dotvim ~/.vim
```

The root directory also includes a `.vimrc` file which can be symlinked to:
```bash
mv ~/.vimrc ~/.vimrc.bak ; ln -s ~/.vimrc ~/.vim/.vimrc
```
