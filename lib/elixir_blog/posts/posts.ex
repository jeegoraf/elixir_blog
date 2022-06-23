defmodule ElixirBlog.Posts do
    @moduledoc """
    Describes the context of the account
    """
  
    alias ElixirBlog.Posts.Commands.{
      CreatePost,
      DeletePost,
      UpdatePost
    }
  
    alias ElixirBlog.Posts.Queries.{
      GetPost,
      ListPosts
    }
  
    # Commands
    defdelegate create_post(attrs), to: CreatePost, as: :process
    defdelegate delete_post(post), to: DeletePost, as: :process
    defdelegate update_post(post, attrs), to: UpdatePost, as: :process
  
    # Queries
    defdelegate get_post(id), to: GetPost, as: :process
    defdelegate list_posts(), to: ListPosts, as: :process
  end