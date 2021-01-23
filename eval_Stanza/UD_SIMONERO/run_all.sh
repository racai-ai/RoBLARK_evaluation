#!/bin/sh

echo "TRAIN TOKENIZER"
time ./001_train_tokenizer.sh

echo "TRAIN LEMMATIZER"
time ./002_train_lemmatizer.sh

echo "TRAIN POS"
time ./003_train_pos.sh

echo "TRAIN PARSER"
time ./004_train_parser.sh

echo "RUN TOKENIZER"
time ./020_run_tokenizer.sh

echo "RUN LEMMATIZER"
time ./021_run_lemmatizer.sh

echo "RUN POS"
time ./022_run_pos.sh

echo "RUN PARSER"
time ./023_run_parser.sh

php 103_combine_xpos_upos.php

echo "EVAL TOKENS"
php 200_eval_tokens.php

echo "EVAL SENT"
php 201_eval_sent.php

echo "EVAL LEMMA"
php 202_eval_lemma.php

echo "EVAL UPOS"
php 203_eval_pos.php

echo "EVAL XPOS"
php 205_eval_xpos.php

echo "EVAL COMBINED UPOS"
php 206_eval_combined_upos.php

echo "EVAL PARSING"
./207_eval_parsing.sh

