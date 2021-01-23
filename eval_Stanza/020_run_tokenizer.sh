#!/bin/sh

{ time python -m stanza.models.tokenizer \
	--mode predict \
	--txt_file ../ud/UD_Romanian-RRT/ro_rrt-ud-test.txt \
	--lang ro \
	--conll_file test.tokens.out.conllu \
	--shorthand rrt \
	--load_name saved_models/tokenize/rrt_tokenizer.pt ; } 2>&1 | tee 020_run_tokenize.txt

