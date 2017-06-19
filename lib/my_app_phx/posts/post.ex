defmodule MyAppPhx.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias MyAppPhx.Posts.Post

  schema "posts_posts" do
    field :body, :string
    field :title, :string
    many_to_many :tags, MyAppPhx.Tags.Tag, join_through: "posts_tags", on_replace: :delete

    timestamps()
  end

  # Changeset is the same
  def changeset(struct, params \\ %{}) do
    struct
    |> Ecto.Changeset.cast(params, [:title, :body])
    |> Ecto.Changeset.put_assoc(:tags, parse_tags(params))
  end

  # Parse tags has slightly changed
  defp parse_tags(params)  do
    (params["tags"] || "")
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(& &1 == "")
    |> insert_and_get_all()
  end

  defp insert_and_get_all([]) do
    []
  end

  defp insert_and_get_all(names) do
    maps = Enum.map(names, &%{name: &1})
    Repo.insert_all MyApp.Tags.Tag, maps, on_conflict: :nothing
    Repo.all(from t in MyApp.Tags.Tag, where: t.name in ^names)
  end

end
