# build docker
DOCKER_PATH="./Dockerfile"

echo "Trying to build docker image from:" $DOCKER_PATH;

if [ -f "$DOCKER_PATH" ]; then
  echo "file exits"
  sudo docker build -t iainmackie/anserini-trec -f $DOCKER_PATH .
  sudo docker run -it -v $PWD/shared/data/:/home/shared/data -v $PWD/shared/index/:/home/shared/index -e input=/home/shared/data/paragraphs/ -e index=/home/shared/index/lucene-index.car17v2.0.paragraphs  -e threads=10 iainmackie/anserini_trec_car 

else
  echo "Error - path to file not found:" $DOCKER_PATH;
  exit 0;

fi