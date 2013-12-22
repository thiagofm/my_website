defmodule PostsRouterTest do
  use MyWebsite.TestCase
  use Dynamo.HTTP.Case

  @endpoint PostsRouter

  test "it loads posts" do
    conn = get("/")
    assert conn.resp_body == "{}"
    assert conn.status == 200
  end
end
