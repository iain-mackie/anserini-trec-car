TRECCAR_DIR=/home/imackie/Documents/trec_car

cp ${TRECCAR_DIR}/data/train_tree/base.train.cbor.tree.qrels ${TRECCAR_DIR}/data/anserini_data/train_tree.qrels
cp ${TRECCAR_DIR}/data/train_tree/train.pages.cbor.tree.qrels ${TRECCAR_DIR}/data/anserini_data/test_tree.qrels

cat ${TRECCAR_DIR}/data/anserini_data/train_tree.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/data/anserini_data/train_tree.topics
cat ${TRECCAR_DIR}/data/anserini_data/test_tree.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/data/anserini_data/test_tree.topics

sort -u -o ${TRECCAR_DIR}/data/anserini_data/train_tree.topics ${TRECCAR_DIR}/data/anserini_data/train_tree.topics
sort -u -o ${TRECCAR_DIR}/data/anserini_data/test_tree.topics ${TRECCAR_DIR}/data/anserini_data/test_tree.topics

sort -u -o ${TRECCAR_DIR}/data/anserini_data/train_tree.qrels ${TRECCAR_DIR}/data/anserini_data/train_tree.qrels
