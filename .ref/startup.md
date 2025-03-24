# Neovim Configuration Loading Order

## Overview

Neovim follows a specific order when sourcing configuration files. Below is an overview of the order and the special directories inside `~/.config/nvim`.

## Neovim Configuration Loading Order

1. **System-wide Configuration** (Optional)
   - Located at `/etc/xdg/nvim/sysinit.vim` (on Linux/macOS)
   - If it exists, it is sourced first.
2. **User Configuration**
   - **`$XDG_CONFIG_HOME/nvim/init.lua` (or `init.vim`)**
     - This is the main entry point for Neovim’s configuration.
     - If both `init.lua` and `init.vim` exist, `init.lua` is used.
3. **Runtime Path (`runtimepath`)**
   - After `init.lua` is sourced, Neovim loads all Lua modules inside:
     ```
     ~/.config/nvim/lua/**/init.lua
     ```
   - This allows for modular configuration.
4. **Plugin Loading (`packpath`)**
   - Neovim loads plugins (both system-wide and user-installed).
   - Includes anything inside:
     ```
     ~/.local/share/nvim/site/pack/**
     ```
5. **After Directory**
   - Neovim sources files inside:
     ```
     ~/.config/nvim/after/
     ```
   - These override previous configurations, allowing fine-tuned customization.

---

## Special Directories in `~/.config/nvim`

- **`init.lua` / `init.vim`** → Main configuration file.
- **`lua/`** → Stores modular Lua configurations (e.g., `lua/plugins.lua`, `lua/keymaps.lua`).
- **`after/`** → Overrides settings from plugins and core configurations.
- **`ftplugin/`** → Filetype-specific configurations.
- **`plugin/`** → User-defined plugin scripts.
- **`colors/`** → Custom color schemes.
- **`snippets/`** → Custom snippets for snippet engines.
- **`syntax/`** → Custom syntax definitions.
- **`spell/`** → Custom spell-checking dictionaries.

Would you like help structuring your Neovim config efficiently? 🚀
