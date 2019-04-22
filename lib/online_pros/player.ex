defmodule OnlinePros.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias OnlinePros.Player

  schema "players" do
    field :image, :string
    field :is_online, :boolean, default: false
    field :name, :string
    field :nationality, :string
    field :platform, :string
    field :position, :string
    field :stream_id, :string
    belongs_to :team, OnlinePros.Team

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :image, :is_online, :platform, :stream_id, :nationality, :position])
    |> validate_required([:name, :image, :is_online, :platform, :stream_id, :nationality, :position])
  end
end
