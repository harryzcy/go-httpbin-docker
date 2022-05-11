FROM golang:1.18.2-alpine3.15 as builder

RUN apk add --no-cache git make && \
    git clone https://github.com/mccutchen/go-httpbin.git /go/src/github.com/mccutchen/go-httpbin

WORKDIR /go/src/github.com/mccutchen/go-httpbin

RUN make build

FROM gcr.io/distroless/base
COPY --from=builder /go/src/github.com/mccutchen/go-httpbin/dist/go-httpbin* /bin/

EXPOSE 8080
CMD ["/bin/go-httpbin"]
