defmodule OnlinePros.League do
  use Ecto.Schema
  import Ecto.Changeset
  alias OnlinePros.League

  schema "leagues" do
    field :image, :string
    field :name, :string
    belongs_to :game, OnlinePros.Game

    timestamps()
  end

  @doc false
  def changeset(league, attrs) do
    league
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
