
defmodule ElixirBlog.Accounts.Queries.ListUsers do
    @moduledoc """
    ListUser Query return all users
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Accounts.Entities.User
  
    def process() do
      res = User
      |>Repo.all()
      |>Repo.preload([:posts])
      
    end
  end