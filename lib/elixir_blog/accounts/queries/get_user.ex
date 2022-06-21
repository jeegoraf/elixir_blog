defmodule ElixirBlog.Accounts.Queries.GetUser do
    @moduledoc """
    GetUser Query find user by id
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Accounts.Entities.User
  
    def process(id) do
      Repo.find(User, id)
    end
  end