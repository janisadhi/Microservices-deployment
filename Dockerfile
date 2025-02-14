# Stage 1: Build Stage
FROM golang:1.22.11-alpine3.21 AS builder

# Install required packages
RUN apk add --no-cache ca-certificates git build-base

WORKDIR /src

# Restore dependencies
COPY go.mod go.sum ./
RUN go mod download
COPY . .

# Build the application
ARG SKAFFOLD_GO_GCFLAGS
RUN go build -gcflags="${SKAFFOLD_GO_GCFLAGS}" -o /go/bin/frontend .

# Stage 2: Final Release Stage
FROM alpine:3.18.0

# Install necessary runtime packages
RUN apk add --no-cache ca-certificates busybox-extras net-tools bind-tools

WORKDIR /src

# Copy built binary
COPY --from=builder /go/bin/frontend /src/server

# Copy templates and static files if required
COPY ./templates ./templates
COPY ./static ./static

# Define environment variables
ENV GOTRACEBACK=single

EXPOSE 8080

# Start the application
ENTRYPOINT ["/src/server"]
