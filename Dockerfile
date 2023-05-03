FROM golang:1.20.4-alpine3.17 as builder

RUN CGO_ENABLED=0 go install github.com/mccutchen/go-httpbin/v2/cmd/go-httpbin@v2.7.0

FROM gcr.io/distroless/base
COPY --from=builder /go/bin/go-httpbin /bin/

EXPOSE 8080
CMD ["/bin/go-httpbin"]
