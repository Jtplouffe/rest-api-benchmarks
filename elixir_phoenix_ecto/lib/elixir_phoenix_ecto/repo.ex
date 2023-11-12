defmodule ElixirPhoenixEcto.Repo do
  use Ecto.Repo,
    otp_app: :elixir_phoenix_ecto,
    adapter: Ecto.Adapters.Postgres
end

defimpl Jason.Encoder, for: Ecto.Association.NotLoaded do
  def encode(struct, _options) do
    case struct.__cardinality__ do
      :many -> "null"
      _ -> "null"
    end
  end
end
