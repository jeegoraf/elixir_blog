defmodule ElixirBlog.Tags.Queries.ListTags do
    @moduledoc """
    ListUser Query return all users
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Tags.Entities.Tag
  
    def process() do
      Tag
      |>Repo.all()
    end
  end