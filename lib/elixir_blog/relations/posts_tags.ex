defmodule ElixirBlog.PostsTags do
    @moduledoc """
    Describes the context of the book
    """
  
    alias ElixirBlog.PostsTags.Commands.{
      CreatePostTag,
      DeletePostTag
    }
  
    alias ElixirBlog.PostsTags.Queries.{
      GetPostTag,
      ListPostTags
    }
  
    # Commands
    defdelegate create_post_tag(attrs), to: CreatePostTag, as: :process
    defdelegate delete_post_tag(post_tag), to: DeletePostTag, as: :process
  
    # Queries
    defdelegate get_post_tag(id), to: GetPostTag, as: :process
    defdelegate list_post_tags(post), to: ListPostTags, as: :process
  end