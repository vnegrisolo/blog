defmodule Blog.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Blog.Repo
      alias Blog.Web.Endpoint
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import Blog.Web.Router.Helpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Blog.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Blog.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Blog.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
