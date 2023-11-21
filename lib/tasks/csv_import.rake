# lib/tasks/csv_import.rake
require 'csv'

namespace :import do
  desc "Import CSV data from multiple files"
  task import_csvs: :environment do
    files = ['20211101_B3D54FD000088A.csv', '20211101_B3D54FD00007B2.csv', '20211101_B3D54FD000088F.csv']

    files.each do |file|
      CSV.foreach(Rails.root.join('lib/assets', file), headers: true) do |row|
        attributes = row.to_hash
        attributes['timestamp'] = attributes.delete('@timestamp') # Adjust the key for Rails convention

        Csv.create!(attributes)
      end
    end
  end
end
