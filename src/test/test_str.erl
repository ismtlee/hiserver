%%%-------------------------------------------------------------------
%%% File          : test_str.erl
%%% Author        : Ludianjun
%%% Organization  : __MyCompanyName__
%%% Project       : gameserver
%%% Description   : 
%%%
%%% Created       :  11-2-24
%%%-------------------------------------------------------------------
-module(test_str).
-author(ludianjun).
-export([test/0]).
%% 角色名合法性检测
validate_name(Name) ->
    validate_name(len, Name).

%% 角色名合法性检测:长度
validate_name(len, Name) ->
    case asn1rt:utf8_binary_to_list(list_to_binary(Name)) of
        {ok, CharList} ->
			io:format("~p~n",[CharList]),
            Len = string_width(CharList),   
            case Len < 11 andalso Len > 1 of
                true ->
                    validate_name(existed, Name);
                false ->
                    %%角色名称长度为1~5个汉字
                    {false, 5}
            end;
        {error, _Reason} ->
            %%非法字符
            {false, 4}
    end;

%%判断角色名是否已经存在
%%Name:角色名
validate_name(existed, Name) ->
    true;
validate_name(_, _Name) ->
    {false, 2}.


%% 字符宽度，1汉字=2单位长度，1数字字母=1单位长度
string_width(String) ->
    string_width(String, 0).
string_width([], Len) ->
    Len;
string_width([H | T], Len) ->
    case H > 255 of
        true ->
            string_width(T, Len + 2);
        false ->
            string_width(T, Len + 1)
    end.

test()->
	Name="张三",
	validate_name(Name).
