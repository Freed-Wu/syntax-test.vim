""
" @section Introduction, intro
" @library
" NOTE: Don't edit this file directly!
" <doc/@plugin(name).txt> is generated by <https://github.com/google/vimdoc>.
" See <README.md> for more information about installation and screenshots.
"
" Note: if you use |indentLine|, remember: >
"     let g:indentLine_fileTypeExclude = ['syntax_test']
" <
" If you use |coc-diagnostic|, remember: >
"     {
"       "diagnostic-languageserver": {
"         "filetypes": {
"           "syntax_test": "syntest"
"         }
"       }
"     }
" <
" If you use |coc-nvim|, remember: >
"     let g:coc_filetype_map = {
"           \ 'sublime_syntax': 'yaml',
"           \ }
" <
" If you use |nvim-treesitter|, remember: >
"     -- https://github.com/nvim-treesitter/nvim-treesitter#adding-parsers
"     local ft_to_parser = \
"     require"nvim-treesitter.parsers".filetype_to_parsername
"     ft_to_parser.sublime_syntax = "yaml"
" <

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
let s:cache_dir = s:path . '/assets/json'
call mkdir(s:cache_dir, 'p')
for s:cache_name in ['scope', 'syntax']
  let s:cache = s:cache_dir . '/' . s:cache_name . '.json'
  let s:{s:cache_name}_items = json_decode(readfile(s:cache)[0])
endfor
""
" Completion scope cache contents. For program.
"
" https://www.sublimetext.com/docs/scope_naming.html
call g:sublime_syntax#utils#plugin.Flag('g:sublime_syntax#scope_items', s:scope_items)
""
" Completion syntax cache contents. For program.
"
" https://www.sublimetext.com/docs/syntax.html
call g:sublime_syntax#utils#plugin.Flag('g:sublime_syntax#syntax_items', s:syntax_items)
""
" Syntax names. For program.
call g:sublime_syntax#utils#plugin.Flag('g:sublime_syntax#syntax_names',
      \ map(deepcopy(s:syntax_items), {_, v -> v.word}) + ['variables', 'contexts']
      \ )
""
" Scope names. For program.
call g:sublime_syntax#utils#plugin.Flag('g:sublime_syntax#scope_names',
      \ map(deepcopy(s:scope_items), {_, v -> v.word})
      \ )
