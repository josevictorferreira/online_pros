defmodule OnlinePros.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :image, :text, null: false
      add :name, :text, null: false

      timestamps()
    end

  end
end
