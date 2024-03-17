defmodule WalletWeb.PaymentCategoriesController do
  use WalletWeb, :controller
  alias Wallet.PaymentCategoriesContext

  def index(conn, _params) do
    with {:ok, categories} <- PaymentCategoriesContext.get_all() do
      conn |> put_status(:ok) |> render(:index, categories: categories)
    end
  end

  def show(conn, %{"id" => id}) when not is_nil(id) do
    with {:ok, category} <- PaymentCategoriesContext.get_by_id(id) do
      conn |> put_status(:ok) |> render(:show, category: category)
    end
  end

  def create(conn, params) do
    with {:ok, category} <- PaymentCategoriesContext.create(params) do
      conn |> put_status(:created) |> render(:new, category: category)
    end
  end

  def update(conn, %{"id" => id} = params) when not is_nil(id) do
    with {:ok, category} <- PaymentCategoriesContext.update(id, params) do
      conn |> put_status(:ok) |> render(:show, category: category)
    end
  end

  def delete(conn, %{"id" => id}) when not is_nil(id) do
    with {:ok, _} <- PaymentCategoriesContext.delete(id) do
      send_resp(conn, :no_content, "")
    end
  end
end
