defmodule ElixirBlog.Posts.Entities.Post do
    use Ecto.Schema
    import Ecto.Changeset
    
    alias ElixirBlog.Accounts.Entities.User

    @required [:title, :author, :body, :user_id]
  
    schema "posts" do
      field :title, :string
      field :author, :string
      field :body, :string

      belongs_to :user, User
    
  
      timestamps()
    end
  
    @doc false
    def create_changeset(post, attrs) do
      post
      |> cast(attrs, @required) 
      |> validate_required(@required)
      |> assoc_constraint(:user) # проверка на существование связанного поля
    end
  
    
    def update_changeset(%__MODULE__{} = post, attrs) do
      post
      |> cast(attrs, @required)
      |> validate_required(@required)
      |> assoc_constraint(:user)
    end
  end