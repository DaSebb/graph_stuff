defmodule GraphStuffWeb.Schema do
  use Absinthe.Schema

  alias GraphStuffWeb.Animal.AnimalResolver

  object :animal do
    field :alive, non_null(:boolean)
    field :name, non_null(:string)
    field :number_of_legs, non_null(:integer)
  end

  query do
    @desc "Get all animals"
    field :all_animals, non_null(list_of(non_null(:animal))) do
      resolve(&AnimalResolver.all_animals/3)
    end
  end
end
