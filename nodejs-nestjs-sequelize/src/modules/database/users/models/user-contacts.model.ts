import {
    AllowNull,
    Column,
    CreatedAt,
    DeletedAt,
    ForeignKey,
    Model,
    PrimaryKey,
    Table,
    UpdatedAt,
} from "sequelize-typescript";
import { Users } from "./users.model";

@Table
export class UserContacts extends Model<UserContacts> {
    @AllowNull(false)
    @PrimaryKey
    @Column
    public id?: number;

    @AllowNull(false)
    @ForeignKey(() => Users)
    @Column
    public userId?: number;

    @AllowNull(false)
    @Column
    public name?: string;

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
}
