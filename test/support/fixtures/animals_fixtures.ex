defmodule GraphStuff.AnimalsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GraphStuff.Animals` context.
  """

  @doc """
  Generate a animal.
  """
  def animal_fixture(attrs \\ %{}) do
    {:ok, animal} =
      attrs
      |> Enum.into(%{
        alive: true,
        name: "some name",
        number_of_legs: 42
      })
      |> GraphStuff.Animals.create_animal()

    animal
  end
end
