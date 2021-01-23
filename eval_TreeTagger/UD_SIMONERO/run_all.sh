#!/bin/sh

echo "Cleanup"
rm -f *.lexicon
rm -f *.conllu
rm -f *.out
rm -f *.corpus
rm -f *.openclass
rm -f model
rm -f model.xpos

echo "Make lexicon UPOS"
php 001.1_make_lexicon_upos.php

echo "Make openclass UPOS"
php 001.2_make_openclass_upos.php

echo "Make lexicon XPOS"
php 001.3_make_lexicon_xpos.php

echo "Make openclass XPOS"
php 001.4_make_openclass_xpos.php

echo "Prepare train corpus UPOS"
php 002.1_make_train_upos.php

echo "Prepare train corpus XPOS"
php 002.2_make_train_xpos.php

echo "Train on UPOS+LEMMA"
chmod u+x 003.1_train_upos.sh
time ./003.1_train_upos.sh

echo "Train on XPOS"
chmod u+x 003.2_train_xpos.sh
time ./003.2_train_xpos.sh

echo "Prepare test corpus"
php 004_make_test.php

echo "Run UPOS+LEMMA model"
chmod +x 005.1_run_model_upos.sh
time ./005.1_run_model_upos.sh

echo "Run XPOS model"
chmod +x 005.2_run_model_xpos.sh
time ./005.2_run_model_xpos.sh

echo "Prepare gold corpus"
./006_make_gold.sh

echo "Run tokenizer"
chmod u+x 010_run_tokenizer.sh
time ./010_run_tokenizer.sh

echo "Convert tokenizer output to conllu"
php 100_tokens_to_conllu.php

echo "Convert UPOS output to conllu"
php 101_model_to_conllu.php

echo "Convert XPOS output to conllu"
php 102_model_xpos_to_conllu.php

echo "Combine XPOS/UPOS to conllu"
php 103_combine_xpos_upos.php

echo "EVALUATION Tokens"
php 200_eval_tokens.php

echo "EVALUATION Sentences from UPOS model"
php 201_eval_sent.php

echo "EVALUATION Lemma UPOS"
php 202_eval_lemma.php

echo "EVALUATION UPOS"
php 203_eval_pos.php

echo "EVALUATION Lemma XPOS"
php 204_eval_lemma_xpos.php

echo "EVALUATION XPOS"
php 205_eval_xpos.php

echo "EVALUATION UPOS derived from XPOS"
php 206_eval_combined_upos.php

echo "EVALUATION Sentences from XPOS model"
php 207_eval_sent_xpos.php
