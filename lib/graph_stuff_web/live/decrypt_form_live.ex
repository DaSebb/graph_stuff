defmodule GraphStuffWeb.DecryptFormLive do
  use GraphStuffWeb, :live_view

  def render(assigns) do
    ~H"""
    <.simple_form id="decrypt_form" for={@form} phx-change="validate" phx-submit="save">
      <.input field={@form[:jwe_input]} type="textarea" label="Input JWE to decrypt" />
      <:actions>
        <.button>Submit</.button>
      </:actions>
    </.simple_form>
    """
  end

  def mount(_params, _session, socket) do
    form_fields = %{"jwe_input" => ""}
    {:ok, assign(socket, :form, to_form(form_fields))}
  end

  def handle_event("save", _unsigned_params, socket) do
    form_fields = %{"jwe_input" => "Eyyo schreib was gscheites rein"}
    # IO.inspect(unsigned_params, label: "TEST DEBUG")
    {:noreply, assign(socket, :form, to_form(form_fields))}
  end

  def handle_event("validate", _unsigned_params, socket) do
    {:noreply, socket}
  end
end
