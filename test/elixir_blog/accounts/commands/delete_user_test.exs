defmodule ElixirBlog.Accounts.Commands.DeleteUserTest do
    use ElixirBlog.DataCase
  
    alias ElixirBlog.Accounts
  
    test "process/1 delete_user test" do
      user = insert(:user)
      assert {:ok, _result} = Accounts.delete_user(user)
      assert {:error, :not_found} = Accounts.get_user(user.id)
    end
  end