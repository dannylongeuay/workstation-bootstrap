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

  augroup _alpha
    autocmd!
    autocmd FileType alpha set showtabline=0 laststatus=0 noruler | autocmd BufUnload <buffer> set showtabline=2 ruler laststatus=2
  augroup END

  augroup _autoformat
    autocmd!
    autocmd BufWritePre * :silent lua vim.lsp.buf.formatting_sync({}, 1000)
  augroup END
]])
