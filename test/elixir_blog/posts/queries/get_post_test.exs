defmodule ElixirBlog.Posts.Queries.GetPostTest do
    use ElixirBlog.DataCase
  
    alias ElixirBlog.Posts
  
    test "process/1 get_post test" do
      user = insert(:user ,%{email: "biba@yandex.ru", password: "sheeeesh229"})
      post = insert(:post, %{author: "old author", title: "old title", body: "old_body", user_id: user.id})
      assert post = Posts.get_post(post.id)
      
    end
  end