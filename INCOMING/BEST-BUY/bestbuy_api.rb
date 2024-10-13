require 'httparty'
require 'json'

module BestBuyAPI
  def self.fetch_products(api_key, category_id, page_number, page_size)
    base_url = 'https://api.bestbuy.com/v1/products'
    path = "#{base_url}((categoryPath.id=#{category_id}))"
    query_params = {
      'apiKey' => api_key,
      'sort' => 'name.asc',
      'show' => 'name,image,regularPrice,salePrice,upc,onlineAvailability,manufacturer,addToCartUrl',
      'format' => 'json',
      'page' => page_number,
      'pageSize' => page_size
    }

    response = HTTParty.get(path, query: query_params)
    if response.success?
      JSON.parse(response.body)
    else
      nil
    end
  end
end
