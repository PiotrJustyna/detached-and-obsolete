Erlang experiments with servers and messages.

Latest addition: exception handling.

```bash
Erlang/OTP 19 [erts-8.0] [64-bit] [smp:8:8] [async-threads:10]

Eshell V8.0  (abort with ^G)
1> c(generic_server).
{ok,generic_server}
2> c(game_server).
{ok,game_server}
3> generic_server:start(game_server1, game_server).
true
4> game_server:add("Piotr", "Home").
ok
5> game_server:fetch("Piotr").
"Home"
6> game_server:fetch("Joanna").
Server game_server1 request {fetch,"Joanna"}
 caused exception badarg.
** exception exit: rpc
     in function  generic_server:rpc/2 (generic_server.erl, line 12)
```
