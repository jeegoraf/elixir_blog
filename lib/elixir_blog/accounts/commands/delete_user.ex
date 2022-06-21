defmodule ElixirBlog.Accounts.Commands.DeleteUser do
    @moduledoc """
    Defines delete user command
    """
    alias ElixirBlog.Accounts.Entitites.User
    alias ElixirBlog.Repo
  
    def process(%User{} = user) do
      Repo.delete(user)
    end
  end