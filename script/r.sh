cd ../ebin
erl +P 1024000 +K true -smp disable -name sd1@127.0.0.1 -setcookie sd2  -boot start_sasl -config log  -s sd server_start -extra 127.0.0.1 6666 1
