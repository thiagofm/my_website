defmodule MyWebsite do
  use Application.Behaviour

  @doc """
  The application callback used to start this
  application and its Dynamos.
  """
  def start(_type, _args) do
    MyWebsite.Sup.start_link
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
