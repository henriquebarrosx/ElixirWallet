defmodule Wallet.PaymentCategoriesContext do
  require Logger

  alias Wallet.BadRequestException
  alias Wallet.PaymentCategoriesRepo

  def get_all, do: PaymentCategoriesRepo.all()

  def get_by_id(id), do: PaymentCategoriesRepo.get_by_id(id)

  def create(params) do
    case PaymentCategoriesRepo.save(params) do
      {:ok, category} ->
        {:ok, category}

      {:error, %Ecto.Changeset{} = changeset} ->
        raise(BadRequestException, "#{serialize_changeset_errors(changeset)}")
    end
  end

  def update(id, params) do
    with(
      {:ok, category} <- PaymentCategoriesRepo.get_by_id(id),
      {:ok, category} <- PaymentCategoriesRepo.update(category, params)
    ) do
      {:ok, category}
    else
      {:error, %Ecto.Changeset{} = changeset} ->
        raise(BadRequestException, "#{serialize_changeset_errors(changeset)}")
    end
  end

  def delete(id) do
    with {:ok, category} <- PaymentCategoriesRepo.get_by_id(id) do
      PaymentCategoriesRepo.delete(category)
    end
  end

  defp serialize_changeset_errors(changeset) do
    Enum.map(changeset.errors, fn {key, {msg, _}} -> "#{key}: #{msg}" end)
  end
end
