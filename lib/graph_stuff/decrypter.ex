defmodule GraphStuff.Decrypter do

  def decrypt_jwe(auth_data, encryption_key) do
    :sha256
    |> :crypto.hash(encryption_key)
    |> JOSE.JWK.from_oct()
    |> JOSE.JWE.block_decrypt(auth_data)
    |> then(fn {decrypted, _} -> Jason.Formatter.pretty_print(decrypted) end)
    |> IO.inspect()
  end
end
