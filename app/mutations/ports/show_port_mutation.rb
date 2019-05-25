class ShowPortMutation < Mutations::Command
  required do
    string :id
  end

  def execute
    Port.find(inputs[:id])
  end
end
