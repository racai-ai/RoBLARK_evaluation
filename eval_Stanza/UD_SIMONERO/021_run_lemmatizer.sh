#!/bin/sh

{ time python -m stanza.models.lemmatizer \
	--mode predict \
	--data_dir saved_models/lemma \
	--lang ro \
	--eval_file simonero.conllu \
	--output_file test.lemmatizer.out.conllu ; } 2>&1 | tee 021_run_lemmatizer.txt


