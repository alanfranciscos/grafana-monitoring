# Agent Guardrails & Architectural Notes

## Code Standards
- **Conventional Commits**: All commits MUST follow the Conventional Commits specification (e.g., `feat:`, `fix:`, `docs:`, `chore:`).
- **Commit Messages**: MUST be in English and stay under 70 characters.
- **Atomic Commits**: Each commit should represent a single logical change.

## Architecture
- **Observability**: We use the LGTM stack (Loki, Grafana, Tempo, Prometheus) for local development.
- **Isolation**: Monitoring configurations and documentation are isolated in the `monitoring/` directory.
- **Automation**: Use `Makefile` targets (`obs-up`, `obs-down`, `obs-status`) located inside `monitoring/` to manage the stack.
- **Version Control**: This directory is managed as a standalone git repository with atomic commit requirements.
