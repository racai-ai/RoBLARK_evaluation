#!/bin/sh

{ time python -m stanza.models.parser \
	--mode predict \
	--data_dir saved_models/parser \
	--wordvec_file /data/vasile/corola/corola.300.20.vec \
	--lang ro \
	--shorthand ro_rrt \
	--eval_file simonero.conllu \
	--output_file test.parser.out.conllu ; } 2>&1 | tee 023_run_parser.txt


