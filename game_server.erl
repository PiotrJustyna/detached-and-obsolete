-module(game_server).
-export([init/0, add/2, find/1, handle/2]).
-import(generic_server, [rpc/2]).

init() -> dict:new().

add(Name, Place) -> rpc(game_server1, { add, Name, Place }).

find(Name) -> rpc(game_server1, { find, Name }).

handle({ add, Name, Place }, Dict) -> { ok, dict:store(Name, Place, Dict) };
handle({ find, Name }, Dict) -> { dict:find(Name, Dict), Dict }.
