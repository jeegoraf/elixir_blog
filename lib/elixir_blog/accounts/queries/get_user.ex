defmodule ElixirBlog.Accounts.Queries.GetUser do
    @moduledoc """
    GetUser Query find user by id
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.Accounts.Entities.User
  
    def process(id) do
      res = User
      |>Repo.get(id)
      |>Repo.preload([:posts])
      
      case res do
        %{} -> {:ok, res}
        _ -> {:error, :not_found}
      
      end
    end
  end