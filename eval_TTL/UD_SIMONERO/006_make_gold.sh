#!/bin/sh

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.conllu > gold.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.conllu >> gold.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.conllu >> gold.conllu
