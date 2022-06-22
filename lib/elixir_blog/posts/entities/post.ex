defmodule ElixirBlog.Posts.Entities.Post do
    use Ecto.Schema
    import Ecto.Changeset
    
    alias ElixirBlog.Accounts.Entities.User

    @required [:title, :author, :user]
  
    schema "users" do
      field :title, :string
      field :author, :string
      field :body, :text

      belongs_to :user, User
  
      timestamps()
    end
  
    @doc false
    def create_changeset(user, attrs) do
      user
      |> cast(attrs, @required) 
      |> validate_required(@required)
      |> assoc_constraint(:user) # проверка на существование связанного поля
    end
  
    
    def update_changeset(%__MODULE__{} = user, attrs) do
      user
      |> cast(attrs, @required)
      |> validate_required(@required)
      |> assoc_constraint(:user)
    end