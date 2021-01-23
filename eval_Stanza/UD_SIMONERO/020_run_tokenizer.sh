#!/bin/sh

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.txt > simonero.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.txt >> simonero.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.txt >> simonero.txt

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.conllu > simonero.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.conllu >> simonero.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.conllu >> simonero.conllu


{ time python -m stanza.models.tokenizer \
	--mode predict \
	--txt_file simonero.txt \
	--lang ro \
	--conll_file test.tokens.out.conllu \
	--shorthand rrt \
	--load_name saved_models/tokenize/rrt_tokenizer.pt ; } 2>&1 | tee 020_run_tokenize.txt

