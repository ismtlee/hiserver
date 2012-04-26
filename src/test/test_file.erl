-module(test_file).
-export([read/0,write_log/1]).
write_log(Content)->
    case file:open("/tmp/mydebug.log",[append]) of
	{ok,F}->
	    case io:format(F,"~p~n",[Content]) of
		ok->
		    file:close(F);
		    
		{error, _} ->
		    error
	    end;
	{_,_}->
	    io:format("open file failed~n",[])
    end.
		
read()->		    
	ok.
		
    
    
