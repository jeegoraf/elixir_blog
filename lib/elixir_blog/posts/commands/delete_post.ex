defmodule ElixirBlog.Posts.Commands.DeletePost do
    @moduledoc """
    Defines delete post command
    """
    alias ElixirBlog.Posts.Entities.Post
    alias ElixirBlog.Repo
  
    def process(%Post{} = post) do
      Repo.delete(post) 
    end
  end