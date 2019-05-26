task :convert_csv_to_base64, [:file_path] => [:environment] do |_, args|
  path = args[:file_path]

  file = File.open(path, 'r')
  puts 'The following is a base64 encoded csv file for testing:'
  puts '============================================'
  puts Base64.encode64(file.read)
end
