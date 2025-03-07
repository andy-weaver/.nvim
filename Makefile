# Clean up the Docker image and container if it exists
docker-clean:
	docker stop nvim-dev || true
	docker rm nvim-dev || true
	docker rmi andyandyandyandy2023/nvim-dev:latest || true

# Build the Dockerfile
docker-build:
	docker build -t andyandyandyandy2023/nvim-dev:latest ./devcontainer

# Push to Docker Hub
docker-push:
	docker login
	docker push andyandyandyandy2023/nvim-dev:latest

# Run the Docker container
docker-up:
	cd devcontainer
	docker compose up -d
	cd ..

# Stop the Docker container
docker-down:
	docker compose down

# SSH into the Docker container
docker-ssh:
	docker compose up -d || true
	ssh root@localhost -p 2223

docker: docker-clean docker-build docker-push docker-up