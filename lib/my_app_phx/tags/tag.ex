defmodule MyAppPhx.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyAppPhx.Tags.Tag


  schema "tags_tags" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:name])
  end
end
