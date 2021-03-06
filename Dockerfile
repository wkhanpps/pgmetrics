FROM golang:1.14
RUN GO111MODULES=on CGO_ENABLED=0 GOOS=linux go get -a github.com/rapidloop/pgmetrics/cmd/pgmetrics

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
COPY --from=0 /go/bin/pgmetrics /bin/pgmetrics
ENTRYPOINT ["/bin/pgmetrics"]

