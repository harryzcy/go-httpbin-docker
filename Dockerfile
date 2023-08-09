FROM golang:1.21.0-alpine3.18 as builder

RUN CGO_ENABLED=0 go install github.com/mccutchen/go-httpbin/v2/cmd/go-httpbin@v2.11.0

FROM gcr.io/distroless/base
COPY --from=builder /go/bin/go-httpbin /bin/

EXPOSE 8080
CMD ["/bin/go-httpbin"]
