defmodule Makerion.PrinterPoller do
  use GenServer

  alias Makerion.Printer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    printer_source = Keyword.get(opts, :printer_source)
    Process.send_after(self(), {:poll_status}, 1_000)
    {:ok, %{printer_source: printer_source, status: nil}}
  end

  def handle_info({:poll_status}, state) do
    IO.puts "Getting printer_status"
    printer_status = Printer.get_status(state.printer_source)
    IO.inspect printer_status
    new_state = %{state | status: printer_status}
    Makerion.send_data(:printer_status, printer_status)
    Process.send_after(self(), {:poll_status}, 1_000)
    {:noreply, new_state}
  end
end