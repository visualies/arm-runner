FROM arm64v8/alpine

RUN mkdir /actions-runner

WORKDIR /actions-runner

RUN apk add --no-cache curl \
    && curl -o actions-runner-linux-arm64-2.300.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.300.2/actions-runner-linux-arm64-2.300.2.tar.gz \
    && tar xzf ./actions-runner-linux-arm64-2.300.2.tar.gz

RUN chmod +x config.sh run.sh

CMD ["./config.sh", "--url", "${URL}", "--token", "${TOKEN}"]
CMD ["./run.sh"]
