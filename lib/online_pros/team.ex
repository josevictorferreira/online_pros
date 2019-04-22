defmodule OnlinePros.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias OnlinePros.Team

  schema "teams" do
    field :image, :string
    field :name, :string
    belongs_to :league, OnlinePros.League

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
