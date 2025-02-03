FROM openjdk:21-jdk-slim

WORKDIR /app

COPY ./back/ /app/
COPY ./tools/script.sh /usr/local/bin/script.sh

RUN apt-get update && apt-get install dumb-init

RUN chmod +x ./gradlew
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 80

ENTRYPOINT ["/usr/bin/dumb-init", "--", "sh", "/usr/local/bin/script.sh"]