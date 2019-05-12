defmodule OnlinePros.Repo.Migrations.CreateLeagues do
  use Ecto.Migration

  def change do
    create table(:leagues) do
      add :name, :string, null: false
      add :image, :string, null: false
      add :game_id, references(:games, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:leagues, [:game_id])
  end
end
