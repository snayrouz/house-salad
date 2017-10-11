class PropublicaService
  def initialize
    @conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_KEY"]
    end
  end

  def filter_by_state(us_state)
    response = conn.get("/congress/v1/members/house/#{us_state}/current.json")
    JSON.parse(response.body, symbolize_names:true) #this will be used everywhere so refactor
  end

  private
    attr_reader :conn
end
