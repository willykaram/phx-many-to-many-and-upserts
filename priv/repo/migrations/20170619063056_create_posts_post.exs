defmodule MyAppPhx.Repo.Migrations.CreateMyAppPhx.Posts.Post do
  use Ecto.Migration

  def change do
    create table(:posts_posts) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
