#!/bin/sh

python ../conll2017/evaluation_script/conll17_ud_eval.py -v ../ud/UD_Romanian-RRT/ro_rrt-ud-test.conllu test.parser.out.conllu
