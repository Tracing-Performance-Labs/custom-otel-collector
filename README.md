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
builder --config=builder-config.yaml
```

## Usage

Run the collector with the provided configuration:

```bash
./_build/otelcol-custom --config=otelcol-config.yaml
```

> [!NOTE]
> You need to create a `file-exporter` directory when using the file exporter.

Then just run any application instrumented with OpenTelemetry and point it to
this collector.


## License 
MIT
