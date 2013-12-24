defmodule PostsRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:cookies, :params])
  end

  get "/" do
    conn.resp 200, JSON.generate(PostQueries.all)
  end

  post "/" do
    post = Post.new(title: conn.params[:title], comment: conn.params[:comment])
    Repository.create(post)

    conn.resp 201, ""
  end
end
