#!/bin/sh

{ time python ../../RNNTagger/RNNTagger/PyRNN/rnn-annotate.py model/rnn.params test.corpus > test.model_only.out ; } 2>&1 | tee 005_run_upos.txt




