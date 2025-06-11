# Custom OTEL Collector

This repository contains configuration files for a custom OpenTelemetry
Collector that includes a deduplication processor for reducing the size of span
attribute data.

## Build

Install the OpenTelemetry Collector builder tool:

```bash
go install go.opentelemetry.io/collector/cmd/builder@v0.109.0
```

Build the collector:

```bash
ocb --config=builder-config.yaml
```

## License 
MIT
