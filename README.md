# Github Stars

**Accepts public repo name and returns stars count for this repo.**

## Usage

Example:
```elixir
iex -S mix

iex> Github.stars("/rails/rails")
=> {:ok, 40838}

iex> Github.stars("/private_repo/private")
=> {:error, "repo is private"}
```
