FROM openjdk:21-jdk-slim

WORKDIR /app

# Copy the pre-built JAR file instead of the entire back directory
COPY ./back/build/libs/*.jar /app/app.jar
COPY ./tools/script.sh /usr/local/bin/script.sh

RUN apt-get update && apt-get install -y dumb-init

RUN chmod +x /usr/local/bin/script.sh

EXPOSE 80

ENTRYPOINT ["/usr/bin/dumb-init", "--", "sh", "/usr/local/bin/script.sh"]