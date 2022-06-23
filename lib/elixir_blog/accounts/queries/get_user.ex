defmodule ElixirBlog.Accounts.Queries.GetUser do
    @moduledoc """
    GetUser Query find user by id
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Accounts.Entities.User
  
    def process(id) do
      User
      |>Repo.get(id)
      |>Repo.preload([:posts])
      
    end
  end