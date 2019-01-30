## About

Fluentd + logz plugin.

**Plugins:**  

- [fluentd-plugin-logzio](https://github.com/logzio/fluent-plugin-logzio)

## Install

```sh
$ docker pull sammlerio/fluentd-logz
```

### Docker Hub

[hub.docker.com/r/sammlerio/fluentd-logz](https://hub.docker.com/r/sammlerio/fluentd-logz/)

## Configuration

Environment variables:

- `LOGZ_API-TOKEN`

Example:

```bash
$ docker run -it sammlerio/fluentd-logz -e "LOGZ_API_TOKEN=foo"
```