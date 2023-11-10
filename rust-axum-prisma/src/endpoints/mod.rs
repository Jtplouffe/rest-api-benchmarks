use axum::Router;

use crate::AppState;

mod users;

pub fn router() -> Router<AppState> {
    Router::new().nest("/user", users::router())
}
