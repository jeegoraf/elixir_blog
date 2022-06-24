defmodule ElixirBlog.PostsTags.Queries.ListPostTags do
    @moduledoc """
    ListPostsTags Query return all comment likes
    """
    import Ecto.Query, only: [from: 2]
  
    alias ElixirBlog.Repo
    alias ElixirBlog.PostsTags.Entities.PostTag
  
    def process(post) do
        PostTag
      |> by_post(post.id)
      |> Repo.all()
    end
  
    defp by_post(query, post_id) do
      from post_tag in query,
        where: post_tag.post_id == ^post_id
    end
  end