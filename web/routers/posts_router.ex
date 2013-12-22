defmodule PostsRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
  end

  get "/" do
    conn.resp 200, JSON.generate []
  end
end
