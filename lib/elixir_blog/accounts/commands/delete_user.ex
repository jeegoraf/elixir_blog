defmodule ElixirBlog.Accounts.Commands.DeleteUser do
    @moduledoc """
    Defines delete user command
    """
    alias ElixirBlog.Accounts.Entities.User
    alias ElixirBlog.Repo
  
    def process(%User{} = user) do
      Repo.delete(user)
    end
  end