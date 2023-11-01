from golang:1.21 as builder
WORKDIR /app
COPY main.go ./
RUN go build -o /hello./main.go

from alpine
WORKDIR /app
COPY --from=builder ./hello ./hello
ENTRYPOINT ["./hello"]