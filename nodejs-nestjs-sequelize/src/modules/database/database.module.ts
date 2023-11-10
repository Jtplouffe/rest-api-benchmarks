import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { UsersModule } from "./users/users.module";

@Module({
    imports: [
        SequelizeModule.forRoot({
            dialect: "postgres",
            host: "host.docker.internal",
            username: "root",
            password: "root",
            database: "rest_api_benchmarks",
            autoLoadModels: true,
            synchronize: false,
            // Disable logging when benchmarking
            logging: false,
            define: {
                timestamps: true,
                paranoid: true,
                underscored: true,
            },
        }),
        UsersModule,
    ],
})
export class DatabaseModule {}
