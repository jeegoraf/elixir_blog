defmodule ElixirBlog.Accounts.Commands.UpdateUser do
    @moduledoc """
    Defines update user command
    """
  
    alias ElixirBlog.Accounts.Entitites.User
    alias ElixirBlog.Repo
  
    def process(%User{} = user, attrs) do
      user
      |> User.update_changeset(attrs)
      |> Repo.update()
    end
  end