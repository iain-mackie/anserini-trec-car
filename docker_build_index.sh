# build docker
DOCKER_PATH="./Dockerfile_index"

echo "Trying to build docker image from:" $DOCKER_PATH;

if [ -f "$DOCKER_PATH" ]; then
  echo "file exits"
  sudo docker build -t iainmackie/anserini-index -f $DOCKER_PATH .
  sudo docker run -it \
	-v $PWD/shared/data/:/home/shared/data \
	-v $PWD/shared/index/:/home/shared/index \
	-e INPUT=/home/shared/data/paragraphs/ \
	-e INDEX=/home/shared/index/lucene-index.car17v2.0.paragraphs  \
	-e THREADS=10 \
	iainmackie/anserini-index 

else
  echo "Error - path to file not found:" $DOCKER_PATH;
  exit 0;

fi
