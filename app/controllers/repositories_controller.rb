class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = 'fc2af72fde10f65d2b03' 
      req.params['client_secret'] = '5b1ad06dc3f48132446381cedd398cd551b2fcef'
    end

    body = JSON.parse(@resp.body)

    @repos = body["items"]

    render 'search'
  end
end
