defmodule ElixirPhoenixEcto.Users.UserContacts do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__]}
  @primary_key {:id, :id, autogenerate: true}
  schema "user_contacts" do
    field :user_id, :integer
    field :name, :string
    field :email, :string
    timestamps(type: :utc_datetime, inserted_at: :created_at)
    field :deleted_at, :utc_datetime
  end

  @doc false
  def changeset(user_contacts, attrs) do
    user_contacts
    |> cast(attrs, [])
    |> validate_required([])
  end
end
