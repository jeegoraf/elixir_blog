defmodule ElixirBlog.PostsTags.Commands.CreatePostTag do
    @moduledoc """
    Defines create comment like command
    """
  
    alias ElixirBlog.PostsTags.Entities.PostTag
    alias ElixirBlog.Repo
  
    def process(attrs) do
      %PostTag{}
      |> PostTag.create_changeset(attrs)
      |> Repo.insert()
    end
  end