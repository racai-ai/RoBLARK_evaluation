#!/bin/sh

../udpipe-1.2.0/udpipe-1.2.0-bin/bin-linux64/udpipe \
    --tag --parse udpipe.model \
    --output=conllu \
    --input=vertical \
    test.corpus \
    > test.model_only.out.conllu

