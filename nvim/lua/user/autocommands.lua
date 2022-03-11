vim.cmd([[
  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _qf
    autocmd!
    autocmd FileType qf setlocal wrap
  augroup end

  augroup _autoformat
    autocmd!
    autocmd BufWritePre * :silent lua vim.lsp.buf.formatting_sync({}, 1000)
  augroup END
]])
