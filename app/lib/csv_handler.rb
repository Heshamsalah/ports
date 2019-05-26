require 'csv'

class CsvHandler
  def initialize(base64_string)
    @base64_string = base64_string
    @csv_rows = parse
  end

  def parse
    decoded_string = Base64.decode64(@base64_string)
    CSV.new(
      decoded_string.encode!('utf-8', 'utf-8', invalid: :replace),
      headers: true,
      header_converters: :symbol
    )
  end

  def rows
    @csv_rows
  end
end
