FROM ubuntu:latest

MAINTAINER iain mackie


# Install essentials
RUN apt-get update \
    && apt-get install software-properties-common -y \
    && apt-get install wget -y \
    && apt-get install make -y \
    && apt-get install gcc -y \
    && apt-get install git -y 

# Install java 11
RUN wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz \
    && tar -xzvf *.tar.gz
ENV JAVA_VERSION="jdk-11.0.2"
RUN mv $JAVA_VERSION /usr/local/share/ \
    && rm *.tar.gz
ENV JAVA_HOME=/usr/local/share/$JAVA_VERSION
ENV PATH="$JAVA_HOME/bin:$PATH"

# Install maven 3.3.9
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar xzf /tmp/apache-maven-3.3.9-bin.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-3.3.9 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin  && \
    rm -f /tmp/apache-maven-3.3.9-bin.tar.gz
ENV MAVEN_HOME /opt/maven

# Install & build Anserini
WORKDIR /home/
RUN git clone https://github.com/castorini/anserini
WORKDIR /home/anserini/
RUN mvn clean package appassembler:assemble -DskipTests -Dmaven.javadoc.skip=true
WORKDIR /home/anserini/eval/
RUN tar xvfz trec_eval.9.0.4.tar.gz 
WORKDIR /home/anserini/eval/trec_eval.9.0.4/ 
RUN make

# Run Anserini
WORKDIR /home/anserini
CMD target/appassembler/bin/IndexCollection \
    -collection CarCollection \
    -generator LuceneDocumentGenerator \
    -input ${input} \
    -index ${index} \ 
    -threads ${threads} \
    -storePositions \
    -storeDocvectors \
    -storeRawDocs
