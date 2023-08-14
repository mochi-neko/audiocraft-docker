# audiocraft-docker
A docker environment for AudioCraft with GPU/CUDA.

## How to run a AudioGen sample by AudioCraft

0. Install NVIDIA driver for CUDA 11.8 and setup Docker enviroment on your host machine, then check CUDA version.

```shell
nvidia-smi
```

1. Build and run docker by compose.

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