FROM golang:1.16 as build

WORKDIR /build

COPY . .
ENV CGO_ENABLED=0

RUN make build_app


FROM alpine:latest

WORKDIR /sample-app

COPY --from=build /build/dist/sample-app .

CMD ["./sample-app"]