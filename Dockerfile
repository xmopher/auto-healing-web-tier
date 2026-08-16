# Static welcome page image for the web tier.
# Default ASG user-data uses public nginx:alpine.
# Optional bonus: build/push this image to GHCR or Docker Hub, then set docker_image in tfvars.
FROM nginx:alpine

LABEL org.opencontainers.image.title="auto-healing-web-tier"
LABEL org.opencontainers.image.description="Static NGINX welcome page for the take-home web tier"
