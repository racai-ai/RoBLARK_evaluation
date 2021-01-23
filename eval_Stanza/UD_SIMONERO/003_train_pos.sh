#!/bin/sh

source ../../stanza/scripts/config.sh

mkdir -p $POS_DATA_DIR

cp rrt-all.conllu $POS_DATA_DIR/rrt.train.in.conllu
cp rrt-dev.conllu $POS_DATA_DIR/rrt.dev.in.conllu
cp rrt-dev.conllu $POS_DATA_DIR/rrt.dev.gold.conllu

batch_size=5000
echo "Using batch size $batch_size"

echo "Running tagger"
{ time python -m stanza.models.tagger \
	--wordvec_file /data/vasile/corola/corola.300.20.vec \
	--train_file $POS_DATA_DIR/rrt.train.in.conllu \
	--eval_file $POS_DATA_DIR/rrt.dev.in.conllu \
        --output_file ${POS_DATA_DIR}/rrt.dev.pred.conllu \
	--gold_file $POS_DATA_DIR/rrt.dev.gold.conllu \
	--batch_size $batch_size \
	--lang ro \
	--shorthand ro_rrt \
	--mode train ; } 2>&1 | tee 003_tagger.time

echo "Evaluating tagger"
python -m stanza.models.tagger \
	--wordvec_file /data/vasile/corola/corola.300.20.vec \
	--eval_file $POS_DATA_DIR/rrt.dev.in.conllu \
        --output_file ${POS_DATA_DIR}/rrt.dev.pred.conllu \
	--gold_file $POS_DATA_DIR/rrt.dev.gold.conllu \
	--lang ro \
	--shorthand ro_rrt \
	--mode predict

results=`python ../../stanza/stanza/utils/conll18_ud_eval.py -v $POS_DATA_DIR/rrt.dev.gold.conllu ${POS_DATA_DIR}/rrt.dev.pred.conllu | head -9 | tail -n+9 | awk '{print $7}'`
echo $results >> ${POS_DATA_DIR}/rrt.results
echo rrt $results

