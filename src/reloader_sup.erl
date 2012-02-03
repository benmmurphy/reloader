-module(reloader_sup).
-behaviour(supervisor).
-export([start_link/0]).
-export([init/1]).

start_link() ->
  supervisor:start_link(reloader_sup, []).

init(_) ->
  {ok, {{one_for_one, 1, 60},
        [{reloader, {reloader, start_link, []},
            permanent, brutal_kill, worker, [reloader]}]}}.

