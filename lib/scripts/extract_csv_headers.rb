require 'csv'

files = ['20211101_B3D54FD000088A.csv', '20211101_B3D54FD00007B2.csv', '20211101_B3D54FD000088F.csv']

files.each do |file|
  csv_file_path = "../assets/#{file}"
  headers = CSV.open(csv_file_path, &:readline)
  puts "CSV Headers: #{headers}"
end
