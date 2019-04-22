defmodule StreamPlatform.Cube do
  @moduledoc """
  This module is responsible with scriping Cube.TV streamer data.
  """

  @doc """
  This function returns the information if a player is online or not.
  """
  def is_online?(player_id) do
    data = player_stream(player_id)["data"]
    is_online(data)
  end

  @doc """
  This function is responsible for getting the user data from Cube.TV
  """
  def player_stream(player_id) do
    body = HTTPoison.get!(get_url(player_id)).body
    Jason.decode!(body)
  end

  defp is_online(data) do
    if data["gameId"] == "" do
      false
    else
      true
    end
  end

  defp get_url(player_id) do
    "#{base_uri()}?cube_id=#{player_id}"
  end

  defp base_uri do
    'https://www.cube.tv/studio/info'
  end
end
