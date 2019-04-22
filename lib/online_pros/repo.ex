defmodule OnlinePros.Repo do
  use Ecto.Repo,
    otp_app: :online_pros,
    adapter: Ecto.Adapters.Postgres
end
