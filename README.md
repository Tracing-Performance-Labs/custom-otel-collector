# Custom OTEL Collector

This repository contains configuration files for a custom OpenTelemetry
Collector that includes a deduplication processor for reducing the size of span
attribute data.

## Build

Install the OpenTelemetry Collector builder tool:

```bash
go install go.opentelemetry.io/collector/cmd/builder@v0.128.0
```

Make sure to install a version compatible with the versions in the
configuration file (in case you change them).

Build the collector:

```bash
ocb --config=builder-config.yaml
```

## License 
MIT
