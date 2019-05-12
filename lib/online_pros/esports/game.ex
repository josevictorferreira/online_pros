defmodule OnlinePros.Esports.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:image, :name])
    |> validate_required([:image, :name])
  end
end
