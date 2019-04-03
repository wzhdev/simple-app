FROM docker.wzh/library/golang:latest
WORKDIR /go/src/github.com/wzhdev/simple-app/
COPY . .
RUN CGO_ENABLED=0 go build -v -o app

FROM scratch
COPY --from=0 /go/src/github.com/wzhdev/simple-app/app .
ENTRYPOINT ["/app"]
