#!/bin/sh

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.conllu > test.gold.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.conllu >> test.gold.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.conllu >> test.gold.conllu
