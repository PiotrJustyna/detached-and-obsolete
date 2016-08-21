-module(generic_server).
-export([start/2, rpc/2]).

start(Name, Module) ->
  register(
    Name,
    spawn(fun() -> loop(Name, Module, Module:init()) end)).

rpc(Name, Request) ->
  io:format("Received an RPC request: ~p from ~p.\n", [Request, Name]),
  io:format("Sending the request from ~p to ~p.\n", [self(), Name]),
  Name ! { self(), Request },
  io:format("Waiting for a response from ~p.\n", [Name]),
  receive
    { Name, Response } ->
      io:format("Received the response ~p from ~p.\n", [Response, Name]),
      Response
  end.

loop(Name, Module, State) ->
  io:format("Looping.\n"),
  receive
    { From, Request } ->
      io:format("Received request ~p from ~p.\n", [Request, From]),
      io:format("Calling ~p's handle with Request: ~p and State: ~p.\n", [Module, Request, State]),
      { Response, State1 } = Module:handle(Request, State),
      io:format("~p's handle returned Response: ~p and new State: ~p.~n", [Module, Response, State1]),
    io:format("Sending the Response ~p from ~p to ~p.\n", [Response, Name, From]),
    From ! { Name, Response },
    loop(Name, Module, State1)
  end.
