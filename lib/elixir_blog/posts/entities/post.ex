defmodule ElixirBlog.Posts.Entities.Post do
    use Ecto.Schema
    import Ecto.Changeset
    
    alias ElixirBlog.Accounts.Entities.User
    alias ElixirBlog.Tags.Entities.Tag
    alias ElixirBlog.Repo

    @required [:title, :author, :body, :user_id]
  
    schema "posts" do
      field :title, :string
      field :author, :string
      field :body, :string

      belongs_to :user, User

      many_to_many :tags, Tag, join_through: "posts_tags", on_delete: :nothing
    
  
      timestamps()
    end
  
    @doc false
    def create_changeset(post, attrs) do
      post
      |> Repo.preload(:tags)
      |> cast(attrs, @required) 
      |> validate_required(@required)
      |> assoc_constraint(:user) # проверка на существование связанного поля
      |> foreign_key_constraint(:user_id, name: :posts_user_id_fkey, message: "not associated with any user")
      |> put_tags(attrs)
    end
  
    
    def update_changeset(%__MODULE__{} = post, attrs) do
      post
      |> Repo.preload(:tags)
      |> cast(attrs, @required)
      |> validate_required(@required)
      |> assoc_constraint(:user)
      |> foreign_key_constraint(:user_id, name: :posts_user_id_fkey, message: "not associated with any user")
      |> put_tags(attrs)
    end

    defp put_tags(changeset, attrs) do
      case Map.fetch(attrs, :tags) do
        {:ok, result} -> put_assoc(changeset, :tags, result)
        :error -> put_assoc(changeset, :tags, [])
      end
    end
  end