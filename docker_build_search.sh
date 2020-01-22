# build docker
DOCKER_PATH="./Dockerfile_search"

echo "Trying to build docker image from:" $DOCKER_PATH;

if [ -f "$DOCKER_PATH" ]; then
  echo "file exits"
  sudo docker build -t iainmackie/anserini-search -f $DOCKER_PATH .
  sudo docker run -it \
	-v $PWD/shared/data/:/home/shared/data \
	-v $PWD/shared/index/:/home/shared/index \
	-e INDEX=/home/shared/index/lucene.local \
	-e TOPICS=/home/shared/data/anserini_data/test.topics \
	-e OUTPUT=/home/shared/data/anserini_data/test.run \
	-e HITS=1000 \
	iainmackie/anserini-search 

else
  echo "Error - path to file not found:" $DOCKER_PATH;
  exit 0;

fi
