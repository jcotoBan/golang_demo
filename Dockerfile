# Start from the official Golang image (with known vulnerabilities in older versions)
#BUILD TEST 7
FROM golang:1.18-alpine

# Set the working directory
WORKDIR /app

# Copy the Go modules definition and download dependencies
COPY go.mod ./
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN go build -o main .

# Expose port 8080
EXPOSE 8080

# Run the web server
CMD ["./main"]