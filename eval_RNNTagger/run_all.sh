#!/bin/sh

echo "Make train/dev UPOS"
php 002_make_train_dev_upos.php

echo "Train UPOS"
{ time ./003_train_upos.sh ; } 2>&1 | tee 003_train_upos.txt

exit -1

echo "RUN Tokenizer"
{ time ./010_run_tokenizer.sh ; } 2>&1 | tee 010_tokenizer.txt

echo "Convert tokens to conllu"
php 100_tokens_to_conllu.php

echo "Eval Tokens"
php 200_eval_tokens.php

echo "Eval Sentences"
php 201_eval_sent.php


