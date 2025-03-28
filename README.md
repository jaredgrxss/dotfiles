# 🧠 Neovim Configuration by @jaredgrxss

Welcome to my personal Neovim configuration! This repo is a tailored setup to streamline development and boost productivity using a clean, efficient, and keyboard-driven workflow.

## 🚀 Features

- 🔗 **Intuitive Keybindings** – Thoughtful remaps for fast navigation and editing.
- 📁 **Enhanced File Navigation** – `nvim-tree` for a smart, sidebar file explorer.
- 🧱 **Terminal Integration** – Easily open terminal windows inside Neovim.
- 🧠 **LSP Support** – Language Server Protocol for code intelligence and refactoring.
- 🎨 **Clean Look & Feel** – Visual tweaks for a better coding experience.

## 🎯 Keybindings at a Glance

| Action                    | Shortcut             |
|---------------------------|----------------------|
| Toggle file explorer      | `<leader>pv`         |
| Open vertical terminal    | `<leader>vst`        |
| Window movement           | `<leader>h/j/k/l`    |
| Next/Previous buffer      | `<leader>bn / bp`    |
| Save / Quit               | `<leader>w / q`      |
| LSP actions               | `<leader>ca` etc.    |
| Format code               | `<leader>lf`         |
| Reload config             | `<leader>sv`         |

🔍 Inside `nvim-tree`:
- `a`: Create file or folder (end in `/` for folder)
- `d`: Delete
- `r`: Rename
- `x/y/p`: Cut, copy, paste
- `gh`: Toggle dotfiles
- `?`: Show help popup

## 🛠 Getting Started

```bash
# Clone into your Neovim config directory
git clone https://github.com/jaredgrxss/nvim-config.git ~/.config/nvim
