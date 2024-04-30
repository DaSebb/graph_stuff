defmodule GraphStuffWeb.Graph.QueryTest do
  use GraphStuffWeb.ConnCase

  test "test if ma wigger works", %{conn: conn} do
    animal = insert(:animal)

    query = """
    query {
      allAnimals{
        name
      }
    }
    """

    result = conn
    |> post("/graph", %{
      "query" => query
    })
    |> json_response(200)
    |> IO.inspect()
  end
end
