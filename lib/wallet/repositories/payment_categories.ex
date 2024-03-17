defmodule Wallet.PaymentCategoriesRepo do
  alias Wallet.Repo
  alias Wallet.NotFoundException
  alias Wallet.Schema.PaymentCategory

  def all do
    {:ok, Repo.all(PaymentCategory)}
  end

  def get_by_id(id) do
    case Repo.get(PaymentCategory, id) do
      nil -> raise NotFoundException, "Category not found"
      category -> {:ok, category}
    end
  end

  def save(params) do
    %PaymentCategory{}
    |> PaymentCategory.changeset(params)
    |> Repo.insert()
  end

  def update(model, params) do
    model
    |> PaymentCategory.changeset(params)
    |> Repo.update()
  end

  def delete(model) do
    IO.inspect(model)

    model
    |> Repo.delete()
  end
end
