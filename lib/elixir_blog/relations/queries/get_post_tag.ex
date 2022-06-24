defmodule ElixirBlog.PostsTags.Queries.GetPostTag do
    @moduledoc """
    GetCommentLike Query find comment_like by id
    """
  
    alias ElixirBlog.Repo
    alias ElixirBlog.PostsTags.Entities.PostTag
  
    def process(id) do
      Repo.find(PostTag, id)
    end
  end