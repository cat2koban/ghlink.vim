let s:V = vital#ghlink#new()
let s:Prelude = s:V.import('Prelude')

" global scope
" g: これもグローバルスコープ、これは変数につく
function! ghlink#build_url(line1, line2)
  let anchor = "L".a:line1."-L".a:line2
  let path = expand('%:p')
  let url = "https://github.com/".s:extract_github_organization()."/blob/".s:current_git_hash()."/".s:current_git_path(path)."#".anchor
  let @* = url
endfunction

" s: スコープがこのファイルonly
function! s:current_git_hash()
  let current_git_hash = system("git rev-parse HEAD")
  return substitute(l:current_git_hash, "\n", "", "g")
endfunction

function! s:current_git_path(path)
  let git_root = s:Prelude.path2project_directory(a:path)
  return substitute(a:path, git_root."/", "", "g")
endfunction

function! s:extract_github_organization()
  let lines = split(system("git remote -v"), "\n")
  for line in lines
    let url = split(line, "[\t ]")[1]
    let org = join(split(url, "[/:]")[-2:-1], "/")
  endfor

  return substitute(org, "\.git$", "", "g")
endfunction
