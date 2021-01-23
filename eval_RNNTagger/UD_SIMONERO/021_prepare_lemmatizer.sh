#!/bin/sh

# Set these paths appropriately

SCRIPTS=../../RNNTagger/RNNTagger/scripts

REFORMAT="perl ${SCRIPTS}/reformat.pl"

$REFORMAT lemmatizer-train.src.tok > lemmatizer-train.src
$REFORMAT lemmatizer-test.src.tok >> lemmatizer-train.src
$REFORMAT lemmatizer-dev.src.tok > lemmatizer-dev.src

