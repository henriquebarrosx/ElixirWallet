defmodule Wallet.Repo.Migrations.CreatePaymentCategories do
  use Ecto.Migration

  def change do
    create table(:payment_categories) do
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
