use std::vec;

use serde::Deserialize;

use crate::database::{
    prisma::{user_contacts, user_notes, users},
    Prisma,
};

#[derive(Deserialize, PartialEq, Eq)]
#[serde(rename_all = "camelCase")]
pub enum UserIncludes {
    Contacts,
    Notes,
}

#[derive(Deserialize)]
pub struct FindUsersOptions {
    #[serde(default)]
    include: Vec<UserIncludes>,
}

pub async fn find_all(
    prisma: Prisma,
    options: &FindUsersOptions,
) -> anyhow::Result<Vec<users::Data>> {
    let mut query = prisma
        .users()
        .find_many(vec![users::deleted_at::equals(None)]);

    if options.include.contains(&UserIncludes::Contacts) {
        query = query.with(users::contacts::fetch(vec![
            user_contacts::deleted_at::equals(None),
        ]));
    }

    if options.include.contains(&UserIncludes::Notes) {
        query = query.with(users::notes::fetch(vec![user_notes::deleted_at::equals(
            None,
        )]));
    }

    let users = query.exec().await?;
    Ok(users)
}
