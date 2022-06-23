defmodule ElixirBlog.Tags do
    @moduledoc """
    Describes the context of the tag
    """
  
    alias ElixirBlog.Tags.Commands.{
      CreateTag
    }
  
    alias ElixirBlog.Tags.Queries.{
      GetTag,
      ListTags
    }
  
    # Commands
    defdelegate create_tag(attrs), to: CreateTag, as: :process
  
    # Queries
    defdelegate get_tag(id), to: GetTag, as: :process
    defdelegate list_tags(), to: ListTags, as: :process
  end