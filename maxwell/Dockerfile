FROM zendesk/maxwell:v1.19.7

# Install the wait-for-it package, which will be used in the run script.
RUN apt-get update -y
RUN apt-get install -y wait-for-it

# Copy the run.sh script to the container.
COPY run.sh /run.sh
RUN chmod +x /run.sh