# Use TensorFlow 1.15.5 image as the base image
FROM tensorflow/tensorflow:1.15.5

# Set the working directory in the container to 'tft'
WORKDIR /tft

# Install git
RUN apt-get update && apt-get install -y git

# Copy the contents of your local project directory to the Docker container
COPY . /tft

# Grant execution rights on your script
RUN chmod +x run.sh

# Command to run when the container starts
CMD bash -c "./run.sh && /bin/bash"