FROM rust:1.73 as builder

RUN USER=root cargo new --bin rust_axum_prisma
WORKDIR /rust_axum_prisma/

COPY ./Cargo.* ./
COPY ./prisma-cli/ ./prisma-cli/

RUN cargo build --release
RUN rm ./src/*.rs

COPY . .

RUN cargo prisma generate

RUN rm ./target/release/deps/rust_axum_prisma*
RUN cargo build --release

# ---

FROM rust:1.73

COPY --from=builder /rust_axum_prisma/target/release/rust-axum-prisma .

ENTRYPOINT ["./rust-axum-prisma"]
