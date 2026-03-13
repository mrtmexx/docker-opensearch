# OpenSearch with Analysis Plugins

Custom OpenSearch 3.5.0 image with `analysis-icu`, `analysis-kuromoji`, and `analysis-phonetic` plugins.

## Build the image

Single platform:

```bash
docker build -t mrtmexx/opensearch:3.5.0 .
```

Multi-platform (amd64 + arm64), build and push in one step:

```bash
docker buildx create --name multiarch --use
docker buildx build --platform linux/amd64,linux/arm64 \
  -t mrtmexx/opensearch:3.5.0 --push .
```

## Run the container

```bash
docker run -d \
  --name opensearch \
  -p 9200:9200 \
  -p 9600:9600 \
  -e "discovery.type=single-node" \
  -e "OPENSEARCH_INITIAL_ADMIN_PASSWORD=<YOUR_PASSWORD>" \
  mrtmexx/opensearch:3.5.0
```

## Publish to DockerHub

1. Log in to DockerHub:

```bash
docker login
```

2. Push the image:

```bash
docker push mrtmexx/opensearch:3.5.0
```

3. (Optional) Add the `latest` tag:

```bash
docker push mrtmexx/opensearch:latest
```

## Verify

```bash
curl -k -u admin:<YOUR_PASSWORD> https://localhost:9200/_cat/plugins
```

The output should include `analysis-icu`, `analysis-kuromoji`, and `analysis-phonetic`.
