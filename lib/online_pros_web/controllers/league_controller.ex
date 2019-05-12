defmodule OnlineProsWeb.LeagueController do
  use OnlineProsWeb, :controller

  alias OnlinePros.Esports
  alias OnlinePros.Esports.League

  plug(:put_layout, {OnlineProsWeb.LayoutView, "torch.html"})

  def index(conn, params) do
    case Esports.paginate_leagues(params) do
      {:ok, assigns} ->
        render(conn, "index.html", assigns)
      error ->
        conn
        |> put_flash(:error, "There was an error rendering Leagues. #{inspect(error)}")
        |> redirect(to: Routes.league_path(conn, :index))
    end
  end

  def new(conn, _params) do
    changeset = Esports.change_league(%League{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"league" => league_params}) do
    case Esports.create_league(league_params) do
      {:ok, league} ->
        conn
        |> put_flash(:info, "League created successfully.")
        |> redirect(to: Routes.league_path(conn, :show, league))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    league = Esports.get_league!(id)
    render(conn, "show.html", league: league)
  end

  def edit(conn, %{"id" => id}) do
    league = Esports.get_league!(id)
    changeset = Esports.change_league(league)
    render(conn, "edit.html", league: league, changeset: changeset)
  end

  def update(conn, %{"id" => id, "league" => league_params}) do
    league = Esports.get_league!(id)

    case Esports.update_league(league, league_params) do
      {:ok, league} ->
        conn
        |> put_flash(:info, "League updated successfully.")
        |> redirect(to: Routes.league_path(conn, :show, league))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", league: league, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    league = Esports.get_league!(id)
    {:ok, _league} = Esports.delete_league(league)

    conn
    |> put_flash(:info, "League deleted successfully.")
    |> redirect(to: Routes.league_path(conn, :index))
  end
end