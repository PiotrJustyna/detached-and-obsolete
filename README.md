# HOWTO

From **werl**:

```
Erlang/OTP 19 [erts-8.0] [64-bit] [smp:8:8] [async-threads:10]

Eshell V8.0  (abort with ^G)
1> c(generic_server).
{ok,generic_server}
2> c(game_server).
{ok,game_server}
3> generic_server:start(game_server1, game_server).
Looping.
true
4> game_server:add("Piotr", "Home").
Received an RPC request: {add,"Piotr","Home"} from game_server1.
Sending the request from <0.56.0> to game_server1.
Waiting for a response from game_server1.
Received request {add,"Piotr","Home"} from <0.56.0>.
Calling game_server's handle with Request: {add,"Piotr","Home"} and State: {dict,
                                                                            0,
                                                                            16,
                                                                            16,
                                                                            8,
                                                                            80,
                                                                            48,
                                                                            {[],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             [],
                                                                             []},
                                                                            {{[],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              [],
                                                                              []}}}.
game_server's handle returned Response: ok and new State: {dict,1,16,16,8,80,
                                                           48,
                                                           {[],[],[],[],[],[],
                                                            [],[],[],[],[],[],
                                                            [],[],[],[]},
                                                           {{[],[],[],[],[],
                                                             [["Piotr",72,111,
                                                               109,101]],
                                                             [],[],[],[],[],
                                                             [],[],[],[],[]}}}.
Sending the Response ok from game_server1 to <0.56.0>.
Looping.
Received the response ok from game_server1.
ok
5> game_server:add("Piotr", "Office").
Received an RPC request: {add,"Piotr","Office"} from game_server1.
Sending the request from <0.56.0> to game_server1.
Waiting for a response from game_server1.
Received request {add,"Piotr","Office"} from <0.56.0>.
Calling game_server's handle with Request: {add,"Piotr","Office"} and State: {dict,
                                                                              1,
                                                                              16,
                                                                              16,
                                                                              8,
                                                                              80,
                                                                              48,
                                                                              {[],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               [],
                                                                               []},
                                                                              {{[],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [["Piotr",
                                                                                  72,
                                                                                  111,
                                                                                  109,
                                                                                  101]],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                [],
                                                                                []}}}.
game_server's handle returned Response: ok and new State: {dict,1,16,16,8,80,
                                                           48,
                                                           {[],[],[],[],[],[],
                                                            [],[],[],[],[],[],
                                                            [],[],[],[]},
                                                           {{[],[],[],[],[],
                                                             [["Piotr",79,102,
                                                               102,105,99,
                                                               101]],
                                                             [],[],[],[],[],
                                                             [],[],[],[],[]}}}.
Sending the Response ok from game_server1 to <0.56.0>.
Looping.
Received the response ok from game_server1.
ok
6> game_server:find("Piotr").
Received an RPC request: {find,"Piotr"} from game_server1.
Sending the request from <0.56.0> to game_server1.
Waiting for a response from game_server1.
Received request {find,"Piotr"} from <0.56.0>.
Calling game_server's handle with Request: {find,"Piotr"} and State: {dict,1,
                                                                      16,16,8,
                                                                      80,48,
                                                                      {[],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[]},
                                                                      {{[],[],
                                                                        [],[],
                                                                        [],
                                                                        [["Piotr",
                                                                          79,
                                                                          102,
                                                                          102,
                                                                          105,
                                                                          99,
                                                                          101]],
                                                                        [],[],
                                                                        [],[],
                                                                        [],[],
                                                                        [],[],
                                                                        [],
                                                                        []}}}.
game_server's handle returned Response: {ok,"Office"} and new State: {dict,1,
                                                                      16,16,8,
                                                                      80,48,
                                                                      {[],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[],
                                                                       [],[]},
                                                                      {{[],[],
                                                                        [],[],
                                                                        [],
                                                                        [["Piotr",
                                                                          79,
                                                                          102,
                                                                          102,
                                                                          105,
                                                                          99,
                                                                          101]],
                                                                        [],[],
                                                                        [],[],
                                                                        [],[],
                                                                        [],[],
                                                                        [],
                                                                        []}}}.
Sending the Response {ok,"Office"} from game_server1 to <0.56.0>.
Looping.
Received the response {ok,"Office"} from game_server1.
{ok,"Office"}
```

\* I'm using the ```game_server1``` as a name to actually distinguish from the module name.
