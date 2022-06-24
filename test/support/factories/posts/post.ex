defmodule ElixirBlog.Factories.Posts.PostFactory do
    @moduledoc """
    Determines PostFactory for ExMachina
    """
    defmacro __using__(_opts) do
      quote do
        alias Faker.{Internet, Lorem}
        alias ElixirBlog.Posts.Entities.Post
  
        def post_factory(attrs) do
          title =
            Map.get(attrs, :title, Lorem.words())
            |> to_string()

  
          body = Map.get(attrs, :body, Lorem.sentence())
            |> to_string()
  
          author = Map.get(attrs, :author, Lorem.words())
          |> to_string()

          user_id = Map.get(attrs, :user_id, 0)

          tags = Map.get(attrs, :tags, [])

  
          %Post{
            title: title,
            author: author,
            body: body, 
            user_id: user_id,
            tags: tags
          }
        end
      end
    end
  end