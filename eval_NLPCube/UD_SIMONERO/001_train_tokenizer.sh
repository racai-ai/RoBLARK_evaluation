#!/bin/sh

mkdir model

{ time python3 ../../NLP-Cube/cube/main.py \
    --train=tokenizer \
    --train-file=train.conllu \
    --dev-file=../../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu \
    --raw-train-file=train.txt \
    --raw-dev-file=../../ud/UD_Romanian-RRT/ro_rrt-ud-dev.txt \
    --embeddings /data/vasile/corola/corola.300.20.vec \
    --store model/tokenizer \
    --batch-size 1000 \
    --set-mem 8000 \
    --autobatch \
    --patience 1 \
    2>&1 | tee 1_train_tokenizer.log ; } 2>&1 | tee 1_time.txt
 

