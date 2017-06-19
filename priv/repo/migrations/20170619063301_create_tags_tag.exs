defmodule MyAppPhx.Repo.Migrations.CreateMyAppPhx.Tags.Tag do
  use Ecto.Migration

  def change do
    create table(:tags_tags) do
      add :name, :string

      timestamps()
    end

  #create unique_index(:tags, [:name])

  end

end
