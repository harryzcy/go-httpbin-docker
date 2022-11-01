FROM golang:1.19.3-alpine3.16 as builder

RUN CGO_ENABLED=0 go install github.com/mccutchen/go-httpbin/v2/cmd/go-httpbin@v2.4.1

FROM gcr.io/distroless/base
COPY --from=builder /go/bin/go-httpbin /bin/

EXPOSE 8080
CMD ["/bin/go-httpbin"]
