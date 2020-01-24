TRECCAR_DIR=/home/imackie/Documents/trec_car

cp ${TRECCAR_DIR}/data/train/base.train.cbor-hierarchical.qrels ${TRECCAR_DIR}/data/anserini_data/train.qrels
cp ${TRECCAR_DIR}/data/benchmarkY1/test.pages.cbor-hierarchical.qrels ${TRECCAR_DIR}/data/anserini_data/test.qrels

cat ${TRECCAR_DIR}/data/anserini_data/train.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/data/anserini_data/train.topics
cat ${TRECCAR_DIR}/data/anserini_data/test.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/data/anserini_data/test.topics

sort -u -o ${TRECCAR_DIR}/data/anserini_data/train.topics ${TRECCAR_DIR}/data/anserini_data/train.topics
sort -u -o ${TRECCAR_DIR}/data/anserini_data/test.topics ${TRECCAR_DIR}/data/anserini_data/test.topics
