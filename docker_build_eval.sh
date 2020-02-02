# build docker
DOCKER_PATH="./Dockerfile_eval"

echo "Trying to build docker image from:" $DOCKER_PATH;

if [ -f "$DOCKER_PATH" ]; then
  echo "file exits"
  sudo docker build -t iainmackie/anserini-eval:v2 -f $DOCKER_PATH .
 #  sudo docker run -it \
	# -v $PWD/shared/data/:/home/shared/data \
	# -v $PWD/shared/index/:/home/shared/index \
	# -e QRELS=/home/shared/data/train/train.qrels \
	# -e RUN=/home/shared/data/train/train.run   \
	# -e OUTPUT=/home/shared/data/train/eval \
	# iainmackie/anserini-eval 

else
  echo "Error - path to file not found:" $DOCKER_PATH;
  exit 0;

fi
