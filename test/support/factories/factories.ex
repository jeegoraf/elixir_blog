defmodule ElixirBlog.Factories do
    @moduledoc """
    Defines the factories for ExMachina
    """
    use ExMachina.Ecto, repo: ElixirBlog.Repo
  
    use ElixirBlog.Factories.Accounts.{
      UserFactory
    }
  end