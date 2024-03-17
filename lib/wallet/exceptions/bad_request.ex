defmodule Wallet.BadRequestException do
  defexception [:message, plug_status: :bad_request]
end
