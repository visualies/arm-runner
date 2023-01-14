# Declare the runner version as a build argument
ARG RUNNER_VERSION=2.300.2

# Use arm64v8/alpine as the base image
FROM arm64v8/FROM ubuntu

# Create a new directory named actions-runner
RUN mkdir /actions-runner

# Set the current working directory to actions-runner
WORKDIR /actions-runner

# Install the curl package and download the runner package
RUN apk add --no-cache curl
RUN curl -o actions-runner-linux-arm64-2.300.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.300.2/actions-runner-linux-arm64-2.300.2.tar.gz
RUN tar xzf ./actions-runner-linux-arm64-2.300.2.tar.gz

# Install bash to run the config and run scripts.
RUN apk add --no-cache bash

# Make config.sh and run.sh files executable
RUN chmod +x config.sh run.sh

# Run config.sh script with the url and token options
CMD ["./config.sh", "--url", "${URL}", "--token", "${TOKEN}"]
CMD ["./run.sh"]
