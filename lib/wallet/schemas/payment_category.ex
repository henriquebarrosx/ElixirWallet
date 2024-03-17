defmodule Wallet.Schema.PaymentCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payment_categories" do
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(payment_category, attrs) do
    payment_category
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
