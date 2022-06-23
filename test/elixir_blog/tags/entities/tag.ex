defmodule ElixirBlog.Tags.Entities.Tag do
    @moduledoc """
    Determines tags schema
    """
  
    use Ecto.Schema
  
    import Ecto.Changeset
  
    @required [:name]
  
  
    schema "tags" do
      field :name, :string
      timestamps()
    end
  
    def create_changeset(%__MODULE__{} = tag_entity, attrs) do
      tag_entity
      |> cast(attrs, @required ++ @optional)
      |> validate_required(@required)
      |> unique_constraint(:name, message: "taken")
    end
  end