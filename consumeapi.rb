require 'uri'
require 'net/http'
require 'json'

class APIClient

  def hacer_peticion

    next_page = 1

    while next_page do
      url = URI("https://api.stagingeb.com/v1/properties")
      query = {
        'page': "#{next_page}",
      }

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      
      request = Net::HTTP::Get.new(url)
      request["accept"] = 'application/json'
      request["X-Authorization"] = 'l7u502p8v46ba3ppgvj5y2aad50lb9'

      response = http.request(request)

      data = JSON.parse(response.body)

      data['content'].each do |child|
        puts child['title']
      end 
      
      next_page = next_page + 1
      puts url
    end
  end
end
