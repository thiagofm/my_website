defmodule PostsRouterTest do
  use MyWebsite.TestCase
  use Dynamo.HTTP.Case

  @endpoint PostsRouter

  setup do
    # remove all posts
    Repository.delete_all(Post)
    :ok
  end

  test "it loads posts" do
    # Create post
    post = Post.new(title: "Hello", comment: "World")
    Repository.create(post)

    # Make req
    conn = get("/")

    # Respose is right?
    parsedJson = JSON.parse(conn.resp_body)
    assert Enum.at(parsedJson, 0)["comment"] == "World"
    assert Enum.at(parsedJson, 0)["title"] == "Hello"
    assert conn.status == 200
  end

  test "it creates posts" do
    # Make req
    conn = Dynamo.Connection.Test.new(:POST, "/", "title=Foo&comment=Bar")
    conn = PostsRouter.service(conn)

    # Response is right?
    assert conn.status == 201
    assert conn.resp_body == ""

    # Post is created
    assert Enum.at(PostQueries.all, 0)[:title] == "Foo"
    assert Enum.at(PostQueries.all, 0)[:comment] == "Bar"
  end

  test "it updates posts" do
    # Create post
    post = Post.new(title: "Hello", comment: "World")
    post = Repository.create(post)

    # Make req
    conn = Dynamo.Connection.Test.new(:PUT, "/#{post.id}", "title=Foo&comment=Bar")
    conn = PostsRouter.service(conn)

    # Response is right?
    assert conn.status == 204
    assert conn.resp_body == ""

    # Post is updated
    assert Enum.at(PostQueries.all, 0)[:title] == "Foo"
    assert Enum.at(PostQueries.all, 0)[:comment] == "Bar"
  end

  test "it deletes posts" do
    # Create post
    post = Post.new(title: "Hello", comment: "World")
    post = Repository.create(post)

    # Make req
    conn = Dynamo.Connection.Test.new(:DELETE, "/#{post.id}")
    conn = PostsRouter.service(conn)
    
    # Response is right?
    assert conn.status == 204
    assert conn.resp_body == ""

    # Post is deleted
    post = Repository.get Post, post.id
    assert post == nil
  end
end
