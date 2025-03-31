FROM rust:1.85.1-alpine AS builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./

RUN mkdir -p src && echo "fn main() { println!(\"Hello, world!\"); }" > src/main.rs

RUN cargo fetch --target x86_64-unknown-linux-musl

COPY . .

RUN cargo build --release --target x86_64-unknown-linux-musl && \
    strip target/x86_64-unknown-linux-musl/release/TP1

FROM scratch

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/TP1 /TP1

CMD ["/TP1"]