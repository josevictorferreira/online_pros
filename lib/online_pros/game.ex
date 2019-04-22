defmodule OnlinePros.Game do
  use Ecto.Schema
  import Ecto.Changeset
  alias OnlinePros.Game

  schema "games" do
    field :image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :image])
    |> validate_required([:name, :image])
  end
end
