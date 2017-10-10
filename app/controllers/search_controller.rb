class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
    conn.headers["X-API-KEY"] = "S9JON3ruNOI6XiyymcnZ7gtsjnToPxuXyT0bgeaX"
    response = conn.get("/congress/v1/members/house/#{params[:state]}/current.json")
    @members = JSON.parse(response.body, symbolize_names:true)[:results]
  end
end
