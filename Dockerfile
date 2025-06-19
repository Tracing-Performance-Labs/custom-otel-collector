FROM alpine:3.19 AS certs
RUN apk --update add ca-certificates

FROM golang:1.24.4 AS build-stage
WORKDIR /build

COPY ./builder-config.yml builder-config.yml

RUN --mount=type=cache,target=/root/.cache/go-build GO111MODULE=on go install go.opentelemetry.io/collector/cmd/builder@v0.128.0
RUN --mount=type=cache,target=/root/.cache/go-build builder --config builder-config.yml

FROM gcr.io/distroless/base:latest

ARG USER_UID=10001
USER ${USER_UID}

COPY ./otelcol-config.yml /otelcol/otelcol-config.yml
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --chmod=755 --from=build-stage /build/_build/otelcol-custom /otelcol

ENTRYPOINT ["/otelcol/otelcol-custom"]
CMD ["--config", "/otelcol/otelcol-config.yml"]

EXPOSE 4317 4318 12001

