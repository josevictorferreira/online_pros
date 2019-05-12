defmodule OnlinePros.Esports.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :image, :string
    field :is_online, :boolean, default: false
    field :name, :string
    field :nationality, :string
    field :platform, :string
    field :position, :string
    field :stream, :string
    belongs_to :team, OnlinePros.Esports.Team

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :image, :is_online, :nationality, :platform, :position, :stream])
    |> validate_required([:name, :image, :is_online, :nationality, :platform, :position, :stream])
  end
end
