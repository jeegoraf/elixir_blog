defmodule ElixirBlog.PostsTags.Commands.DeletePostTag do
    @moduledoc """
    Defines create comment like command
    """
  
    alias ElixirBlog.PostsTags.Entities.PostTag
    alias ElixirBlog.Repo
  
    def process(attrs) do
      %PostTag{}
      |> Repo.delete()
    end
  end