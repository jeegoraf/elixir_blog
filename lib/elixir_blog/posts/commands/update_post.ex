defmodule ElixirBlog.Posts.Commands.UpdatePost do
    @moduledoc """
    Defines update post command
    """
  
    alias ElixirBlog.Posts.Entities.Post
    alias ElixirBlog.Repo
  
    def process(%Post{} = post, attrs) do
        post
        |> Post.update_changeset(attrs) 
        |> Repo.update() 
    end
  end