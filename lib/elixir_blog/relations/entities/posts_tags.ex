defmodule PostTag do
    @moduledoc """
    Determines booktag shema - relation between books and tags
    """
    use Ecto.Schema
  
    import Ecto.Changeset
  
    alias ElixirBlog.Posts.Entities.Post
    alias ElixirBlog.Tags.Entities.Tag
  
    @required [
      :post_id,
      :tag_id
    ]
  
    @primary_key false
    schema "posts_tags" do
      belongs_to :post, Post
      belongs_to :tag, Tag
  
      timestamps()
    end
  
    def changeset(%__MODULE__{} = book_tag, attrs \\ %{}) do
      book_tag
      |> cast(attrs, @required)
      |> validate_required(@required)
      |> assoc_constraint(:post)
      |> assoc_constraint(:tag)
      |> unique_constraint([:post, :tag], message: "taken")
    end
  end