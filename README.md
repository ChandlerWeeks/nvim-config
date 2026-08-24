# Neovim Configuration

Personal Neovim configuration built with Lua and [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- Neovim 0.12+
- Git
- A Nerd Font for icons
- `ripgrep` for repository text search
- `tree-sitter-cli`, a C compiler, `curl`, and `tar` for Treesitter parsers
- OpenSSH, `curl`, and `tar` for remote development

## Install

Clone this repository to your Neovim configuration directory:

```sh
git clone https://github.com/ChandlerWeeks/nvim-config.git ~/.config/nvim
```

Open Neovim, then let lazy.nvim install the configured plugins.

For richer Markdown rendering, install its Treesitter parsers:

```vim
:TSInstall markdown markdown_inline
```

## Key bindings

Leader is `Space`.

| Key | Action |
| --- | --- |
| `Ctrl-f` | Fuzzy search within the current file |
| `Space f f` | Find files |
| `Space f g` | Search repository text |
| `Space e` | Toggle file explorer |
| `Space e f` | Focus file explorer and reveal current file |
| `Space o` | Toggle code outline |
| `Space c f` | Format current buffer |
| `]t` / `[t` | Next / previous TODO-style comment |
| `Space f t` | Search TODO-style comments |
| `Space r s` | Start or reconnect to a remote Neovim session |

## Remote development

Add hosts to `~/.ssh/config`, start Neovim locally, then press `Space r s` (or run
`:RemoteStart`). Choose **Remote SSH: Set up configured SSH host** and select the
host and remote project directory. The first connection installs an isolated
Neovim on the host and copies this configuration; later connections can reuse the
saved host and workspace.

The remote host needs an SSH server, `bash`, either `curl` or `wget`, and access
to GitHub so Neovim and the configured plugins can be installed. Run
`:checkhealth remote-nvim` locally to diagnose missing prerequisites. Use
`:RemoteCleanup` to remove the plugin-managed Neovim installation and workspace
from a host.
