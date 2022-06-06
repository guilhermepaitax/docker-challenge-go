FROM golang:1.8 as build-stage

WORKDIR /app

COPY hello.go .

RUN CGO_ENABLED=0 go build -o codeeducation .


FROM scratch as run-stage

COPY --from=build-stage /app/codeeducation .

CMD ["./codeeducation"]