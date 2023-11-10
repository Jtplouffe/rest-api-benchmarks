use std::sync::Arc;

use self::prisma::PrismaClient;

#[allow(warnings, unused)]
pub mod prisma;

pub type Prisma = Arc<PrismaClient>;
