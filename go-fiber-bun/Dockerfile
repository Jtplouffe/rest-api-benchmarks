FROM golang:1.21-alpine as builder

WORKDIR /server/

COPY go.* ./
RUN go mod download

COPY . .
RUN go build -o ./server -v ./cmd/

# ---

FROM alpine as bin

COPY --from=builder /server/server /server

EXPOSE 8080

ENTRYPOINT ["/server"]
