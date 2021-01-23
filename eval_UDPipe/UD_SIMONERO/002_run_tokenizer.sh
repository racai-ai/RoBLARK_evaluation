#!/bin/sh

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.txt > test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.txt >> test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.txt >> test.txt


../../udpipe-1.2.0/udpipe-1.2.0-bin/bin-linux64/udpipe \
    --tokenize udpipe.model.ud \
    --output=conllu \
    test.txt \
    > test.tokens.out.conllu

