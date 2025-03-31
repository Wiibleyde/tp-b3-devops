FROM rust:1.85.1-alpine

WORKDIR /app

COPY Cargo.toml Cargo.lock ./

RUN mkdir -p src && echo "fn main() { println!(\"Hello, world!\"); }" > src/main.rs

RUN cargo fetch

COPY . .

RUN cargo build --release && \
    rm -rf src Cargo.lock Cargo.toml target/debug

RUN addgroup -S apigroup && adduser -S apiuser -G apigroup

RUN chown -R apiuser:apigroup /app

USER apiuser

CMD ["./target/release/TP1"]