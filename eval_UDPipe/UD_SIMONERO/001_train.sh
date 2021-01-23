#!/bin/sh

../../udpipe-1.2.0/udpipe-1.2.0-bin/bin-linux64/udpipe \
    --train udpipe.model.ud \
    ../../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu \
    ../../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu \
    ../../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu
