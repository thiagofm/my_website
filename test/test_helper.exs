Dynamo.under_test(MyWebsite.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule MyWebsite.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
