defmodule ElixirPhoenixEctoWeb.Router do
  alias ElixirPhoenixEctoWeb.UsersController
  use ElixirPhoenixEctoWeb, :router

  pipeline :api do
    get "/user", UsersController, :index
  end

  scope "/", ElixirPhoenixEctoWeb do
    pipe_through :api
  end
end
