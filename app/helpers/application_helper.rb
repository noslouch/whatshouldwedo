module ApplicationHelper

  def four_sq_request(section)
    url = URI('https://api.foursquare.com/v2/venues/explore')
    t = Time.now
    params = {
      near: "Greenpoint, Brooklyn",
      client_id: "3WPIQTCP4J50A23SXQCDH0PRIRAT0TCEVGMQMHRBUOOSGRYA",
      client_secret: "F43WJIRIWPG5QDQWZJTNHRCJP4ZNBURYBJIASZD1354TADPY",
      section: section,
      limit: 10,
      v: t.strftime('%Y%m%d')
    }
    url.query = URI.encode_www_form(params)
    res = JSON.parse(Net::HTTP.get_response(url).body, symbolize_names: true)
    res[:response] if res[:meta][:code] == 200
  end

  def parse_response(section)
    res = four_sq_request(section)
    if true # foursquare request
      venues = res[:groups][0][:items]
      venue = venues.sample[:venue]
    else # implement other service responses
    end

    venue
  end

  def get_a_venue(section)
    parse_response(section)
  end
end
