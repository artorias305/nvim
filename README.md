# 🌀 Neovim Config

A personal, fast, and minimal Neovim setup optimized for development and note-taking.

## ✨ Features

- 🎨 **Colorscheme**: Tokyo Night (switchable via `themify.lua`)
- **LSP + Autocompletion**: Powered by `nvim-lspconfig`, `blink.cmp`
- **Fuzzy finding**: File, buffer, and LSP search with `telescope.nvim`
- **Treesitter**: Enchanced syntax highlighting and text objects
- **Plugin manger**: `lazy.nvim`
- **File Explorer**: `neotree.nvim` and `oil.nvim` for navigation
- **Statusline**: Customizable with `lualine.nvim`
- **Markdown Rendering**: Preview Markdown with `render-markdown.lua`

## 🧩 Plugin Highlights

| Plugin                | Purpose                              |
|-----------------------|--------------------------------------|
| `nvim-treesitter`     | Syntax highlighting and text objects |
| `telescope.nvim`      | Fuzzy finder for files, buffers, LSP |
| `blink.cmp`           | Autocompletion engine               |
| `nvim-lspconfig`      | LSP configuration                   |
| `which-key.nvim`      | Keybinding hints                    |
| `lualine.nvim`        | Customizable statusline             |
| `mason.nvim`          | LSP and tool installer              |
| `neotree.nvim`        | File explorer                       |
| `oil.nvim`            | Lightweight file manager            |
| `render-markdown.lua` | Markdown preview                    |
| `nvim-autopairs`      | Auto-close brackets and quotes      |

## 🧠 LSP Support

Preconfigured language servers for:

- TypeScript / JavaScript
- C / C++
- Lua
- Go

Autoformatting on save is enabled for supported servers.

## ⌨️ Keybindings 

Default `<leader>` is `<Space>`. Key mappings are defined in `lua/config/keymaps.lua`. Highlights:

- `<leader>ff` -> Fuzzy find files (`telescope.nvim`)
- `<leader>fg` -> Live grep in project (`telescope.nvim`)
- `<leader>e` -> Toggle NeoTree file explorer
- `<leader>ths` -> Open theme switcher (`themify.lua`)

See `keymaps.lua` for the full list.

## 📦 Installation

### Prerequisites

- Neovim
- Git
- Node.js
- clang

### Steps

1. Clone the repository:

```bash
git clone https://github.com/artorias305/nvim ~/.config/nvim
```

2. Start Neovim to install plugins via `lazy.nvim`:

```bash
nvim
```

3. Install LSP servers (optional, via `mason.nvim`);

```lua
:MasonInstall lua-language-server typescript-language-server gopls clangd
```

## 🛠️ Customization

- **Plugins**: Add new plugins to `lua/plugins/`.
- **LSP**: Extend `lua/plugins/lspconfig.lua` to add new language servers.
- **Keymaps**: Modify `lua/config/keymaps.lua` for custom keybindings.
- **Options**: Tweak Neovim settings in `lua/config/options.lua`.

## 📂 Directory Structure

```bash
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── autopairs.lua
│       ├── completion.lua
│       ├── lspconfig.lua
│       ├── lualine.lua
│       ├── mason.lua
│       ├── mini.lua
│       ├── neotree.lua
│       ├── noice.lua
│       ├── oil.lua
│       ├── render-markdown.lua
│       ├── snacks.lua
│       ├── telescope.lua
│       ├── themify.lua
│       ├── treesitter.lua
│       └── which-key.lua
└── README.md
```

## 📜 License

MIT License. Feel free to use and modify this configuration.

## 🤝 Contributing

Contributions are welcome! Please open an issue or pull request on [GitHub](https://github.com/artorias305/nvim).
