require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "css",
    "scss",
    "html",
    "javascript",
    "typescript",
    "json",
    "jsonc",
  },
  sync_install = true,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = { enable = false },
  context_commentstring = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true }
}
