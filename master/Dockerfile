FROM mysql:8.0.15

# Copy the setup.sh script to the container. The mysql Docker image is set up so that any scripts
# in the docker-entrypoint-initdb.d directory will be run after the database is initialized.
RUN mkdir -p /docker-entrypoint-initdb.d
COPY setup.sh /docker-entrypoint-initdb.d/setup.sh
RUN chmod +x /docker-entrypoint-initdb.d/setup.sh