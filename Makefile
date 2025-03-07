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
	docker compose up -d

# Stop the Docker container
docker-down:
	docker compose down

# SSH into the Docker container
docker-ssh:
	docker compose up -d || true
	ssh root@localhost -p 2223

# Running make cleans up the Docker container and image, 
# builds the Docker image, 
# pushes to dockerhub, 
# and runs the Docker container
docker: docker-clean docker-build docker-push docker-up