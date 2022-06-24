defmodule ElixirBlog.Posts.Queries.ListPosts do
    @moduledoc """
    ListUser Query return all users
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Posts.Entities.Post
  
    def process() do
      Post
      |>Repo.all()
      |>Repo.preload([:user, :tags])
    end
  end