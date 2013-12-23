defmodule MyWebsite do
  use Application.Behaviour

  @doc """
  The application callback used to start this
  application and its Dynamos.
  """
  def start(_type, _args) do
    MyWebsite.Dynamo.start_link([max_restarts: 5, max_seconds: 5])
  end
end

defmodule MyWebsite.Sup do
  use Supervisor.Behaviour

  def start_link do
    :supervisor.start_link({ :local, __MODULE__ }, __MODULE__, [])
  end

  def init([]) do
    tree = [ worker(MyWebsite.Dynamo, []), worker(Repository, []) ]
    supervise(tree, strategy: :one_for_all)
  end
end
