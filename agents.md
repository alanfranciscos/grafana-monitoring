# Agent Guardrails & Architectural Notes

## Code Standards
- **Conventional Commits**: All commits MUST follow the Conventional Commits specification (e.g., `feat:`, `fix:`, `docs:`, `chore:`).
- **Commit Messages**: MUST be in English and stay under 70 characters.
- **Atomic Commits**: Each commit should represent a single logical change.

## Architecture
- **Observability**: We use the unified `grafana/otel-lgtm` image for local development, providing a single-binary LGTM stack.
- **Push-based Telemetry**: Applications push traces, logs, and metrics to the OTLP receiver (ports 4317 gRPC / 4318 HTTP) provided by the embedded OpenTelemetry Collector.
- **Connectivity**: For Linux, use the host IP (e.g., `172.17.0.1`) if the application is in a different bridge network. For MacOS/Windows, use `host.docker.internal`.
- **Isolation**: Monitoring configurations and documentation are isolated in the `monitoring/` directory.
- **Automation**: Use `Makefile` targets (`obs-up`, `obs-down`, `obs-status`) located inside `monitoring/` to manage the stack.
- **Version Control**: This directory is managed as a standalone git repository with atomic commit requirements.
