defmodule ElixirBlog.Posts.Commands.CreatePost do
    @moduledoc """
    Defines create post command
    """
  
    alias ElixirBlog.Posts.Entities.Post
    alias ElixirBlog.Repo
  
    def process(attrs) do
      %Post{}
      |> Post.create_changeset(attrs) 
      |> Repo.insert() 
    end
  end