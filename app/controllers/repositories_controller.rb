
class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "77606794c297c4a406f5"
      req.params['client_secret'] = "6fb967398675259c51e9b6102547a544df56db7f"
      # req.params['v'] = '20160201'
      req.params['q'] = params[:query]
    end
    @resp = JSON.parse(@resp.body)
    render 'search'
  end
end
