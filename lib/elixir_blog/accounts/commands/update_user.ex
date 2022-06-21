defmodule ElixirBlog.Accounts.Commands.UpdateUser do
    @moduledoc """
    Defines update user command
    """
  
    alias ElixirBlog.Accounts.Entities.User
    alias ElixirBlog.Repo
  
    def process(%User{} = user, attrs) do
      user
      |> User.update_changeset(attrs)
      |> Repo.update()
    end
  end