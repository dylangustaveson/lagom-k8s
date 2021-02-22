FROM openjdk:8

WORKDIR /usr/src/app

ENV APP_CLASSPATH="hello-impl-1.0-SNAPSHOT/lib/*"
ENV JAVA_OPTS=""
ENV JMX_CONFIG=""
ENV PLAY_SECRET="abc123wsx321"
ENV CONFIG_FILE="/usr/src/app/application.conf"
ENV CONFIG="-Dplay.crypto.secret=abc123wsx321 -Dplay.http.secret.key=abc123wsx321 -Dlagom.cluster.join-self=off -Dorg.xerial.snappy.use.systemlib=true -Dconfig.file=application.conf"
ENV PLAY_SERVER_START="play.core.server.ProdServerStart"

COPY ./hello-impl/target/universal/hello-impl-1.0-SNAPSHOT.zip ./hello-impl-1.0-SNAPSHOT/
COPY ./hello-impl/src/main/resources/application.conf .
COPY ./hello-impl/target/universal/scripts/bin ./scripts/bin

RUN unzip -q -o ./hello-impl-1.0-SNAPSHOT/hello-impl-1.0-SNAPSHOT.zip

CMD ["bash", "-c", "java -cp \"$APP_CLASSPATH\" $JAVA_OPTS $JMX_CONFIG $CONFIG $PLAY_SERVER_START"]
