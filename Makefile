.PHONY: obs-up obs-down obs-status

obs-up:
	docker compose -f docker-compose.yml up -d

obs-down:
	docker compose -f docker-compose.yml down

obs-status:
	docker compose -f docker-compose.yml ps
