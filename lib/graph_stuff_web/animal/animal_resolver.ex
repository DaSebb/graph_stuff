defmodule GraphStuffWeb.Animal.AnimalResolver do
  alias GraphStuff.Animals

  def all_animals(_root, _args, _info) do
    {:ok, Animals.list_animals()}
  end
end
