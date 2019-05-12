defmodule OnlinePros.Esports.LeaguesTest do
  use OnlinePros.DataCase

  alias OnlinePros.Esports.League
  alias OnlinePros.Esports.Game
  alias OnlinePros.Repo

  describe "leagues" do
    @valid_attrs %League{
      name: "CBLOL",
      image: "cblol.jpg",
      game: %Game{name: "League of Legends", image: "lol.jpg"}
    }
    @invalid_attrs_1 %League{
      name: nil,
      image: "cblol.jpg",
      game: %Game{name: "League of Legends", image: "lol.jpg"}
    }
    @invalid_attrs_2 %League{
      name: "Teste",
      image: nil,
      game: %Game{name: "League of Legends", image: "lol.jpg"}
    }
    @invalid_attrs_3 %League{
      name: "Teste",
      image: "teste.jpg",
      game: nil
    }

    test "With valid data creates and updates a League" do
      assert {:ok, %League{} = league} = Repo.insert(@valid_attrs)
      assert league.name == "CBLOL"
      assert league.image == "cblol.jpg"
      assert league.game.name == "League of Legends"
      assert league.game.image == "lol.jpg"
      league = Ecto.Changeset.change league, name: "Testando"
      assert {:ok, %League{} = league} = Repo.update(league)
      assert league.name == "Testando"
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
