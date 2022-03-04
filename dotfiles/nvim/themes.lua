vim.g.tokyonight_style = "storm"
vim.g.tokyonight_sidebars = { "terminal", "packer" }

vim.cmd([[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])
