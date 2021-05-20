let g:flogteamjump_selected_team = v:null

function! flogteamjump#Jump_To_Selected_Team(forwards) abort
  if type(g:flogteamjump_selected_team) != v:t_list
    let g:flogteamjump_selected_team = g:flogteamjump_teams[0]
  endif
  if a:forwards
    let l:flags = ''
  else
    let l:flags = 'b'
  endif
  call search(flogteamjump#Build_Teamjump_Regex(g:flogteamjump_selected_team.members), l:flags)
endfunction

function! flogteamjump#Build_Teamjump_Regex(authors) abort
  return '{' . join(a:authors, '\|') . '}'
endfunction

" This function makes it possible to define each team as a global, and
" define your own custom mapping to directly select that team, instead of
" using Choose_From_Teams()
function! flogteamjump#Select_Team(team) abort
  echom('Setting flogteamjump to track team ' . a:team.name)
  echom ' (' . join(a:team.members, ', ') . ')'
  let g:flogteamjump_selected_team = a:team
endfunction

function! flogteamjump#Choose_From_Teams() abort
  echo("Choose a team")
  let l:index = 1
  for l:team in g:flogteamjump_teams
    echo('[' . l:index . '] ' . l:team.name . ' (' . join(l:team.members, ', ') . ')')
    let l:index = l:index + 1
  endfor
  let l:index = input('Team number: ')
  redraw
  call flogteamjump#Select_Team(g:flogteamjump_teams[l:index-1])
endfunction
