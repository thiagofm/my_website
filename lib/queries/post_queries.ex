defmodule PostQueries do
  import Ecto.Query

  def all do
    Enum.map(_all, fn(x) -> {x.id, x.title, x.comment, x.created_at, x.updated_at} end)
  end

  defp _all do
    query = from p in Post,
            select: p
    Repository.all(query)
  end
end
