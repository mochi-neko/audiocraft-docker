# audiocraft-docker

0. Install NVIDIA Driver for CUDA 11.8 to your host machine and setup Docker enviroment.

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