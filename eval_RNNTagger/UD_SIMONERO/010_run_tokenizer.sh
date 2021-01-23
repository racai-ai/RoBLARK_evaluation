#!/bin/sh

# Set these paths appropriately

BIN=./bin
SCRIPTS=../../RNNTagger/RNNTagger/scripts
LIB=../../RNNTagger/RNNTagger/lib
PyRNN=../../RNNTagger/RNNTagger/PyRNN
PyNMT=../../RNNTagger/RNNTagger/PyNMT
TMP=/tmp/rnn-tagger$$
LANGUAGE=romanian

TOKENIZER="perl ${SCRIPTS}/tokenize.pl"
ABBR_LIST=${LIB}/Tokenizer/${LANGUAGE}-abbreviations
TAGGER="python3 $PyRNN/rnn-annotate.py"
RNNPAR=${LIB}/PyRNN/${LANGUAGE}
REFORMAT="perl ${SCRIPTS}/reformat.pl"
LEMMATIZER="python3 $PyNMT/nmt-translate.py"
NMTPAR=${LIB}/PyNMT/${LANGUAGE}

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.txt > test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.txt >> test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.txt >> test.txt

$TOKENIZER -r -a $ABBR_LIST test.txt > test.tokens.out

