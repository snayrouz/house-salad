class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    conn.headers["X-API-KEY"] = ENV["PROPUBLICA_KEY"]
    response = conn.get("/congress/v1/members/house/#{params[:state]}/current.json")
    @members = JSON.parse(response.body, symbolize_names:true)[:results].map do |raw_member|
      Member.new(raw_member)
    end
  end
end
