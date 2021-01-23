#!/bin/sh

rm -f *.conllu
rm -f *.corpus
rm -f udpipe.model
#rm -f *.log

echo "TRAIN MODEL" 
time ./001_train.sh

echo "Run TOKENIZER"
time ./002_run_tokenizer.sh

echo "Make test"
php 003_make_test.php

echo " RUN TEST"
time ./004_run_test.sh

echo "UPOS from XPOS"
php 103_combine_xpos_upos.php

echo "Eval TOKENS"
php 200_eval_tokens.php

echo "Eval SENT"
php 201_eval_sent.php

echo "Eval LEMMA"
php 202_eval_lemma.php

echo "Eval UPOS"
php 203_eval_pos.php

echo "Eval XPOS"
php 205_eval_xpos.php

echo "Eval UPOS from XPOS"
php 206_eval_combined_upos.php
