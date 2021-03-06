-module(mongo_cursor_test).

-export([do_find/1, do_find/2]).

do_find(Connection) ->
	mongo:do(safe, master, Connection, mongrel_test, 
			 fun() ->
					 C = mongo:find(author, {}),
					 %mongo_cursor:close(C),
					 %mongo_cursor:rest(C),
					 C
			 end				 
			).

do_find(_Connection, 0) ->
	ok;
do_find(Connection, Count) ->
	do_find(Connection),
	do_find(Connection, Count-1).
