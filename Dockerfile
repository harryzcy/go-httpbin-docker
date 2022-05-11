FROM golang:1.18.2-alpine3.15 as builder

RUN go install github.com/mccutchen/go-httpbin/v2/cmd/go-httpbin@v2.4.0

FROM gcr.io/distroless/base
COPY --from=builder /go/bin/go-httpbin /bin/

EXPOSE 8080
CMD ["/bin/go-httpbin"]
