defmodule ElixirBlog.Tags.Queries.GetTag do
    @moduledoc """
    GetUser Query find user by id
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Tags.Entities.Tag
  
    def process(id) do
      Tag
      |>Repo.get(id)
      
    end
  end