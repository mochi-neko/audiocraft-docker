# audiocraft-docker
A docker environment for AudioCraft with GPU/CUDA.

## How to run a AudioGen sample by AudioCraft

0. Install NVIDIA Driver for CUDA 11.8 and setup Docker enviroment.

1. Build docker by compose.

```shell
docker compose up -d --build
```

2. Open bash in docker.

```shell
docker compose exec app bash
```

3. Run an AudioGen sample.

```shell
poetry run python src/main.py
```