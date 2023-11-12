defmodule ElixirPhoenixEcto.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias ElixirPhoenixEcto.Repo

  alias ElixirPhoenixEcto.Users.Users

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%Users{}, ...]

  """
  def list_users do
    Repo.all(Users)
  end

  @doc """
  Gets a single users.

  Raises `Ecto.NoResultsError` if the Users does not exist.

  ## Examples

      iex> get_users!(123)
      %Users{}

      iex> get_users!(456)
      ** (Ecto.NoResultsError)

  """
  def get_users!(id), do: Repo.get!(Users, id)

  @doc """
  Creates a users.

  ## Examples

      iex> create_users(%{field: value})
      {:ok, %Users{}}

      iex> create_users(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users(attrs \\ %{}) do
    %Users{}
    |> Users.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users.

  ## Examples

      iex> update_users(users, %{field: new_value})
      {:ok, %Users{}}

      iex> update_users(users, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users(%Users{} = users, attrs) do
    users
    |> Users.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a users.

  ## Examples

      iex> delete_users(users)
      {:ok, %Users{}}

      iex> delete_users(users)
      {:error, %Ecto.Changeset{}}

  """
  def delete_users(%Users{} = users) do
    Repo.delete(users)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking users changes.

  ## Examples

      iex> change_users(users)
      %Ecto.Changeset{data: %Users{}}

  """
  def change_users(%Users{} = users, attrs \\ %{}) do
    Users.changeset(users, attrs)
  end

  alias ElixirPhoenixEcto.Users.UserContacts

  @doc """
  Returns the list of user_contacts.

  ## Examples

      iex> list_user_contacts()
      [%UserContacts{}, ...]

  """
  def list_user_contacts do
    Repo.all(UserContacts)
  end

  @doc """
  Gets a single user_contacts.

  Raises `Ecto.NoResultsError` if the User contacts does not exist.

  ## Examples

      iex> get_user_contacts!(123)
      %UserContacts{}

      iex> get_user_contacts!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_contacts!(id), do: Repo.get!(UserContacts, id)

  @doc """
  Creates a user_contacts.

  ## Examples

      iex> create_user_contacts(%{field: value})
      {:ok, %UserContacts{}}

      iex> create_user_contacts(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_contacts(attrs \\ %{}) do
    %UserContacts{}
    |> UserContacts.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_contacts.

  ## Examples

      iex> update_user_contacts(user_contacts, %{field: new_value})
      {:ok, %UserContacts{}}

      iex> update_user_contacts(user_contacts, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_contacts(%UserContacts{} = user_contacts, attrs) do
    user_contacts
    |> UserContacts.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_contacts.

  ## Examples

      iex> delete_user_contacts(user_contacts)
      {:ok, %UserContacts{}}

      iex> delete_user_contacts(user_contacts)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_contacts(%UserContacts{} = user_contacts) do
    Repo.delete(user_contacts)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_contacts changes.

  ## Examples

      iex> change_user_contacts(user_contacts)
      %Ecto.Changeset{data: %UserContacts{}}

  """
  def change_user_contacts(%UserContacts{} = user_contacts, attrs \\ %{}) do
    UserContacts.changeset(user_contacts, attrs)
  end

  alias ElixirPhoenixEcto.Users.UserNotes

  @doc """
  Returns the list of user_notes.

  ## Examples

      iex> list_user_notes()
      [%UserNotes{}, ...]

  """
  def list_user_notes do
    Repo.all(UserNotes)
  end

  @doc """
  Gets a single user_notes.

  Raises `Ecto.NoResultsError` if the User notes does not exist.

  ## Examples

      iex> get_user_notes!(123)
      %UserNotes{}

      iex> get_user_notes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_notes!(id), do: Repo.get!(UserNotes, id)

  @doc """
  Creates a user_notes.

  ## Examples

      iex> create_user_notes(%{field: value})
      {:ok, %UserNotes{}}

      iex> create_user_notes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_notes(attrs \\ %{}) do
    %UserNotes{}
    |> UserNotes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_notes.

  ## Examples

      iex> update_user_notes(user_notes, %{field: new_value})
      {:ok, %UserNotes{}}

      iex> update_user_notes(user_notes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_notes(%UserNotes{} = user_notes, attrs) do
    user_notes
    |> UserNotes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_notes.

  ## Examples

      iex> delete_user_notes(user_notes)
      {:ok, %UserNotes{}}

      iex> delete_user_notes(user_notes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_notes(%UserNotes{} = user_notes) do
    Repo.delete(user_notes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_notes changes.

  ## Examples

      iex> change_user_notes(user_notes)
      %Ecto.Changeset{data: %UserNotes{}}

  """
  def change_user_notes(%UserNotes{} = user_notes, attrs \\ %{}) do
    UserNotes.changeset(user_notes, attrs)
  end
end
