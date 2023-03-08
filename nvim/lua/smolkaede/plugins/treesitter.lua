require'nvim-treesitter.configs'.setup{
  --Ensure installed
  ensure_installed = {"help", "json", "go", "java", "lua", "ruby"},

  --Install parsers synchronosly
  sync_install = false,

  --Auto install
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}
