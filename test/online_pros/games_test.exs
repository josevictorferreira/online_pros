defmodule OnlinePros.GamesTest do
  use OnlinePros.DataCase
  alias OnlinePros.Game
  alias OnlinePros.Repo

  describe "games" do
    @valid_attrs %Game{name: "League of Legends", image: "teste.jpg"}
    @invalid_attrs %Game{name: nil, image: nil}
    @invalid_attrs_2 %Game{name: "League", image: nil}
    @invalid_attrs_3 %Game{name: nil, image: "cs.jpg"}

    test "With valid data creates and updates a Game" do
      assert {:ok, %Game{} = game} = Repo.insert(@valid_attrs)
      assert game.name == "League of Legends"
      assert game.image == "teste.jpg"
      game = Ecto.Changeset.change game, name: "Counter Strike", image: "cs.jpg"
      assert {:ok, %Game{} = game} = Repo.update(game)
      assert game.name == "Counter Strike"
      assert game.image == "cs.jpg"
    end
  end

  test "Insert with invalid attrs must return error" do
    assert_raise Postgrex.Error, fn ->
      Repo.insert(@invalid_attrs)
    end
    assert_raise Postgrex.Error, fn ->
      Repo.insert(@invalid_attrs_2)
    end
    assert_raise Postgrex.Error, fn ->
      Repo.insert(@invalid_attrs_3)
    end
  end
end
