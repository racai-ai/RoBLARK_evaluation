#!/bin/sh

source ../stanza/scripts/config.sh

labels=${TOKENIZE_DATA_DIR}/rrt-ud-train.toklabels

echo "Preparing tokenizer data..."
python ../stanza/stanza/utils/prepare_tokenizer_data.py  \
	../ud/UD_Romanian-RRT/ro_rrt-ud-train.txt \
	../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu \
	-o ${TOKENIZE_DATA_DIR}/rrt-ud-train.toklabels \
	-m ${TOKENIZE_DATA_DIR}/rrt-ud-train-mwt.json

cp ../ud/UD_Romanian-RRT/ro_rrt-ud-train.conllu ${TOKENIZE_DATA_DIR}/rrt.train.gold.conllu
cp ../ud/UD_Romanian-RRT/ro_rrt-ud-train.txt ${TOKENIZE_DATA_DIR}/rrt.train.txt

python ../stanza/stanza/utils/prepare_tokenizer_data.py  \
	../ud/UD_Romanian-RRT/ro_rrt-ud-dev.txt \
	../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu \
	-o ${TOKENIZE_DATA_DIR}/rrt-ud-dev.toklabels \
	-m ${TOKENIZE_DATA_DIR}/rrt-ud-dev-mwt.json

cp ../ud/UD_Romanian-RRT/ro_rrt-ud-dev.conllu ${TOKENIZE_DATA_DIR}/rrt.dev.gold.conllu
cp ../ud/UD_Romanian-RRT/ro_rrt-ud-dev.txt ${TOKENIZE_DATA_DIR}/rrt.dev.txt


seqlen=$(python -c "from math import ceil; print(ceil($(python ../stanza/stanza/utils/avg_sent_len.py $labels) * 3 / 100) * 100)")

echo "Running tokenizer ..."
labels=${TOKENIZE_DATA_DIR}/rrt-ud-train.toklabels
time python -m stanza.models.tokenizer \
	--label_file $labels \
	--txt_file ${TOKENIZE_DATA_DIR}/rrt.train.txt \
	--lang ro \
	--max_seqlen $seqlen \
	--mwt_json_file ${TOKENIZE_DATA_DIR}/rrt-ud-dev-mwt.json \
	--dev_txt_file ${TOKENIZE_DATA_DIR}/rrt.dev.txt \
	--dev_label_file ${TOKENIZE_DATA_DIR}/rrt-ud-dev.toklabels \
	--dev_conll_gold ${TOKENIZE_DATA_DIR}/rrt.dev.gold.conllu \
	--conll_file ${TOKENIZE_DATA_DIR}/rrt.dev.pred.conllu \
	--shorthand rrt

echo "Running predict dev"
python -m stanza.models.tokenizer \
	--mode predict \
	--txt_file ${TOKENIZE_DATA_DIR}/rrt.dev.txt \
	--lang ro \
	--conll_file ${TOKENIZE_DATA_DIR}/rrt.dev.pred.conllu \
	--shorthand rrt \
	--mwt_json_file ${TOKENIZE_DATA_DIR}/rrt-ud-dev-mwt.json

results=`python ../stanza/stanza/utils/conll18_ud_eval.py -v ${TOKENIZE_DATA_DIR}/rrt.dev.gold.conllu ${TOKENIZE_DATA_DIR}/rrt.dev.pred.conllu | head -5 | tail -n+3 | awk '{print $7}' | pr --columns 3 -aJT`
echo $results >> ${TOKENIZE_DATA_DIR}/rrt.results
echo rrt $results

