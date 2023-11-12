defmodule ElixirPhoenixEcto.Users.UserNotes do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__]}
  @primary_key {:id, :id, autogenerate: true}
  schema "user_notes" do
    field :user_id, :integer
    field :title, :string
    field :content, :string
    timestamps(type: :utc_datetime, inserted_at: :created_at)
    field :deleted_at, :utc_datetime
  end

  @doc false
  def changeset(user_notes, attrs) do
    user_notes
    |> cast(attrs, [])
    |> validate_required([])
  end
end
