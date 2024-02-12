BASE_IMAGE=ghcr.io/autowarefoundation/autoware-universe:humble-2024.02-cuda
TARGET_IMAGE=${BASE_IMAGE}-f1tenth

DOCKER_BUILDKIT=1 docker build --network=host \
    --build-arg BASE_IMAGE=$BASE_IMAGE \
    -t $TARGET_IMAGE .
