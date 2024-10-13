# csv_writer.rb
require 'csv'

def write_to_csv(filename, products)
  CSV.open(filename, 'w', write_headers: true, headers: ['Name', 'UPC', 'Regular Price', 'Sale Price', 'Online Availability', 'Image Link']) do |csv|
    products.each do |product|
      csv << [
        product['name'] || '',
        product['upc'] || '',
        product['regularPrice'] || '',
        product['salePrice'] || '',
        product['onlineAvailability'] ? 'Yes' : 'No',
        product['image'] || ''
      ]
    end
  end
end
