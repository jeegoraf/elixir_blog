defmodule ElixirBlog.Posts.Queries.GetPost do
    @moduledoc """
    ListUser Query return all users
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Posts.Entities.Post
  
    def process(id) do
      Post
      |>Repo.get(id)
      |>Repo.preload([:user])
    end
  end