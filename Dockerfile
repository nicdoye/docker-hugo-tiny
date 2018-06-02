FROM alpine:3.7 as build

ENV HUGO_VERSION 0.41
RUN apk update && \
  apk add ca-certificates && \
  wget -q -O - https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | tar zxf -

FROM busybox
COPY --from=build hugo /bin/hugo
COPY --from=build /etc/ssl/certs /etc/ssl/certs

LABEL org.label-schema.name = "hugo"
LABEL org.label-schema.description = "Runs hugo in a bare bones fashion"
LABEL org.label-schema.vcs-url = "https://github.com/nicdoye/docker-hugo-tiny"
LABEL org.label-schema.version = "1.0.0-beta3"
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.docker.cmd = "docker run --rm -v local-hugo-root:/hugo nicdoye/hugo -s /hugo"
LABEL org.label-schema.docker.devel = "docker run --rm -v local-hugo-root:/hugo -p 1313:1313 nicdoye/hugo -s /hugo --bind 0.0.0.0 --debug serve"
LABEL org.label-schema.docker.cmd.help = " docker run --rm nicdoye/hugo help"
LABEL org.label-schema.vendor = "Nic Doye"

EXPOSE 1313
CMD [ "/bin/hugo" ]
