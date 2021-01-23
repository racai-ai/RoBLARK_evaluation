#!/bin/sh

mkdir model

{ time python3 ../NLP-Cube/cube/main.py \
    --train=tagger \
    --train-file=../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu \
    --dev-file=../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu \
    --embeddings /data/vasile/corola/corola.300.20.vec \
    --store model/tagger \
    --batch-size 1000 \
    --set-mem 8000 \
    --autobatch \
    --patience 1 \
    2>&1 | tee 002_train_tokenizer.log ; } 2>&1 | tee 002_time.txt


