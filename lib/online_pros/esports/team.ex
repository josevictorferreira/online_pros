defmodule OnlinePros.Esports.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :image, :string
    field :name, :string
    belongs_to :league, OnlinePros.Esports.League

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
