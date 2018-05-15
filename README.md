# nicdoye/hugo

## Introduction

`nicdoye/hugo` is a bare-bones Docker image for static sites generated with [Hugo](https://gohugo.io).

It is intended to be used as part of a CI/CD pipeline, or locally as a replacement for having hugo installed.

There are two versions:

* `nicdoye/hugo:[<VERSION>-]busybox` which works in CI solutions.
* `nicdoye/hugo:[latest|<VERSION>]` which is even smaller.

Docker Hub states they are 7 & 6MB (compressed) respectively. The image that I'd previously used is listed as 99MB.

## Busybox version for CI

A version built from [busybox](https://hub.docker.com/r/library/busybox/) is also available that gives you more options to play with.

### CircleCI 2.0 Example

This image is meant to be used in a CI pipeline. As an example, in [CircleCI 2.0](https://circleci.com/), you could use the following:

```yaml
version: 2
jobs:
  build:
    docker:
      - image: nicdoye/hugo:busybox
    steps:
      - checkout
      - run: hugo
```

### CLI

Obviously, if run from the command-line, one has to call `hugo` when you run it. e.g.

```bash
docker run --rm -v ${HUGO_DIRECTORY}:/hugo nicdoye/hugo:busybox hugo -s /hugo
```

## Tinyest version

A really tiny version is based on the scratch image, which means is roughly the same size as hugo binary itself.

### As A Command Line Replacement for `hugo`

If you have checked out the contents of your hugo tree in `${HUGO_DIRECTORY}`, you can build your site via the following (instead of `hugo -s ${HUGO_DIRECTORY}`).

```bash
docker run --rm -v ${HUGO_DIRECTORY}:/hugo nicdoye/hugo -s /hugo
```

### Locally

You can also use it to serve your site while developing locally. Note this also means you can
easily pick and choose which version of hugo you want, by picking the relevant tag.

```bash
docker run --rm -v ${HUGO_DIRECTORY}:/hugo -p 1313:1313 nicdoye/hugo:0.40.3 -s /hugo --bind 0.0.0.0 serve
```

## Notes

The folder `/hugo` is purely arbitrary, you can pretty much use whatever you want, as long as you use the same name in both locations (the docker volume mount, and after hugo's `-s`).

Obviously, you have to bind to something other than the default (localhost), hence the `--bind`.

## Maintainers

[Nic Doye](https://worldofnic.org)

## License

[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
