# Foco Mútuo

## Observabilidade Local

Esta stack utiliza a imagem unificada `grafana/otel-lgtm` que agrupa Loki, Grafana, Tempo e Prometheus em um único container, otimizada para o desenvolvimento local e suporte nativo a OpenTelemetry.

### Pré-requisitos
- Docker
- Docker Compose

### Comandos Úteis (Executar dentro da pasta `monitoring/`)
- `make obs-up`: Inicia a stack de observabilidade.
- `make obs-down`: Para a stack.
- `make obs-status`: Verifica o status do container.

### Acesso aos Serviços
- **Grafana**: http://localhost:3000 (Acesso anônimo como Admin habilitado)
- **Loki**: http://localhost:3100
- **Tempo**: http://localhost:3200
- **Prometheus**: http://localhost:9090
- **OpenTelemetry (gRPC)**: localhost:4317
- **OpenTelemetry (HTTP)**: http://localhost:4318

### Notas de Implementação
A stack utiliza a imagem `grafana/otel-lgtm:latest`, que integra todos os componentes de observabilidade em um único processo, facilitando o desenvolvimento local e eliminando a necessidade de gerenciar múltiplos containers e redes complexas.

## Planejamento de Capacidade (Produção K8s)

> **Nota:** Os valores abaixo referem-se a uma implantação de produção em larga escala (Kubernetes). Para a stack local (`otel-lgtm`), recomenda-se reservar apenas **4Gi de RAM** e **2 CPUs** no Docker.

| Componente | CPU (Request/Limit) | Memória (Request/Limit) | Notas |
| :--- | :--- | :--- | :--- |
| Loki | 500m / 2 | 2Gi / 4Gi | Escala horizontalmente via microservices. |
| Prometheus | 1 / 2 | 4Gi / 8Gi | Requer armazenamento persistente rápido (SSD). |
| Tempo | 500m / 2 | 1Gi / 2Gi | Alta vazão, baixo consumo de CPU por trace. |
| Grafana | 200m / 500m | 512Mi / 1Gi | Stateless, fácil de escalar. |
