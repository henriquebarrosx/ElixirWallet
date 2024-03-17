defmodule Wallet.NotFoundException do
  defexception [:message, plug_status: :not_found]
end
