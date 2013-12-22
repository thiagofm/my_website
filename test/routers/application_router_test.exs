defmodule ApplicationRouterTest do
  use MyWebsite.TestCase
  use Dynamo.HTTP.Case

  # Sometimes it may be convenient to test a specific
  # aspect of a router in isolation. For such, we just
  # need to set the @endpoint to the router under test.
  @endpoint ApplicationRouter

  test "it loads static html page" do
    conn = get("/")
    assert conn.status == 200
  end

  test "reads posts" do
    conn = get("/api/posts.json")
    assert conn.status == 200
    assert conn.resp_body == "{}"
  end
end
