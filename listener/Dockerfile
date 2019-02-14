FROM mysql:8.0.15

# Install the wait-for-it package, which will be used in the listen script.
RUN apt-get update -y
RUN apt-get install -y wait-for-it

COPY listen.sh /listen.sh
RUN chmod +x /listen.sh