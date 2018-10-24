require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'emails.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  user = User.new
  user.fullname = row['fullname']
  user.email = row['email']
  user.admin = row['admin']
  user.save
  puts "#{user.fullname}, #{user.email}, admin: #{user.admin} saved"
end

puts "There are now #{User.count} rows in the Users table"
