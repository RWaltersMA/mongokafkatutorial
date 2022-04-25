# MongoDB Connector for Apache Kafka tutorial shell

This repository contains the source Docker files needed to create the MongoDB Kafka Tutorial client shell.  This shell is used as part of the MongoDB Connector for Apache Kafka tutorial series located in the MongoDB Documentation.  (Link TBD).

Note: There is a docker image of [MongoKafkaTutorial](https://hub.docker.com/repository/docker/robwma/mongokafkatutorial) available to use on Docker Hub.  If you chose to manually build the image, git clone this repository and follow the build instructions below.

This image contains the following:
- Ubuntu OS
- Python 3
- MongoDB Python Driver (PyMongo)
- [jq](https://stedolan.github.io/jq/download/)
- [KafkaCat](https://github.com/edenhill/kafkacat)
- [Mongosh](https://docs.mongodb.com/mongodb-shell/install/)

If you already have Python and the MongoDB shell, and access to the MongoDB cluster you do not have to use this image for the MongoDB Kafka tutorials.  It is provided as a convience for those who do you have these tools installed locally.

To build the image:
```docker build -t mongokafkatutorial:latest . ```

Once built, simply run the container and launch an interactive shell session:
```docker run -it --rm mongokafkatutorial:latest bash```

Note: remember to include the --network if your Kafka or MongoDB is located in a seperate docker network.  For more information see the MongoDB Online documentation.

There is a docker image of [MongoKafkaTutorial](https://hub.docker.com/repository/docker/robwma/mongokafkatutorial) available to use on Docker Hub.
