#!/bin/sh

../udpipe-1.2.0/udpipe-1.2.0-bin/bin-linux64/udpipe \
    --tokenize udpipe.model \
    --output=conllu \
    ../ud/UD_Romanian-RRT/ro_rrt-ud-test.txt \
    > test.tokens.out.conllu

