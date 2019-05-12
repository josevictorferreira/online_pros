defmodule OnlinePros.Esports do
  @moduledoc """
  The Esports context.
  """

  import Ecto.Query, warn: false
  alias OnlinePros.Repo
import Torch.Helpers, only: [sort: 1, paginate: 4]
import Filtrex.Type.Config

alias OnlinePros.Esports.Game

@pagination [page_size: 15]
@pagination_distance 5

@doc """
Paginate the list of games using filtrex
filters.

## Examples

    iex> list_games(%{})
    %{games: [%Game{}], ...}
"""
@spec paginate_games(map) :: {:ok, map} | {:error, any}
def paginate_games(params \\ %{}) do
  params =
    params
    |> Map.put_new("sort_direction", "desc")
    |> Map.put_new("sort_field", "inserted_at")

  {:ok, sort_direction} = Map.fetch(params, "sort_direction")
  {:ok, sort_field} = Map.fetch(params, "sort_field")

  with {:ok, filter} <- Filtrex.parse_params(filter_config(:games), params["game"] || %{}),
       %Scrivener.Page{} = page <- do_paginate_games(filter, params) do
    {:ok,
      %{
        games: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries,
        distance: @pagination_distance,
        sort_field: sort_field,
        sort_direction: sort_direction
      }
    }
  else
    {:error, error} -> {:error, error}
    error -> {:error, error}
  end
end

defp do_paginate_games(filter, params) do
  Game
  |> Filtrex.query(filter)
  |> order_by(^sort(params))
  |> paginate(Repo, params, @pagination)
end

@doc """
Returns the list of games.

## Examples

    iex> list_games()
    [%Game{}, ...]

"""
def list_games do
  Repo.all(Game)
end

@doc """
Gets a single game.

Raises `Ecto.NoResultsError` if the Game does not exist.

## Examples

    iex> get_game!(123)
    %Game{}

    iex> get_game!(456)
    ** (Ecto.NoResultsError)

"""
def get_game!(id), do: Repo.get!(Game, id)

@doc """
Creates a game.

## Examples

    iex> create_game(%{field: value})
    {:ok, %Game{}}

    iex> create_game(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def create_game(attrs \\ %{}) do
  %Game{}
  |> Game.changeset(attrs)
  |> Repo.insert()
end

@doc """
Updates a game.

## Examples

    iex> update_game(game, %{field: new_value})
    {:ok, %Game{}}

    iex> update_game(game, %{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def update_game(%Game{} = game, attrs) do
  game
  |> Game.changeset(attrs)
  |> Repo.update()
end

@doc """
Deletes a Game.

## Examples

    iex> delete_game(game)
    {:ok, %Game{}}

    iex> delete_game(game)
    {:error, %Ecto.Changeset{}}

"""
def delete_game(%Game{} = game) do
  Repo.delete(game)
end

@doc """
Returns an `%Ecto.Changeset{}` for tracking game changes.

## Examples

    iex> change_game(game)
    %Ecto.Changeset{source: %Game{}}

"""
def change_game(%Game{} = game) do
  Game.changeset(game, %{})
end

defp filter_config(:games) do
  defconfig do
    text :image
      text :name
      
  end
end
import Torch.Helpers, only: [sort: 1, paginate: 4]
import Filtrex.Type.Config

alias OnlinePros.Esports.League

@pagination [page_size: 15]
@pagination_distance 5

@doc """
Paginate the list of leagues using filtrex
filters.

## Examples

    iex> list_leagues(%{})
    %{leagues: [%League{}], ...}
"""
@spec paginate_leagues(map) :: {:ok, map} | {:error, any}
def paginate_leagues(params \\ %{}) do
  params =
    params
    |> Map.put_new("sort_direction", "desc")
    |> Map.put_new("sort_field", "inserted_at")

  {:ok, sort_direction} = Map.fetch(params, "sort_direction")
  {:ok, sort_field} = Map.fetch(params, "sort_field")

  with {:ok, filter} <- Filtrex.parse_params(filter_config(:leagues), params["league"] || %{}),
       %Scrivener.Page{} = page <- do_paginate_leagues(filter, params) do
    {:ok,
      %{
        leagues: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries,
        distance: @pagination_distance,
        sort_field: sort_field,
        sort_direction: sort_direction
      }
    }
  else
    {:error, error} -> {:error, error}
    error -> {:error, error}
  end
end

defp do_paginate_leagues(filter, params) do
  League
  |> Filtrex.query(filter)
  |> order_by(^sort(params))
  |> paginate(Repo, params, @pagination)
end

@doc """
Returns the list of leagues.

## Examples

    iex> list_leagues()
    [%League{}, ...]

"""
def list_leagues do
  Repo.all(League)
end

@doc """
Gets a single league.

Raises `Ecto.NoResultsError` if the League does not exist.

## Examples

    iex> get_league!(123)
    %League{}

    iex> get_league!(456)
    ** (Ecto.NoResultsError)

"""
def get_league!(id), do: Repo.get!(League, id)

@doc """
Creates a league.

## Examples

    iex> create_league(%{field: value})
    {:ok, %League{}}

    iex> create_league(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def create_league(attrs \\ %{}) do
  %League{}
  |> League.changeset(attrs)
  |> Repo.insert()
end

@doc """
Updates a league.

## Examples

    iex> update_league(league, %{field: new_value})
    {:ok, %League{}}

    iex> update_league(league, %{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def update_league(%League{} = league, attrs) do
  league
  |> League.changeset(attrs)
  |> Repo.update()
end

@doc """
Deletes a League.

## Examples

    iex> delete_league(league)
    {:ok, %League{}}

    iex> delete_league(league)
    {:error, %Ecto.Changeset{}}

"""
def delete_league(%League{} = league) do
  Repo.delete(league)
end

@doc """
Returns an `%Ecto.Changeset{}` for tracking league changes.

## Examples

    iex> change_league(league)
    %Ecto.Changeset{source: %League{}}

"""
def change_league(%League{} = league) do
  League.changeset(league, %{})
end

defp filter_config(:leagues) do
  defconfig do
    text :name
      text :image
      
  end
end
import Torch.Helpers, only: [sort: 1, paginate: 4]
import Filtrex.Type.Config

alias OnlinePros.Esports.Team

@pagination [page_size: 15]
@pagination_distance 5

@doc """
Paginate the list of teams using filtrex
filters.

## Examples

    iex> list_teams(%{})
    %{teams: [%Team{}], ...}
"""
@spec paginate_teams(map) :: {:ok, map} | {:error, any}
def paginate_teams(params \\ %{}) do
  params =
    params
    |> Map.put_new("sort_direction", "desc")
    |> Map.put_new("sort_field", "inserted_at")

  {:ok, sort_direction} = Map.fetch(params, "sort_direction")
  {:ok, sort_field} = Map.fetch(params, "sort_field")

  with {:ok, filter} <- Filtrex.parse_params(filter_config(:teams), params["team"] || %{}),
       %Scrivener.Page{} = page <- do_paginate_teams(filter, params) do
    {:ok,
      %{
        teams: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries,
        distance: @pagination_distance,
        sort_field: sort_field,
        sort_direction: sort_direction
      }
    }
  else
    {:error, error} -> {:error, error}
    error -> {:error, error}
  end
end

defp do_paginate_teams(filter, params) do
  Team
  |> Filtrex.query(filter)
  |> order_by(^sort(params))
  |> paginate(Repo, params, @pagination)
end

@doc """
Returns the list of teams.

## Examples

    iex> list_teams()
    [%Team{}, ...]

"""
def list_teams do
  Repo.all(Team)
end

@doc """
Gets a single team.

Raises `Ecto.NoResultsError` if the Team does not exist.

## Examples

    iex> get_team!(123)
    %Team{}

    iex> get_team!(456)
    ** (Ecto.NoResultsError)

"""
def get_team!(id), do: Repo.get!(Team, id)

@doc """
Creates a team.

## Examples

    iex> create_team(%{field: value})
    {:ok, %Team{}}

    iex> create_team(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def create_team(attrs \\ %{}) do
  %Team{}
  |> Team.changeset(attrs)
  |> Repo.insert()
end

@doc """
Updates a team.

## Examples

    iex> update_team(team, %{field: new_value})
    {:ok, %Team{}}

    iex> update_team(team, %{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def update_team(%Team{} = team, attrs) do
  team
  |> Team.changeset(attrs)
  |> Repo.update()
end

@doc """
Deletes a Team.

## Examples

    iex> delete_team(team)
    {:ok, %Team{}}

    iex> delete_team(team)
    {:error, %Ecto.Changeset{}}

"""
def delete_team(%Team{} = team) do
  Repo.delete(team)
end

@doc """
Returns an `%Ecto.Changeset{}` for tracking team changes.

## Examples

    iex> change_team(team)
    %Ecto.Changeset{source: %Team{}}

"""
def change_team(%Team{} = team) do
  Team.changeset(team, %{})
end

defp filter_config(:teams) do
  defconfig do
    text :name
      text :image
      
  end
end
import Torch.Helpers, only: [sort: 1, paginate: 4]
import Filtrex.Type.Config

alias OnlinePros.Esports.Player

@pagination [page_size: 15]
@pagination_distance 5

@doc """
Paginate the list of players using filtrex
filters.

## Examples

    iex> list_players(%{})
    %{players: [%Player{}], ...}
"""
@spec paginate_players(map) :: {:ok, map} | {:error, any}
def paginate_players(params \\ %{}) do
  params =
    params
    |> Map.put_new("sort_direction", "desc")
    |> Map.put_new("sort_field", "inserted_at")

  {:ok, sort_direction} = Map.fetch(params, "sort_direction")
  {:ok, sort_field} = Map.fetch(params, "sort_field")

  with {:ok, filter} <- Filtrex.parse_params(filter_config(:players), params["player"] || %{}),
       %Scrivener.Page{} = page <- do_paginate_players(filter, params) do
    {:ok,
      %{
        players: page.entries,
        page_number: page.page_number,
        page_size: page.page_size,
        total_pages: page.total_pages,
        total_entries: page.total_entries,
        distance: @pagination_distance,
        sort_field: sort_field,
        sort_direction: sort_direction
      }
    }
  else
    {:error, error} -> {:error, error}
    error -> {:error, error}
  end
end

defp do_paginate_players(filter, params) do
  Player
  |> Filtrex.query(filter)
  |> order_by(^sort(params))
  |> paginate(Repo, params, @pagination)
end

@doc """
Returns the list of players.

## Examples

    iex> list_players()
    [%Player{}, ...]

"""
def list_players do
  Repo.all(Player)
end

@doc """
Gets a single player.

Raises `Ecto.NoResultsError` if the Player does not exist.

## Examples

    iex> get_player!(123)
    %Player{}

    iex> get_player!(456)
    ** (Ecto.NoResultsError)

"""
def get_player!(id), do: Repo.get!(Player, id)

@doc """
Creates a player.

## Examples

    iex> create_player(%{field: value})
    {:ok, %Player{}}

    iex> create_player(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def create_player(attrs \\ %{}) do
  %Player{}
  |> Player.changeset(attrs)
  |> Repo.insert()
end

@doc """
Updates a player.

## Examples

    iex> update_player(player, %{field: new_value})
    {:ok, %Player{}}

    iex> update_player(player, %{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def update_player(%Player{} = player, attrs) do
  player
  |> Player.changeset(attrs)
  |> Repo.update()
end

@doc """
Deletes a Player.

## Examples

    iex> delete_player(player)
    {:ok, %Player{}}

    iex> delete_player(player)
    {:error, %Ecto.Changeset{}}

"""
def delete_player(%Player{} = player) do
  Repo.delete(player)
end

@doc """
Returns an `%Ecto.Changeset{}` for tracking player changes.

## Examples

    iex> change_player(player)
    %Ecto.Changeset{source: %Player{}}

"""
def change_player(%Player{} = player) do
  Player.changeset(player, %{})
end

defp filter_config(:players) do
  defconfig do
    text :name
      text :image
      boolean :is_online
      text :nationality
      text :platform
      text :position
      text :stream
      
  end
end
end
