#!/bin/sh

# Set these paths appropriately

BIN=./bin
SCRIPTS=../RNNTagger/RNNTagger/scripts
LIB=../RNNTagger/RNNTagger/lib
PyRNN=./PyRNN
PyNMT=./PyNMT
TMP=/tmp/rnn-tagger$$
LANGUAGE=romanian

TOKENIZER="perl ${SCRIPTS}/tokenize.pl"
ABBR_LIST=${LIB}/Tokenizer/${LANGUAGE}-abbreviations
TAGGER="python3 $PyRNN/rnn-annotate.py"
RNNPAR=${LIB}/PyRNN/${LANGUAGE}
REFORMAT="perl ${SCRIPTS}/reformat.pl"
LEMMATIZER="python3 $PyNMT/nmt-translate.py"
NMTPAR=${LIB}/PyNMT/${LANGUAGE}

$TOKENIZER -r -a $ABBR_LIST ../ud/UD_Romanian-RRT/ro_rrt-ud-test.txt > test.tokens.out

