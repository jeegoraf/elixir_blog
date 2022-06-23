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
      |> foreign_key_constraint(:user_id, name: :posts_user_id_fkey, message: "not associated with any user")
    end
  
    
    def update_changeset(%__MODULE__{} = post, attrs) do
      post
      |> cast(attrs, @required)
      |> validate_required(@required)
      |> assoc_constraint(:user)
      |> foreign_key_constraint(:user_id, name: :posts_user_id_fkey, message: "not associated with any user")
    end
  end