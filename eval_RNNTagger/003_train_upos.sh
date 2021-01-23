#!/bin/sh

mkdir -p model

{ time python ../RNNTagger/RNNTagger/PyRNN/rnn-train.py \
    --word_embeddings /data/vasile/corola/corola.300.20.vec \
    train.upos dev.upos model/rnn.params ; } 2>&1 | tee 003_train_upos.txt
    



