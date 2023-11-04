import { Module } from "@nestjs/common";
import { SequelizeModule } from "@nestjs/sequelize";
import { UsersController } from "./controllers/users.controller";
import { UserContacts } from "./models/user-contacts.model";
import { UserNotes } from "./models/user-notes.model";
import { Users } from "./models/users.model";
import { UsersService } from "./services/users.service";

@Module({
    imports: [SequelizeModule.forFeature([Users, UserContacts, UserNotes])],
    providers: [UsersService],
    controllers: [UsersController],
})
export class UsersModule {}
