defmodule ElixirBlog.Tags.Entities.Tag do
    @moduledoc """
    Determines tags schema
    """
  
    use Ecto.Schema
  
    import Ecto.Changeset

    alias ElixirBlog.Posts.Entities.Post
  
    @required [:name]
  
  
    schema "tags" do
      field :name, :string
      timestamps()

      many_to_many :posts, Post, join_through: "posts_tags", on_delete: :nothing

    end
  
    def create_changeset(%__MODULE__{} = tag_entity, attrs) do
      tag_entity
      |> cast(attrs, @required)
      |> validate_required(@required)
      |> unique_constraint(:name, message: "taken")
    end
  end