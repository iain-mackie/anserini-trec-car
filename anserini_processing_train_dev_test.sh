TRECCAR_DIR=/home/imackie/Documents/trec_car

for f in ${TRECCAR_DIR}/data/train/fold-[0-3]-base.train.cbor-hierarchical.qrels; do (cat "${f}"; echo); done > ${TRECCAR_DIR}/data/train_dev_test/train.qrels
cp ${TRECCAR_DIR}/data/train/fold-4-base.train.cbor-hierarchical.qrels ${TRECCAR_DIR}/data/train_dev_test/dev.qrels
cp ${TRECCAR_DIR}/data/benchmarkY1/test.pages.cbor-hierarchical.qrels ${TRECCAR_DIR}/data/train_dev_test/test.qrels

cat ${TRECCAR_DIR}/data/train_dev_test/train.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/data/train_dev_test/train.topics
cat ${TRECCAR_DIR}/data/train_dev_test/dev.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/data/train_dev_test/dev.topics
cat ${TRECCAR_DIR}/data/train_dev_test/test.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/data/train_dev_test/test.topics

sort -u -o ${TRECCAR_DIR}/data/train_dev_test/train.topics ${TRECCAR_DIR}/data/train_dev_test/train.topics
sort -u -o ${TRECCAR_DIR}/data/train_dev_test/train.topics ${TRECCAR_DIR}/data/train_dev_test/train.topics
sort -u -o ${TRECCAR_DIR}/data/train_dev_test/test.topics ${TRECCAR_DIR}/data/train_dev_test/test.topics
