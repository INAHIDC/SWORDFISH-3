# main.rb
require_relative 'client'
require_relative 'fetcher'
require_relative 'csv_writer'

print "File name: "
filename = gets.chomp

fetch_headphone_products(filename)
