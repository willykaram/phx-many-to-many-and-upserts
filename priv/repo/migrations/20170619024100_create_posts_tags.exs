defmodule MyAppPhx.Repo.Migrations.CreateNotesSpheres do
 use Ecto.Migration

 def change do

   create table(:posts_tags, primary_key: false) do
     add :post_id, references(:posts_posts)
     add :tag_id, references(:tags_tags)
   end

 end
end
