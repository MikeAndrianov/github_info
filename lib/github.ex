defmodule Github do
  use HTTPoison.Base

  @api_url "https://api.github.com"

  def process_url(url) do
    @api_url <> url
  end

  def stars(repo_name) do
    case get_repo_info(repo_name) do
      {:ok, %{"stargazers_count" => stars_count}} ->
        {:ok, stars_count}

      error ->
        error
    end
  end

  defp get_repo_info(repo_name) do
    case __MODULE__.get!("/repos" <> repo_name) do
      %HTTPoison.Response{status_code: 200, body: body} ->
        {:ok, Poison.decode!(body)}

      _ ->
        {:error, "repo is private"}
    end
  end
end
