import { Controller, Get, Query } from "@nestjs/common";
import { FindUsersDto } from "../dto/find-users.dto";
import { Users } from "../models/users.model";
import { UsersService } from "../services/users.service";

@Controller("user")
export class UsersController {
    constructor(private service: UsersService) {}

    @Get()
    public findUsers(@Query() dto: FindUsersDto): Promise<Users[]> {
        return this.service.repository.findAll(dto.toFindOptions());
    }
}
