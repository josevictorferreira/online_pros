defmodule OnlinePros.TeamsTest do
  use OnlinePros.DataCase

  alias OnlinePros.Team
  alias OnlinePros.League
  alias OnlinePros.Game
  alias OnlinePros.Repo

  describe "teams" do
    @game %Game{name: "League of Legends", image: "lol.jpg"}
    @league %League{name: "CBLOL", image: "cblol.jpg", game: @game}
    @valid_attrs %Team{
      name: "Flamengo",
      image: "flamengo.jpg",
      league: @league
    }
    @invalid_attrs_1 %Team{
      name: nil,
      image: "flamengo.jpg",
      league: @league
    }
    @invalid_attrs_2 %Team{
      name: "Flamengo",
      image: nil,
      league: @league
    }
    @invalid_attrs_3 %Team{
      name: "Flamengo",
      image: "flamengo.jpg",
      league: nil
    }

    test "With valid data creates and updates a Team" do
      assert {:ok, %Team{} = team} = Repo.insert(@valid_attrs)
      assert team.name == "Flamengo"
      assert team.image == "flamengo.jpg"
      assert team.league.name == "CBLOL"
      assert team.league.image == "cblol.jpg"
      team = Ecto.Changeset.change team, name: "Testando"
      assert {:ok, %Team{} = team} = Repo.update(team)
      assert team.name == "Testando"
    end

    test "Insert with invalid attrs must return error" do
      assert_raise Postgrex.Error, fn ->
        Repo.insert(@invalid_attrs_1)
      end
      assert_raise Postgrex.Error, fn ->
        Repo.insert(@invalid_attrs_2)
      end
      assert_raise Postgrex.Error, fn ->
        Repo.insert(@invalid_attrs_3)
      end
    end
  end
end
