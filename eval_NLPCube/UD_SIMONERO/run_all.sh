#!/bin/sh

echo "MAKE TRAIN TEST"
./000_make_train_test.sh

echo "TRAIN TOKENIZER"
./001_train_tokenizer.sh

echo "TRAIN TAGGER"
./002_train_tagger.sh

echo "TRAIN LEMMATIZER"
./003_train_lemmatizer.sh

echo "TRAIN PARSER"
./004_train_parser.sh

echo "Create test corpus"
php 010_make_test.php

echo "RUN TOKENIZER"
./020_run_tokenizer.sh

echo "RUN LEMMATIZER"
./021_run_lemmatizer.sh

echo "RUN TAGGER"
./022_run_tagger.sh

echo "RUN PARSER"
./023_run_parser.sh

echo "EVAL TOKENS"
php 200_eval_tokens.php

echo "EVAL SENT"
php 201_eval_sent.php

echo "EVAL LEMMA"
php 202_eval_lemma.php

echo "EVAL POS"
php 203_eval_pos.php

echo "EVAL XPOS"
php 205_eval_xpos.php
