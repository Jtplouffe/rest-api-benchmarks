import {
    AllowNull,
    Column,
    CreatedAt,
    DataType,
    DeletedAt,
    ForeignKey,
    Model,
    PrimaryKey,
    Table,
    UpdatedAt,
} from "sequelize-typescript";
import { Users } from "./users.model";

@Table
export class UserNotes extends Model<UserNotes> {
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
    public title?: string;

    @AllowNull(false)
    @Column(DataType.TEXT)
    public content?: string;

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
