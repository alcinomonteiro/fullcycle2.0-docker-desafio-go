FROM golang:1.17.2-alpine as build
WORKDIR /usr/src/app
COPY rocks.go .
RUN go build -o /rocks rocks.go

FROM scratch
COPY --from=build /rocks /rocks
ENTRYPOINT [ "./rocks" ]