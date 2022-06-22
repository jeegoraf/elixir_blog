defmodule ElixirBlog.Accounts.Commands.GetUserTest do
    use ElixirBlog.DataCase
  
    alias ElixirBlog.Accounts
  
    test "process/1 get_user test" do
      user = insert(:user, %{email: "some@email.com", password: "someSOME123*"})
      assert {:ok, result} = Accounts.get_user(user.id)
      assert result.id == user.id
    end
  end