defmodule ElixirPhoenixEcto.Users.Users do
  alias ElixirPhoenixEcto.Users.UserNotes
  alias ElixirPhoenixEcto.Users.UserContacts
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__]}
  @primary_key {:id, :id, autogenerate: true}
  schema "users" do
    field :username, :string
    field :email, :string
    timestamps(type: :utc_datetime, inserted_at: :created_at)
    field :deleted_at, :utc_datetime

    has_many :contacts, UserContacts, foreign_key: :user_id, references: :id
    has_many :notes, UserNotes, foreign_key: :user_id, references: :id
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [])
    |> validate_required([])
  end
end
