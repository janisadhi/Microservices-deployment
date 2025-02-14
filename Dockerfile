FROM golang:1.22.11-alpine3.21

WORKDIR /app

COPY . /app

RUN go mod tidy

RUN go build -o myapp
EXPOSE 3550
CMD ["./myapp"]
