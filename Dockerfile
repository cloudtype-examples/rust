FROM rust:1-slim-buster as builder
WORKDIR /app
COPY . .
RUN cargo install --path .


FROM debian:stable-slim as runner
COPY --from=builder /usr/local/cargo/bin/rust /usr/local/bin/rust
ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
CMD ["rust"]