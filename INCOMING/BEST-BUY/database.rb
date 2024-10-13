require 'sqlite3'

module Database
  DB_NAME = 'products.db'

  def self.setup
    db = SQLite3::Database.new DB_NAME
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        image TEXT,
        regular_price REAL,
        sale_price REAL,
        upc TEXT,
        online_availability BOOLEAN,
        manufacturer TEXT,
        add_to_cart_url TEXT
      );
    SQL
    db.close
  end

  def self.save_products(products)
    db = SQLite3::Database.new DB_NAME
    products.each do |product|
      db.execute "INSERT INTO products (name, image, regular_price, sale_price, upc, online_availability, manufacturer, add_to_cart_url)
                  VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                 [
                   product['name'],
                   product['image'],
                   product['regularPrice'],
                   product['salePrice'],
                   product['upc'],
                   product['onlineAvailability'] ? 1 : 0,
                   product['manufacturer'],
                   product['addToCartUrl']
                 ]
    end
    db.close
  end
end
