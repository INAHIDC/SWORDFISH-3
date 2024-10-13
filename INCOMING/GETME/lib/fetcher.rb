# fetcher.rb
require 'json'

def fetch_headphone_products(filename)
  base_url = 'https://api.bestbuy.com/v1/products((search=mp3)&freeShipping=true&inStoreAvailability=true)'
  api_key = 
  params = {
    "apiKey"   => api_key,
    "sort"     => "upc.asc",
    "show"     => "name,upc,regularPrice,salePrice,onlineAvailability,image",
    "format"   => "json",
    "pageSize" => 100,  # Adjust as necessary
    "page"     => 1
  }
  products = []

  loop do
    url = build_url(base_url, params)
    response = get_response(url)
    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      products.concat(data["products"] || [])
      break if params['page'] * params['pageSize'] >= data['total']
      params['page'] += 1
    else
      puts "Failed to fetch products, status code: #{response.code}"
      break
    end
  end

  write_to_csv(filename, products)
  puts "CSV file has been created with #{products.length} products."
end
