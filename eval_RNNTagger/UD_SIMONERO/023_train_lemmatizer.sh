#!/bin/sh

mkdir -p model

{ time python ../../RNNTagger/RNNTagger/PyNMT/nmt-train.py \
    lemmatizer-train.src lemmatizer-train.tgt \
    lemmatizer-dev.src lemmatizer-dev.tgt \
    model/nmt.params ; } 2>&1 | tee 023_train_lemmatizer.txt




