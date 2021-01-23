#!/bin/sh

{ time python -m stanza.models.lemmatizer \
	--mode predict \
	--data_dir saved_models/lemma \
	--lang ro \
	--eval_file ../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu \
	--output_file test.lemmatizer.out.conllu ; } 2>&1 | tee 021_run_lemmatizer.txt


