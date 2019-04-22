defmodule StreamPlatform.Nimo do
  @moduledoc """
  This module helps getting streamer data from Nimo.TV
  """

  def get_content(player_id) do
    IO.puts(get_url(player_id))
    case HTTPoison.get(get_url(player_id), [], get_ssl()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp get_url(player_id) do
    "#{base_uri()}/#{player_id}"
  end

  defp base_uri do
    "https://www.nimo.tv"
  end

  defp get_ssl() do
    [ ssl: [{:versions, [:'tlsv1.2']}] ]
  end
end
