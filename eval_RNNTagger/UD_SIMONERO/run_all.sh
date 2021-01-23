#!/bin/sh

echo "Make train/dev UPOS"
php 002_make_train_dev_upos.php

echo "Train UPOS"
time ./003_train_upos.sh

echo "Make test"
php 004_make_test.php

echo "Run model UPOS"
time ./005_run_model_upos.sh

echo "Make train dev xpos"
php 006_make_train_dev_xpos.php

echo "Train XPOS"
time ./007_train_xpos.sh

echo "Run model XPOS"
time ./008_run_model_xpos.sh

echo "RUN Tokenizer"
{ time ./010_run_tokenizer.sh ; } 2>&1 | tee 010_tokenizer.txt

echo "Prepare lemmatizer"
php 020_prepare_lemmatizer.php

echo "Prepare lemmatizer (2)"
./021_prepare_lemmatizer.sh

echo "Prepare lemmatizer (3)"
php 022_prepare_lemmatizer_tgt.php

echo "Train lemmatizer"
time ./023_train_lemmatizer.sh

echo "Run lemmatizer"
time ./024_run_lemmatizer.sh

echo "Convert tokens to conllu"
php 100_tokens_to_conllu.php

echo "Convert model to conllu"
php 101_model_to_conllu.php

echo "Convert model xpos to conllu"
php 102_model_xpos_to_conllu.php

echo "Combine XPOS and UPOS"
php 103_combine_xpos_upos.php

echo "Make test"
./104_make_test.sh

echo "Eval Tokens"
php 200_eval_tokens.php

echo "Eval Sentences"
php 201_eval_sent.php

echo "Eval UPOS"
php 203_eval_pos.php

echo "Eval XPOS"
php 205_eval_xpos.php

echo "Eval combined UPOS"
php 206_eval_combined_upos.php

echo "Convert lemma to conllu"
php 207_lemma_to_conllu.php

echo "Eval lemma"
php 208_eval_lemma.php
