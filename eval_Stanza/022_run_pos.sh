#!/bin/sh

{ time python -m stanza.models.tagger \
	--mode predict \
	--data_dir saved_models/pos \
	--wordvec_file /data/vasile/corola/corola.300.20.vec \
	--lang ro \
	--shorthand ro_rrt \
	--eval_file ../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu \
	--output_file test.tagger.out.conllu ; } 2>&1 | tee 022_run_pos.txt


