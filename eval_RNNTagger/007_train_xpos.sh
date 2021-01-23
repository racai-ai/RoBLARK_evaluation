#!/bin/sh

mkdir -p model

{ time python ../RNNTagger/RNNTagger/PyRNN/rnn-train.py \
    --word_embeddings /data/vasile/corola/corola.300.20.vec \
    train.xpos dev.xpos model/rnn.xpos.params ; } 2>&1 | tee 007_train_xpos.txt




