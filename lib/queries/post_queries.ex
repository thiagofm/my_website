defmodule PostQueries do
  import Ecto.Query

  def all do
    Enum.map(_all, fn(x) -> [id: x.id, title: x.title, comment: x.comment, created_at: x.created_at, updated_at: x.updated_at] end)
  end

  defp _all do
    query = from p in Post,
            select: p
    Repository.all(query)
  end
end
