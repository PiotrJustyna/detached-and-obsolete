-module(generic_server).
-export([start/2, rpc/2]).

start(Name, Module) ->
  register(
    Name,
    spawn(fun() -> loop(Name, Module, Module:init()) end)).

rpc(Name, Request) ->
  Name ! { self(), Request },
  receive
    { Name, Response } -> Response
  end.

loop(Name, Module, State) ->
  io:format("generic server looping\n"),
  receive
    { From, Request } ->
      io:format("generic server received a request and is calling the ~p's handle.~n", [Module]),
      { Response, State1 } = Module:handle(Request, State),
      io:format("generic server received ~p's result.~n", [Module]),
    From ! { Name, Response },
    io:format("generic server is sending a message to ~p.~n", [From]),
    loop(Name, Module, State1)
  end.
