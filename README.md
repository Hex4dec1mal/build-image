# Build image

GitHub Action for building and publishing Docker images

## Example usage

Example building 2 images:

- `my.registry.com/my-image-name:v1.0.0`
- `my.registry.com/my-image-name:latest`

```yaml
name: Docker Image CI

on: [push]

jobs:
  build:
    runs-on: ubuntu-18.04

    steps:
      - uses: actions/checkout@v1

      - uses: 4ops/build-image@v1
        with:
          registry: "my.registry.com"
          image: "my-image-name"
          tag: "v1.0.0"
          username: ${{ secrets.DockerUsername }}
          password: ${{ secrets.DockerPassword }}
```

If you do not want to use `latest` tag - setup an empy value:

```yaml
      - uses: 4ops/build-image@v1
        with:
          registry: "my.registry.com"
          image: "my-image-name"
          tag: "v1.0.0"
          latest: ""
          username: ${{ secrets.DockerUsername }}
          password: ${{ secrets.DockerPassword }}
```
