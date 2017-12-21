# Vimrc

This is my Vim-setting files for Ubuntu.

If you want to apply these files on Windows, you may need to modify some settings. For example, you may  need to rename `.vim/` to `vimfiles/` or rename `.vimrc` to `_vimrc`.

In addtion, I will add Windows-version vim files in the future.

*PS: The `raw` folder contains my previous Vim settings on Windows.  It may contain a lot of bugs and strange codes if you want to use it.*

## Brief Descriptions of Installation

- Install this repository and copy `.vimrc` and `.vim/` to home directory.
  (Don't forget to backup your old vim files. I am not doing this here.)

  ```shell
  cd Vimrc/
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

- Follow the descriptions inside [Valloric / YouCompleteMe](https://github.com/Valloric/YouCompleteMe) to install the plug-in `YouCompleteMe`.

  Note that **YouCompleteMe does not work with Anaconda Python**. See more details here: https://github.com/Valloric/YouCompleteMe/issues/1241 .

- You are done now !

## Work Progress of the Files

The files are Roughly finished.

Right now, the files are set on Ubuntu 17.04 on my own computer. Both terminal-Vim and GVim works great.

In the future, I will try to make these files work on Windows Gvim.

## Plus

I am not good at English, so if you find any English grammar problems in this readme article, please tell me by adding issues. Thank you.