defmodule OnlineProsWeb.Router do
  use OnlineProsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", OnlineProsWeb do
    pipe_through :browser

    resources "/games", GameController
    resources "/leagues", LeagueController
    resources "/teams", TeamController
    resources "/players", PlayerController
  end

  scope "/", OnlineProsWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", OnlineProsWeb do
  #   pipe_through :api
  # end
end
