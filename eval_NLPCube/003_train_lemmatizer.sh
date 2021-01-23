#!/bin/sh

mkdir model

{ time python3 ../NLP-Cube/cube/main.py \
    --train=lemmatizer \
    --train-file=../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu \
    --dev-file=../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu \
    --embeddings /data/vasile/corola/corola.300.20.vec \
    --store model/lemmatizer \
    --batch-size 1000 \
    --set-mem 8000 \
    --autobatch \
    --patience 1 \
    2>&1 | tee 003_train_lemmatizer.log ; } 2>&1 | tee 003_time.txt


