FROM tensorflow/tensorflow:1.15.5-gpu

# Set the working directory in the container to 'tft'
WORKDIR /tft

# Install necessary packages
RUN apt-get update && apt-get install -y git wget

# Install a newer version of CMake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1-Linux-x86_64.sh -O /tmp/cmake-install.sh \
    && chmod +x /tmp/cmake-install.sh \
    && /tmp/cmake-install.sh --skip-license --prefix=/usr/local

# Copy the contents of your local project directory to the Docker container
COPY . /tft

# Grant execution rights on your script
RUN chmod +x run.sh

# Command to run when the container starts
CMD bash -c "./run.sh && /bin/bash"