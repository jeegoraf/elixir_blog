defmodule ElixirBlog.Accounts.Commands.CreateUser do
    @moduledoc """
    Defines create user command
    """
  
    alias ElixirBlog.Accounts.Entities.User
    alias ElixirBlog.Repo
  
    def process(attrs) do
      %User{}
      |> User.create_changeset(attrs) 
      |> Repo.insert() # добавляет пользователя в Repo
    end
  end