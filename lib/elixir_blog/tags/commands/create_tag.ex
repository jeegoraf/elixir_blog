defmodule ElixirBlog.Tags.Commands.CreateTag do
    @moduledoc """
    Defines create post command
    """
  
    alias ElixirBlog.Tags.Entities.Tag
    alias ElixirBlog.Repo
  
    def process(attrs) do
      %Tag{}
      |> Tag.create_changeset(attrs) 
      |> Repo.insert() 
    end
  end