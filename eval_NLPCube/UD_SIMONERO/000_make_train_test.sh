#!/bin/sh

cat ../../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu > train.conllu
cat ../../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu >> train.conllu

cat ../../ud/UD_Romanian-RRT/ro_rrt-ud-train.txt > train.txt
cat ../../ud/UD_Romanian-RRT/ro_rrt-ud-test.txt >> train.txt

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.txt > test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.txt >> test.txt
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.txt >> test.txt

cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-train.conllu > test.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-test.conllu >> test.conllu
cat ../../ud/UD_Romanian-SiMoNERo/ro_simonero-ud-dev.conllu >> test.conllu
