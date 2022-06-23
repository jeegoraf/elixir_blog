defmodule ElixirBlog.Accounts.Entities.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias ElixirBlog.Posts.Entities.Post

  @required [:email, :password]

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :posts, Post, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def create_changeset(user, attrs) do
    user
    |> cast(attrs, @required) # создает changeset (attrs - изменение, @required - поля, которые можно изменять)
    |> validate_required(@required) # проверяет, что обязательные поля всегда присутствуют
    |> unique_constraint(:email, message: "taken") # проверяет email на уникальность
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
      message: "invalid_password_format"
    )
    |> put_password_hash() # хэширование пароля

  end

  
  def update_changeset(%__MODULE__{} = user, attrs) do
    user
    |> cast(attrs, @required)
    |> validate_required(@required)
    |> unique_constraint(:email, message: "taken")
    |> validate_format(:password, ~r/^(?=.*\d)(?=.*[a-z])(?=.*[a-zA-Z]).{8,}/,
      message: "invalid_password_format"
    )
    |> put_password_hash()
  end

  defp put_password_hash(%{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp put_password_hash(changeset), do: changeset
end
