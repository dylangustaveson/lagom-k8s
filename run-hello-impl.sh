#!/bin/bash
sbt "project hello-impl" "dist" &&\
cd hello-impl/target/universal &&\
unzip -q -o hello-impl-1.0-SNAPSHOT.zip && \

export APP_LIB=hello-impl-1.0-SNAPSHOT/lib &&\
export APP_CLASSPATH=$APP_LIB/* &&\
export JAVA_OPTS="" &&\
export JMX_CONFIG="" &&\
export PLAY_SECRET="abc123wsx321" &&\
export CONFIG_FILE=/d/code/test/hello-impl/src/main/resources/application.conf &&\
export CONFIG="-Dplay.crypto.secret=$PLAY_SECRET -Dplay.http.secret.key=$PLAY_SECRET -Dlagom.cluster.join-self=off -Dorg.xerial.snappy.use.systemlib=true -Dconfig.file=$CONFIG_FILE" &&\
export PLAY_SERVER_START="play.core.server.ProdServerStart" &&\

java -cp "$APP_CLASSPATH" $JAVA_OPTS $JMX_CONFIG $CONFIG $PLAY_SERVER_START
