defmodule ElixirPhoenixEctoWeb.UsersController do
  alias ElixirPhoenixEcto.Repo
  alias ElixirPhoenixEcto.Users.Users
  import Ecto.Query

  use ElixirPhoenixEctoWeb, :controller

  def index(conn, params) do
    include =
      case Map.get(params, "include") do
        include when is_list(include) -> include
        include when is_binary(include) -> [include]
        _ -> []
      end

    users =
      Repo.all(from users in Users, preload: ^preloads(include, []))

    conn
    |> put_status(200)
    |> json(users)
  end

  defp preloads([head | tail], acc) do
    case head do
      "contacts" -> preloads(tail, [:contacts | acc])
      "notes" -> preloads(tail, [:notes | acc])
      _ -> preloads(tail, acc)
    end
  end

  defp preloads([], acc), do: acc
end
