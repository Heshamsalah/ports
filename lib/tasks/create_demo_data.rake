task create_demo_data: :environment do
  user = FactoryBot.create(:user, password: '123456789')

  puts 'Created user with the following credentials:'
  puts '============================================'
  puts "Email: #{user.email}"
  puts 'Password: 123456789'
  puts '============================================'

  ports = FactoryBot.create_list(:port, 3)
  puts 'Created 3 ports with the following data:'
  puts '============================================'
  ports.each do |port|
    awesome_print port.attributes
  end
  puts '============================================'

  file = File.open('spec/fixtures/files/small_test.csv', 'r')
  puts 'The following is a base64 encoded csv file for testing:'
  puts '============================================'
  puts Base64.encode64(file.read)
end
