#!/bin/sh


{ time python3 ../NLP-Cube/cube/main.py \
    --run=tagger \
    --embeddings /data/vasile/corola/corola.300.20.vec \
    --models model \
    --input-file test.lemmatizer.out.conllu \
    --output-file test.tagger.out.conllu \
    2>&1 | tee 022_run_tagger.log ; } 2>&1 | tee 022_time.txt


