defmodule ElixirBlog.Posts.Commands.UpdatePostTest do
    use ElixirBlog.DataCase
  
    alias ElixirBlog.Posts

    test "process/1 update_post test" do
      user = insert(:user ,%{email: "fuck@yandex.ru", password: "sheeeesh140"})
      post = insert(:post, %{author: "old author", title: "old title", body: "old_body", user_id: user.id})
      attrs = %{title: "new title"}
      assert {:ok, updated_post} = Posts.update_post(post, attrs)
      assert updated_post.title == attrs.title
      
    end
  end