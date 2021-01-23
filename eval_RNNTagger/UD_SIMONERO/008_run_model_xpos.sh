#!/bin/sh

{ time python ../../RNNTagger/RNNTagger/PyRNN/rnn-annotate.py model/rnn.xpos.params test.corpus > test.model_only.xpos.out ; } 2>&1 | tee 008_run_xpos.txt




