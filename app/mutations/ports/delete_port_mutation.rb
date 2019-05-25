class DeletePortMutation < Mutations::Command
  required do
    string :id
  end

  def execute
    port = Port.find(inputs[:id])
    port.destroy!
  end
end
