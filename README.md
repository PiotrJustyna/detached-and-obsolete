# HOWTO

```erlang
c(generic_server).
c(game_server).
generic_server:start(game_server, game_server).
game_server:add("Piotr", "Home").
game_server:find("Piotr").
---
{ok,"Home"}
```
