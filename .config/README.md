## Table of Contents
* [Aliases](#Aliases)

## Aliases
The `aliases.zsh` file, contains my personal configuration. Plugins add a whole lot more, and I definitely recommend checking each plugin out.

Note: Don't forget to add `source ~/.config/aliases.zsh` into your `.zshrc`.

Tip: I recommend setting up alias for quick navigation to your work directory.

<details>
  <summary>Aliases</summary>

  | Alias | Command | Desription |
  |---|---|---|
  | **General** | | Practical commands |
  | `r` | `source ~/.zshrc` | Reload zsh configuration |
  | `c` | `clear` | Clear your terminal |
  | `x` | `exit` | Leave current session |
  | `u` | `bubu && maintain` | Runs all necessary update commands |
  | **Maintenance** | | Maintain this configuration with ease |
  | `u_colorls` | `gem update colorls` | Updates [colorls](https://github.com/athityakumar/colorls) |
  | `u_omz` | `omz update` | Updates [oh My ZSH!](https://ohmyz.sh) |
  | `maintain` | `u_colorls && u_omz` | Updates all pluins which are not managed by [brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) |
  | **Filesystem** | | Move faster across files |
  | `~` | `cd ~/` | Move to home directory |
  | `.` | `Open .` | Opens current directory |
  | `..` | `cd ..` | Move up a directory |
  | `...` | `cd ../..` | Move up 2 directories |
  | `....` | `cd ../../..` | Move up 3 directories |
  | `.....` | `cd ../../../..` | Move up 4 directories |
  | `ls` | `colorls` | Beautiful file listing |
  | `tree` | `colorls --tree=3 --sd --dark` | File tree |
  | `utree` | `colorls --tree=10 --sd --dark` | Unlimited file tree | 
  | `detail` | `colorls -lA --sd --dark` | Detailed info about files |
  | **Shortcuts** | | Fast navigation |
  | `.zshrc` | `nvim ~/.zshrc` | Opens `.zshrc` in neovim |
  | `aliases` | `nvim ~/.config/aliases.zsh` | Opens `aliases.zsh` in neovim |
  | `neovim` | `nvim ~/.config/nvim/init.lua` | Opens `init.lua` in neovim |
  | `.tmux.conf` | `nvim ~/.tmux.conf` | Opens `.tmux.conf` in neovim |
  | `.p10k` | `nvim `~.p10k.zsh` | Opens `.p10k.zsh` in neovim |
  | `.config` | `cd ~/.config` | Go to `.config` directory |
  | `work` | | Move to your work directory |
  | **Brew** | Note: [Brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) plugin adds a lot more | Common brew comands |
  | `bu` | `brew upgrade` | Upgrades outdated packages |
  | `bi` | `brew install` | Install package |
  | `bri` | `brew reinstall` | Reinstall package |
  | `bl` | `brew list` | List of brew packages |
  | `bubo` | `brew update && brew outdated` | Update brew and list outdated packages |
  | `bubc` | `brew upgrade && brew cleanup` | Upgrade outdated packages and run cleanup |
  | `bubu` | `bubo && bubc` | Runs both commands above |
  | **Git** | Note: [Git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) plugin adds a lot more | Common git commands |
  | `gc` | `git clone --recursive` | Clones git repository properly |

</details>
