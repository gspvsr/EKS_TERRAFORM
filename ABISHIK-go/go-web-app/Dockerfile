# Build stage
FROM golang:1.22.5 AS build

WORKDIR /app

# Copy go.mod and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code and build the application
COPY . .
RUN go build -o main .

# Final stage - Distroless/base
FROM gcr.io/distroless/base

# Create a directory for static files
WORKDIR /app

# Copy the built application and static files from the build stage
COPY --from=build /app/main /app/
COPY --from=build /app/static /app/static

# Expose the application port
EXPOSE 8080

# Use a non-root user for better security
USER nonroot:nonroot

# Command to run the application
CMD ["./main"]
