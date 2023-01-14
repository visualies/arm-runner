# Declare the runner version as a build argument
ARG RUNNER_VERSION=2.300.2

# Use arm64v8/alpine as the base image
FROM arm64v8/alpine

# Create a new directory named actions-runner
RUN mkdir /arm-runner

# Set the current working directory to actions-runner
WORKDIR /arm-runner

# Install the curl package and download the runner package
RUN apk add --no-cache curl \
    && curl -o actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-arm64-${RUNNER_VERSION}.tar.gz

# Make config.sh and run.sh files executable
RUN chmod +x config.sh run.sh

# Run config.sh script with the url and token options
CMD ["./config.sh", "--url", "${URL}", "--token", "${TOKEN}"]
CMD ["./run.sh"]
