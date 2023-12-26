defmodule GenserverAplication do
  use GenServer

  def init(state), do: {:ok, state}

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def handle_call(:items, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:retirar, _, []), do: {:reply, nil, []}

  def handle_call(:retirar, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_cast({:adicionar, value}, state) do
    {:noreply, state ++ [value]}
  end

  ### public funtions

  def mostrar(), do: GenServer.call(__MODULE__, :items)
  def retirar(), do: GenServer.call(__MODULE__, :retirar)
  def adicionar(value), do: GenServer.cast(__MODULE__, {:adicionar, value})
end
