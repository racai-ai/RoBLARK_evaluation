#!/bin/sh

# Set these paths appropriately

BIN="../../TreeTagger/bin"
CMD="../../TreeTagger/cmd"
LIB="../../TreeTagger/lib"

OPTIONS="-token -lemma -sgml"

TOKENIZER=${CMD}/utf8-tokenize.perl
TAGGER=${BIN}/tree-tagger
ABBR_LIST=${LIB}/romanian-abbreviations
PARFILE=${LIB}/romanian.par

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.txt > test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.txt >> test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.txt >> test.txt


{ time cat test.txt | $TOKENIZER -r -a $ABBR_LIST $* | ${CMD}/split-romanian.perl ${LIB}/romanian-tokens >test.tokens.out ; } 2>&1 | tee 010_run_tokenizer.log

