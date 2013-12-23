defmodule PostsRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
  end

  get "/" do
    # insert into post (title, comment) VALUES ('Hello world', 'Yeah!');
    IO.inspect(PostQueries.all)
    conn.resp 200, JSON.generate(PostQueries.all)
  end
end
