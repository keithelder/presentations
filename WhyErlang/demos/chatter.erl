-module(chatter).

-export([start/0, loop/1]).

start() ->
    spawn(?MODULE, loop, [1]).

loop(Count) ->
    receive  
        done ->
            io:format("Closing~n", []),
            ok;
        skip -> 
            ?MODULE:loop(Count+2)
    after 2000 ->
              io:format("Erlang Loop ~p says hey That Conference!~n", [Count]),
              ?MODULE:loop(Count+1)
    end.
