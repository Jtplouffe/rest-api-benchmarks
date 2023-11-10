use axum::{
    extract::{Json, State},
    http::StatusCode,
    response::IntoResponse,
    routing::get,
    Router,
};
use axum_extra::extract::Query;
use serde_json::json;

use crate::{
    services::{self, users::FindUsersOptions},
    AppState,
};

pub fn router() -> Router<AppState> {
    Router::new().route("/", get(find_all_users))
}

async fn find_all_users(
    Query(options): Query<FindUsersOptions>,
    State(state): State<AppState>,
) -> impl IntoResponse {
    match services::users::find_all(state.prisma, &options).await {
        Ok(users) => Json::from(users).into_response(),
        Err(err) => (
            StatusCode::INTERNAL_SERVER_ERROR,
            Json(json!({ "error": err.to_string() })),
        )
            .into_response(),
    }
}
