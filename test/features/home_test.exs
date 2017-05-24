defmodule Blog.Features.HomeTest do
  use Blog.FeatureCase, async: true

  @title Query.css("header")
  @home_path page_path(Endpoint, :index)

  test "user visits home page", %{session: session} do
    title = session
            |> visit(@home_path)
            |> find(@title)
            |> Element.text

    assert title == "Welcome to Code4Share"
  end
end
