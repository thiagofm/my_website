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
    parsedJson = JSON.parse(conn.resp_body)
    assert Enum.at(parsedJson, 0)["comment"] == "World"
    assert Enum.at(parsedJson, 0)["title"] == "Hello"
    assert conn.status == 200
  end

  test "it creates posts" do
    conn = Dynamo.Connection.Test.new(:POST, "/", "key1=value1&key2=value2")
    conn = process(PostsRouter, conn, :POST, "/")
    assert conn.resp_body == ""
    assert conn.status == 201
  end
end
