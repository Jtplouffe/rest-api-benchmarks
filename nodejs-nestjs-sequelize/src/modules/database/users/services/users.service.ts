import { Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/sequelize";
import { Users } from "../models/users.model";

@Injectable()
export class UsersService {
    constructor(@InjectModel(Users) public readonly repository: typeof Users) {}
}
