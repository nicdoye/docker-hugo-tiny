# nicdoye/hugo

## Introduction

`nicdoye/hugo` is a bare-bones Docker image for static sites generated with [Hugo](https://gohugo.io).

It is intended to be used as part of a CI/CD pipeline, or locally as a replacement for having hugo installed.

It is tiny. With hugo 0.40.3, `docker images` reports it as being 17.8MB, roughly the same size as hugo itself.

## In a pipeline

If you have checked out the contents of your hugo tree in `${HUGO_DIRECTORY}`, you can build your site
via the following.

```bash
docker run --rm -v ${HUGO_DIRECTORY}:/hugo nicdoye/hugo -s /hugo
```

## Locally

You can also use it to serve your site while developing locally. Note this also means you can
easily pick and choose which version of hugo you want, by picking the relevant tag.

```bash
docker run --rm -v ${HUGO_DIRECTORY}:/hugo -p 1313:1313 nicdoye/hugo:0.40.3 -s /hugo --bind 0.0.0.0 serve
```

## Notes

The folder `/hugo` is purely arbitrary, you can pretty much use whatever you want, as long as you use the same 
name in both locations (the docker volume mount, and after hugo's `-s`).

Obviously, you have to bind to something other than the default (localhost), hence the `--bind`.

## Maintainers

[Nic Doye](https://worldofnic.org)

## License

[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)
