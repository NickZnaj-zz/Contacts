require 'rest-client'
require 'addressable'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/1.json'
# ).to_s

#
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users/5.json',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#   }
# ).to_s

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s
rescue RestClient::Exception 
  puts RestClient.post(
    url,
    { user: { name: "Gizmo"} }
  )
end

puts create_user
