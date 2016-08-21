# HOWTO

From **werl**:

```
c(generic_server).
c(game_server).
generic_server:start(game_server1, game_server).
---
11> game_server:add("Piotr", "Home").               
generic server received a request and is calling the game_server's handle.
generic server received game_server's result.
generic server is sending a message to <0.86.0>.
generic server looping
ok
---
12> game_server:find("Piotr").        
generic server received a request and is calling the game_server's handle.
generic server received game_server's result.
generic server is sending a message to <0.86.0>.
generic server looping
{ok,"Home"}
```

\* I'm using the ```game_server1``` as a name to actually distinguish from the module name.
