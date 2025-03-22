#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Music Mix Analyzer - Docker Setup${NC}"
echo "----------------------------------------"

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Error: Docker is not installed.${NC}"
    echo "Please install Docker first: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}Error: Docker Compose is not installed.${NC}"
    echo "Please install Docker Compose first: https://docs.docker.com/compose/install/"
    exit 1
fi

# Check if the container is already running
if docker ps | grep -q music-analyzer; then
    echo -e "${YELLOW}Music Analyzer is already running.${NC}"
    echo "Access it at: http://localhost:5001"
    echo ""
    echo "To stop it, run: docker-compose down"
    exit 0
fi

# Build and start the container
echo -e "${YELLOW}Building and starting the Docker container...${NC}"
docker-compose up -d

# Check if the container started successfully
if [ $? -eq 0 ]; then
    echo -e "${GREEN}Music Analyzer is now running!${NC}"
    echo "Access it at: http://localhost:5001"
    echo ""
    echo "To stop it, run: docker-compose down"
    echo ""
    echo "To view logs, run: docker-compose logs -f"
else
    echo -e "${RED}Failed to start the Docker container.${NC}"
    echo "Check the logs with: docker-compose logs"
fi 