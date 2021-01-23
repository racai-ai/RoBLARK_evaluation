#!/bin/sh


{ time python3 ../NLP-Cube/cube/main.py \
    --run=lemmatizer \
    --embeddings /data/vasile/corola/corola.300.20.vec \
    --models model \
    --input-file test.corpus.conllu \
    --output-file test.lemmatizer.out.conllu \
    2>&1 | tee 021_run_lemmatizer.log ; } 2>&1 | tee 021_time.txt


