FROM alpine:latest

RUN apk add --no-cache curl tar elixir
WORKDIR /usr/src/app
RUN curl -L -o exercism.tar.gz https://github.com/exercism/cli/releases/download/v3.3.0/exercism-3.3.0-linux-x86_64.tar.gz

RUN tar -xzf exercism.tar.gz && \
    mv exercism /usr/local/bin/exercism && \
    chmod +x /usr/local/bin/exercism

RUN rm -f exercism.tar.gz && \
    apk del curl tar

RUN mkdir workspaces

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["sh", "/usr/src/app/entrypoint.sh"]
CMD ["exercism", "version"]
