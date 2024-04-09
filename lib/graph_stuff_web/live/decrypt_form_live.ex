defmodule GraphStuffWeb.DecryptFormLive do
  alias GraphStuff.Decrypter
  use GraphStuffWeb, :live_view

  def render(assigns) do
    ~H"""
    <.simple_form id="decrypt_form" for={@form} phx-change="validate" phx-submit="submit">
      <.input field={@form[:jwe_input]} type="textarea" label="Input JWE to decrypt" />
      <.input field={@form[:enc_key_input]} type="textarea" label="Input Encryption Key" />
      <.input field={@form[:output]} type="textarea" label="Decrypted JWE" disabled />


      <:actions>
        <.button>Submit</.button>
      </:actions>
    </.simple_form>

    """
  end

  def mount(_params, _session, socket) do
    form_fields = %{"jwe_input" => "", "enc_key_input" => "", "output" => ""}
    {:ok, assign(socket, :form, to_form(form_fields))}
  end

  def handle_event("submit", form = %{"jwe_input" => jwe, "enc_key_input" => enc_key}, socket) do
    form_fields = Map.put(form, "output", Decrypter.decrypt_jwe(jwe, enc_key))
    {:noreply, assign(socket, :form, to_form(form_fields))}
  end

  def handle_event("validate", _unsigned_params, socket) do
    {:noreply, socket}
  end
end
