use std::sync::Arc;

use axum::Server;
use database::{prisma::PrismaClient, Prisma};

mod database;
mod endpoints;
mod services;

#[derive(Clone)]
pub struct AppState {
    prisma: Prisma,
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    // Disable logging when benchmarking
    // tracing_subscriber::fmt()
    //     .with_max_level(tracing::Level::DEBUG)
    //     .init();

    let prisma_client = PrismaClient::_builder().build().await?;

    let app_state = AppState {
        prisma: Arc::new(prisma_client),
    };

    let app = endpoints::router()
        .with_state(app_state);
    //  .layer(tower_http::trace::TraceLayer::new_for_http());

    Server::bind(&"0.0.0.0:8080".parse()?)
        .serve(app.into_make_service())
        .await?;

    Ok(())
}
