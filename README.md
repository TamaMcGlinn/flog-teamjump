# Flog teamjump - jump through your team's commits

This is plugin to use in combination with vim-flog; it is for jumping 
between members of user-defined 'teams' - some subset of git authors that
you are interested in. Of course, if you are just looking for one author's commits,
you can just use * to search, on their last / first name, which is much simpler.

The plugin only defines autoload'ed functions, so there is 0 overhead when you don't use it,
and no chance of accidentally overriding your keybindings, because the plugin doesn't define
any itself.

With this plugin, you can define some teams, for instance, with this in your (private) vimrc:

```
let g:flogteamjump_teams = [{'name': 'Team1',
                         \'members': ['YourName', 'Colleague1', 'Colleague2']},
                       \{'name': 'Team2',
                         \'members': ['Colleague3']}]

augroup flogteamjump
  autocmd FileType floggraph nno <silent> <buffer> ]] :<C-U>call flogteamjump#Choose_From_Teams()<CR>
  autocmd FileType floggraph nno <silent> <buffer> ]p :<C-U>call flogteamjump#Jump_To_Selected_Team(v:true)<CR>
  autocmd FileType floggraph nno <silent> <buffer> [p :<C-U>call flogteamjump#Jump_To_Selected_Team(v:false)<CR>
augroup END
```

The first team is selected by default. The above mappings, for example, give `]p` to jump forwards and `[p` to jump backwards, `]]`
to show the teams and select one.

An Alternative to the `flogteamjump#Choose_From_Teams()` menu is to define direct mappings to switch teams:

```
let g:awesome_team = {'name': 'Team1',
                         \'members': ['YourName', 'Colleague1', 'Colleague2']}

let g:flogteamjump_teams = [g:awesome_team, g:less_awesome_team]

augroup flogteamjump
  autocmd FileType floggraph nno <silent> <buffer> ]]a :<C-U>call flogteamjump#Select_Team(g:awesome_team)<CR>
augroup END
```

## Installation

Use your plugin manager, for instance for plug:

```
Plug 'TamaMcGlinn/flog-teamjump.vim'
```

