defmodule OnlinePros.Esports.PlayersTest do
  use OnlinePros.DataCase

  alias OnlinePros.Esports.Player
  alias OnlinePros.Esports.Team
  alias OnlinePros.Esports.League
  alias OnlinePros.Esports.Game
  alias OnlinePros.Repo

  describe "players" do
    @game %Game{name: "League of Legends", image: "lol.jpg"}
    @league %League{name: "CBLOL", image: "cblol.jpg", game: @game}
    @team %Team{name: "Flamengo", image: "flamengo.jpg", league: @league}
    @valid_attrs %Player{
      name: "brTT",
      stream: "brTT",
      image: "brtt.jpg",
      platform: "Cube.TV",
      nationality: "Brazillian",
      position: "AD Carry",
      team: @team
    }
    @valid_attrs_2 %Player{
      name: "brTT",
      stream: "brTT",
      image: "brtt.jpg",
      platform: "Cube.TV",
      nationality: "Brazillian",
      position: "AD Carry",
      team: nil
    }
    @invalid_attrs_1 %Player{
      name: nil,
      stream: "brTT",
      image: "brtt.jpg",
      platform: "Cube.TV",
      nationality: "Brazillian",
      position: "AD Carry",
      team: @team
    }
    @invalid_attrs_2 %Player{
      name: "brTT",
      stream: nil,
      image: "brtt.jpg",
      platform: "Cube.TV",
      nationality: "Brazillian",
      position: "AD Carry",
      team: @team
    }
  end

  test "With valid data creates and updates a Player" do
    assert {:ok, %Player{} = player} = Repo.insert(@valid_attrs)
    assert player.name == "brTT"
    assert player.stream == "brTT"
    assert player.nationality == "Brazillian"
    assert player.position == "AD Carry"
    assert player.image == "brtt.jpg"
    assert player.is_online == false
    assert player.team.name == "Flamengo"
    player = Ecto.Changeset.change player, is_online: true
    assert {:ok, %Player{} = player} = Repo.update(player)
    assert player.is_online == true
  end

  test "With valid data creates a Player with no Team" do
    assert {:ok, %Player{} = player} = Repo.insert(@valid_attrs_2)
    assert player.team == nil
  end

  test "Should throw exception when creating a Player with invalid data" do
    assert_raise Postgrex.Error, fn ->
      Repo.insert(@invalid_attrs_1)
    end
    assert_raise Postgrex.Error, fn ->
      Repo.insert(@invalid_attrs_2)
    end
  end
end
