#!/bin/sh


{ time python3 ../../NLP-Cube/cube/main.py \
    --run=tokenizer \
    --embeddings /data/vasile/corola/corola.300.20.vec \
    --models model \
    --input-file test.txt \
    --output-file test.tokens.out.conllu \
    2>&1 | tee 020_run_tokenizer.log ; } 2>&1 | tee 020_time.txt


