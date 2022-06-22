defmodule ElixirBlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :author, :string, default: ""
      add :body, :text
      add :user_id, references(:users)

      timestamps()
    end
  end
end
