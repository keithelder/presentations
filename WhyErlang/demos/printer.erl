-module(printer).
-export([print/2,print_msg/0]).

print(Node, Message) ->
    Pid = spawn(Node, printer, print_msg, []),
    Pid ! {msg, Message},
    Pid ! stop.

print_msg() -> 
    receive
        {msg, Msg} -> 
            erlang:display(Msg),
            print_msg();
        stop -> 
            ok
    end.


