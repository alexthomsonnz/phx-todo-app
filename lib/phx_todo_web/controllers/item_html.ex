defmodule PhxTodoWeb.ItemHTML do
  use PhxTodoWeb, :html

  embed_templates "item_html/*"

  def complete(item) do
    case item.status do
      1 -> "completed"
      _ -> "" # empty string means empty class so no style applied
    end
  end

  # returns integer value of items where item.status == 0 (not "done")
  def remaining_items(items) do
    Enum.filter(items, fn i -> i.status == 0 end) |> Enum.count
  end

  def filter(items, str) do
    case str do
      "items" -> Enum.filter(items, fn i -> i.status !== 2 end)
      "active" -> Enum.filter(items, fn i -> i.status == 0 end)
      "completed" -> Enum.filter(items, fn i -> i.status == 1 end)
      _ -> Enum.filter(items, fn i -> i.status !== 2 end)
    end
  end

  # @doc """
  # Renders a item form.
  # """
  # attr :changeset, Ecto.Changeset, required: true
  # attr :action, :string, required: true

  # def item_form(assigns)
end
