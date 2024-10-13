require_relative 'bestbuy_api'
require_relative 'database'

api_key = ENV['BESTBUY_API_KEY'] || ''
category_id = 'abcat0502000'
page_number = '33'
page_size = '33'

data = BestBuyAPI.fetch_products(api_key, category_id, page_number, page_size)

if data
  Database.setup
  Database.save_products(data['products'])
end
