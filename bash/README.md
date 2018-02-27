# bashrc

This is my configuration files for bash.

## Usage

- Instead of `cd`, use `c` to visit directory.
  - Each time you `c` to a directory, it will auto `ls` for you.
  - Whenever you start a new bash, it will start at the path which you  visited last time by `c` .
- Instead of `vim`, use `v` .
- Instead of `python3`, use `p` .
- Type `ptt` to visit PTT.
- Type `ptt2` to visit PTT2.

## Installation

- Add the following code to the very end of `~/.bashrc`

  ```bash
  echo "source [path_to_dotfiles/bash/bash_aliases]" >> ~/.bashrc
  ```

- Add `~/.last_position` since bash will record the path you last visited to that file.

  ```bash
  echo "~" > ~/.last_position
  ```

- Add a new `~/desktop` directory, which is the default "home directory " of `c` . (That is, if you type only `c`, it will go back to ~/desktop)

  ```bash
  mkdir ~/desktop
  ```

- Done !