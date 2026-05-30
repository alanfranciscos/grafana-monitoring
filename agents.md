# Agent Guardrails & Architectural Notes

## Code Standards
- **Conventional Commits**: All commits MUST follow the Conventional Commits specification (e.g., `feat:`, `fix:`, `docs:`, `chore:`).
- **Commit Messages**: MUST be in English and stay under 70 characters.
- **Atomic Commits**: Each commit should represent a single logical change.

## Architecture
- **Observability**: We use the LGTM stack (Loki, Grafana, Tempo, Prometheus) for local development.
- **Push-based Telemetry**: Applications push traces and metrics directly to Tempo (port 4317/4318) via OTLP.
- **Connectivity**: Local containers should use `--network host` or the `host.docker.internal` alias to reach the monitoring stack exposed on the host.
- **Isolation**: Monitoring configurations and documentation are isolated in the `monitoring/` directory.
- **Automation**: Use `Makefile` targets (`obs-up`, `obs-down`, `obs-status`) located inside `monitoring/` to manage the stack.
- **Version Control**: This directory is managed as a standalone git repository with atomic commit requirements.
