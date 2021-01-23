#!/bin/sh


{ time python3 ../../NLP-Cube/cube/main.py \
    --run=parser \
    --embeddings /data/vasile/corola/corola.300.20.vec \
    --models model \
    --input-file test.tagger.out.conllu \
    --output-file test.parser.out.conllu \
    2>&1 | tee 023_run_tagger.log ; } 2>&1 | tee 023_time.txt


