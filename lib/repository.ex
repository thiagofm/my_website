defmodule Repository do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url, do: "ecto://horo@localhost/my_website_development"
end
