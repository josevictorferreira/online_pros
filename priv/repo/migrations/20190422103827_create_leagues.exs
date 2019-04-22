defmodule OnlinePros.Repo.Migrations.CreateLeagues do
  use Ecto.Migration

  def change do
    create table(:leagues) do
      add :name, :string, null: false
      add :image, :string, null: false
      add :game_id, references(:games), null: false

      timestamps()
    end

  end
end
