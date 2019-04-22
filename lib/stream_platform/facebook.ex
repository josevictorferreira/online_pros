defmodule StreamPlatform.Facebook do
  @moduledoc """
  Provides Facebook streaming platform functions.
  """

  @doc """
  Check if a given player is streaming right now.
  """
  def player_stream(player) do
    body = HTTPoison.get!(get_url(player), [], params: %{access_token: access_token()}).body
    Jason.decode!(body)
  end

  defp get_url(player) do
    "#{base_uri()}/v3.2/#{player}/"
  end

  defp access_token do
    Application.get_env(:online_pros, :facebook_access_token)
  end

  defp base_uri do
    "https://graph.facebook.com"
  end
end
