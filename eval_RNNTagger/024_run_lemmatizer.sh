#!/bin/sh

# Set these paths appropriately

SCRIPTS=../RNNTagger/RNNTagger/scripts
LIB=../RNNTagger/RNNTagger/lib
PyNMT=../RNNTagger/RNNTagger/PyNMT

REFORMAT="perl ${SCRIPTS}/reformat.pl"
LEMMATIZER="python3 $PyNMT/nmt-translate.py"

{ time $REFORMAT test.model_only.xpos.out > test.model_only.reformatted ; } 2>&1 | tee 024_1_run_lemmatizer.txt
{ time $LEMMATIZER --print_source model/nmt.params test.model_only.reformatted > test.model_only.lemmas ; } 2>&1 | tee 024_2_run_lemmatizer.txt
{ time $SCRIPTS/lemma-lookup.pl test.model_only.lemmas test.model_only.xpos.out > test.model_only.out.lemma ; } 2>&1 | tee 024_3_run_lemmatizer.txt

#rm $TMP.tok  $TMP.tagged  $TMP.reformatted $TMP.lemmas
