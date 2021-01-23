#!/bin/sh

source ../../stanza/scripts/config.sh

mkdir -p $LEMMA_DATA_DIR

cp rrt-all.conllu $LEMMA_DATA_DIR/rrt.train.in.conllu
cp rrt-dev.conllu $LEMMA_DATA_DIR/rrt.dev.in.conllu
cp rrt-dev.conllu $LEMMA_DATA_DIR/rrt.dev.gold.conllu

num_epoch=60

echo "Running lemmatizer"
{ time python -m stanza.models.lemmatizer \
	--data_dir $LEMMA_DATA_DIR \
	--train_file $LEMMA_DATA_DIR/rrt.train.in.conllu \
	--eval_file $LEMMA_DATA_DIR/rrt.dev.in.conllu \
        --output_file ${LEMMA_DATA_DIR}/rrt.dev.pred.conllu \
	--gold_file $LEMMA_DATA_DIR/rrt.dev.gold.conllu \
	--lang ro \
	--num_epoch $num_epoch \
	--mode train ; } 2>&1 | tee 002_train_lemmatizer.time

echo "Evaluating lemmatizer "
python -m stanza.models.lemmatizer \
	--data_dir $LEMMA_DATA_DIR \
	--eval_file $LEMMA_DATA_DIR/rrt.dev.in.conllu \
        --output_file ${LEMMA_DATA_DIR}/rrt.dev.pred.conllu \
	--gold_file $LEMMA_DATA_DIR/rrt.dev.gold.conllu \
	--lang ro \
	--mode predict

