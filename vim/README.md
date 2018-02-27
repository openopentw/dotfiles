# Vimrc

This is my Vim-setting files

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

- (Optional) Install `YouCompleteMe`.

  Uncomment following in `.vimrc`:

  ```vim
  " Plug 'Valloric/YouCompleteMe'
  " let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
  ```

  Follow the descriptions inside [Valloric / YouCompleteMe](https://github.com/Valloric/YouCompleteMe) to install the plug-in `YouCompleteMe`.

  Note that **YouCompleteMe does not work with Anaconda Python with default setting**. See more details here: https://github.com/Valloric/YouCompleteMe/issues/1241 .

- You are done now !

## Work Progress of the Files

- ~~If you want to apply these files on Windows, you may need to modify some settings. For example, you may  need to rename `.vim/` to `vimfiles/` or rename `.vimrc` to `_vimrc`.~~

  **Now you can use these files for both Windows and Ubuntu without renaming.**


- In the future, I will try to write a manual of my settings.