# No bs installation guide (MacOS)

## Table of Contents
* [Prerequisites+Zsh](#Prerequisites+Zsh)
* [Tmux](#Tmux)
* [Neovim](#Neovim)
* [Troubleshooting](#Troubleshooting)

# Prerequisites+Zsh
1. Open terminal
2. Make sure you have command-line tools by executing
```
xcode-select -p
```
If you get path like `/Library/Developer/CommandLineTools` then you are good. Otherwise
```
xcode-select --install
```
3. Now install [Brew](https://brew.sh) by executing
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
4. Run 
```
brew update
```
5. Install [git](https://git-scm.com)
```
brew install git
```
6. Install [zsh](https://zsh.sourceforge.io)
```
brew install zsh
```
7. Make [zsh](https://zsh.sourceforge.io) your default shell
```
chsh -s /usr/local/bin/zsh
```
8. Close and open new terminal session. You may get message looking something like this:
```
[oh-my-zsh] Insecure completion-dependent directories detected:
drwxrwxr-x  52 gmeece  admin  1664 Sep  4 17:07 /usr/local/share

[oh-my-zsh] For safety, we will not load completions from these directories until
[oh-my-zsh] you fix their permissions and ownership and restart zsh.
[oh-my-zsh] See the above list for directories with group or other writability.

[oh-my-zsh] To fix your permissions you can do so by disabling
[oh-my-zsh] the write permission of "group" and "others" and making sure that the
[oh-my-zsh] owner of these directories is either root or your current user.
[oh-my-zsh] The following command may help:
[oh-my-zsh]     compaudit | xargs chmod g-w,o-w

[oh-my-zsh] If the above didn't help or you want to skip the verification of
[oh-my-zsh] insecure directories you can set the variable ZSH_DISABLE_COMPFIX to
[oh-my-zsh] "true" before oh-my-zsh is sourced in your zshrc file.

zsh compinit: insecure directories, run compaudit for list.
Ignore insecure directories and continue [y] or abort compinit [n]? 
```
Simply enter `y` and execute 
```
chmod go-w '/usr/local/share'
```
9. Verify [zsh](https://zsh.sourceforge.io) is working
```
echo $0
# Should return: zsh
which zsh
# Should return: /usr/local/bin/zsh
zsh --version
# Should return a version higher than 5.1; e.g.:
# zsh 5.7.1 (x86_64-apple-darwin18.2.0)
```
10. Install [Oh My Zsh!](https://ohmyz.sh)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
11. Install [iTerm2](https://iterm2.com)
```
brew install iterm2 --cask
```
12. Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k) by running
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
13. Now the time has come. Enter directory where you want to download [this repository](https://github.com/Roiqk7/dotfiles) for example
```
cd Desktop
```
and then download this reository with
```
git clone https://github.com/Roiqk7/dotfiles.git
```
And you should see `dotfiles` folder on your desktop.
14. Go back to your home directory by running
```
cd ~
```
And open it in your finder by running
```
open .
```
Then go to `dotfiles` folder on your desktop and you will see `_zshrc` file. Rename it to `.zshrc` and then move it to your finder window with home directory.
15. Now in your terminal move to `.config` directory by running
```
cd .config
```
and open it with
```
open .
```
Then go to `dotfiles` into `_config` directory and grab `aliases.zsh` file and move it to your `.config` directory. This will give you access to the aliases.
16. Open and close your terminal. Agree to install recommended fonts and follow the tutorial
That's it. Now your terminal should be ready to go. That was the hard part from now on it will be quick. Also since we setup the aliases from now on I will use them so you get familiar with them.

# Tmux
**Note:** I am using aliases from `aliases.zsh` file and am assuming you already cloned this repository.
1. Install [tmux](https://github.com/tmux/tmux) by running
```
bi tmux
```
2. Go to your terminal and move to your home directory
```
~
```
then open the home directory 
```
.
```
4. Go to `dotfiles` and rename `_tmux.conf` to `.tmux.conf`. Then move it to your home directory.
5. Run this to resource tmux
```
tmux source ~/.tmux.conf
```

# Neovim
**Note:** I am using aliases from `aliases.zsh` file and am assuming you already cloned this repository.
1. Install [neovim](https://neovim.io)
```
bi neovim
```
2. Install plugin manager [Packer](https://github.com/wbthomason/packer.nvim#quickstart) on MacOS or Linux using this:
```
gc https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
3. Go to `dotfiles` inside `_config` and then move the `nvim` to your `~/.config` directory.
4. Open your terminal and run:
```
n
```
5. Now you will see a lot of errors. Simply click though them and then type `:PackerSync`. This will update your neovim. Then type `:q` to leave and reopen neovim. May be neccesary to again type `:PackerSync` and also wait for other plugins to install what they need so do not close neovim right away.

# Thanks for installing my dotfiles!
Now I highly recommend reading [this](https://github.com/Roiqk7/dotfiles/blob/main/README.md) for more information.

# Troubleshooting

## Too many files open
If you get this error message after running 
```
:PackerSync
``` 
then go into a terminal and enter this piece of code: 
```
ulimit -n 10240
``` 
Note that this is not a permanent solution. It will increase the maximum number of files just for the current session.
