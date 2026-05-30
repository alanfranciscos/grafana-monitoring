# Foco Mútuo

## Observabilidade Local

Esta stack utiliza Loki, Grafana, Tempo e Prometheus (LGTM) para fornecer logs, métricas e traces.

### Pré-requisitos
- Docker
- Docker Compose

### Comandos Úteis (Executar dentro da pasta `monitoring/`)
- `make obs-up`: Inicia a stack de observabilidade.
- `make obs-down`: Para a stack.
- `make obs-status`: Verifica o status dos containers.

### Acesso aos Serviços
- **Grafana**: http://localhost:3000 (Login: admin/admin)
- **Prometheus**: http://localhost:9090
- **Loki**: http://localhost:3100
- **Tempo**: http://localhost:3200

### Retenção de Dados
A retenção local está configurada para **10 dias** para economizar espaço em disco.

## Planejamento de Capacidade (Produção K8s)

| Componente | CPU (Request/Limit) | Memória (Request/Limit) | Notas |
| :--- | :--- | :--- | :--- |
| Loki | 500m / 2 | 2Gi / 4Gi | Escala horizontalmente via microservices. |
| Prometheus | 1 / 2 | 4Gi / 8Gi | Requer armazenamento persistente rápido (SSD). |
| Tempo | 500m / 2 | 1Gi / 2Gi | Alta vazão, baixo consumo de CPU por trace. |
| Grafana | 200m / 500m | 512Mi / 1Gi | Stateless, fácil de escalar. |
