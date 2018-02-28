# tmux.conf

This is my configuration files for tmux.

## Usage

- Split panes :

  - `<prefix> |` to split a pane vertically (`|` : `shift` + `\`)
  - `<prefix> _` to split a pane horizontally

- Moving cursor between panes :

  - `<prefix> h` to move to the left of the pane
  - `<prefix> j` to move to the bottom of the pane
  - `<prefix> k` to move to the top of the pane
  - `<prefix> l` to move to the right of the pane

- Reordering tabs :

  - `<Ctrl>` + `<Shift>` + `<Right>` to move the tab to right.
  - `<Ctrl>` + `<Shift>` + `<Left>` to move the tab to left.

- Select and copy :

  - `<prefix> [` to enter copy-mode.
    - When in copy-mode, press `v` to start selecting words.
    - When in copy-mode, press `y` to copy the words selected.
    - When outside of copy-mode, press `<prefix> ]` to paste words.

(Usually, the default `<prefix>` key is `<Ctrl> + B`)

## Installation

- Install [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm).

  ```bash
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ```

- Source this setting files in `~/.tmux.conf`.

  ```bash
  echo "source [path_to_dotfiles/tmux/tmux.conf]" >> ~/.tmux.conf
  ```
