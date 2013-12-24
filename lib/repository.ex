defmodule Repository do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url, do: "ecto://horo@localhost/my_website_#{Mix.env}"
end
