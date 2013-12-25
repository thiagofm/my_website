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

  put "/:id" do
    post = Repository.get Post, conn.params[:id]

    post = post.title(conn.params[:title])
    post = post.comment(conn.params[:comment])

    Repository.update(post)

    conn.resp 204, ""
  end

  delete "/:id" do
    post = Repository.get Post, conn.params[:id]

    Repository.delete(post)

    conn.resp 204, ""
  end
end
