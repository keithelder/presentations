-module(hello).
-export([sayit/1]).

sayit(Message) ->
    io:format("~s~n", [Message]).
