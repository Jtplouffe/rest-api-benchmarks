import {
    AllowNull,
    Column,
    CreatedAt,
    DeletedAt,
    HasMany,
    Model,
    PrimaryKey,
    Table,
    UpdatedAt,
} from "sequelize-typescript";
import { UserContacts } from "./user-contacts.model";
import { UserNotes } from "./user-notes.model";

@Table
export class Users extends Model<Users> {
    @AllowNull(false)
    @PrimaryKey
    @Column
    public id?: number;

    @AllowNull(false)
    @Column
    public username?: string;

    @AllowNull(false)
    @Column
    public email?: string;

    @AllowNull(false)
    @CreatedAt
    @Column
    public createdAt?: Date;

    @AllowNull(false)
    @UpdatedAt
    @Column
    public updatedAt?: Date;

    @DeletedAt
    @Column
    public deletedAt?: Date;

    @HasMany(() => UserContacts)
    public contacts?: UserContacts[];

    @HasMany(() => UserNotes)
    public notes?: UserNotes[];
}
