defmodule OnlinePros.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do

      add :name, :string, null: false
      add :image, :string, null: false
      add :league_id, references(:leagues), null: false

      timestamps()
    end

  end
end
