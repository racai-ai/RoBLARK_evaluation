#!/bin/sh

# Set these paths appropriately

BIN="../TreeTagger/bin"
CMD="../TreeTagger/cmd"
LIB="../TreeTagger/lib"

OPTIONS="-token -lemma -sgml"

TOKENIZER=${CMD}/utf8-tokenize.perl
TAGGER=${BIN}/tree-tagger
ABBR_LIST=${LIB}/romanian-abbreviations
PARFILE=${LIB}/romanian.par

cat ../ud/UD_Romanian-RRT/ro_rrt-ud-test.txt | $TOKENIZER -r -a $ABBR_LIST $* | ${CMD}/split-romanian.perl ${LIB}/romanian-tokens >test.tokens.out

