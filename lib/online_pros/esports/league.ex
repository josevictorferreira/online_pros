defmodule OnlinePros.Esports.League do
  use Ecto.Schema
  import Ecto.Changeset

  schema "leagues" do
    field :image, :string
    field :name, :string
    belongs_to :game, OnlinePros.Esports.Game

    timestamps()
  end

  @doc false
  def changeset(league, attrs) do
    league
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
