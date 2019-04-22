defmodule OnlinePros.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string, null: false
      add :image, :string, null: false
      add :is_online, :boolean, default: false, null: false
      add :platform, :string, null: false
      add :stream_id, :string, null: false
      add :nationality, :string, null: false
      add :position, :string, null: false
      add :team_id, references(:teams)

      timestamps()
    end

  end
end
