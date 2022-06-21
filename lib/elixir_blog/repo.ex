defmodule ElixirBlog.Repo do
  use Ecto.Repo,
    otp_app: :elixir_blog,
    adapter: Ecto.Adapters.Postgres
end

# функции с более удобным выводом и не возвращающие nil

# возвращает единственный результат запроса
def fetch_one(query) do
  case __MODULE__.one(query) do
    nil ->
      {:error, :not_found}

    value ->
      {:ok, value}
  end
end

# поиск по id
def find(query, id) do
  case __MODULE__.get(query, id) do
    %_{} = schema ->
      {:ok, schema}

    nil ->
      {:error, :not_found}
  end
end

# поиск по условию
def find_by(query, by) do
  case __MODULE__.get_by(query, by) do
    %_{} = schema ->
      {:ok, schema}

    nil ->
      {:error, :not_found}
  end
end
