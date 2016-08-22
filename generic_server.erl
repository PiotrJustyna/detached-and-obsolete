-module(generic_server).
-export([start/2, rpc/2]).

start(Name, Module) ->
  register(
    Name,
    spawn(fun() -> loop(Name, Module, Module:init()) end)).

rpc(Name, Request) ->
  Name ! { self(), Request },
  receive
    { Name, crash } -> exit(rpc);
    { Name, ok, Response } -> Response
  end.

loop(Name, Module, State) ->
  receive
    { From, Request } ->
      try Module:handle(Request, State) of
        { Response, State1 }  ->
          From ! { Name, ok, Response },
          loop(Name, Module, State1)
      catch
        _:Reason ->
          log_the_error(Name, Request, Reason),
          From ! { Name, crash },
          loop(Name, Module, State)
      end
  end.

  log_the_error(Name, Request, Reason) ->
    io:format("Server ~p request ~p~n caused exception ~p.~n", [Name, Request, Reason]).
