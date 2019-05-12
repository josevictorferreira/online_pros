defmodule OnlinePros.EsportsTest do
  use OnlinePros.DataCase

  alias OnlinePros.Esports

  describe "games" do
    alias OnlinePros.Esports.Game

    @valid_attrs %{image: "some image", name: "some name"}
    @update_attrs %{image: "some updated image", name: "some updated name"}
    @invalid_attrs %{image: nil, name: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Esports.create_game()

      game
    end

    test "paginate_games/1 returns paginated list of games" do
      for _ <- 1..20 do
        game_fixture()
      end

      {:ok, %{games: games} = page} = Esports.paginate_games(%{})

      assert length(games) == 15
      assert page.page_number == 1
      assert page.page_size == 15
      assert page.total_pages == 2
      assert page.total_entries == 20
      assert page.distance == 5
      assert page.sort_field == "inserted_at"
      assert page.sort_direction == "desc"
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Esports.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Esports.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Esports.create_game(@valid_attrs)
      assert game.image == "some image"
      assert game.name == "some name"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Esports.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, game} = Esports.update_game(game, @update_attrs)
      assert %Game{} = game
      assert game.image == "some updated image"
      assert game.name == "some updated name"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Esports.update_game(game, @invalid_attrs)
      assert game == Esports.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Esports.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Esports.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Esports.change_game(game)
    end
  end

  describe "leagues" do
    alias OnlinePros.Esports.League

    @valid_attrs %{image: "some image", name: "some name"}
    @update_attrs %{image: "some updated image", name: "some updated name"}
    @invalid_attrs %{image: nil, name: nil}

    def league_fixture(attrs \\ %{}) do
      {:ok, league} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Esports.create_league()

      league
    end

    test "paginate_leagues/1 returns paginated list of leagues" do
      for _ <- 1..20 do
        league_fixture()
      end

      {:ok, %{leagues: leagues} = page} = Esports.paginate_leagues(%{})

      assert length(leagues) == 15
      assert page.page_number == 1
      assert page.page_size == 15
      assert page.total_pages == 2
      assert page.total_entries == 20
      assert page.distance == 5
      assert page.sort_field == "inserted_at"
      assert page.sort_direction == "desc"
    end

    test "list_leagues/0 returns all leagues" do
      league = league_fixture()
      assert Esports.list_leagues() == [league]
    end

    test "get_league!/1 returns the league with given id" do
      league = league_fixture()
      assert Esports.get_league!(league.id) == league
    end

    test "create_league/1 with valid data creates a league" do
      assert {:ok, %League{} = league} = Esports.create_league(@valid_attrs)
      assert league.image == "some image"
      assert league.name == "some name"
    end

    test "create_league/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Esports.create_league(@invalid_attrs)
    end

    test "update_league/2 with valid data updates the league" do
      league = league_fixture()
      assert {:ok, league} = Esports.update_league(league, @update_attrs)
      assert %League{} = league
      assert league.image == "some updated image"
      assert league.name == "some updated name"
    end

    test "update_league/2 with invalid data returns error changeset" do
      league = league_fixture()
      assert {:error, %Ecto.Changeset{}} = Esports.update_league(league, @invalid_attrs)
      assert league == Esports.get_league!(league.id)
    end

    test "delete_league/1 deletes the league" do
      league = league_fixture()
      assert {:ok, %League{}} = Esports.delete_league(league)
      assert_raise Ecto.NoResultsError, fn -> Esports.get_league!(league.id) end
    end

    test "change_league/1 returns a league changeset" do
      league = league_fixture()
      assert %Ecto.Changeset{} = Esports.change_league(league)
    end
  end

  describe "teams" do
    alias OnlinePros.Esports.Team

    @valid_attrs %{image: "some image", name: "some name"}
    @update_attrs %{image: "some updated image", name: "some updated name"}
    @invalid_attrs %{image: nil, name: nil}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Esports.create_team()

      team
    end

    test "paginate_teams/1 returns paginated list of teams" do
      for _ <- 1..20 do
        team_fixture()
      end

      {:ok, %{teams: teams} = page} = Esports.paginate_teams(%{})

      assert length(teams) == 15
      assert page.page_number == 1
      assert page.page_size == 15
      assert page.total_pages == 2
      assert page.total_entries == 20
      assert page.distance == 5
      assert page.sort_field == "inserted_at"
      assert page.sort_direction == "desc"
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Esports.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Esports.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Esports.create_team(@valid_attrs)
      assert team.image == "some image"
      assert team.name == "some name"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Esports.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, team} = Esports.update_team(team, @update_attrs)
      assert %Team{} = team
      assert team.image == "some updated image"
      assert team.name == "some updated name"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Esports.update_team(team, @invalid_attrs)
      assert team == Esports.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Esports.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Esports.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Esports.change_team(team)
    end
  end

  describe "players" do
    alias OnlinePros.Esports.Player

    @valid_attrs %{image: "some image", is_online: true, name: "some name", nationality: "some nationality", platform: "some platform", position: "some position", stream: "some stream"}
    @update_attrs %{image: "some updated image", is_online: false, name: "some updated name", nationality: "some updated nationality", platform: "some updated platform", position: "some updated position", stream: "some updated stream"}
    @invalid_attrs %{image: nil, is_online: nil, name: nil, nationality: nil, platform: nil, position: nil, stream: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Esports.create_player()

      player
    end

    test "paginate_players/1 returns paginated list of players" do
      for _ <- 1..20 do
        player_fixture()
      end

      {:ok, %{players: players} = page} = Esports.paginate_players(%{})

      assert length(players) == 15
      assert page.page_number == 1
      assert page.page_size == 15
      assert page.total_pages == 2
      assert page.total_entries == 20
      assert page.distance == 5
      assert page.sort_field == "inserted_at"
      assert page.sort_direction == "desc"
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Esports.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Esports.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Esports.create_player(@valid_attrs)
      assert player.image == "some image"
      assert player.is_online == true
      assert player.name == "some name"
      assert player.nationality == "some nationality"
      assert player.platform == "some platform"
      assert player.position == "some position"
      assert player.stream == "some stream"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Esports.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, player} = Esports.update_player(player, @update_attrs)
      assert %Player{} = player
      assert player.image == "some updated image"
      assert player.is_online == false
      assert player.name == "some updated name"
      assert player.nationality == "some updated nationality"
      assert player.platform == "some updated platform"
      assert player.position == "some updated position"
      assert player.stream == "some updated stream"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Esports.update_player(player, @invalid_attrs)
      assert player == Esports.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Esports.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Esports.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Esports.change_player(player)
    end
  end
end
