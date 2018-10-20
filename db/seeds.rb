require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'emails.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  affiliate = Affiliate.new
  affiliate.firstname = row['firstname']
  affiliate.email = row['email']
  affiliate.save
  puts "#{affiliate.firstname}, #{affiliate.email} saved"
end

puts "There are now #{Affiliate.count} rows in the affiliates table"
