# Vimrc

This is my Vim-setting files

## Key Mappings

- Function Keys (FX)

  | Key     | Function            |
  | ------- | ------------------- |
  | `<F2>`  | Open new tab.       |
  | `<F5>`  | Open file-tree.     |
  | `<F8>`  | Open `explorer.exe` |
  | `<F9>`  | Open `powershell`   |
  | `<F10>` | Open `git-bash`     |

- About Tabs

  | Key            | Function              |
  | -------------- | --------------------- |
  | `g` `n`        | Next tab.             |
  | `g` `p`        | Previous tab.         |
  | `g` `=`        | Move the tab right.   |
  | `g` `-`        | Move the tab left.    |
  | `g` `<number>` | Move to the n-th tab. |

- About Splits

  | Key     | Function                                          |
  | ------- | ------------------------------------------------- |
  | `g` `h` | **Go** to the split on the **left-hand** side.    |
  | `g` `j` | **Go** to the split on the **bottom** .           |
  | `g` `k` | **Go** to the split on the **top** .              |
  | `g` `l` | **Go** to the split on the **right-hand** side.   |
  | `g` `H` | **Move** to the split on the **left-hand** side.  |
  | `g` `J` | **Move** to the split on the **bottom** .         |
  | `g` `K` | **Move** to the split on the **top** .            |
  | `g` `L` | **Move** to the split on the **right-hand** side. |
  | `g` `t` | Switch from panes.                                |

- Others

  | Key              | Function                                                     |
  | ---------------- | ------------------------------------------------------------ |
  | `g` `c` `c`      | Comment the whole line.                                      |
  | `g` `a` `<char>` | Align the line selected by some character.<br>See the guide here: https://github.com/junegunn/vim-easy-align |
  | `<Ctrl>+y` `,`   | Change HTML format. (Like "div#login" to HTML)<br>See the guide here: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL |

## Brief Descriptions of Installation

- Install this repository and copy `.vimrc` and `.vim/` to home directory.
  (Remember to backup your old vim files. I am not doing this here.)

  ```shell
  cd dotfiles/vim/
  cp .vimrc ~/
  cp -r .vim/ ~/
  ```

- Create a directory `tmp` in `~` (home directory), since I set `backupdir` in `~/tmp`.

  ```shell
  mkdir ~/tmp
  ```

  Open Vim and type command `PlugInstall` in vim to install plug-ins.

  ```shell
  vim
  :PlugInstall
  ```

- (Optional) Install `YouCompleteMe` :

  - Uncomment following in `.vimrc`:

    ```vim
    " Plug 'Valloric/YouCompleteMe'
    " let g:ycm_global_ycm_extra_conf =     '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
    ```


  - Follow the descriptions inside [Valloric / YouCompleteMe](https://github.com/Valloric/YouCompleteMe) to install the plug-in `YouCompleteMe`.
  - Note that **YouCompleteMe does not work with Anaconda Python with default setting**. See more details here: https://github.com/Valloric/YouCompleteMe/issues/1241 .

- You are done now !

## Work Progress of the Files

- ~~If you want to apply these files on Windows, you may need to modify some settings. For example, you may  need to rename `.vim/` to `vimfiles/` or rename `.vimrc` to `_vimrc`.~~

  **Now you can use these files for both Windows and Ubuntu without renaming.**


- In the future, I will try to write a manual of my settings.
