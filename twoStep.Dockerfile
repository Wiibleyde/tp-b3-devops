FROM rust:1.85.1-alpine AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./

RUN mkdir -p src && echo "fn main() { println!(\"Hello, world!\"); }" > src/main.rs

RUN cargo fetch

COPY . .

RUN cargo build --release

FROM alpine:3.18

WORKDIR /app

COPY --from=builder /app/target/release/TP1 ./TP1

CMD ["./TP1"]