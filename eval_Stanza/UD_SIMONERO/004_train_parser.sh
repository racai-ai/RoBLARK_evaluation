source ../../stanza/scripts/config.sh

mkdir -p $DEPPARSE_DATA_DIR

cp rrt-all.conllu $DEPPARSE_DATA_DIR/rrt.train.in.conllu
cp rrt-dev.conllu $DEPPARSE_DATA_DIR/rrt.dev.in.conllu
cp rrt-dev.conllu $DEPPARSE_DATA_DIR/rrt.dev.gold.conllu

batch_size=5000
echo "Using batch size $batch_size"

echo "Running parser"
{ time python -m stanza.models.parser \
	--wordvec_file /data/vasile/corola/corola.300.20.vec \
	--train_file $DEPPARSE_DATA_DIR/rrt.train.in.conllu \
	--eval_file $DEPPARSE_DATA_DIR/rrt.dev.in.conllu \
        --output_file ${DEPPARSE_DATA_DIR}/rrt.dev.pred.conllu \
	--gold_file $DEPPARSE_DATA_DIR/rrt.dev.gold.conllu \
	--batch_size $batch_size \
	--lang ro \
	--shorthand ro_rrt \
	--mode train ; } 2>&1 | tee 004_train_parser.time

echo "Evaluating parser"
python -m stanza.models.parser \
	--wordvec_file /data/vasile/corola/corola.300.20.vec \
	--eval_file $DEPPARSE_DATA_DIR/rrt.dev.in.conllu \
        --output_file ${DEPPARSE_DATA_DIR}/rrt.dev.pred.conllu \
	--gold_file $DEPPARSE_DATA_DIR/rrt.dev.gold.conllu \
	--lang ro \
	--shorthand ro_rrt \
	--mode predict

results=`python ../../stanza/stanza/utils/conll18_ud_eval.py -v $POS_DATA_DIR/rrt.dev.gold.conllu ${POS_DATA_DIR}/rrt.dev.pred.conllu | head -12 | tail -n+12 | awk '{print $7}'`
echo $results >> ${DEPPARSE_DATA_DIR}/rrt.results
echo rrt $results

