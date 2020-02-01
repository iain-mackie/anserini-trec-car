TRECCAR_DIR=/Users/iain/LocalStorage/tree_data/

cp ${TRECCAR_DIR}/Y1-tree-qrels/benchmarkY1-test/test.pages.cbor.tree.qrels ${TRECCAR_DIR}/test_tree.qrels
grep '/' ${TRECCAR_DIR}/test_tree.qrels > ${TRECCAR_DIR}/test_tree_no_root.qrels 

cat ${TRECCAR_DIR}/test_tree.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/test_tree.topics
cat ${TRECCAR_DIR}/test_tree_no_root.qrels | cut -d' ' -f1 > ${TRECCAR_DIR}/test_tree_no_root.topics

sort -u -o ${TRECCAR_DIR}/test_tree.topics ${TRECCAR_DIR}/test_tree.topics
sort -u -o ${TRECCAR_DIR}/test_tree_no_root.topics ${TRECCAR_DIR}/test_tree_no_root.topics

sort -u -o ${TRECCAR_DIR}/test_tree.qrels ${TRECCAR_DIR}/test_tree.qrels
sort -u -o ${TRECCAR_DIR}/test_tree_no_root.qrels ${TRECCAR_DIR}/test_tree_no_root.qrels

