# docker-base

> Just some basic docker images for sammler.io to be easily able to change the used images in all projects/services.


### Commands
 
## Build

```
$ ./build-all.sh
```

### Build a single image

```bash
$ make image DIR=mongo REGISTRY=sammlerio
```

### Example

Build it:

```bash
$ make image DIR=fluentd-logz REGISTRY=sammlerio
```

Run it:

```bash
$ docker run -it sammlerio/fluentd-logz -e "LOGZ_API_TOKEN=foo"
```

## Images

- [fluentd-logz](./fluentd-logz)
- mongo
- nats-streaming
- natsboard
- node-yarn
- rabbitmq

## References

- Inspired by https://github.com/jessfraz/dockerfiles
 