defmodule ElixirBlog.Posts.Commands.DeletePostTest do
  use ElixirBlog.DataCase

  alias ElixirBlog.Posts

  test "process/1 delete_post test" do
    user = insert(:user ,%{email: "mama@yandex.ru", password: "sheeeesh"})
    post = insert(:post, %{author: "old author", title: "old title", body: "old_body", user_id: user.id})
    assert {:ok, _} = Posts.delete_post(post)
    
  end
end