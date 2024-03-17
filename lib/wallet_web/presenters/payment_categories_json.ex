defmodule WalletWeb.PaymentCategoriesJSON do
  alias Wallet.Schema.PaymentCategory

  def index(%{categories: categories}) do
    for(category <- categories, do: data(category))
  end

  def show(%{category: category}) do
    data(category)
  end

  def new(%{category: category}) do
    %{id: category.id}
  end

  defp data(%PaymentCategory{} = category) do
    %{
      id: category.id,
      title: category.title,
      created_at: category.inserted_at,
      updated_at: category.updated_at
    }
  end
end
