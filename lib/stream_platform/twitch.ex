defmodule StreamPlatform.Twitch do
  @moduledoc """
  Provides Twitch platform functions.
  """

  @doc """
  Checks if a given streamer is online.
  """
  def is_online?(player) do
    is_online(player_stream(player)["data"])
  end

  @doc """
  Get the streamer data from Twitch api.
  """
  def player_stream(player) do
    body = HTTPoison.get!(get_url(), get_headers(), params: get_params(player)).body
    Jason.decode!(body)
  end

  defp is_online([]), do: false
  defp is_online(nil), do: false
  defp is_online(_), do: true

  defp get_url do
    "#{base_uri()}/streams"
  end

  defp get_params(player) do
    %{user_login: player}
  end

  defp get_headers do
    ["Client-ID": get_client_id()]
  end

  defp get_client_id do
    Application.get_env(:online_pros, :twitch_client_id)
  end

  defp base_uri do
    'https://api.twitch.tv/helix'
  end
end
