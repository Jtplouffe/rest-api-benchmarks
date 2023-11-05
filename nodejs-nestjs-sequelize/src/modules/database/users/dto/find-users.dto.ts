import { Transform } from "class-transformer";
import { IsArray, IsIn, IsOptional, isArray, isDefined } from "class-validator";
import { FindOptions, Includeable } from "sequelize";
import { UserContacts } from "../models/user-contacts.model";
import { UserNotes } from "../models/user-notes.model";
import { Users } from "../models/users.model";

const FindUsersIncludeValues = ["contacts", "notes"] as const;
type FindUsersIncludes = typeof FindUsersIncludeValues[number];

export class FindUsersDto {
    @IsArray()
    @IsIn(FindUsersIncludeValues, { each: true })
    @IsOptional()
    @Transform(({ value }) => {
        if (!isArray(value) && isDefined(value)) {
            return [value];
        }

        return value;
    })
    public include?: FindUsersIncludes[];

    public toFindOptions(): FindOptions<Users> {
        return {
            include: this.generateIncludes(),
            order: [["username", "ASC"]],
        };
    }

    private generateIncludes(): Includeable[] {
        const includes: Includeable[] = [];

        if (!this.include?.length) {
            return includes;
        }

        if (this.include.includes("contacts")) {
            includes.push({ model: UserContacts, separate: true });
        }

        if (this.include.includes("notes")) {
            includes.push({ model: UserNotes, separate: true });
        }

        return includes;
    }
}
