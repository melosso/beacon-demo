FROM debian:bookworm-slim AS patcher

ARG BRANCH=main

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://raw.githubusercontent.com/melosso/beacon/${BRANCH}/Source/Beacon/wwwroot/admin/_shell.html" -o /shell.html \
 && curl -fsSL "https://raw.githubusercontent.com/melosso/beacon/${BRANCH}/Source/Beacon/wwwroot/login.html" -o /login.html

COPY inject.sh /inject.sh
RUN chmod +x /inject.sh \
 && /inject.sh /shell.html \
 && /inject.sh /login.html

FROM ghcr.io/melosso/beacon:latest
COPY --from=patcher /shell.html /app/wwwroot/admin/_shell.html
COPY --from=patcher /login.html /app/wwwroot/login.html
RUN rm -f /app/wwwroot/login.html.gz /app/wwwroot/login.html.br
