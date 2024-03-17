defmodule Wallet.UnprocessableEntityException do
  defexception [:message, plug_status: :unprocessable_entity]
end
