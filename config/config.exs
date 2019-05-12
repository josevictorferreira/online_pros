# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :online_pros,
  ecto_repos: [OnlinePros.Repo],
  twitch_client_id: System.get_env("TWITCH_CLIENT_ID"),
  facebook_access_token: System.get_env("FACEBOOK_ACCESS_TOKEN")

config :online_pros, OnlinePros.Repo,
  adapter: Ecto.Adaoters.Postgres,
  username: System.get_env("PGUSER"),
  password: System.get_env("PGPASSWORD"),
  database: System.get_env("PGDATABASE"),
  hostname: System.get_env("PGHOST"),
  port: System.get_env("PGPORT") |> String.to_integer,
  pool_size: System.get_env("PGPOOL") |> String.to_integer

# Configures the endpoint
config :online_pros, OnlineProsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "T+ftWEM7j3WTcYce1Im8bI9YmLbXgbsY/MMPif4OddOHwXrxU2wS1/ngM9Ad4/bA",
  render_errors: [view: OnlineProsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OnlinePros.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :torch,
  otp_app: :online_pros,
  template_format: "eex" || "slim"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
