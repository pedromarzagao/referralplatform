require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'emails.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  user = User.new
  user.firstname = row['firstname']
  user.email = row['email']
  user.save
  puts "#{user.firstname}, #{user.email} saved"
end

puts "There are now #{User.count} rows in the users table"
